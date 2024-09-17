unit gstdevicemonitor;

interface

uses
  glib280, common_GST, gstobject, gstbus, gstcaps;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGstDeviceMonitorPrivate = record
  end;
  PGstDeviceMonitorPrivate = ^TGstDeviceMonitorPrivate;

  TGstDeviceMonitor = record
    parent: TGstObject;
    priv: PGstDeviceMonitorPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstDeviceMonitor = ^TGstDeviceMonitor;

  TGstDeviceMonitorClass = record
    parent_class: TGstObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstDeviceMonitorClass = ^TGstDeviceMonitorClass;


function gst_device_monitor_get_type: TGType; cdecl; external gstreamerlib;
function gst_device_monitor_new: PGstDeviceMonitor; cdecl; external gstreamerlib;
function gst_device_monitor_get_bus(monitor: PGstDeviceMonitor): PGstBus; cdecl; external gstreamerlib;
function gst_device_monitor_get_devices(monitor: PGstDeviceMonitor): PGList; cdecl; external gstreamerlib;
function gst_device_monitor_start(monitor: PGstDeviceMonitor): Tgboolean; cdecl; external gstreamerlib;
procedure gst_device_monitor_stop(monitor: PGstDeviceMonitor); cdecl; external gstreamerlib;
function gst_device_monitor_add_filter(monitor: PGstDeviceMonitor; Classes: Pgchar; caps: PGstCaps): Tguint; cdecl; external gstreamerlib;
function gst_device_monitor_remove_filter(monitor: PGstDeviceMonitor; filter_id: Tguint): Tgboolean; cdecl; external gstreamerlib;
function gst_device_monitor_get_providers(monitor: PGstDeviceMonitor): PPgchar; cdecl; external gstreamerlib;
procedure gst_device_monitor_set_show_all_devices(monitor: PGstDeviceMonitor; show_all: Tgboolean); cdecl; external gstreamerlib;
function gst_device_monitor_get_show_all_devices(monitor: PGstDeviceMonitor): Tgboolean; cdecl; external gstreamerlib;

function GST_DEVICE_MONITOR_CAST(obj: longint): PGstDeviceMonitor;

// === Konventiert am: 17-9-24 17:52:20 ===

function GST_TYPE_DEVICE_MONITOR: TGType;
function GST_DEVICE_MONITOR(obj: Pointer): PGstDeviceMonitor;
function GST_DEVICE_MONITOR_CLASS(klass: Pointer): PGstDeviceMonitorClass;
function GST_IS_DEVICE_MONITOR(obj: Pointer): Tgboolean;
function GST_IS_DEVICE_MONITOR_CLASS(klass: Pointer): Tgboolean;
function GST_DEVICE_MONITOR_GET_CLASS(obj: Pointer): PGstDeviceMonitorClass;

implementation

function GST_TYPE_DEVICE_MONITOR: TGType;
begin
  GST_TYPE_DEVICE_MONITOR := gst_device_monitor_get_type;
end;

function GST_DEVICE_MONITOR(obj: Pointer): PGstDeviceMonitor;
begin
  Result := PGstDeviceMonitor(g_type_check_instance_cast(obj, GST_TYPE_DEVICE_MONITOR));
end;

function GST_DEVICE_MONITOR_CLASS(klass: Pointer): PGstDeviceMonitorClass;
begin
  Result := PGstDeviceMonitorClass(g_type_check_class_cast(klass, GST_TYPE_DEVICE_MONITOR));
end;

function GST_IS_DEVICE_MONITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DEVICE_MONITOR);
end;

function GST_IS_DEVICE_MONITOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_DEVICE_MONITOR);
end;

function GST_DEVICE_MONITOR_GET_CLASS(obj: Pointer): PGstDeviceMonitorClass;
begin
  Result := PGstDeviceMonitorClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_DEVICE_MONITOR_CAST(obj: longint): PGstDeviceMonitor;
begin
  GST_DEVICE_MONITOR_CAST := PGstDeviceMonitor(obj);
end;


end.
