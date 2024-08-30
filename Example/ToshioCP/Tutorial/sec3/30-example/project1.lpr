program project1;

uses
  ctypes,
  Math,
  glib280;

  // https://github.com/ToshioCP/Gobject-tutorial/blob/main/gfm/sec3.md

type
  TTDouble = record
    parent: TGObject;
    Value: cdouble;
  end;
  PTDouble = ^TTDouble;

  TTDoubleClass = record
    parent_class: TGObjectClass;
  end;

  procedure t_double_class_init(_class: TTDoubleClass); cdecl;
  begin
  end;

  procedure t_double_init(self: TTDouble); cdecl;
  begin
  end;

  function t_double_get_type: TGType; cdecl;
  const
    type_: TGType = 0;
  var
    info: TGTypeInfo;
  begin
    if type_ = 0 then begin
      info.class_size := SizeOf(TTDoubleClass);
      info.base_init := nil;
      info.base_finalize := nil;
      info.class_init := TGClassInitFunc(@t_double_class_init);
      info.class_finalize := nil;
      info.class_data := nil;
      info.instance_size := SizeOf(TDouble);
      info.n_preallocs := 0;
      info.instance_init := TGInstanceInitFunc(@t_double_init);
      info.value_table := nil;
      type_ := g_type_register_static(G_TYPE_OBJECT, 'TDouble', @info, 0);
    end;
    Result := type_;
  end;

  function T_TYPE_DOUBLE: TGType;
  begin
    Result := t_double_get_type;
  end;

  function T_DOUBLE(obj: Pointer): PTDouble;
  begin
    Result := PTDouble(g_type_check_instance_cast(obj, T_TYPE_DOUBLE));
  end;

  function T_IS_DOUBLE(obj: Pointer): Tgboolean;
  begin
    Result := g_type_check_instance_is_a(obj, T_TYPE_DOUBLE);
  end;



  function t_doube_get_value(self: PTDouble; Value: Pgdouble): Tgboolean;
  begin
    //  return_val_if_fail
    if T_IS_DOUBLE(self) then begin
      Value^ := self^.Value;
      Result := True;
    end else begin
      g_return_if_fail_warning(G_LOG_DOMAIN, nil, 'gFALSE');
      Result := False;
    end;
  end;

  procedure t_double_set_value(self: PTDouble; Value: Tgdouble);
  begin
    if T_IS_DOUBLE(self) then begin
      self^.Value := Value;
    end else begin
      g_return_if_fail_warning(G_LOG_DOMAIN, nil, 'gFALSE');
    end;
  end;

  function t_double_new(Value: Tgdouble): PTDouble;
  var
    d: PTDouble;
  begin
    d := g_object_new(T_TYPE_DOUBLE, nil);
    d^.Value := Value;
    Result := d;
  end;




  function main(argc: cint; argv: PPChar): cint;
  var
    d: PTDouble;
    value: Tgdouble;
  begin
    d:=t_double_new(10.0);

    if t_doube_get_value(d, @value) then begin
      g_print('t_doube_get_value io. :  %lf.'#10, value);
    end else begin
      g_print('t_doube_get_value error'#10);
    end;


    g_object_unref(d);

    Result := 0;


    g_return_if_fail_warning(nil, nil, 'gFalse');
  end;

begin
  SetExceptionMask([exDenormalized, exInvalidOp, exOverflow, exPrecision, exUnderflow, exZeroDivide]);
  main(argc, argv);
  WriteLn('--- ende --');
end.
