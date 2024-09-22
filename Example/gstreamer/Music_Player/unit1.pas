unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  Buttons, ExtCtrls, ComCtrls, Menus, Types, FileUtil,
  Common, MenuBar, SoundListBox, PlayBtnBox, AddSongs, SongEditBox,
  Streamer;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    MainMenu: TMenuBar;
    EditBox: TEditBox;
    PlayBox: TPlayPanel;
    Timer: TTimer;
    IsTrackBarMDown: boolean;
    SekStream,
    PriStream: TStreamer;
    IsChange: boolean;
    procedure LoadNewMusic(const titel: string; freeed: boolean);
    procedure BoxEventProc(cmd: Tcommand);
    procedure PlayBoxTrackBarChange(Sender: TObject);
    procedure PlayBoxTrackBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure PlayBoxTrackBarMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure TimerTimer(Sender: TObject);
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
        PlayBox.TrackBar.Position := 0;
        PlayBox.TrackBar.Max := 1000;
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

procedure TForm1.PlayBoxTrackBarChange(Sender: TObject);
begin
  IsChange := True;
end;

procedure TForm1.PlayBoxTrackBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  WriteLn('down');
  IsTrackBarMDown := True;
end;

procedure TForm1.PlayBoxTrackBarMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  WriteLn('up');
  IsTrackBarMDown := False;
end;

procedure TForm1.TimerTimer(Sender: TObject);
var
  SDur, SPos: integer;
  OldChangeProc: TNotifyEvent;
  volume: extended;
begin
  if (*(ListBoxSongs.Count > 0) and*) (PriStream <> nil) then begin
    if IsChange then begin
      PriStream.Position := PlayBox.TrackBar.Position;
      IsChange := False;
    end else begin
      OldChangeProc := PlayBox.TrackBar.OnChange;
      PlayBox.TrackBar.OnChange := nil;
      SPos := PriStream.Position;
      SDur := PriStream.Duration;
      PlayBox.TrackBar.Max := SDur;
      PlayBox.TrackBar.Position := SPos;
      PlayBox.TrackBar.OnChange := OldChangeProc;
      Label1.Caption := GstClockToStr(SDur);
      Label3.Caption := GstClockToStr(SPos);
      volume := PriStream.Position / FITime;
      if volume > 1.0 then begin
        volume := 1.0;
      end;
      PriStream.Volume := volume;
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
  if SekStream <> nil then begin
    if SekStream.Duration > 0 then begin
      volume := (SekStream.Duration - SekStream.Position) / FITime;
      if volume > 1.0 then begin
        volume := 1.0;
      end;
      SekStream.Volume := volume;
      WriteLn(SekStream.Volume: 4: 2);
    end;

    if SekStream.isEnd then begin
      FreeAndNil(SekStream);
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
  ListBoxSongs.Top := 140;
  ListBoxSongs.Left := 5;
  ListBoxSongs.Width := ClientWidth - 10;
  ListBoxSongs.Height := ClientHeight - 170;
  ListBoxSongs.Parent := self;

  PlayBox := TPlayPanel.Create(Self);
  PlayBox.Parent := Self;
  PlayBox.Left := 5;
  PlayBox.Top := 0;
  PlayBox.PlayBtnPanel.OnPlayBoxEvent := @BoxEventProc;
  PlayBox.Width:=Width;
  PlayBox.Anchors := [akTop, akLeft, akRight];

  EditBox := TEditBox.Create(Self);
  EditBox.Top := PlayBox.Height;
  EditBox.Left := ClientWidth - EditBox.Width - 5;
  EditBox.Parent := Self;
  EditBox.OnPlayBoxEvent := @BoxEventProc;


  sl := FindAllFiles('/n4800/Multimedia/Music/Schlager/Various/25 Jahre Deutscher Schlager', '*.flac');
  ListBoxSongs.Items.AddStrings(sl);
  sl.Free;

  sl := FindAllFiles('/n4800/Multimedia/Music/Disco/Italo Disco/The Best Of Italo Disco Vol. 1-16/Vol. 09/CD 1', '*.mp3');
  ListBoxSongs.Items.AddStrings(sl);
  sl.Free;

  sl := FindAllFiles('/home/tux/Schreibtisch/sound', '*.mp3');
  ListBoxSongs.Items.AddStrings(sl);
  sl.Free;

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

  Timer := TTimer.Create(self);
  Timer.OnTimer := @TimerTimer;
  Timer.Interval := 200;
  PlayBox.TrackBar.TickStyle := tsNone;
  PlayBox.TrackBar.Max := 1000;
  PlayBox.TrackBar.OnChange := @PlayBoxTrackBarChange;
  PlayBox.TrackBar.OnMouseDown := @PlayBoxTrackBarMouseDown;
  PlayBox.TrackBar.OnMouseUp := @PlayBoxTrackBarMouseUp;
  IsTrackBarMDown := False;

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

  PlayBox.TrackBar.Max := 0;
  PlayBox.TrackBar.Position := 0;
  PriStream.Play;
end;

end.
