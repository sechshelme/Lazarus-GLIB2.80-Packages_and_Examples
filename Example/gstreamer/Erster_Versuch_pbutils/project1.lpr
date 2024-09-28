program project1;

uses
  Classes,
  sysutils,
  FileUtil,


  glib280,
  gst124,

  // audio

  audio_channels,
  audio_format,
  audio_info,
  gstnonstreamaudiodecoder,

  // video

  // pbutils

  codec_utils,
  install_plugins,
  gstaudiovisualizer,
  gstdiscoverer,
  encoding_target,
  encoding_profile,
  descriptions,
  gstpluginsbaseversion,    // version makro !
  missing_plugins,
  pbutils,
  pbutils_enumtypes,

  // base

  gstaggregator,                 // io.
  gstcollectpads,                // io.
  gstadapter,                    // io.
  gstbytereader,                 // viele Makros entfernt
  gstbaseparse,                  // io.
  gstbasetransform,              // io.
  gstbasesrc,
  gstbytewriter,                 // viele Makros entfernt




  gstTools;

  function get_duration(s: string): Tguint64;
  var
    discoverer, info: Pointer;
  begin
    discoverer := gst_discoverer_new(5 * GST_SECOND, nil);

    //  info := gst_discoverer_discover_uri(discoverer, 'file:/home/tux/Schreibtisch/sound/test.mp3', nil);
    info := gst_discoverer_discover_uri(discoverer, PChar('file:' + s), nil);

    if info = nil then begin
      WriteLn('Info error !');
      Result := -1;
    end else begin
      Result := gst_discoverer_info_get_duration(info) div G_USEC_PER_SEC;
      //    gst_discoverer_info_unref(info);
      g_object_unref(info);
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
begin
  gst_init(nil,nil);

  sl := FindAllFiles('/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos', '*.flac;*.mp3', True);
  WriteDuration(sl);
  sl.Free;
  sl := FindAllFiles('/n4800/Multimedia/Music/Disco/Italo Disco/The Best Of Italo Disco Vol. 1-16', '*.flac;*.mp3', True);
  WriteDuration(sl);
  sl.Free;
end;

begin
  main;
end.

