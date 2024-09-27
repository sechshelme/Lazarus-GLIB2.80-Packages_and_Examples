unit SoundListBox;

interface

uses
  Classes, SysUtils, StdCtrls, Controls, Dialogs, ExtCtrls, ComCtrls,
  Laz2_XMLCfg,
  Streamer;

type
  TSongsListPanel = class(TPanel)
  private
    ListView: TListView;
    function GetCount: integer;
    function GetItemIndex: integer;
    procedure SetItemIndex(AValue: integer);
  public
    constructor Create(TheOwner: TComponent); override;
    procedure Add(const song: string); overload;
    procedure Add(const song: TStringList); overload;
    procedure Remove;
    procedure RemoveAll;
    procedure Down;
    procedure Up;
    function Next: boolean;
    function Prev: boolean;
    function GetTitle: string;
    procedure SaveToXML;
    procedure LoadToXML;

    property ItemIndex: integer read GetItemIndex write SetItemIndex;
    property Count: integer read GetCount;
  end;

implementation

function TSongsListPanel.GetItemIndex: integer;
begin
  Result := ListView.ItemIndex;
end;

procedure TSongsListPanel.SetItemIndex(AValue: integer);
begin
  ListView.ItemIndex := AValue;
end;

function TSongsListPanel.GetCount: integer;
begin
  Result := ListView.Items.Count;
end;

constructor TSongsListPanel.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  Anchors := [akTop, akLeft, akBottom, akRight];

  ListView := TListView.Create(Self);
  ListView.Parent := Self;
  ListView.Align := alClient;
  ListView.ReadOnly:=True;

  ListView.ViewStyle := vsReport;
  ListView.Columns.Add.Caption := 'Song Titel';
 // ListView.Columns[0].Width := Width- 100;
//  WriteLn(Width);
  ListView.Columns[0].Width := 800;
  ListView.Columns.Add.Caption := 'Dauer';
  ListView.Columns[1].Width := 100;
end;

procedure TSongsListPanel.Add(const song: string);
var
  ad: TListItem;
begin
  ad := ListView.Items.Add;
  ad.Caption := song;
  ad.SubItems.Add('123');
end;

procedure TSongsListPanel.Add(const song: TStringList);
var
  ad: TListItem;
  i: integer;
begin
  for i := 0 to song.Count - 1 do begin
    ad := ListView.Items.Add;
    ad.Caption := song[i];
    ad.SubItems.Add('123');
  end;
end;

procedure TSongsListPanel.Remove;
var
  index: integer;
begin
  index := ListView.ItemIndex;
  if (index >= 0) and (index < ListView.Items.Count) then  begin
    ListView.Items.Delete(index);
    if index < ListView.Items.Count then  begin
      ListView.ItemIndex := index;
    end else if index > 0 then  begin
      ListView.ItemIndex := index - 1;
    end;
  end;
end;

procedure TSongsListPanel.RemoveAll;
begin
  ListView.Clear;
end;

procedure TSongsListPanel.Down;
var
  index: integer;
begin
  index := ListView.ItemIndex;
  if index = -1 then begin
    Exit;
  end;
  if index < ListView.Items.Count - 1 then  begin
    ListView.Items.Move(index, index + 1);
    ListView.ItemIndex := index + 1;
  end;
end;

procedure TSongsListPanel.Up;
var
  index: integer;
begin
  index := ListView.ItemIndex;
  if index = -1 then begin
    Exit;
  end;
  if index > 0 then  begin
    ListView.Items.Move(index, index - 1);
    ListView.ItemIndex := index - 1;
  end;
end;

function TSongsListPanel.Next: boolean;
var
  index: integer;
begin
  if ListView.Items.Count <= 0 then begin
    Result := False;
    Exit;
  end else begin
    Result := True;
  end;
  index := ListView.ItemIndex;
  Inc(index);
  if index >= ListView.Items.Count then begin
    index := 0;
  end;
  ListView.ItemIndex := index;
end;

function TSongsListPanel.Prev: boolean;
begin
  if ListView.Items.Count <= 0 then begin
    Result := False;
    Exit;
  end;
  Result := True;
  begin
    if ListView.ItemIndex = 0 then begin
      ListView.ItemIndex := ListView.Items.Count - 1;
    end else begin
      ListView.ItemIndex := ListView.ItemIndex - 1;
    end;
  end;
end;

function TSongsListPanel.GetTitle: string;
var
  si: TListItem;
begin
  if ListView.ItemIndex >= 0 then begin
    si:=ListView.Items[ListView.ItemIndex];
    Result:=si.Caption;
  end else begin
    Result := '';
  end;
end;

procedure TSongsListPanel.SaveToXML;
var
  xml: TXMLConfig;
  i: integer;
begin
  xml := TXMLConfig.Create(nil);
  xml.Filename := 'test.xml';
  xml.Clear;
  for i := 1 to ListView.Items.Count do begin
//    xml.SetValue('songs/items[' + IntToStr(i) + ']/song', ListView.Items[i - 1]);
  end;
  xml.Free;
end;

procedure TSongsListPanel.LoadToXML;
var
  i, cnt: integer;
  xml: TXMLConfig;
  s: string;
begin
  xml := TXMLConfig.Create(nil);
  xml.Filename := 'test.xml';

  cnt := xml.GetChildCount('songs');
  for i := 1 to cnt do begin
//    s := xml.GetValue('songs/items[' + IntToStr(i) + ']/song', '');
//    WriteLn(s);
  end;
  xml.Free;
end;

end.
