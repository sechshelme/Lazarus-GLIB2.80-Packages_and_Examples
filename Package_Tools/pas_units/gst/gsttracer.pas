unit gsttracer;

interface

uses
  glib280, common_GST, gstobject, gstplugin;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGstTracerPrivate = record
  end;
  PGstTracerPrivate = ^TGstTracerPrivate;

  TGstTracer = record
    parent: TGstObject;
    priv: PGstTracerPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstTracer = ^TGstTracer;

  TGstTracerClass = record
    parent_class: TGstObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstTracerClass = ^TGstTracerClass;


function gst_tracer_get_type: TGType; cdecl; external gstreamerlib;
procedure gst_tracing_register_hook(tracer: PGstTracer; detail: Pgchar; func: TGCallback); cdecl; external gstreamerlib;
function gst_tracer_register(plugin: PGstPlugin; Name: Pgchar; _type: TGType): Tgboolean; cdecl; external gstreamerlib;
function gst_tracing_get_active_tracers: PGList; cdecl; external gstreamerlib;

function GST_TRACER_CAST(obj: Pointer): PGstTracer;

// === Konventiert am: 18-9-24 15:43:42 ===

function GST_TYPE_TRACER: TGType;
function GST_TRACER(obj: Pointer): PGstTracer;
function GST_TRACER_CLASS(klass: Pointer): PGstTracerClass;
function GST_IS_TRACER(obj: Pointer): Tgboolean;
function GST_IS_TRACER_CLASS(klass: Pointer): Tgboolean;
function GST_TRACER_GET_CLASS(obj: Pointer): PGstTracerClass;

implementation

function GST_TYPE_TRACER: TGType;
begin
  GST_TYPE_TRACER := gst_tracer_get_type;
end;

function GST_TRACER(obj: Pointer): PGstTracer;
begin
  Result := PGstTracer(g_type_check_instance_cast(obj, GST_TYPE_TRACER));
end;

function GST_TRACER_CLASS(klass: Pointer): PGstTracerClass;
begin
  Result := PGstTracerClass(g_type_check_class_cast(klass, GST_TYPE_TRACER));
end;

function GST_IS_TRACER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TRACER);
end;

function GST_IS_TRACER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_TRACER);
end;

function GST_TRACER_GET_CLASS(obj: Pointer): PGstTracerClass;
begin
  Result := PGstTracerClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TRACER_CAST(obj: Pointer): PGstTracer;
begin
  GST_TRACER_CAST := PGstTracer(obj);
end;


end.
