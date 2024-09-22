
program project1;

uses
  glib2,
  ctypes,

  gst;

  procedure main;
  var
    pipeline: PGstElement;
  begin
    gst_init(nil, nil);

    //   pipeline := gst_parse_launch('playbin uri=file:/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.wav ! volume', nil);
    // pipeline := gst_parse_launch('filesrc location=/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/test.wav ! wavparse ! audioconvert ! volume ! autoaudiosink', nil);
    pipeline := gst_parse_launch('filesrc location=/home/tux/Schreibtisch/sound/test.mp3 ! decodebin ! audioconvert ! audioresample ! volume ! autoaudiosink', nil);
    if pipeline = nil then begin
      WriteLn('pipeline error');
    end else begin
      WriteLn('pipeline io.');
    end;

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    ReadLn;

    gst_object_unref(pipeline);
  end;

begin
  main;
end.
