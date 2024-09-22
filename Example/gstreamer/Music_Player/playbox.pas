unit PlayBox;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Controls, StdCtrls, ExtCtrls, Buttons, Graphics,
  Common;

type
  TPlayBox = class(TPanel)
  private
    FOnPlayBoxEvent: TPlayBoxEvent;
    procedure BtnClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    property OnPlayBoxEvent: TPlayBoxEvent read FOnPlayBoxEvent write FOnPlayBoxEvent;
  private
    procedure LoadButtons(const props: TcmdProps);
  end;

implementation

{ TPlayBox }

procedure TPlayBox.BtnClick(Sender: TObject);
begin
  if OnPlayBoxEvent <> nil then  begin
    OnPlayBoxEvent(Tcommand(TBitBtn(Sender).Tag));
  end;
end;

constructor TPlayBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Anchors := [akLeft, akTop];
  LoadButtons(PlayCmdProp);
end;

procedure TPlayBox.LoadButtons(const props: TcmdProps);
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
    btn.Width := BT_WIDTH;
    btn.Height := BT_HEIGHT;
    Btn.Top := BORDER;
    Btn.Left := i * (BT_WIDTH + BORDER) + BORDER;
    Btn.Parent := Self;
    path := 'png/' + props[i].IconPath + '.png';
    if FileExists(path) then  begin
      pic.LoadFromFile('png/' + props[i].IconPath + '.png');
    end;
    btn.Glyph := pic.Bitmap;
  end;
  pic.Free;
end;

end.
