program project1;

uses
  ctypes,
  Math,
  glib280;

  // https://github.com/ToshioCP/Gobject-tutorial/blob/main/gfm/sec2.md

  procedure show_ref_count(ainstance: PGObject);
  begin
    if G_IS_OBJECT(ainstance) then begin
      g_print('Reference count is %d.'#10, ainstance^.ref_count);
    end else begin
      g_print('Instance is not GObject.'#10);
    end;
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    instance: PGObject;
  begin
    instance := g_object_new(G_TYPE_OBJECT, nil);
    g_print('Call g_object_new.'#10);
    show_ref_count(instance);

    g_object_unref(instance);

    Exit(0);
  end;

begin
  SetExceptionMask([exDenormalized, exInvalidOp, exOverflow, exPrecision, exUnderflow, exZeroDivide]);
  main(argc, argv);
end.
