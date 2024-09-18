program project1;

uses
  Math,
  ctypes,
  GTK4,
  GDK4,
  glib280,
  gst124;

  // https://gstreamer.freedesktop.org/documentation/tutorials/basic/toolkit-integration.html?gi-language=c

type
  TCustomData = record
    playbin: PGstElement;
    sink_widget, slider, streams_list: PGtkWidget;
    slider_update_signal_id: Tgulong;
    state: TGstState;
    duration: Tgint64;
  end;
  PCustomData = ^TCustomData;

  procedure play_cb(button: PGtkButton; Data: PCustomData); cdecl;
  begin
    gst_element_set_state(Data^.playbin, GST_STATE_PLAYING);
  end;

  procedure pause_cb(button: PGtkButton; Data: PCustomData); cdecl;
  begin
    gst_element_set_state(Data^.playbin, GST_STATE_PAUSED);
  end;

  procedure stop_cb(button: PGtkButton; Data: PCustomData); cdecl;
  begin
    gst_element_set_state(Data^.playbin, GST_STATE_READY);
  end;

  procedure delete_event_cb(widget: PGtkWidget; event: pgdkevent; Data: PCustomData); cdecl;
  begin
    stop_cb(nil, Data);
//    gtk_main_quit();
  end;

procedure slider_cb(range: PGtkRange; Data: PCustomData); cdecl;
var
  value: Tdouble;
begin
  value:=gtk_range_get_value(GTK_RANGE(Data^.slider));
  gst_element_seek_simple(Data^.playbin,GST_FORMAT_TIME,GST_SEEK_FLAG_FLUSH or GST_SEEK_FLAG_KEY_UNIT, Round(GST_SECOND));
end;

procedure activate(app: PGtkApplication; data: PCustomData);
var
  window, play_button, constrols, main_hbox, main_box: PGtkWidget;
begin
  window := gtk_application_window_new(app);
  gtk_window_set_title(GTK_WINDOW(window), 'Window');
  gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

  play_button:=gtk_button_new_from_icon_name('media-plaback-start');



  constrols:=gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
  gtk_box_append(GTK_BOX(constrols),play_button);

  main_hbox:=gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
  gtk_box_append(GTK_BOX(main_hbox),data^.sink_widget);
  gtk_box_append(GTK_BOX(main_hbox),data^.streams_list);

  main_box:=gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
  gtk_box_append(GTK_BOX(main_box),main_hbox);
  gtk_box_append(GTK_BOX(main_box),constrols);




  gtk_window_set_child(GTK_WINDOW(window), main_box);

  gtk_window_present(GTK_WINDOW(window));
end;


  function main(argc: cint; argv: PPChar): cint;
  var
    Data: TCustomData;
    app: PGtkApplication;
    status: LongInt;
  begin
    gst_init(@argc, @argv);
    FillChar(data,SizeOf(Data),$00);


    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), @Data);

    // gst zeugs

    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);





    Result := 0;
  end;

begin
  SetExceptionMask([exDenormalized, exInvalidOp, exOverflow, exPrecision, exUnderflow, exZeroDivide]);
  main(argc, argv);
end.
