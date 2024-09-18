unit gsttypefindfactory;

interface

uses
  glib280, common_GST, gstobject, gsttypefind, gstcaps;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGstTypeFindFactory = record
  end;
  PGstTypeFindFactory = ^TGstTypeFindFactory;

  TGstTypeFindFactoryClass = record
  end;
  PGstTypeFindFactoryClass = ^TGstTypeFindFactoryClass;

function gst_type_find_factory_get_type: TGType; cdecl; external gstreamerlib;
function gst_type_find_factory_get_list: PGList; cdecl; external gstreamerlib;
function gst_type_find_factory_get_extensions(factory: PGstTypeFindFactory): PPgchar; cdecl; external gstreamerlib;
function gst_type_find_factory_get_caps(factory: PGstTypeFindFactory): PGstCaps; cdecl; external gstreamerlib;
function gst_type_find_factory_has_function(factory: PGstTypeFindFactory): Tgboolean; cdecl; external gstreamerlib;
procedure gst_type_find_factory_call_function(factory: PGstTypeFindFactory; find: PGstTypeFind); cdecl; external gstreamerlib;

// === Konventiert am: 18-9-24 15:44:01 ===

function GST_TYPE_TYPE_FIND_FACTORY: TGType;
function GST_TYPE_FIND_FACTORY(obj: Pointer): PGstTypeFindFactory;
function GST_TYPE_FIND_FACTORY_CLASS(klass: Pointer): PGstTypeFindFactoryClass;
function GST_IS_TYPE_FIND_FACTORY(obj: Pointer): Tgboolean;
function GST_IS_TYPE_FIND_FACTORY_CLASS(klass: Pointer): Tgboolean;
function GST_TYPE_FIND_FACTORY_GET_CLASS(obj: Pointer): PGstTypeFindFactoryClass;

implementation

function GST_TYPE_TYPE_FIND_FACTORY: TGType;
begin
  GST_TYPE_TYPE_FIND_FACTORY := gst_type_find_factory_get_type;
end;

function GST_TYPE_FIND_FACTORY(obj: Pointer): PGstTypeFindFactory;
begin
  Result := PGstTypeFindFactory(g_type_check_instance_cast(obj, GST_TYPE_TYPE_FIND_FACTORY));
end;

function GST_TYPE_FIND_FACTORY_CLASS(klass: Pointer): PGstTypeFindFactoryClass;
begin
  Result := PGstTypeFindFactoryClass(g_type_check_class_cast(klass, GST_TYPE_TYPE_FIND_FACTORY));
end;

function GST_IS_TYPE_FIND_FACTORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TYPE_FIND_FACTORY);
end;

function GST_IS_TYPE_FIND_FACTORY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_TYPE_FIND_FACTORY);
end;

function GST_TYPE_FIND_FACTORY_GET_CLASS(obj: Pointer): PGstTypeFindFactoryClass;
begin
  Result := PGstTypeFindFactoryClass(PGTypeInstance(obj)^.g_class);
end;



end.
