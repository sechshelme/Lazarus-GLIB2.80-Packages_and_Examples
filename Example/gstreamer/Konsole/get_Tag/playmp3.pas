program playmp3;
{$mode objfpc}
{$h+}

uses
  crt,
  SysUtils,
  glib280,
  GLIBTools,
  gst124,
  gstTools,
  gst124_tag,
  gst124_audio;


  // https://github.com/GStreamer/gst-plugins-good/blob/master/tests/check/elements/id3demux.c
  // id3v2
  // sudo apt install kid3


const
  path = '/home/tux/Schreibtisch/sound/test2.mp3';
  //  path = '/home/tux/Schreibtisch/sound/test.wav';
  //    path = '/n4800/Multimedia/Videos/WNDSURF1.AVI';

type
  TTagInfo = record
    ready: boolean;
    duration: int64;
    title,
    artist,
    album: string;
  end;
  PTagInfo = ^TTagInfo;


  procedure tag_message_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer); cdecl;
  var
    tags: PGstTagList;
    Count: Tgint;
    i: integer;
    Name, tag_value, value: Pgchar;
    valueType: PGValue;
    TagInfo: PTagInfo absolute Data;
  begin
    gst_message_parse_tag(msg, @tags);
    if tags <> nil then begin
      WriteLn('Tags io.');
    end;

    TagInfo^.ready := True;

    WriteLn('Tag List: ', gst_tag_list_to_string(tags));

    Count := gst_tag_list_n_tags(tags);
    WriteLn('Count: ', Count);
    for i := 0 to Count - 1 do begin
      Name := gst_tag_list_nth_tag_name(tags, i);
      valueType := gst_tag_list_get_value_index(tags, Name, 0);
      Write('name: ', Name, 'Typ: ', valueType^.g_type, '    ');
      if valueType^.g_type = G_TYPE_STRING then begin
        gst_tag_list_get_string(tags, Name, @tag_value);
        WriteLn(tag_value);
      end else begin
        WriteLn();
      end;
    end;

    gst_tag_list_unref(tags);

    gst_tag_list_get_string(tags, 'album', @value);
    TagInfo^.album := value;

    WriteLn(#10);
  end;


  function GetTagAndDuration(const path: string): TTagInfo;
  var
    pipeline: PGstElement;
    bus: PGstBus;
    duration: int64;
  begin
    Result.ready := False;

    pipeline := gst_parse_launch(PChar('filesrc location="' + path + '" ! queue ! id3demux name=demux ! decodebin ! audioconvert ! audioresample ! fakesink'), nil);

    bus := gst_element_get_bus(pipeline);
    if bus = nil then begin
      WriteLn('bus error');
    end;
    gst_bus_add_signal_watch(bus);

    g_signal_connect(G_OBJECT(bus), 'message::tag', TGCallback(@tag_message_cb), @Result);
    gst_object_unref(bus);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);
    duration := 0;
    repeat
      gst_element_query_duration(pipeline, GST_FORMAT_TIME, @duration);
    until duration > 0;

    duration := duration div G_USEC_PER_SEC;
    WriteLn('duration: 0', GstClockToStr(duration));
    Result.duration := duration;

    repeat
      g_main_iteration(False);
    until Result.ready;

    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(pipeline);
  end;

  // ===========================================

  procedure main;
  var
    pipeline: PGstElement = nil;
    volume, equalizer, demux: PGstElement;

    quit: boolean = False;
    vol: Tgdouble = 0.5;
    mute: Tgboolean = False;
    equ: array [0..2] of Tgdouble = (0.0, 0.0, 0.0);
    ch: ansichar;
    bus: PGstBus;
    taglist: TTagInfo;
  begin
    gst_init(@argc, @argv);

    taglist := GetTagAndDuration(path);
    WriteLn('=======================');
    WriteLn('Album: ', taglist.album);
    WriteLn('Dauer: ', GstClockToStr(taglist.duration));
    WriteLn('=======================');

    pipeline := gst_parse_launch(PChar('filesrc location="' + path + '" ! queue ! id3demux name=demux ! decodebin ! audioconvert ! audioresample ! equalizer-3bands name=equ ! volume name=vol ! autoaudiosink'), nil);

    volume := gst_bin_get_by_interface(GST_BIN(pipeline), gst_stream_volume_get_type());
    // volume := gst_bin_get_by_name(GST_BIN(pipeline), 'vol');
    if volume = nil then begin
      WriteLn('Volume Error');
    end;

    equalizer := gst_bin_get_by_name(GST_BIN(pipeline), 'equ');
    if equalizer = nil then begin
      WriteLn('Equalizer Error');
    end;

    demux := gst_bin_get_by_name(GST_BIN(pipeline), 'demux');
    if demux = nil then begin
      WriteLn('Demux Error');
    end;
    GObjectShowProperty(demux);

    bus := gst_element_get_bus(pipeline);
    if bus = nil then begin
      WriteLn('bus error');
    end;
    gst_bus_add_signal_watch(bus);
    gst_object_unref(bus);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    repeat
      g_main_iteration(False);
      g_object_set(volume, 'volume', vol, 'mute', mute, nil);
      g_object_set(equalizer, 'band0', equ[0], 'band1', equ[1], 'band2', equ[2], nil);
      if KeyPressed then begin
        ch := ReadKey;
        case ch of
          #27: begin
            quit := True;
          end;
          #32: begin
            mute := not mute;
            WriteLn('Mute: ', mute);
          end;
          '+': begin
            vol += 0.1;
            if vol >= 1.0 then begin
              vol := 1.0;
            end;
            WriteLn('volume: ', vol: 4: 2);
          end;
          '-': begin
            vol -= 0.1;
            if vol <= 0.0 then begin
              vol := 0.0;
            end;
            WriteLn('volume: ', vol: 4: 2);
          end;
          't': begin
            equ[2] -= 1.0;
            if equ[2] <= -24.0 then begin
              equ[2] := -24.0;
            end;
            WriteLn('Treble: ', equ[2]: 4: 2);
          end;
          'T': begin
            equ[2] += 1.0;
            if equ[2] >= 12.0 then begin
              equ[2] := 12.0;
            end;
            WriteLn('Treble: ', equ[2]: 4: 2);
          end;
          'm': begin
            equ[1] -= 1.0;
            if equ[1] <= -24.0 then begin
              equ[1] := -24.0;
            end;
            WriteLn('Middle: ', equ[1]: 4: 2);
          end;
          'M': begin
            equ[1] += 1.0;
            if equ[1] >= 12.0 then begin
              equ[1] := 12.0;
            end;
            WriteLn('Middle: ', equ[1]: 4: 2);
          end;
          'b': begin
            equ[0] -= 1.0;
            if equ[0] <= -24.0 then begin
              equ[0] := -24.0;
            end;
            WriteLn('Bass: ', equ[0]: 4: 2);
          end;
          'B': begin
            equ[0] += 1.0;
            if equ[0] >= 12.0 then begin
              equ[0] := 12.0;
            end;
            WriteLn('Bass: ', equ[0]: 4: 2);
          end;
          'p': begin
            gst_element_set_state(pipeline, GST_STATE_NULL);
            gst_element_set_state(pipeline, GST_STATE_PLAYING);
          end;
        end;
      end;
    until quit;

    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(pipeline);
  end;

begin
  main;
end.
