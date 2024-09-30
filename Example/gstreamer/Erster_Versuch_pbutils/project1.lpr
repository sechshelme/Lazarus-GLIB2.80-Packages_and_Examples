program project1;

uses
  Classes,
  sysutils,
  FileUtil,


  glib280,
  gst124,
  gst124_base,

  // base

  //gstaggregator,                 // io.
  //gstcollectpads,                // io.
  //gstadapter,                    // io.
  //gstbaseparse,                  // io.
  //gstbasetransform,              // io.
  //gstbasesrc,                    // io.
  //gstpushsrc,                    // io. -> gstbasesrc
  //gstbasesink,                   // io.
  //gstdataqueue,                  // io.
  //gstqueuearray,                 // io.
  //gsttypefindhelper,             // io.
  //gstflowcombiner,               // io.
  //gstbitreader,                  // io.   viele Makros entfernt
  //gstbitwriter,                  // io.   viele Makros entfernt
  //gstbytereader,                 // io.   viele Makros entfernt
  //gstbytewriter,                 // io. -> gstbytereader    viele Makros entfernt

  // audio

  audio_format,                  // io.
  gstaudiocdsrc,                 // io.
  gstaudiostreamalign,           // io.
  audio_enumtypes,               // io.
  audio,                         // io.
  gstaudiosrc,                   // io.
  gstaudioclock,                 // io.
  streamvolume,                  // io.
  audio_channels,                // io. -> audio_format
  audio_quantize,                // io. -> audio_format
  audio_info,                    // io. -> audio_format, audio_channels
  audio_channel_mixer,           // io. -> audio_format, audio_channels
  gstnonstreamaudiodecoder,      // io. -> audio_info, audio_format
  gstaudiofilter,                // io. -> audio_info, audio_format
  audio_buffer,                  // io. -> audio_info, audio_format
  gstaudiodecoder,               // io. -> audio_info
  gstaudioencoder,               // io. -> audio_info
  audio_converter,               // io. -> audio_info
  gstaudioaggregator,            // io. -> audio_info
  gstplanaraudioadapter,         // io. -> audio_info
  gstdsdformat,                  // io.
  gstaudioringbuffer,            // io. -> audio_info, gstdsdformat, audio_channels
  gstaudiobasesrc,               // io. -> gstaudioringbuffer
  gstaudioiec61937,              // io. -> gstaudioringbuffer
  gstaudiobasesink,              // io. -> gstaudioringbuffer
  gstdsd,                        // io. -> gstdsdformat, audio_format, audio_info, audio_channels
  audio_resampler,               // io. -> audio_format         (  provided_clock <-> clock ???? )
  gstaudiometa,                  // io. -> audio_channels, audio_info
  gstaudiosink,                  // io. -> gstaudiobasesink, gstaudioringbuffer

  // video

  video,                         // io.
  navigation,                    // io.
  video_hdr,                     // io.
  gstvideoutils,                 // io. -> video_info, video_hdr
  gstvideoencoder,               // io. -> gstvideoutils
  video_tile,                    // io.
  video_format,                  // io. -> video_tile, video     viele Makros entfernt
  video_anc,                     // io. -> video_format          Fehler im Makro C-seitig
  video_chroma,                  // io. -> video_format
  video_color,                   // io. -> video_format, video
  video_info,                    // io. -> video_format, video_color, video       makro and / not
  video_frame,                   // io. -> video_info, video
  gstvideoaggregator,            // io. -> video_info, video_frame
  gstvideodecoder,               // io. -> gstvideoutils, video_format, video_info
  gstvideotimecode,              // io.
  gstvideometa,                  // io. -> video, video_frame, video_format, video_info, gstvideotimecode



  // pbutils

  pbutils,                       // io.
  missing_plugins,               // io.
  pbutils_enumtypes,             // io.
  codec_utils,                   // io.
  install_plugins,               // io.
  gstaudiovisualizer,            // io.
  gstdiscoverer,                 // io.
  encoding_profile,              // io. -> gstdiscoverer
  encoding_target,               // io. -> encoding_profile
  descriptions,                  // io.
  gstpluginsbaseversion,         //  version makro !


  gstTools;

  function get_duration(s: string): Tguint64;
  var
    discoverer, info: Pointer;
  begin
    discoverer := gst_discoverer_new(5 * GST_SECOND, nil);


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

