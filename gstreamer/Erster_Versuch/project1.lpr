
program project1;

uses
  glib280,
  ctypes,

  common_GST,
  gst,                      // io.
  gstconfig,                // io.
  gstobject,                // io. -> gstconfig
  gstminiobject,            // io.
  gstenumtypes,             // io.
  gsterror,                 // io.
  gstchildproxy,            // io.
  gstparamspecs,            // io.
  gstcontrolsource,         // io.
  gstmemory,                // io.
  gstallocator,             // io. -> gstmemory
  gstcontrolbinding,        // io. -> gstobject, gstconfig
  gstclock,                 // io.
  gstinfo,                  // io.         Makros entfernt
  gstdatetime,              // io.
  gststructure,             // io. -> gstdatetime
  gstcontext,               // io. -> gststructure
  gsttaskpool,              // io.
  gsttask,                  // io. -> gsttaskpool,
  gstbytearrayinterface,    // io.    ( move() )
  gstmeta,                  // io. -> gststructure, gstbytearrayinterface
  gstcapsfeatures,          // io.
  gstcaps,                  // io. -> gststructure, gstcapsfeatures
  gstdevice,                // io. -> gstcaps, gststructure
  gstbuffer,                // io. -> gstmemory, gstallocator, gstmeta, gstcaps, gstclock
  gststreamcollection,      // io.
  gstiterator,              // io.
  gstformat,                // io. -> gstiterator
  gstsegment,               // io. -> gstformat
  gstbufferlist,            // io.
  gstsample,                // io. -> gstbuffer, gstcaps, gstsegment, gststructure, gstbufferlist
  gsttaglist,               // io. -> gstdatetime, gstsample
  gsttoc,                   // io. -> gsttaglist
  gstplugin,                // io. -> gststructure
  gstpluginfeature,         // io. -> gstplugin
  gstpadtemplate,           // io. -> gstcaps          // ( PGstPad = Pointer ) wegen Kompflickt
  gstevent,                 // io. -> gststructure, gstsegment, gststreamcollection, gstcaps, gsttaglist, gsttoc, gstformat, gstclock
  gstpad,                   // io. -> gstpadtemplate, gsttask, gstbufferlist, gstevent, gstiterator, gstcaps, gstbuffer
  gstbufferpool,            // io. -> gstformat, gststructure, gstbuffer, gstallocator, gstcaps, gstpad
  gstquery,                 // io. -> gstformat, gststructure, gstcaps, gstallocator, gstbufferpool, gstpad, gstcontext
  gstmessage,               // io. -> gststructure, gsttaglist, gstquery, gstformat, gstclock, gsttoc, gstcontext, gstevent, gstdevice, gststreamcollection
  gstbus,                   // io. -> gstmessage
  gststreams,               // io. -> gstcaps, gstevent, gsttaglist
  gstelement,               // io. -> gststructure, gstbus, gstclock, gstmessage, gstpad, gstcontext, gstdevice, gstcaps, gstpadtemplate, gstiterator, gstconfig, gstevent, gstformat, gstsegment; Makros entfernt
  gsturi,                   // io. -> gstelement
  gstelementfactory,        // io. -> gstelement, gsturi, gstplugin, gstpluginfeature, gstcaps
  gstparse,                 // io. -> gstelement
  gstbin,                   // io. -> gstelement, gstbus, gstclock, gstmessage, gstiterator
  gstutils,                 // io. -> gstelement, gstcaps, gstformat, gstpad, gstpadtemplate, gstsegment, gstbin, gstparse        Makros entfernt
  gstvalue,                 // io. -> gstcaps, gstcapsfeatures, gststructure, gstbuffer, gstdatetime
  gstdeviceprovider,        // io. -> gstbus, gstdevice
  gstdeviceproviderfactory, // io. -> gstdeviceprovider, gstplugin, gstpluginfeature
  gsttypefind,              // io. -> gstcaps, gstplugin
  gstghostpad,              // io. -> gstpad, gstpadtemplate, gstiterator, gstbufferlist
  gstregistry,              // io. -> gstplugin, gstpluginfeature
  gstdebugutils,            // io. -> gstbin





  crt;


  // https://forums.developer.nvidia.com/t/pipeline-ends-after-4-seconds-with-gst-message-eos/253486

  //const
  //  GST_CLOCK_TIME_NONE = TGstClockTime(-1);

  function gst_stream_volume_get_type(): TGType; cdecl; external 'gstaudio-1.0';



  procedure tutorial_main(argc: cint; argv: PPChar);
  var
    pipeline, filesrc, volume: PGstElement;
    ch: ansichar;
    vol: single = 1.0;
    quit: boolean = False;
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

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    repeat
      g_object_set(volume, 'volume', vol, nil);
      if KeyPressed then begin
        ch := ReadKey;
        case ch of
          #27: begin
            quit := True;
          end;
          '1': begin
            gst_element_set_state(pipeline, GST_STATE_READY);
          end;
          '2': begin
            gst_element_set_state(pipeline, GST_STATE_PLAYING);
          end;
          '3': begin
            gst_element_set_state(pipeline, GST_STATE_PAUSED);
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
          'm': begin
            g_object_set(volume, 'mute', gTRUE, nil);
          end;
          'M': begin
            g_object_set(volume, 'mute', gFALSE, nil);
          end;
        end;
      end;
    until quit;

    gst_object_unref(pipeline);
    gst_object_unref(filesrc);
  end;

begin
  tutorial_main(argc, argv);
end.
