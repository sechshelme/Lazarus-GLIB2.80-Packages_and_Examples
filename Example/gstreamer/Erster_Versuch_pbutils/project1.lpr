program project1;

uses
  crt,
  Classes,
  SysUtils, GL,
  FileUtil,


  glib280,
  gst124,
  gst124_base,
  gst124_audio,
  gst124_video,
  gst124_pbutils,
  gst124_allocators,
  gst124_analytics,
  gst124_check,
  gst124_interfaces,
  gst124_mse,
  gst124_insertbin,
  gst124_sdp,
  gst124_webrtc,
  gst124_webrtc_nice,
  gst124_mpegts,
  gst124_tag,
  gst124_fft,
  gst124_codecparsers,
  gst124_controller,
  gst124_rtp,
  gst124_rtsp,
  gst124_wayland,
  gst124_va,
  gst124_player,
  gst124_gl,
  gst124_gl_egl,
  gst124_gl_x11,
  gst124_gl_wayland,
  gst124_gl_glprototypes,

  // ==== gl

  //gstgl_enums,              // io.
  //gl_enumtypes,             // io.
  //gstglfuncs,               // io.
  //gstglwindow,              // io. -> gstglfuncs
  //gstgldebug,               // io. -> gstglwindow                       makros entfernt
  //gstglquery,               // io. -> gstglwindow, gstgldebug           makros entfernt
  //gstglbasememory,          // io, -> gstglwindow, gstglquery
  //gstglbuffer,              // io. -> gstglbasememory, gstglwindow
  //gstglformat,              // io. -> gstgl_enums, gstglwindow
  //gstglmemory,              // io. -> gstgl_enums, gstglbasememory, gstglwindow, gstglformat
  //gstglmemorypbo,           // io. -> gstglmemory, gstgl_enums, gstglformat
  //gstglapi,                 // io.
  //gstglcontext,             // io. -> gstglapi, gstglwindow
  //gstgldisplay,             // io. -> gstglapi, gstglwindow
  //gstglbasefilter,          // io. -> gstglapi, gstglwindow
  //gstglbasemixer,           // io. -> gstglapi, gstglwindow
  //gstglsl,                  // io. -> gstglapi, gstglwindow
  //gstglslstage,             // io. -> gstglwindow, gstglsl
  //gstglshader,              // io. -> gstglwindow, gstglsl, gstglslstage
  //gstglframebuffer,         // io. -> gstglwindow, gstglbasememory, gstglmemory
  //gstglbasesrc,             // io. -> gstglwindow, gstglapi, gstglmemory
  //gstglbufferpool,          // io. -> gstglwindow, gstglbasememory
  //gstglcolorconvert,        // io. -> gstglwindow, gstglframebuffer, gstglshader
  //gstglcontextconfig,       // io. -> gl_enumtypes
  //gstglfeature,             // io.
  //gstglfilter,              // io. -> gstglmemory, gstglbasefilter, gstgl_enums, gstglframebuffer, gstglshader
  //gstglmixer,               // io. -> gstglbasemixer, gstglmemory, gstglframebuffer
  //gstgloverlaycompositor,   // io. -> gstglwindow, gstglshader
  //gstglrenderbuffer,        // io. -> gstglwindow, gstglbasememory, gstglformat
  //gstglshaderstrings,       // io. -> gstglwindow, gstglsl
  //gstglsyncmeta,            // io. -> gstglwindow
  //gstglupload,              // io. -> gstglwindow
  //gstglutils,               // io. -> gstglwindow, gstgl_enums
  //gstglviewconvert,         // io. -> gstglwindow, gl_enumtypes, gstgl_enums, gstglshader, gstglframebuffer

  // === gl/egl

  //gstegl,                   // io.
  //gstgldisplay_egl,         // io.
  //gstgldisplay_egl_device,  // io. -> gstgldisplay_egl
  //gsteglimage,              // io.
  //gstglmemoryegl,           // io. -> gsteglimage

  // ==== gl/glprototypes

  //base,
  //blending,
  //buffers,
  //buffer_storage,
  //debug,
  //eglimage,
  //fbo,
  //fixedfunction,
  //gles,
  //opengl,
  //query,
  //shaders,
  //sync,
  //vao,


  GLIBTools,
  gstTools;

  function get_duration(s: string): Tguint64;
  var
    discoverer: PGstDiscoverer;
    info: PGstDiscovererInfo;
  begin
    discoverer := gst_discoverer_new(5 * GST_SECOND, nil);

    info := gst_discoverer_discover_uri(discoverer, PChar('file:' + s), nil);

    if info = nil then begin
      WriteLn('Info error !');
      Result := -1;
    end else begin
      Result := gst_discoverer_info_get_duration(info) div G_USEC_PER_SEC;
      gst_discoverer_info_unref(info);
    end;
    g_object_unref(discoverer);
  end;

  procedure WriteDuration(sl: TStringList);
  var
    i: integer;
    s: string;
    dur: Tguint64;
  begin
    for i := 0 to sl.Count - 1 do begin
      s := sl[i];
      dur := get_duration(s);
      WriteLn(GstClockToStr(dur));
      //    Application.ProcessMessages;
      //    Memo1.Lines.Add(s);
    end;
  end;

  procedure main;
  const
    path = '/home/tux/Schreibtisch/sound/test.wav';
  var
    sl: TStringList;
    obj: PGstShmAllocator;
    pipeline, mse: PGstElement;
    fft: PGstFFTF64;
    prg: TGLuint;
  begin
    gst_init(nil, nil);

    pipeline := gst_parse_launch(PChar('filesrc location="' + path + '" ! decodebin ! audioconvert  ! autoaudiosink'), nil);
    gst_element_set_state(pipeline, GST_STATE_PLAYING);

//prg:=    CreateProgram;
//WriteLn('GL Programm: ', prg);

    mse := gst_bin_get_by_interface(GST_BIN(pipeline), GST_TYPE_MSE_SRC);
    if mse = nil then begin
      WriteLn('mse error');
    end;

    fft := gst_fft_f64_new(1024, True);
    if fft = nil then begin
      WriteLn('fft error');
    end else begin
      WriteLn('fft io.');
    end;

    //    gst_check_init(nil,nil);
    //  gst_check_remove_log_filter(nil);


    obj := g_object_new(GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_VA_DMABUF_ALLOCATOR, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_VA_DMABUF_ALLOCATOR(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_TAG_XMP_WRITER, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_WEBRTC_NICE_TRANSPORT(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_RTSP_EXTENSION, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_RTSP_EXTENSION(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    //    obj := g_object_new(GST_TYPE_WL_WINDOW, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_WL_WINDOW(obj));
    //    GObjectShowProperty(obj);
    g_object_unref(obj);



    obj := g_object_new(GST_TYPE_GL_VIEW_CONVERT, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_GL_VIEW_CONVERT(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_GL_MEMORY_ALLOCATOR, nil);
    if obj <> nil then begin
      WriteLn('io');
    end;
    WriteLn(GST_IS_GL_MEMORY_ALLOCATOR(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    WriteLn('xxxxxxxxxxxxxxxxxxx');




    obj := g_object_new(GST_TYPE_RTP_BASE_AUDIO_PAYLOAD, nil);
    WriteLn(GST_IS_RTP_BASE_AUDIO_PAYLOAD(obj));
    //    GObjectShowProperty(obj);
    g_object_unref(obj);


    obj := g_object_new(GST_TYPE_INTERPOLATION_CONTROL_SOURCE, nil);
    WriteLn(GST_IS_INTERPOLATION_CONTROL_SOURCE(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);


    obj := g_object_new(GST_MPEG_VIDEO_META_API_TYPE, nil);
    WriteLn(GST_IS_WEBRTC_NICE_TRANSPORT(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);


    obj := g_object_new(GST_MPEGTS_PES_METADATA_META_API_TYPE, nil);
    WriteLn(GST_IS_WEBRTC_NICE_TRANSPORT(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_MPEGTS_DVB_CABLE_DELIVERY_SYSTEM_DESCRIPTOR, nil);
    WriteLn(GST_IS_WEBRTC_NICE_TRANSPORT(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);


    obj := g_object_new(GST_TYPE_WEBRTC_SESSION_DESCRIPTION, nil);
    WriteLn(GST_IS_WEBRTC_NICE_TRANSPORT(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_SOURCE_BUFFER, nil);
    WriteLn(GST_IS_SOURCE_BUFFER(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_SOURCE_BUFFER_LIST, nil);
    WriteLn(GST_IS_SOURCE_BUFFER_LIST(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);


    obj := g_object_new(GST_TYPE_MSE_SRC, nil);
    if obj = nil then begin
      WriteLn('GST_TYPE_MSE_SRC error');
    end;
    WriteLn('foto ', GST_IS_MSE_SRC(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_TEST_CLOCK, nil);
    WriteLn(GST_IS_SHM_ALLOCATOR(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_SHM_ALLOCATOR, nil);
    WriteLn(GST_IS_SHM_ALLOCATOR(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    obj := g_object_new(GST_TYPE_FD_ALLOCATOR, nil);
    WriteLn('shm: ', obj <> nil);
    WriteLn(GST_IS_FD_ALLOCATOR(obj));
    GObjectShowProperty(obj);
    g_object_unref(obj);

    sl := FindAllFiles('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos', '*.flac;*.mp3', True);
    WriteDuration(sl);
    sl.Free;
    sl := FindAllFiles('/n4800/Multimedia/Music/Disco/Italo Disco/The Best Of Italo Disco Vol. 1-16', '*.flac;*.mp3', True);
    //    WriteDuration(sl);
    sl.Free;

    repeat
    until KeyPressed;
    g_object_unref(pipeline);
  end;

begin
  main;
end.
