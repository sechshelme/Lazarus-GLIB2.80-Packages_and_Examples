program project1;

uses
  ctypes,
  glib280,
  gst124;

  // https://gstreamer.freedesktop.org/documentation/tutorials/basic/media-formats-and-pad-capabilities.html?gi-language=c

  procedure print_pad_templates_information(factory: PGstElementFactory);
  begin
    //  gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_LONGNAME);
    g_print('Pad Templates for %s:'#10, gst_element_factory_get_longname(factory));
    if gst_element_factory_get_num_pad_templates(factory) = 0 then begin
      g_print('  none'#10);
      exit;
    end;
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    source_factory, sink_factory: PGstElementFactory;
  begin
    gst_init(@argc, @argv);

    source_factory := gst_element_factory_find('audiotestsrc');
    sink_factory := gst_element_factory_find('autoaudiosink');
    if (source_factory = nil) or (sink_factory = nil) then begin
      gst_printerr('Not all element factories could be created.'#10);
      Exit(-1);
    end;

    print_pad_templates_information(source_factory);
    print_pad_templates_information(sink_factory);
  end;

begin
  main(argc, argv);
end.
