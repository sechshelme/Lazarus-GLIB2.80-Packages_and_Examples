unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  Buttons, ExtCtrls, ComCtrls, Menus, Types, FileUtil,
  Common, MenuBar, SoundListBox, PlayBox, AddSongs,
  Streamer;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    TrackBar1: TTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    MainMenu: TMenuBar;
    EditBox: TEditBox;
    PlayBox: TPlayBox;
    SekStream,
    PriStream: TStreamer;
    IsChange: boolean;
    procedure LoadNewMusic(const titel: string; freeed: boolean);
    procedure BoxEventProc(cmd: Tcommand);
  public
    ListBoxSongs: TSoundListBox;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.BoxEventProc(cmd: Tcommand);
var
  index: integer;
  s: string;
begin
  case cmd of
    cmNone: begin
    end;
    cmNew: begin
      //      ListBoxSongs.Add;
    end;
    cmSave: begin
      ListBoxSongs.SaveToXML;
    end;
    cmOpen: begin
      ListBoxSongs.LoadToXML;
    end;
    cmClose: begin
      Close;
    end;

    cmAdd: begin
      SoundAddForm.SongListBox := ListBoxSongs;
      SoundAddForm.ShowModal;
    end;
    cmRemove: begin
      ListBoxSongs.Remove;
    end;
    cmRemoveAll: begin
      if MessageDlg('Songs Löschen', 'Alle Einträge entfernen ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
        ListBoxSongs.RemoveAll;
      end;
    end;
    cmUp: begin
      ListBoxSongs.Up;
    end;
    cmDown: begin
      ListBoxSongs.Down;
    end;

    cmPlay: begin
      if PriStream = nil then begin
        index := ListBoxSongs.ItemIndex;
        if ListBoxSongs.Count > 0 then begin
          if index < 0 then begin
            index := 0;
            ListBoxSongs.ItemIndex := index;
          end;
          s := ListBoxSongs.Items[index];
          LoadNewMusic(s, True);
        end;
      end else begin
        PriStream.Play;
      end;
    end;
    cmPause: begin
      if PriStream <> nil then begin
        PriStream.Pause;
      end;
    end;
    cmStop: begin
      if PriStream <> nil then begin
        PriStream.Stop;
        FreeAndNil(PriStream);
        TrackBar1.Position := 0;
        TrackBar1.Max := 1000;
      end;
    end;
    cmNext: begin
      if (PriStream <> nil) and (PriStream.Duration > 0) then begin
        if ListBoxSongs.Next then  begin
          if (PriStream <> nil) and (PriStream.isPlayed) then begin
            LoadNewMusic(ListBoxSongs.GetTitle, True);
          end;
        end;
      end;
    end;
    cmPrev: begin
      if (PriStream <> nil) and (PriStream.Duration > 0) then begin
        if PriStream.Position > 2000 then begin
          PriStream.Position := 0;
        end else begin
          if ListBoxSongs.Prev then begin
            LoadNewMusic(ListBoxSongs.GetTitle, True);
          end;
        end;
      end;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  sl: TStringList;
begin
  PriStream := nil;
  SekStream := nil;

  MainMenu := TMenuBar.Create(Self);
  MainMenu.OnMenuBarEvent := @BoxEventProc;
  Menu := MainMenu;

  ListBoxSongs := TSoundListBox.Create(self);
  ListBoxSongs.Anchors := [akTop, akLeft, akBottom, akRight];
  ListBoxSongs.Width := ClientWidth - 150;
  ListBoxSongs.Height := ClientHeight - 70;
  ListBoxSongs.Parent := self;

  EditBox := TEditBox.Create(Self);
  EditBox.Parent := Self;
  EditBox.OnPlayBoxEvent := @BoxEventProc;

  PlayBox := TPlayBox.Create(Self);
  PlayBox.Parent := Self;
  PlayBox.OnPlayBoxEvent := @BoxEventProc;


  ListBoxSongs.Items.Add('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac');
  ListBoxSongs.Items.Add('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac');
  ListBoxSongs.Items.Add('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac');
  ListBoxSongs.Items.Add('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac');
  ListBoxSongs.Items.Add('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac');
  ListBoxSongs.Items.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_1.wav');
  ListBoxSongs.Items.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_2.wav');
  ListBoxSongs.Items.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_3.wav');
  ListBoxSongs.Items.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_4.wav');
  ListBoxSongs.Items.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_6.wav');
  ListBoxSongs.Items.Add('/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/SDL-3/examples/Audio/Boing_7.wav');

  sl := FindAllFiles('/n4800/Multimedia/Music/Schlager/Various/25 Jahre Deutscher Schlager', '*.flac');
  ListBoxSongs.Items.AddStrings(sl);
  sl.Free;

  Timer1.Interval := 100;
  TrackBar1.TickStyle := tsNone;
  TrackBar1.Max := 1000;
  Width := 1024;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if PriStream <> nil then begin
    FreeAndNil(PriStream);
  end;
  if SekStream <> nil then begin
    FreeAndNil(PriStream);
  end;
end;

procedure TForm1.LoadNewMusic(const titel: string; freeed: boolean);
begin
  if freeed and (PriStream <> nil) then begin
    FreeAndNil(PriStream);
  end;
  PriStream := TStreamer.Create(titel);

  TrackBar1.Max := 0;
  TrackBar1.Position := 0;

  //  Mix_FadeInMusic(PriStream, 1, 3000);
  PriStream.Play;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  IsChange := True;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  SDur, SPos: integer;
  OldChangeProc: TNotifyEvent;
begin
  if (ListBoxSongs.Count > 0) and (PriStream <> nil) then begin
    if IsChange then begin
      PriStream.Position := TrackBar1.Position;
      IsChange := False;
    end else begin
      OldChangeProc := TrackBar1.OnChange;
      TrackBar1.OnChange := nil;
      SPos := PriStream.Position;
      SDur := PriStream.Duration;
      TrackBar1.Max := SDur;
      TrackBar1.Position := SPos;
      TrackBar1.OnChange := OldChangeProc;
      Label1.Caption := GstClockToStr(SDur);
      Label3.Caption := GstClockToStr(SPos);
      //if PriStream.isEnd then begin
      //  if ListBoxSongs.Next then  begin
      //    LoadNewMusic(ListBoxSongs.GetTitle);
      //  end;
      //end;
      if PriStream.Duration > 0 then begin
        if PriStream.isEnd or (PriStream.Duration - PriStream.Position < CFTime) then begin
          if SekStream <> nil then begin
            FreeAndNil(SekStream);
          end;
          SekStream := PriStream;
          if ListBoxSongs.Next then  begin
            LoadNewMusic(ListBoxSongs.GetTitle, False);
          end;
        end;
      end;
    end;
  end;
end;

end.
