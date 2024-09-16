unit 123;

interface

uses
  glib280, common_GST, gstobject;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GHOST_PAD_CAST(obj : longint) : PGstGhostPad;


// === Konventiert am: 16-9-24 18:09:13 ===

function GST_TYPE_GHOST_PAD : TGType;
function GST_GHOST_PAD(obj : Pointer) : PGstGhostPad;
function GST_GHOST_PAD_CLASS(klass : Pointer) : PGstGhostPadClass;
function GST_IS_GHOST_PAD(obj : Pointer) : Tgboolean;
function GST_IS_GHOST_PAD_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_GHOST_PAD : TGType;
  begin
    GST_TYPE_GHOST_PAD:=gst_ghost_pad_get_type;
  end;

function GST_GHOST_PAD(obj : Pointer) : PGstGhostPad;
begin
  Result := PGstGhostPad(g_type_check_instance_cast(obj, GST_TYPE_GHOST_PAD));
end;

function GST_GHOST_PAD_CLASS(klass : Pointer) : PGstGhostPadClass;
begin
  Result := PGstGhostPadClass(g_type_check_class_cast(klass, GST_TYPE_GHOST_PAD));
end;

function GST_IS_GHOST_PAD(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_GHOST_PAD);
end;

function GST_IS_GHOST_PAD_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_GHOST_PAD);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GHOST_PAD_CAST(obj : longint) : PGstGhostPad;
begin
  GST_GHOST_PAD_CAST:=PGstGhostPad(obj);
end;


end.
