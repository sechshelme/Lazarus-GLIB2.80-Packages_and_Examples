
program project1;

uses
  glib280,
  ctypes,


  common_GST,
  gst,                    // io.
  gstconfig,              // io.
  gstobject,              // io. -> gstconfig
  gstminiobject,

  gstmemory,              // io.
  gstallocator,           // io. -> gstmemory
  gstcontrolbinding,      // io. -> gstobject, gstconfig
  gstclock,               // io.
  gstdatetime,            // io.
  gststructure,           // io. -> gstdatetime
  gsttaskpool,            // io.
  gsttask,                // io. -> gsttaskpool,
  gstbytearrayinterface,  // io.    ( move() )
  gstmeta,                // io. -> gststructure, gstbytearrayinterface
  gstcapsfeatures,        // io.
  gstcaps,                // io. -> gststructure, gstcapsfeatures
  gstbuffer,              // io. -> gstmemory, gstallocator, gstmeta, gstcaps, gstclock
  gstiterator,            // io.
  gstformat,              // io. -> gstiterator
  gstsegment,             // io. -> gstformat
  gstbufferlist,          // io.
  gstsample,              // io. -> gstbuffer, gstcaps, gstsegment, gststructure, gstbufferlist
  gsttaglist,             // io. -> gstdatetime, gstsample
  gsttoc,                 // io. -> gsttaglist
  gstplugin,              // io. -> gststructure
  gstpluginfeature,       // io. -> gstplugin


  gstelement,       // Makros entfernt
  gstelementfactory,      // io. -> gstelement, gsturi, gstplugin, gstpluginfeature, gstcaps

  gsturi,
  gstcontext,
  gstdevice,

  gststreamcollection,
  gststreams,
  gstevent,
  gstpadtemplate,                   // ( PGstPad = Pointer ) wegen Kompflickt
  gstpad,
  gstquery,
  gstbufferpool,
  gstmessage,
  gstbus,




  crt;


  // https://forums.developer.nvidia.com/t/pipeline-ends-after-4-seconds-with-gst-message-eos/253486

  //const
  //  GST_CLOCK_TIME_NONE = TGstClockTime(-1);

  function gst_stream_volume_get_type(): TGType; cdecl; external 'gstaudio-1.0';



  procedure tutorial_main(argc: cint; argv: PPChar);
  var
    pipeline, filesrc, volume: PGstElement;
  begin
    gst_init(@argc, @argv);

    //  pipeline := gst_parse_launch('playbin uri=file:/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.wav ! volume', nil);

    pipeline := gst_parse_launch('filesrc location=/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.wav ! wavparse ! audioconvert ! volume ! autoaudiosink', nil);
    if pipeline = nil then begin
      WriteLn('pipeline error');
    end else begin
      WriteLn('pipeline io.');
    end;

    filesrc := gst_bin_get_by_name(GST_BIN(pipeline), 'filesrc0');
    if filesrc = nil then begin
      WriteLn('filesrc error');
    end else begin
      WriteLn('filesrc io.');
    end;
    //    g_object_set(filesrc, 'location', 'test.wav');

    //  volume := gst_bin_get_by_name(GST_BIN(pipeline), 'volume0');
    //volume := gst_bin_get_by_interface(GST_BIN( pipeline), GST_TYPE_STREAM_VOLUME);
    volume := gst_bin_get_by_interface(GST_BIN(pipeline), gst_stream_volume_get_type());
    if volume = nil then begin
      WriteLn('volume error');
    end else begin
      WriteLn('volume io.');
    end;

    g_object_set(volume, 'volume', 0.1, nil);


    gst_element_set_state(pipeline, GST_STATE_PLAYING);


    repeat
    until KeyPressed;

    gst_object_unref(pipeline);
    gst_object_unref(filesrc);
  end;

begin
  tutorial_main(argc, argv);
end.
