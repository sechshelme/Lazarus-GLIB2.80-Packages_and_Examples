
program project1;

uses
  ctypes,
  glib280,
  gst124;

  procedure Play_uri_1;
  var
    pipeline: PGstElement;
  begin
    pipeline := gst_parse_launch('playbin uri=file:/home/tux/Schreibtisch/sound/test.mp3', nil);
    if pipeline = nil then begin
      WriteLn('pipeline error');
    end else begin
      WriteLn('pipeline io.');
    end;

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    WriteLn('Press <ENTER>');
    ReadLn;

    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(pipeline);
  end;

procedure Play_uri_2;
var
  pipeline, bin: PGstElement;
begin
//  pipeline := gst_parse_launch('playbin name=bin ! volume', nil);
  pipeline := gst_parse_launch('playbin name=bin ! level', nil);
  if pipeline = nil then begin
    WriteLn('pipeline error');
  end else begin
    WriteLn('pipeline io.');
  end;

  bin := gst_bin_get_by_name(GST_BIN(pipeline), 'bin');
  if bin = nil then begin
    WriteLn('bin error');
  end else begin
    WriteLn('bin io.');
  end;
  g_object_set(bin, 'uri', 'file:/home/tux/Schreibtisch/sound/test.mp3',nil);

  gst_element_set_state(pipeline, GST_STATE_PLAYING);

  WriteLn('Press <ENTER>');
  ReadLn;

  gst_element_set_state(pipeline, GST_STATE_NULL);
  gst_object_unref(pipeline);
end;

var
  s: string = '';

begin
  gst_init(nil, nil);
  repeat
    WriteLn('<1> - Classic');
    WriteLn('<q> - Exit');
    ReadLn(s);
    case s of
      '1': begin
        Play_uri_1;
      end;
      '2': begin
        Play_uri_2;
      end;
    end;
  until s = 'q';
end.
