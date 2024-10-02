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

  //audio_format,                  // io.
  //gstaudiocdsrc,                 // io.
  //gstaudiostreamalign,           // io.
  //audio_enumtypes,               // io.
  //audio,                         // io.
  //gstaudioclock,                 // io.
  //streamvolume,                  // io.
  //audio_channels,                // io. -> audio_format
  //audio_quantize,                // io. -> audio_format
  //audio_info,                    // io. -> audio_format, audio_channels
  //audio_channel_mixer,           // io. -> audio_format, audio_channels
  //gstnonstreamaudiodecoder,      // io. -> audio_info, audio_format
  //gstaudiofilter,                // io. -> audio_info, audio_format
  //audio_buffer,                  // io. -> audio_info, audio_format
  //gstaudiodecoder,               // io. -> audio_info
  //gstaudioencoder,               // io. -> audio_info
  //audio_converter,               // io. -> audio_info
  //gstaudioaggregator,            // io. -> audio_info
  //gstplanaraudioadapter,         // io. -> audio_info
  //gstdsdformat,                  // io.
  //gstaudioringbuffer,            // io. -> audio_info, gstdsdformat, audio_channels
  //gstaudiobasesrc,               // io. -> gstaudioringbuffer
  //gstaudiosrc,                   // io. -> gstaudiobasesrc
  //gstaudioiec61937,              // io. -> gstaudioringbuffer
  //gstaudiobasesink,              // io. -> gstaudioringbuffer
  //gstdsd,                        // io. -> gstdsdformat, audio_format, audio_info, audio_channels
  //audio_resampler,               // io. -> audio_format         (  provided_clock <-> clock ???? )
  //gstaudiometa,                  // io. -> audio_channels, audio_info
  //gstaudiosink,                  // io. -> gstaudiobasesink, gstaudioringbuffer

  // video

  //video,                                // io.
  //video_enumtypes,                      // io.
  //video_resampler,                      // io.
  //navigation,                           // io.
  //videoorientation,                     // io.
  //videooverlay,                         // io.
  //video_sei,                            // io.
  //gstvideoaffinetransformationmeta,     // io.
  //video_event,                          // io.
  //gstvideocodecalphameta,               // io.
  //videodirection,                       // io.
  //colorbalancechannel,                  // io.
  //colorbalance,                         // io. -> colorbalancechannel
  //video_tile,                           // io.
  //video_format,                         // io. -> video_tile     viele Makros entfernt
  //video_anc,                            // io. -> video_format          Fehler im Makro C-seitig
  //video_chroma,                         // io. -> video_format
  //video_dither,                         // io. -> video_format
  //video_scaler,                         // io. -> video_resampler, video_format
  //video_color,                          // io. -> video_format, video
  //video_info,                           // io. -> video_format, video_color
  //video_hdr,                            // io.
  //gstvideoutils,                        // io. -> video_info, video_hdr
  //gstvideoencoder,                      // io. -> gstvideoutils
  //video_multiview,                      // io. -> video_info
  //gstvideosink,                         // io. -> video_info
  //video_info_dma,                       // io. -> video_info, video_format
  //video_frame,                          // io. -> video_info, video
  //gstvideofilter,                       // io. -> video_info, video_frame
  //video_converter,                      // io. -> video_info, video_frame
  //gstvideoaggregator,                   // io. -> video_info, video_frame
  //gstvideopool,                         // io. -> video_info, video_frame
  //video_blend,                          // io. -> video_info, video_frame
  //video_overlay_composition,            // io. -> video_format, video_frame
  //gstvideodecoder,                      // io. -> gstvideoutils, video_format, video_info
  //gstvideotimecode,                     // io.
  //gstvideometa,                         // io. -> video, video_frame, video_format, video_info, gstvideotimecode

  // pbutils

  //pbutils,                       // io.
  //missing_plugins,               // io.
  //pbutils_enumtypes,             // io.
  //codec_utils,                   // io.
  //install_plugins,               // io.
  //gstaudiovisualizer,            // io.
  //gstdiscoverer,                 // io.
  //encoding_profile,              // io. -> gstdiscoverer
  //encoding_target,               // io. -> encoding_profile
  //descriptions,                  // io.
  //gstpluginsbaseversion,         //  version makro !

  // allocators

  //gstdrmdumb,                      // io.
  //gstphysmemory,                   // io.
  //gstfdmemory,                     // io.
  //gstshmallocator,                 // io. -> gstfdmemory
  //gstdmabuf,                       // io. -> gstfdmemory

//
//  gstanalyticsmeta,                  // io.
//  gstanalyticsclassificationmtd,     // io. -> gstanalyticsmeta
//  gstanalyticsobjectdetectionmtd,    // io. -> gstanalyticsmeta
//  gstanalyticsobjecttrackingmtd,     // io. -> gstanalyticsmeta


  // CK_DLL_EXP  internal-check.h

  gstcheck,                        // viele Makros entfernt
  gstbufferstraw,
  gstconsistencychecker,
  gstharness,
  gsttestclock,
  internal_check,                // viele Makros entfernt   lib CK_DLL_EXP  ?????




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

    gst_check_init(nil,nil);
    gst_check_remove_log_filter(nil);
    WriteLn(PtrUInt(gst_harness_new_empty));
    WriteLn(PtrUInt(suite_create('abc')));


    obj := g_object_new(GST_TYPE_DRM_DUMB_ALLOCATOR, nil);
    WriteLn(GST_IS_SHM_ALLOCATOR(obj));
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
