unit PlayBtnBox;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Controls, StdCtrls, ExtCtrls, Buttons, Graphics,ComCtrls,
  Common;

type
  TPlayBtnBox = class(TPanel)
  private
    FOnPlayBoxEvent: TPlayBoxEvent;
    procedure BtnClick(Sender: TObject);
    procedure LoadButtons(const props: TcmdProps);
  public
    constructor Create(AOwner: TComponent); override;
    property OnPlayBoxEvent: TPlayBoxEvent read FOnPlayBoxEvent write FOnPlayBoxEvent;
  end;

  Type
    TPlayPanel=class(TPanel)
    public
      PlayBtnPanel:TPlayBtnBox;
      TrackBar: TTrackBar;

      constructor Create(AOwner: TComponent); override;
    end;

implementation

{ TPlayBtnBox }

procedure TPlayBtnBox.BtnClick(Sender: TObject);
begin
  if OnPlayBoxEvent <> nil then  begin
    OnPlayBoxEvent(Tcommand(TBitBtn(Sender).Tag));
  end;
end;

constructor TPlayBtnBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Anchors := [akLeft, akTop];
  LoadButtons(PlayCmdProp);
end;

procedure TPlayBtnBox.LoadButtons(const props: TcmdProps);
const
  BT_WIDTH = 28;
  BT_HEIGHT = 28;
  BORDER = 5;
var
  i: integer;
  Btn: TSpeedButton;
  propsCount: SizeInt;
  pic: TPicture;
  path: string;
begin
  propsCount := Length(props);

  Width := propsCount * (BT_WIDTH + BORDER) + BORDER;
  Height := BT_HEIGHT + 2 * BORDER;

  pic := TPicture.Create;
  for i := 0 to propsCount - 1 do begin
    Btn := TSpeedButton.Create(Self);
    //    Btn.Caption := props[i].Caption;
    Btn.Caption := '';
    Btn.Tag := PtrInt(props[i].cmd);
    Btn.OnClick := @BtnClick;
    Btn.Width := BT_WIDTH;
    Btn.Height := BT_HEIGHT;
    Btn.Top := BORDER;
    Btn.Left := i * (BT_WIDTH + BORDER) + BORDER;
    Btn.Parent := Self;
    path := 'png/' + props[i].IconPath + '.png';
    if FileExists(path) then  begin
      pic.LoadFromFile('png/' + props[i].IconPath + '.png');
    end;
    Btn.Glyph := pic.Bitmap;
  end;
  pic.Free;
end;

{ TPlayPanel }

constructor TPlayPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Height:=200;
  width:=500;

  TrackBar:=TTrackBar.Create(Self);
  TrackBar.Parent:=Self;
  TrackBar.Width:=Width;

  PlayBtnPanel:=TPlayBtnBox.Create(Self);
  PlayBtnPanel.Parent:=Self;
  PlayBtnPanel.Top:=TrackBar.Height+50;
end;

end.
