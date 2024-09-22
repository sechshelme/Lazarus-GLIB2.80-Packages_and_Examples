unit Streamer;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, glib2, gst;

type
  TPipelineElement = record
    pipeline,
    equalizer,
    volume: PGstElement;
    state: TGstState;
    Duration: Tgint64;
    FIsEnd: boolean;
  end;
  PPipelineElement = ^TPipelineElement;

type

  { TStreamer }

  TStreamer = class(TObject)
  private
    fsongPath: string;
    pipelineElement: TPipelineElement;
    FPosition: integer;
    function GetDuration: integer;
    procedure SetVolume(vol: gdouble);
    function GetVolume: gdouble;
    procedure SetPosition(AValue: integer);
    function GetPosition: integer;
  public
    constructor Create(const AsongPath: string);
    destructor Destroy; override;
    procedure Play;
    procedure Pause;
    procedure Stop;
    procedure SetEqualizer0(vol: gdouble);
    procedure SetEqualizer1(vol: gdouble);
    procedure SetEqualizer2(vol: gdouble);
    procedure SetMute(mute: boolean);
    procedure printInfo;
    function getState: string;
    property Position: integer read GetPosition write SetPosition;
    property Duration: integer read GetDuration;
    property Volume:gdouble read GetVolume write SetVolume;
    function isPlayed: boolean;
    function isEnd: boolean;
  end;

const
  G_USEC_PER_SEC = 1000000;

  GST_SEEK_FLAG_FLUSH = 1 shl 0;
  GST_SEEK_FLAG_KEY_UNIT = 1 shl 2;


function GstClockToStr(t: TGstClockTime): string;

implementation

function gst_stream_volume_get_type(): GType; cdecl; external 'gstaudio-1.0';

function GstClockToStr(t: TGstClockTime): string;
var
  ms, s, min: TGstClockTime;
  i: integer;
begin
  min := t div 60000;
  s := (t mod 60000) div 1000;
  ms := t mod 1000;
  WriteStr(Result, min: 3, ':', s: 2, ':', ms: 3);
  for i := 1 to Length(Result) do begin
    if Result[i] = ' ' then begin
      Result[i] := '0';
    end;
  end;
end;

// ====

procedure TestIO(element: Pointer; const s: string);
begin
  if element = nil then begin
    WriteLn(s, ': error !');
  end else begin
    WriteLn(s, ': io.');
  end;
end;

procedure test_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer);
begin
  case GST_MESSAGE_TYPE(msg) of
    GST_MESSAGE_ERROR: begin
      WriteLn('Fehler');
    end;
  end;
  //  WriteLn(GST_MESSAGE_TYPE(msg));
end;

//procedure duration_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer);
//var
//  pE: PPipelineElement absolute Data;
//  stat: TGboolean;
//  ct: integer = 0;
//begin
//  repeat
//    sleep(1);
//    stat := gst_element_query_duration(pE^.pipeline, GST_FORMAT_TIME, @pE^.Duration);
//    //    WriteLn(ct: 4, ' stat:', stat, '  duration: ', pE^.Duration / G_USEC_PER_SEC / 1000: 4: 2);
//    Inc(ct);
//  until stat or (ct > 100);
//end;

procedure state_changed_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer);
var
  pE: PPipelineElement absolute Data;
  old_state, new_state, pending_state: TGstState;
begin
  gst_message_parse_state_changed(msg, @old_state, @new_state, @pending_state);
  pE^.state := new_state;
end;

procedure eos_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer);
var
  pE: PPipelineElement absolute Data;
begin
  pe^.FIsEnd := True;
end;

// =========================

constructor TStreamer.Create(const AsongPath: string);
var
  bus: PGstBus;
begin
  fsongPath := AsongPath;
  pipelineElement.FisEnd := False;
  pipelineElement.Duration := 0;
  pipelineElement.pipeline := gst_parse_launch(PChar('filesrc location="' + fsongPath + '" ! decodebin3 ! audioconvert ! audioresample ! equalizer-3bands name=equ ! volume name=vol ! autoaudiosink'), nil);

  pipelineElement.volume := gst_bin_get_by_name(GST_BIN(pipelineElement.pipeline), 'vol');
  if pipelineElement.volume = nil then begin
    WriteLn('Volume Error');
  end;

  pipelineElement.equalizer := gst_bin_get_by_name(GST_BIN(pipelineElement.pipeline), 'equ');
  if pipelineElement.equalizer = nil then begin
    WriteLn('Equalizer Error');
  end;

  bus := gst_element_get_bus(pipelineElement.pipeline);
  gst_bus_add_signal_watch(bus);
  g_signal_connect(G_OBJECT(bus), 'message::state-changed', TGCallback(@state_changed_cb), @pipelineElement);
  g_signal_connect(G_OBJECT(bus), 'message::eos', TGCallback(@eos_cb), @pipelineElement);
  g_signal_connect(G_OBJECT(bus), 'message', TGCallback(@test_cb), @pipelineElement);
  //  g_signal_connect(G_OBJECT(bus), 'message::duration-changed', TGCallback(@duration_cb), @pipelineElement);
  gst_object_unref(bus);
end;

destructor TStreamer.Destroy;
begin
  Stop;
  gst_object_unref(pipelineElement.pipeline);
  inherited Destroy;
end;

procedure TStreamer.Play;
begin
  gst_element_set_state(pipelineElement.pipeline, GST_STATE_PLAYING);
end;

procedure TStreamer.Pause;
begin
  gst_element_set_state(pipelineElement.pipeline, GST_STATE_PAUSED);
end;

procedure TStreamer.Stop;
begin
  gst_element_set_state(pipelineElement.pipeline, GST_STATE_NULL);
end;

procedure TStreamer.SetPosition(AValue: integer);
begin
  gst_element_seek_simple(pipelineElement.pipeline, GST_FORMAT_TIME, TGstSeekFlags(int64(GST_SEEK_FLAG_FLUSH) or int64(GST_SEEK_FLAG_KEY_UNIT)), AValue * G_USEC_PER_SEC);
end;

function TStreamer.GetPosition: integer;
var
  current: Tgint64;
begin
  gst_element_query_position(pipelineElement.pipeline, GST_FORMAT_TIME, @current);
  Result := current div G_USEC_PER_SEC;
end;

function TStreamer.GetDuration: integer;
var
  current: Tgint64 = 0;
begin
  if pipelineElement.Duration = 0 then begin
    gst_element_query_duration(pipelineElement.pipeline, GST_FORMAT_TIME, @current);
    if current > 0 then  begin
      pipelineElement.Duration := current;
    end;
    WriteLn(current);
  end;
  Result := pipelineElement.Duration div G_USEC_PER_SEC;
end;

function TStreamer.GetVolume: gdouble;
begin
  g_object_get(pipelineElement.volume, 'volume', @Result, nil);
end;

procedure TStreamer.SetVolume(vol: gdouble);
begin
  g_object_set(pipelineElement.volume, 'volume', vol, nil);
end;

procedure TStreamer.SetEqualizer0(vol: gdouble);
begin
  g_object_set(pipelineElement.equalizer, 'band0', vol, nil);
end;

procedure TStreamer.SetEqualizer1(vol: gdouble);
begin
  g_object_set(pipelineElement.equalizer, 'band1', vol, nil);
end;

procedure TStreamer.SetEqualizer2(vol: gdouble);
begin
  g_object_set(pipelineElement.equalizer, 'band2', vol, nil);
end;

procedure TStreamer.SetMute(mute: boolean);
begin
  g_object_set(pipelineElement.volume, 'mute', gboolean(mute), nil);
end;

procedure TStreamer.printInfo;
var
  n_audio, n_text: gint;
begin
  g_object_get(pipelineElement.pipeline, 'n-audio', @n_audio, nil);
  WriteLn('n-audio: ', n_audio);
  g_object_get(pipelineElement.pipeline, 'n-text', @n_text, nil);
  WriteLn('n-text: ', n_text);
end;

function TStreamer.getState: string;
begin
  WriteStr(Result, pipelineElement.state);
end;

function TStreamer.isPlayed: boolean;
begin
  Result := pipelineElement.state = GST_STATE_PLAYING;
end;

function TStreamer.isEnd: boolean;
begin
  Result := pipelineElement.FIsEnd;
end;

begin
  gst_init(@argc, @argv);
end.
