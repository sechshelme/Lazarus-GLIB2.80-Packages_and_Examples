program project1;

uses
  ctypes,
  Math,
  glib280;

  function main(argc: cint; argv: PPChar): cint;
  var
    list: PGList = nil;
  begin
    list := g_list_append(list, PChar('Hello World 1!'));
    list := g_list_append(list, PChar('Hello World 2!'));
    list := g_list_append(list, PChar('Hello World 3!'));
    list := g_list_append(list, PChar('Hello World 4!'));

    g_print('Die Anzahle der Eintraege ist: %d'#10, g_list_first(list)^.Data);

    Result := 0;
  end;

begin
  SetExceptionMask([exDenormalized, exInvalidOp, exOverflow, exPrecision, exUnderflow, exZeroDivide]);
  main(argc, argv);
  WriteLn('--- ende --');
end.
