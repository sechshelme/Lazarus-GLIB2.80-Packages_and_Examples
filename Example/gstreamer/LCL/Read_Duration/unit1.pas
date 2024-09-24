unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  FileUtil,
  glib280, gst124, gstTools;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

function get_duration(s: string): Tguint64;
var
  pipeline: PGstElement;
  bus: PGstBus;
  msg: PGstMessage;
  duration: int64;
begin
  pipeline := gst_element_factory_make('playbin', 'playbin');
  if pipeline = nil then begin
    WriteLn('pipeline error !');
  end;
  g_object_set(pipeline, 'uri', PChar('file:' + s), nil);
  //  g_object_set(pipeline, 'uri', PChar('file:/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos/01 - Boonoonoonoos.flac'), nil);


  //gst_element_set_state(pipeline, GST_STATE_PLAYING);
  gst_element_set_state(pipeline, GST_STATE_PAUSED);

  bus := gst_element_get_bus(pipeline);
  if bus = nil then begin
    WriteLn('bus error !');
  end;
  msg := gst_bus_timed_pop_filtered(bus, GST_CLOCK_TIME_NONE, GST_MESSAGE_DURATION_CHANGED or GST_MESSAGE_ERROR);
  if msg = nil then begin
    WriteLn('msg error !');
  end;
  repeat
    gst_element_query_duration(pipeline, GST_FORMAT_TIME, @duration);
    //  Application.ProcessMessages;
  until duration <> GST_CLOCK_TIME_NONE;

  WriteLn(GstClockToStr(duration div G_USEC_PER_SEC));
  //  WriteLn(duration: 4);

  gst_element_set_state(pipeline, GST_STATE_NULL);
  gst_message_unref(msg);
  g_object_unref(bus);
  g_object_unref(pipeline);
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  sl: TStringList;
  s: string;
  i: integer;
  dur: Tguint64;
begin
  sl := FindAllFiles('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos', '*.flac;*.mp3', True);
  for i := 0 to sl.Count - 1 do begin
    s := sl[i];
    dur := get_duration(s);
    Memo1.Lines.Add(s);
  end;
  sl := FindAllFiles('/n4800/Multimedia/Music/Disco/Italo Disco/The Best Of Italo Disco Vol. 1-16/Vol. 06', '*.flac;*.mp3', True);
  for i := 0 to sl.Count - 1 do begin
    s := sl[i];
    dur := get_duration(s);
    Memo1.Lines.Add(s);
  end;
  sl.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  gst_init(nil, nil);
end;

end.
