program project1;

uses
  ctypes,
  Math,
  glib280;

  procedure print_list(ls: PGList);
  var
    First: PGList;
    Count: Tguint;
  begin
    Count := g_list_length(ls);
    g_print(#10'Anzahl Eintraege: %i'#10, Count);

    First := g_list_first(ls);
    while First <> nil do begin
      g_print('Eintrag: %s'#10, First^.Data);
      First := g_list_next(First);
    end;
  end;

  procedure list_clear_cp(Data: Tgpointer); cdecl;
  begin
    WriteLn('clear');
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    list: PGList = nil;
  begin
    list := g_list_append(list, PChar('Hello World 1!'));
    list := g_list_append(list, PChar('Hello World 2!'));
    list := g_list_append(list, PChar('Hello World 3!'));
    list := g_list_append(list, PChar('Hello World 4!'));

    g_print('Der erste Eintrag ist: %s'#10, g_list_first(list)^.Data);

    print_list(list);

    g_list_insert(list, PChar('neuer Eintrag'), 2);
    g_list_reverse(list);
    print_list(list);

    g_list_free_full(list, @list_clear_cp);
    list:=nil;
    list := g_list_append(list, PChar('eins'));
    list := g_list_append(list, PChar('zwei'));
    list := g_list_append(list, PChar('drei'));
    print_list(list);




    Result := 0;
  end;

begin
  SetExceptionMask([exDenormalized, exInvalidOp, exOverflow, exPrecision, exUnderflow, exZeroDivide]);
  main(argc, argv);
  WriteLn('--- ende --');
end.
