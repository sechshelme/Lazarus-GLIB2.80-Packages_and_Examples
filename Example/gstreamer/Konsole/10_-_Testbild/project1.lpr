
program project1;

uses
  Crt,
  ctypes,
  glib280,
  gst124;

//  function gst_stream_volume_get_type():TGType;cdecl;external 'gstaudio-1.0';
//  function gst_video_test_src_get_type:TGType;cdecl;external 'gstvideo-1.0';

  // https://gstreamer.freedesktop.org/documentation/videotestsrc/?gi-language=c

  procedure tutorial_main(argc: cint; argv: PPChar);
  var
    pipeline, filesrc, src: PGstElement;
    pattern:Tgint=0;  // GstVideoTestSrcPattern
    ch: AnsiChar;
    quit:Boolean=False;
  begin
    gst_init(@argc, @argv);

      pipeline := gst_parse_launch('videotestsrc name=src ! autovideosink', nil);
    if pipeline = nil then begin
      WriteLn('pipeline error');
    end else begin
      WriteLn('pipeline io.');
    end;

    src := gst_bin_get_by_name(GST_BIN(pipeline), 'src');
    //src := gst_bin_get_by_interface(GST_BIN( pipeline), GST_TYPE_STREAM_VOLUME);
//   src := gst_bin_get_by_interface(GST_BIN( pipeline), gst_video_test_src_get_type());
    if src = nil then begin
      WriteLn('src error');
    end else begin
      WriteLn('src io.');
    end;

    g_object_set(src, 'pattern', pattern, nil);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    repeat
      if KeyPressed then begin
        ch := ReadKey;
        case ch of
          #27: begin
            quit := True;
          end;
          'p': begin
            Inc(pattern);
            if pattern>25 then pattern:=0;
            g_object_set(src, 'pattern', pattern, nil);
          end;
          'P': begin
            Dec(pattern);
            if pattern<9 then pattern:=25;
            g_object_set(src, 'pattern', pattern, nil);
          end;
        end;
      end;
    until quit;
    gst_object_unref(pipeline);
    gst_object_unref(src);
  end;

begin
  tutorial_main(argc, argv);
end.
