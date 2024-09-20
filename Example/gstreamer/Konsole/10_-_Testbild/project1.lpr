
program project1;

uses
  Crt,
  ctypes,
  glib280,
  gst124;

  //  function gst_stream_volume_get_type():TGType;cdecl;external 'gstaudio-1.0';
  //  function gst_video_test_src_get_type:TGType;cdecl;external 'gstvideo-1.0';

  // https://gstreamer.freedesktop.org/documentation/videotestsrc/?gi-language=c

  procedure showProperty(e: Pointer);
  var
    prolist: PPGParamSpec;
    Count: Tguint;
    i: integer;
    valueType, value: string;
    name: Pgchar;
    p:Tgpointer;
  begin
    if GST_IS_OBJECT(e) then begin
      prolist := g_object_class_list_properties(G_OBJECT_GET_CLASS(e), @Count);

      WriteLn('count:', Count);
      for i := 0 to Count - 1 do begin
        value:='<unknow>';
        name:=prolist[i]^.Name;
        g_object_get(G_OBJECT(e), name, @p,nil);
        case prolist[i]^.value_type of
          G_TYPE_INVALID: begin
            valueType := 'G_TYPE_INVALID';
          end;
          G_TYPE_NONE: begin
            valueType := 'G_TYPE_NONE';
          end;
          G_TYPE_INTERFACE: begin
            valueType := 'G_TYPE_INTERFACE';
          end;
          G_TYPE_CHAR: begin
            valueType := 'G_TYPE_CHAR';
            WriteStr(value,  Byte(p));
          end;
          G_TYPE_UCHAR: begin
            valueType := 'G_TYPE_UCHAR';
          end;
          G_TYPE_BOOLEAN: begin
            valueType := 'G_TYPE_BOOLEAN';
          end;
          G_TYPE_INT: begin
            valueType := 'G_TYPE_INT';
          end;
          G_TYPE_UINT: begin
            valueType := 'G_TYPE_UINT';
          end;
          G_TYPE_ULONG: begin
            valueType := 'G_TYPE_ULONG';
          end;
          G_TYPE_INT64: begin
            valueType := 'G_TYPE_INT64';
          end;
          G_TYPE_UINT64: begin
            valueType := 'G_TYPE_UINT64';
          end;
          G_TYPE_ENUM: begin
            valueType := 'G_TYPE_ENUM';
          end;
          G_TYPE_FLAGS: begin
            valueType := 'G_TYPE_FLAGS';
          end;
          G_TYPE_FLOAT: begin
            valueType := 'G_TYPE_FLOAT';
          end;
          G_TYPE_DOUBLE: begin
            valueType := 'G_TYPE_DOUBLE';
          end;
          G_TYPE_STRING: begin
            valueType := 'G_TYPE_STRING';
            value:=PChar(p);
          end;
          G_TYPE_POINTER: begin
            valueType := 'G_TYPE_POINTER';
          end;
          G_TYPE_BOXED: begin
            valueType := 'G_TYPE_BOXED';
          end;
          G_TYPE_OBJECT: begin
            valueType := 'G_TYPE_OBJECT';
          end;
          G_TYPE_RESERVED_GLIB_FIRST: begin
            valueType := 'G_TYPE_RESERVED_GLIB_FIRST';
          end;
          G_TYPE_RESERVED_GLIB_LAST: begin
            valueType := 'G_TYPE_RESERVED_GLIB_LAST';
          end;
          G_TYPE_RESERVED_BSE_FIRST: begin
            valueType := 'G_TYPE_RESERVED_BSE_FIRST';
          end;
//          G_TYPE_RESERVED_BSE_LAST: begin
//            valueType := 'G_TYPE_RESERVED_BSE_LAST';
//          end;
          G_TYPE_RESERVED_USER_FIRST: begin
            valueType := 'G_TYPE_RESERVED_USER_FIRST';
          end;
          else begin
            valueType := '<unknow>';
          end;
        end;

        WriteLn(i: 3, 'Name: ', prolist[i]^.Name, '  Valuetype: ', valueType, '  Value: ', value);
      end;
      g_free(prolist);
    end;
  end;



  procedure tutorial_main(argc: cint; argv: PPChar);
  var
    pipeline, src: PGstElement;
    pattern: Tgint = 0;  // GstVideoTestSrcPattern
    ch: ansichar;
    quit: boolean = False;
    fgCol, bgCol: Tguint;
    flip: Tgboolean;
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
      showProperty(src);
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
          'c': begin
            fgCol := Random($FFFFFFFF);
            bgCol := Random($FFFFFFFF);
            g_object_set(src, 'foreground-color', fgCol, 'background-color', bgCol, nil);
          end;
          'f': begin
            g_object_get(src, 'flip', @flip, nil);
            flip := not flip;
            ;
            g_object_set(src, 'flip', flip, nil);
          end;

          'p': begin
            Inc(pattern);
            if pattern > 25 then begin
              pattern := 0;
            end;
            g_object_set(src, 'pattern', pattern, nil);
          end;
          'P': begin
            Dec(pattern);
            if pattern < 9 then begin
              pattern := 25;
            end;
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
