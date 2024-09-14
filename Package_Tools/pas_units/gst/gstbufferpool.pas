unit gstbufferpool;

interface

uses
  glib280, common_GST, gstobject, gstformat, gststructure, gstbuffer,gstallocator, gstcaps, gstpad;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGstBufferPoolAcquireFlags = ^TGstBufferPoolAcquireFlags;
  TGstBufferPoolAcquireFlags = longint;

const
  GST_BUFFER_POOL_ACQUIRE_FLAG_NONE = 0;
  GST_BUFFER_POOL_ACQUIRE_FLAG_KEY_UNIT = 1 shl 0;
  GST_BUFFER_POOL_ACQUIRE_FLAG_DONTWAIT = 1 shl 1;
  GST_BUFFER_POOL_ACQUIRE_FLAG_DISCONT = 1 shl 2;
  GST_BUFFER_POOL_ACQUIRE_FLAG_LAST = 1 shl 16;

type
  TGstBufferPoolAcquireParams = record
    format: TGstFormat;
    start: Tgint64;
    stop: Tgint64;
    flags: TGstBufferPoolAcquireFlags;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstBufferPoolAcquireParams = ^TGstBufferPoolAcquireParams;

type
  TGstBufferPoolClass = record
    object_class: TGstObjectClass;
    get_options: function(pool: PGstBufferPool): PPgchar; cdecl;
    set_config: function(pool: PGstBufferPool; config: PGstStructure): Tgboolean; cdecl;
    start: function(pool: PGstBufferPool): Tgboolean; cdecl;
    stop: function(pool: PGstBufferPool): Tgboolean; cdecl;
    acquire_buffer: function(pool: PGstBufferPool; buffer: PPGstBuffer; params: PGstBufferPoolAcquireParams): TGstFlowReturn; cdecl;
    alloc_buffer: function(pool: PGstBufferPool; buffer: PPGstBuffer; params: PGstBufferPoolAcquireParams): TGstFlowReturn; cdecl;
    reset_buffer: procedure(pool: PGstBufferPool; buffer: PGstBuffer); cdecl;
    release_buffer: procedure(pool: PGstBufferPool; buffer: PGstBuffer); cdecl;
    free_buffer: procedure(pool: PGstBufferPool; buffer: PGstBuffer); cdecl;
    flush_start: procedure(pool: PGstBufferPool); cdecl;
    flush_stop: procedure(pool: PGstBufferPool); cdecl;
    _gst_reserved: array[0..(GST_PADDING - 2) - 1] of Tgpointer;
  end;
  PGstBufferPoolClass = ^TGstBufferPoolClass;


function gst_buffer_pool_get_type: TGType; cdecl; external gstreamerlib;
function gst_buffer_pool_new: PGstBufferPool; cdecl; external gstreamerlib;
function gst_buffer_pool_set_active(pool: PGstBufferPool; active: Tgboolean): Tgboolean; cdecl; external gstreamerlib;
function gst_buffer_pool_is_active(pool: PGstBufferPool): Tgboolean; cdecl; external gstreamerlib;
function gst_buffer_pool_set_config(pool: PGstBufferPool; config: PGstStructure): Tgboolean; cdecl; external gstreamerlib;
function gst_buffer_pool_get_config(pool: PGstBufferPool): PGstStructure; cdecl; external gstreamerlib;
function gst_buffer_pool_get_options(pool: PGstBufferPool): PPgchar; cdecl; external gstreamerlib;
function gst_buffer_pool_has_option(pool: PGstBufferPool; option: Pgchar): Tgboolean; cdecl; external gstreamerlib;
procedure gst_buffer_pool_set_flushing(pool: PGstBufferPool; flushing: Tgboolean); cdecl; external gstreamerlib;
procedure gst_buffer_pool_config_set_params(config: PGstStructure; caps: PGstCaps; size: Tguint; min_buffers: Tguint; max_buffers: Tguint); cdecl; external gstreamerlib;
function gst_buffer_pool_config_get_params(config: PGstStructure; caps: PPGstCaps; size: Pguint; min_buffers: Pguint; max_buffers: Pguint): Tgboolean; cdecl; external gstreamerlib;
procedure gst_buffer_pool_config_set_allocator(config: PGstStructure; allocator: PGstAllocator; params: PGstAllocationParams); cdecl; external gstreamerlib;
function gst_buffer_pool_config_get_allocator(config: PGstStructure; allocator: PPGstAllocator; params: PGstAllocationParams): Tgboolean; cdecl; external gstreamerlib;
function gst_buffer_pool_config_n_options(config: PGstStructure): Tguint; cdecl; external gstreamerlib;
procedure gst_buffer_pool_config_add_option(config: PGstStructure; option: Pgchar); cdecl; external gstreamerlib;
function gst_buffer_pool_config_get_option(config: PGstStructure; index: Tguint): Pgchar; cdecl; external gstreamerlib;
function gst_buffer_pool_config_has_option(config: PGstStructure; option: Pgchar): Tgboolean; cdecl; external gstreamerlib;
function gst_buffer_pool_config_validate_params(config: PGstStructure; caps: PGstCaps; size: Tguint; min_buffers: Tguint; max_buffers: Tguint): Tgboolean; cdecl; external gstreamerlib;
function gst_buffer_pool_acquire_buffer(pool: PGstBufferPool; buffer: PPGstBuffer; params: PGstBufferPoolAcquireParams): TGstFlowReturn; cdecl; external gstreamerlib;
procedure gst_buffer_pool_release_buffer(pool: PGstBufferPool; buffer: PGstBuffer); cdecl; external gstreamerlib;

function GST_BUFFER_POOL_CAST(obj: longint): PGstBufferPool;

function GST_BUFFER_POOL_IS_FLUSHING(pool: longint): longint;

// === Konventiert am: 12-9-24 18:04:11 ===

function GST_TYPE_BUFFER_POOL: TGType;
function GST_BUFFER_POOL(obj: Pointer): PGstBufferPool;
function GST_BUFFER_POOL_CLASS(klass: Pointer): PGstBufferPoolClass;
function GST_IS_BUFFER_POOL(obj: Pointer): Tgboolean;
function GST_IS_BUFFER_POOL_CLASS(klass: Pointer): Tgboolean;
function GST_BUFFER_POOL_GET_CLASS(obj: Pointer): PGstBufferPoolClass;

implementation

function GST_TYPE_BUFFER_POOL: TGType;
begin
  GST_TYPE_BUFFER_POOL := gst_buffer_pool_get_type;
end;

function GST_BUFFER_POOL(obj: Pointer): PGstBufferPool;
begin
  Result := PGstBufferPool(g_type_check_instance_cast(obj, GST_TYPE_BUFFER_POOL));
end;

function GST_BUFFER_POOL_CLASS(klass: Pointer): PGstBufferPoolClass;
begin
  Result := PGstBufferPoolClass(g_type_check_class_cast(klass, GST_TYPE_BUFFER_POOL));
end;

function GST_IS_BUFFER_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_BUFFER_POOL);
end;

function GST_IS_BUFFER_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_BUFFER_POOL);
end;

function GST_BUFFER_POOL_GET_CLASS(obj: Pointer): PGstBufferPoolClass;
begin
  Result := PGstBufferPoolClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BUFFER_POOL_CAST(obj: longint): PGstBufferPool;
begin
  GST_BUFFER_POOL_CAST := PGstBufferPool(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function GST_BUFFER_POOL_IS_FLUSHING(pool: longint): longint;
begin
  GST_BUFFER_POOL_IS_FLUSHING := g_atomic_int_get(@(pool^.flushing));
end;


end.
