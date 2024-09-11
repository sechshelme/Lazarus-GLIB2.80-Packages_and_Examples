unit gstbus;

interface

uses
  glib280, common_GST, gstobject, gstmessage;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  PGstBusFlags = ^TGstBusFlags;
  TGstBusFlags =  Longint;
  Const
    GST_BUS_FLUSHING = GST_OBJECT_FLAG_LAST shl 0;
    GST_BUS_FLAG_LAST = GST_OBJECT_FLAG_LAST shl 1;
type
  PGstBusSyncReply = ^TGstBusSyncReply;
  TGstBusSyncReply =  Longint;
  Const
    GST_BUS_DROP = 0;
    GST_BUS_PASS = 1;
    GST_BUS_ASYNC = 2;
type
  TGstBusPrivate=record
        end;
  PGstBusPrivate=^TGstBusPrivate;

  TGstBus = record
      obj : TGstObject;
      priv : PGstBusPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
  PGstBus = ^TGstBus;

  TGstBusClass = record
      parent_class : TGstObjectClass;
      message : procedure (bus:PGstBus; message:PGstMessage);cdecl;
      sync_message : procedure (bus:PGstBus; message:PGstMessage);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
  PGstBusClass = ^TGstBusClass;

  TGstBusSyncHandler = function (bus:PGstBus; message:PGstMessage; user_data:Tgpointer):TGstBusSyncReply;cdecl;
  TGstBusFunc = function (bus:PGstBus; message:PGstMessage; user_data:Tgpointer):Tgboolean;cdecl;

  function gst_bus_get_type:TGType;cdecl;external gstreamerlib;
function gst_bus_new:PGstBus;cdecl;external gstreamerlib;
function gst_bus_post(bus:PGstBus; message:PGstMessage):Tgboolean;cdecl;external gstreamerlib;
function gst_bus_have_pending(bus:PGstBus):Tgboolean;cdecl;external gstreamerlib;
function gst_bus_peek(bus:PGstBus):PGstMessage;cdecl;external gstreamerlib;
function gst_bus_pop(bus:PGstBus):PGstMessage;cdecl;external gstreamerlib;
function gst_bus_pop_filtered(bus:PGstBus; types:TGstMessageType):PGstMessage;cdecl;external gstreamerlib;
function gst_bus_timed_pop(bus:PGstBus; timeout:TGstClockTime):PGstMessage;cdecl;external gstreamerlib;
function gst_bus_timed_pop_filtered(bus:PGstBus; timeout:TGstClockTime; types:TGstMessageType):PGstMessage;cdecl;external gstreamerlib;
procedure gst_bus_set_flushing(bus:PGstBus; flushing:Tgboolean);cdecl;external gstreamerlib;
procedure gst_bus_set_sync_handler(bus:PGstBus; func:TGstBusSyncHandler; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external gstreamerlib;
procedure gst_bus_get_pollfd(bus:PGstBus; fd:PGPollFD);cdecl;external gstreamerlib;
function gst_bus_create_watch(bus:PGstBus):PGSource;cdecl;external gstreamerlib;
function gst_bus_add_watch_full(bus:PGstBus; priority:Tgint; func:TGstBusFunc; user_data:Tgpointer; notify:TGDestroyNotify):Tguint;cdecl;external gstreamerlib;
function gst_bus_add_watch(bus:PGstBus; func:TGstBusFunc; user_data:Tgpointer):Tguint;cdecl;external gstreamerlib;
function gst_bus_remove_watch(bus:PGstBus):Tgboolean;cdecl;external gstreamerlib;
function gst_bus_poll(bus:PGstBus; events:TGstMessageType; timeout:TGstClockTime):PGstMessage;cdecl;external gstreamerlib;
function gst_bus_async_signal_func(bus:PGstBus; message:PGstMessage; data:Tgpointer):Tgboolean;cdecl;external gstreamerlib;
function gst_bus_sync_signal_handler(bus:PGstBus; message:PGstMessage; data:Tgpointer):TGstBusSyncReply;cdecl;external gstreamerlib;
procedure gst_bus_add_signal_watch(bus:PGstBus);cdecl;external gstreamerlib;
procedure gst_bus_add_signal_watch_full(bus:PGstBus; priority:Tgint);cdecl;external gstreamerlib;
procedure gst_bus_remove_signal_watch(bus:PGstBus);cdecl;external gstreamerlib;
procedure gst_bus_enable_sync_message_emission(bus:PGstBus);cdecl;external gstreamerlib;
procedure gst_bus_disable_sync_message_emission(bus:PGstBus);cdecl;external gstreamerlib;

function GST_BUS_CAST(obj : polongint) : PGstBus;


// === Konventiert am: 11-9-24 16:59:47 ===

function GST_TYPE_BUS : TGType;
function GST_BUS(obj : Pointer) : PGstBus;
function GST_BUS_CLASS(klass : Pointer) : PGstBusClass;
function GST_IS_BUS(obj : Pointer) : Tgboolean;
function GST_IS_BUS_CLASS(klass : Pointer) : Tgboolean;
function GST_BUS_GET_CLASS(obj : Pointer) : PGstBusClass;

implementation

function GST_TYPE_BUS : TGType;
  begin
    GST_TYPE_BUS:=gst_bus_get_type;
  end;

function GST_BUS(obj : Pointer) : PGstBus;
begin
  Result := PGstBus(g_type_check_instance_cast(obj, GST_TYPE_BUS));
end;

function GST_BUS_CLASS(klass : Pointer) : PGstBusClass;
begin
  Result := PGstBusClass(g_type_check_class_cast(klass, GST_TYPE_BUS));
end;

function GST_IS_BUS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_BUS);
end;

function GST_IS_BUS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_BUS);
end;

function GST_BUS_GET_CLASS(obj : Pointer) : PGstBusClass;
begin
  Result := PGstBusClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BUS_CAST(obj : longint) : PGstBus;
begin
  GST_BUS_CAST:=PGstBus(bus);
end;


end.
