unit gstcontext;

interface

uses
  glib280, common_GST, gstobject, gststructure, gstminiobject;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

var
  _gst_context_type: TGType; cvar;external gstreamerlib;

type
  TGstContext = record
  end;
  PGstContext = ^TGstContext;
  PPGstContext = ^PGstContext;

function gst_context_get_type: TGType; cdecl; external gstreamerlib;
function gst_context_ref(context: PGstContext): PGstContext; cdecl; external gstreamerlib;
procedure gst_context_unref(context: PGstContext); cdecl; external gstreamerlib;
procedure gst_clear_context(context_ptr: PPGstContext); cdecl; external gstreamerlib;
function gst_context_copy(context: PGstContext): PGstContext; cdecl; external gstreamerlib;

function gst_context_replace(old_context: PPGstContext; new_context: PGstContext): Tgboolean; cdecl; external gstreamerlib;
function gst_context_new(context_type: Pgchar; persistent: Tgboolean): PGstContext; cdecl; external gstreamerlib;
function gst_context_get_context_type(context: PGstContext): Pgchar; cdecl; external gstreamerlib;
function gst_context_has_context_type(context: PGstContext; context_type: Pgchar): Tgboolean; cdecl; external gstreamerlib;
function gst_context_get_structure(context: PGstContext): PGstStructure; cdecl; external gstreamerlib;
function gst_context_writable_structure(context: PGstContext): PGstStructure; cdecl; external gstreamerlib;
function gst_context_is_persistent(context: PGstContext): Tgboolean; cdecl; external gstreamerlib;

function GST_TYPE_CONTEXT: TGType;

function GST_IS_CONTEXT(obj: TGType): Tgboolean;
function GST_CONTEXT_CAST(obj: Pointer): PGstContext;
function GST_CONTEXT(obj: Pointer): PGstContext;

function gst_context_is_writable(context: Pointer): Tgboolean;
function gst_context_make_writable(context: Pointer): PGstContext;

// === Konventiert am: 14-9-24 19:45:57 ===


implementation

function GST_TYPE_CONTEXT: TGType;
begin
  Result := _gst_context_type;
end;


function GST_IS_CONTEXT(obj: TGType): Tgboolean;
begin
  GST_IS_CONTEXT := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_CONTEXT);
end;

function GST_CONTEXT_CAST(obj: Pointer): PGstContext;
begin
  GST_CONTEXT_CAST := PGstContext(obj);
end;

function GST_CONTEXT(obj: Pointer): PGstContext;
begin
  GST_CONTEXT := GST_CONTEXT_CAST(obj);
end;

function gst_context_is_writable(context: Pointer): Tgboolean;
begin
  gst_context_is_writable := gst_mini_object_is_writable(GST_MINI_OBJECT_CAST(context));
end;

function gst_context_make_writable(context: Pointer): PGstContext;
begin
  gst_context_make_writable := GST_CONTEXT_CAST(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(context)));
end;


end.