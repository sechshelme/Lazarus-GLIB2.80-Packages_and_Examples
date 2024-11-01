program project1;

uses
  ctypes,
  glib280,
  gst124,
  gst124_audio;

  // https://gstreamer.freedesktop.org/documentation/tutorials/basic/short-cutting-the-pipeline.html?gi-language=c

const
  CHUNK_SIZE = 1024;
  SAMPLE_RATE = 44100;

type
  TCustomData = record
    pipeline, app_source, tee, audio_queue, audio_convert1, audio_resample, audio_sink,
    video_queue, audio_convert2, visual, video_convert, video_sink,
    app_queue, app_sink: PGstElement;
    num_samples: Tguint64;
    a, b, c, d: Tgfloat;
    sourceid: Tguint;
    main_loop: TGMainLoop;
  end;
  PCustomData = ^TCustomData;

  function push_data(user_data: Tgpointer): Tgboolean; cdecl;
  var
    buffer: PGstBuffer;
    Data: PCustomData absolute user_data;
    num_samples: Tguint64 = CHUNK_SIZE div 2;
    map: TGstMapInfo;
    raw: Pgint16;
    freq: Tgfloat;
    i: integer;
    ret: TGstFlowReturn;
  begin
    buffer := gst_buffer_new_and_alloc(CHUNK_SIZE);

    buffer^.pts := gst_util_uint64_scale(Data^.num_samples, GST_SECOND, SAMPLE_RATE);
    buffer^.duration := gst_util_uint64_scale(num_samples, GST_SECOND, SAMPLE_RATE);

    gst_buffer_map(buffer, @map, GST_MAP_WRITE);
    raw := Pgint16(map.Data);
    Data^.c := Data^.d;
    Data^.d := Data^.c / 1000;

    freq := 1100 + 1000 * Data^.d;
    for i := 0 to num_samples - 1 do begin
      Data^.a := Data^.b;
      Data^.b := Data^.a / freq;
      raw[i] := Trunc(500 * Data^.a);
    end;
    gst_buffer_unmap(buffer, @map);
    Data^.num_samples := num_samples;

    g_signal_emit_by_name(Data^.app_source, 'push-buffer', buffer, @ret);
    gst_buffer_unref(buffer);

    if ret <> GST_FLOW_OK then begin
      Exit(False);
    end;
    Exit(True);
  end;

  procedure start_feed(Source: PGstElement; size: Tguint; Data: PCustomData); cdecl;
  begin
    if Data^.sourceid = 0 then begin
      g_print('Start feeding'#10);
      Data^.sourceid := g_idle_add(@push_data, Data);
    end;
  end;

  procedure stop_feed(Source: PGstElement; size: Tguint; Data: PCustomData); cdecl;
  begin
    if Data^.sourceid <> 0 then begin
      g_print('Stop feeding'#10);
      g_source_remove(Data^.sourceid);
      Data^.sourceid := 0;
    end;
  end;

  function new_sample(sink: PGstElement; Data: PCustomData): TGstFlowReturn; cdecl;
  var
    sample: PGstSample;
  begin
    g_signal_emit_by_name(sink, 'pull-sample', @sample);
    if sample <> nil then begin
      g_print('*');
      gst_sample_unref(sample);
      Exit(GST_FLOW_OK);
    end;
    Exit(GST_FLOW_ERROR);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    Data: TCustomData;
    info: TGstAudioInfo;
    audio_caps: PGstCaps;
  begin
    FillChar(Data, SizeOf(Data), $00);
    Data.b := 1;
    Data.d := 1;

    gst_init(@argc, @argv);

    Data.app_source := gst_element_factory_make('appsrc', 'audio_source');
    Data.tee := gst_element_factory_make('tee', 'tee');
    Data.audio_queue := gst_element_factory_make('queue', 'audio_queue');
    Data.audio_convert1 := gst_element_factory_make('audioconvert', 'audio_convert1');
    Data.audio_resample := gst_element_factory_make('audioresample', 'audio_resample');
    Data.audio_sink := gst_element_factory_make('autoaudiosink', 'audio_sink');
    Data.video_queue := gst_element_factory_make('queue', 'video_queue');
    Data.audio_convert2 := gst_element_factory_make('audioconvert', 'audio_convert2');
    Data.visual := gst_element_factory_make('wavescope', 'visual');
    Data.video_convert := gst_element_factory_make('videoconvert', 'video_convert');
    Data.video_sink := gst_element_factory_make('autovideosink', 'video_sink');
    Data.app_queue := gst_element_factory_make('queue', 'app_queue');
    Data.app_sink := gst_element_factory_make('appsink', 'app_sink');

    Data.pipeline := gst_pipeline_new('test-pipeline');

    if (Data.pipeline = nil) or (Data.app_source = nil) or (Data.tee = nil) or (Data.audio_queue = nil) or (Data.audio_convert1 = nil) or
      (Data.audio_resample = nil) or (Data.audio_sink = nil) or (Data.video_queue = nil) or (Data.audio_convert2 = nil) or (Data.visual = nil) or
      (Data.video_convert = nil) or (Data.video_sink = nil) or (Data.app_queue = nil) or (Data.app_sink = nil) then begin
      g_printerr('Not all elements could be created.'#10);
    end;

    g_object_set(Data.visual, 'shader', 0, 'style', 0, nil);

    gst_audio_info_set_format(@info, GST_AUDIO_FORMAT_S16, SAMPLE_RATE, 1, nil);
    audio_caps := gst_audio_info_to_caps(@info);
    g_object_set(Data.app_source, 'caps', audio_caps, 'format', GST_FORMAT_TIME, nil);
    g_signal_connect(Data.app_source, 'need-data', G_CALLBACK(@start_feed), @Data);
    g_signal_connect(Data.app_source, 'enough-data', G_CALLBACK(@stop_feed), @Data);

    g_object_set(Data.app_sink, 'emit-signals', True, 'caps', audio_caps, nil);
    g_signal_connect(Data.app_sink, 'new-sample', G_CALLBACK(@new_sample), @Data);
    gst_caps_unref(audio_caps);

    gst_bin_add_many(GST_BIN(Data.pipeline), Data.app_source, Data.tee, Data.audio_queue, Data.audio_convert1, Data.audio_resample,
      Data.audio_sink, Data.video_queue, Data.audio_convert2, Data.visual, Data.video_convert, Data.video_sink, Data.app_queue,
      Data.app_sink, nil);

    if (not gst_element_link_many(Data.app_source, Data.tee, nil)) or
      (not gst_element_link_many(Data.audio_queue, Data.audio_convert1, Data.audio_resample, Data.audio_sink, nil)) or
      (not gst_element_link_many(Data.video_queue, Data.audio_convert2, Data.visual, Data.video_convert, Data.video_sink, nil)) or
      (not gst_element_link_many(Data.app_queue, Data.app_sink, nil)) then begin
      g_printerr('Elements could not linked'#10);
      gst_object_unref(Data.pipeline);
      Exit(-1);
    end;


    // ====================

  end;

begin
  main(argc, argv);
  WriteLn('ende');
end.
