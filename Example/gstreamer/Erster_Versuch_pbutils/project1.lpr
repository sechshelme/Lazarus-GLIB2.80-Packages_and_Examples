program project1;

uses
  Classes,
  SysUtils,
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


  //photography,                           // io.
  //photography_enumtypes,                 // io.




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
  var
    sl: TStringList;
    obj: PGstShmAllocator;
  begin
    gst_init(nil, nil);

    //    gst_check_init(nil,nil);
    //  gst_check_remove_log_filter(nil);


    obj := g_object_new(GST_TYPE_PHOTOGRAPHY, nil);
    if obj = nil then begin
      WriteLn('fotoerror');
    end;
    WriteLn('foto ', GST_IS_PHOTOGRAPHY(obj));
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
  end;

begin
  main;
end.
