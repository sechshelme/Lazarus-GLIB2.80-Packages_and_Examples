unit gstbuffer;

interface

uses
  glib280, common_GST, gstobject, gstminiobject, gstbufferpool;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

  var
    _gst_buffer_type : TGType;cvar;external gstreamerlib;

type
  PGstBufferFlags = ^TGstBufferFlags;
  TGstBufferFlags =  Longint;
  Const
    GST_BUFFER_FLAG_LIVE = GST_MINI_OBJECT_FLAG_LAST shl 0;
    GST_BUFFER_FLAG_DECODE_ONLY = GST_MINI_OBJECT_FLAG_LAST shl 1;
    GST_BUFFER_FLAG_DISCONT = GST_MINI_OBJECT_FLAG_LAST shl 2;
    GST_BUFFER_FLAG_RESYNC = GST_MINI_OBJECT_FLAG_LAST shl 3;
    GST_BUFFER_FLAG_CORRUPTED = GST_MINI_OBJECT_FLAG_LAST shl 4;
    GST_BUFFER_FLAG_MARKER = GST_MINI_OBJECT_FLAG_LAST shl 5;
    GST_BUFFER_FLAG_HEADER = GST_MINI_OBJECT_FLAG_LAST shl 6;
    GST_BUFFER_FLAG_GAP = GST_MINI_OBJECT_FLAG_LAST shl 7;
    GST_BUFFER_FLAG_DROPPABLE = GST_MINI_OBJECT_FLAG_LAST shl 8;
    GST_BUFFER_FLAG_DELTA_UNIT = GST_MINI_OBJECT_FLAG_LAST shl 9;
    GST_BUFFER_FLAG_TAG_MEMORY = GST_MINI_OBJECT_FLAG_LAST shl 10;
    GST_BUFFER_FLAG_SYNC_AFTER = GST_MINI_OBJECT_FLAG_LAST shl 11;
    GST_BUFFER_FLAG_NON_DROPPABLE = GST_MINI_OBJECT_FLAG_LAST shl 12;
    GST_BUFFER_FLAG_LAST = GST_MINI_OBJECT_FLAG_LAST shl 16;
type
  PGstBuffer = ^TGstBuffer;
  TGstBuffer = record
      mini_object : TGstMiniObject;
      pool : PGstBufferPool;
      pts : TGstClockTime;
      dts : TGstClockTime;
      duration : TGstClockTime;
      offset : Tguint64;
      offset_end : Tguint64;
    end;

function gst_buffer_get_type:TGType;cdecl;external gstreamerlib;
function gst_buffer_get_max_memory:Tguint;cdecl;external gstreamerlib;
function gst_buffer_new:PGstBuffer;cdecl;external gstreamerlib;
function gst_buffer_new_allocate(allocator:PGstAllocator; size:Tgsize; params:PGstAllocationParams):PGstBuffer;cdecl;external gstreamerlib;
function gst_buffer_new_wrapped_full(flags:TGstMemoryFlags; data:Tgpointer; maxsize:Tgsize; offset:Tgsize; size:Tgsize; 
           user_data:Tgpointer; notify:TGDestroyNotify):PGstBuffer;cdecl;external gstreamerlib;
function gst_buffer_new_wrapped(data:Tgpointer; size:Tgsize):PGstBuffer;cdecl;external gstreamerlib;
function gst_buffer_new_wrapped_bytes(bytes:PGBytes):PGstBuffer;cdecl;external gstreamerlib;
function gst_buffer_new_memdup(data:Tgconstpointer; size:Tgsize):PGstBuffer;cdecl;external gstreamerlib;
function gst_buffer_n_memory(buffer:PGstBuffer):Tguint;cdecl;external gstreamerlib;
procedure gst_buffer_insert_memory(buffer:PGstBuffer; idx:Tgint; mem:PGstMemory);cdecl;external gstreamerlib;
procedure gst_buffer_replace_memory_range(buffer:PGstBuffer; idx:Tguint; length:Tgint; mem:PGstMemory);cdecl;external gstreamerlib;
function gst_buffer_peek_memory(buffer:PGstBuffer; idx:Tguint):PGstMemory;cdecl;external gstreamerlib;
function gst_buffer_get_memory_range(buffer:PGstBuffer; idx:Tguint; length:Tgint):PGstMemory;cdecl;external gstreamerlib;
procedure gst_buffer_remove_memory_range(buffer:PGstBuffer; idx:Tguint; length:Tgint);cdecl;external gstreamerlib;
procedure gst_buffer_prepend_memory(buffer:PGstBuffer; mem:PGstMemory);cdecl;external gstreamerlib;
procedure gst_buffer_append_memory(buffer:PGstBuffer; mem:PGstMemory);cdecl;external gstreamerlib;
procedure gst_buffer_replace_memory(buffer:PGstBuffer; idx:Tguint; mem:PGstMemory);cdecl;external gstreamerlib;
procedure gst_buffer_replace_all_memory(buffer:PGstBuffer; mem:PGstMemory);cdecl;external gstreamerlib;
function gst_buffer_get_memory(buffer:PGstBuffer; idx:Tguint):PGstMemory;cdecl;external gstreamerlib;
function gst_buffer_get_all_memory(buffer:PGstBuffer):PGstMemory;cdecl;external gstreamerlib;
procedure gst_buffer_remove_memory(buffer:PGstBuffer; idx:Tguint);cdecl;external gstreamerlib;
procedure gst_buffer_remove_all_memory(buffer:PGstBuffer);cdecl;external gstreamerlib;
function gst_buffer_find_memory(buffer:PGstBuffer; offset:Tgsize; size:Tgsize; idx:Pguint; length:Pguint; 
           skip:Pgsize):Tgboolean;cdecl;external gstreamerlib;
function gst_buffer_is_memory_range_writable(buffer:PGstBuffer; idx:Tguint; length:Tgint):Tgboolean;cdecl;external gstreamerlib;
function gst_buffer_is_all_memory_writable(buffer:PGstBuffer):Tgboolean;cdecl;external gstreamerlib;
function gst_buffer_fill(buffer:PGstBuffer; offset:Tgsize; src:Tgconstpointer; size:Tgsize):Tgsize;cdecl;external gstreamerlib;
function gst_buffer_extract(buffer:PGstBuffer; offset:Tgsize; dest:Tgpointer; size:Tgsize):Tgsize;cdecl;external gstreamerlib;
function gst_buffer_memcmp(buffer:PGstBuffer; offset:Tgsize; mem:Tgconstpointer; size:Tgsize):Tgint;cdecl;external gstreamerlib;
function gst_buffer_memset(buffer:PGstBuffer; offset:Tgsize; val:Tguint8; size:Tgsize):Tgsize;cdecl;external gstreamerlib;
function gst_buffer_get_sizes_range(buffer:PGstBuffer; idx:Tguint; length:Tgint; offset:Pgsize; maxsize:Pgsize):Tgsize;cdecl;external gstreamerlib;
function gst_buffer_resize_range(buffer:PGstBuffer; idx:Tguint; length:Tgint; offset:Tgssize; size:Tgssize):Tgboolean;cdecl;external gstreamerlib;
function gst_buffer_get_sizes(buffer:PGstBuffer; offset:Pgsize; maxsize:Pgsize):Tgsize;cdecl;external gstreamerlib;
function gst_buffer_get_size(buffer:PGstBuffer):Tgsize;cdecl;external gstreamerlib;
procedure gst_buffer_resize(buffer:PGstBuffer; offset:Tgssize; size:Tgssize);cdecl;external gstreamerlib;
procedure gst_buffer_set_size(buffer:PGstBuffer; size:Tgssize);cdecl;external gstreamerlib;
function gst_buffer_map_range(buffer:PGstBuffer; idx:Tguint; length:Tgint; info:PGstMapInfo; flags:TGstMapFlags):Tgboolean;cdecl;external gstreamerlib;
function gst_buffer_map(buffer:PGstBuffer; info:PGstMapInfo; flags:TGstMapFlags):Tgboolean;cdecl;external gstreamerlib;
procedure gst_buffer_unmap(buffer:PGstBuffer; info:PGstMapInfo);cdecl;external gstreamerlib;
procedure gst_buffer_extract_dup(buffer:PGstBuffer; offset:Tgsize; size:Tgsize; dest:Pgpointer; dest_size:Pgsize);cdecl;external gstreamerlib;
function gst_buffer_get_flags(buffer:PGstBuffer):TGstBufferFlags;cdecl;external gstreamerlib;
function gst_buffer_has_flags(buffer:PGstBuffer; flags:TGstBufferFlags):Tgboolean;cdecl;external gstreamerlib;
function gst_buffer_set_flags(buffer:PGstBuffer; flags:TGstBufferFlags):Tgboolean;cdecl;external gstreamerlib;
function gst_buffer_unset_flags(buffer:PGstBuffer; flags:TGstBufferFlags):Tgboolean;cdecl;external gstreamerlib;
function gst_buffer_ref(buf:PGstBuffer):PGstBuffer;cdecl;external gstreamerlib;
procedure gst_buffer_unref(buf:PGstBuffer);cdecl;external gstreamerlib;
procedure gst_clear_buffer(buf_ptr:PPGstBuffer);cdecl;external gstreamerlib;
function gst_buffer_copy(buf:PGstBuffer):PGstBuffer;cdecl;external gstreamerlib;
function gst_buffer_copy_deep(buf:PGstBuffer):PGstBuffer;cdecl;external gstreamerlib;
type
  PGstBufferCopyFlags = ^TGstBufferCopyFlags;
  TGstBufferCopyFlags =  Longint;
  Const
    GST_BUFFER_COPY_NONE = 0;
    GST_BUFFER_COPY_FLAGS = 1 shl 0;
    GST_BUFFER_COPY_TIMESTAMPS = 1 shl 1;
    GST_BUFFER_COPY_META = 1 shl 2;
    GST_BUFFER_COPY_MEMORY = 1 shl 3;
    GST_BUFFER_COPY_MERGE = 1 shl 4;
    GST_BUFFER_COPY_DEEP = 1 shl 5;

function gst_buffer_copy_into(dest:PGstBuffer; src:PGstBuffer; flags:TGstBufferCopyFlags; offset:Tgsize; size:Tgsize):Tgboolean;cdecl;external gstreamerlib;

function gst_buffer_replace(obuf:PPGstBuffer; nbuf:PGstBuffer):Tgboolean;cdecl;external gstreamerlib;
function gst_buffer_copy_region(parent:PGstBuffer; flags:TGstBufferCopyFlags; offset:Tgsize; size:Tgsize):PGstBuffer;cdecl;external gstreamerlib;
function gst_buffer_append_region(buf1:PGstBuffer; buf2:PGstBuffer; offset:Tgssize; size:Tgssize):PGstBuffer;cdecl;external gstreamerlib;
function gst_buffer_append(buf1:PGstBuffer; buf2:PGstBuffer):PGstBuffer;cdecl;external gstreamerlib;
type
  TGstBufferForeachMetaFunc = function (buffer:PGstBuffer; meta:PPGstMeta; user_data:Tgpointer):Tgboolean;cdecl;

function gst_buffer_get_meta(buffer:PGstBuffer; api:TGType):PGstMeta;cdecl;external gstreamerlib;
function gst_buffer_get_n_meta(buffer:PGstBuffer; api_type:TGType):Tguint;cdecl;external gstreamerlib;
function gst_buffer_add_meta(buffer:PGstBuffer; info:PGstMetaInfo; params:Tgpointer):PGstMeta;cdecl;external gstreamerlib;
function gst_buffer_remove_meta(buffer:PGstBuffer; meta:PGstMeta):Tgboolean;cdecl;external gstreamerlib;
function gst_buffer_iterate_meta(buffer:PGstBuffer; state:Pgpointer):PGstMeta;cdecl;external gstreamerlib;
function gst_buffer_iterate_meta_filtered(buffer:PGstBuffer; state:Pgpointer; meta_api_type:TGType):PGstMeta;cdecl;external gstreamerlib;
function gst_buffer_foreach_meta(buffer:PGstBuffer; func:TGstBufferForeachMetaFunc; user_data:Tgpointer):Tgboolean;cdecl;external gstreamerlib;
function gst_buffer_add_custom_meta(buffer:PGstBuffer; name:Pgchar):PGstCustomMeta;cdecl;external gstreamerlib;
function gst_buffer_get_custom_meta(buffer:PGstBuffer; name:Pgchar):PGstCustomMeta;cdecl;external gstreamerlib;

type
  PGstParentBufferMeta = ^TGstParentBufferMeta;
  TGstParentBufferMeta = record
      parent : TGstMeta;cdecl;
      buffer : PGstBuffer;
    end;

function gst_parent_buffer_meta_api_get_type:TGType;cdecl;external gstreamerlib;
const
  GST_TYPE_PARENT_BUFFER_META_API_TYPE = GST_PARENT_BUFFER_META_API_TYPE;  

function gst_buffer_add_parent_buffer_meta(buffer:PGstBuffer; ref:PGstBuffer):PGstParentBufferMeta;cdecl;external gstreamerlib;
type
  PGstReferenceTimestampMeta = ^TGstReferenceTimestampMeta;
  TGstReferenceTimestampMeta = record
      parent : TGstMeta;
      reference : PGstCaps;
      timestamp : TGstClockTime;
      duration : TGstClockTime;
    end;

function gst_buffer_add_reference_timestamp_meta(buffer:PGstBuffer; reference:PGstCaps; timestamp:TGstClockTime; duration:TGstClockTime):PGstReferenceTimestampMeta;cdecl;external gstreamerlib;
function gst_buffer_get_reference_timestamp_meta(buffer:PGstBuffer; reference:PGstCaps):PGstReferenceTimestampMeta;cdecl;external gstreamerlib;
type
  PGstBufferMapInfo = ^TGstBufferMapInfo;
  TGstBufferMapInfo = TGstMapInfo;
{ xxxxxxxxxxxxxxxxxxxxxx }
{static inline void _gst_buffer_map_info_clear(GstBufferMapInfo *info) }
{ G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(GstBufferMapInfo, _gst_buffer_map_info_clear) }

function  GST_TYPE_BUFFER :TGType;

function GST_IS_BUFFER(obj : longint) : longint;
function GST_BUFFER_CAST(obj : longint) : PGstBuffer;
function GST_BUFFER(obj : longint) : longint;
function GST_BUFFER_FLAGS(buf : longint) : longint;
function GST_BUFFER_FLAG_IS_SET(buf,flag : longint) : longint;
function GST_BUFFER_FLAG_SET(buf,flag : longint) : longint;
function GST_BUFFER_FLAG_UNSET(buf,flag : longint) : longint;
function GST_BUFFER_PTS(buf : longint) : longint;
function GST_BUFFER_DTS(buf : longint) : longint;
function GST_BUFFER_DTS_OR_PTS(buf : longint) : longint;
function GST_BUFFER_DURATION(buf : longint) : longint;
function GST_BUFFER_OFFSET(buf : longint) : longint;
function GST_BUFFER_OFFSET_END(buf : longint) : longint;
function GST_BUFFER_OFFSET_NONE : Tguint64;
function GST_BUFFER_DURATION_IS_VALID(buffer : longint) : longint;
function GST_BUFFER_PTS_IS_VALID(buffer : longint) : longint;
function GST_BUFFER_DTS_IS_VALID(buffer : longint) : longint;
function GST_BUFFER_OFFSET_IS_VALID(buffer : longint) : longint;
function GST_BUFFER_OFFSET_END_IS_VALID(buffer : longint) : longint;
function GST_BUFFER_IS_DISCONT(buffer : longint) : longint;

function GST_BUFFER_COPY_METADATA : TGstBufferCopyFlags;
function GST_BUFFER_COPY_ALL : TGstBufferCopyFlags;

function gst_buffer_is_writable(buf : longint) : longint;
function gst_buffer_make_writable(buf : longint) : longint;

function gst_value_set_buffer(v,b : longint) : longint;
function gst_value_take_buffer(v,b : longint) : longint;
function gst_value_get_buffer(v : longint) : longint;

function GST_PARENT_BUFFER_META_API_TYPE : longint; { return type might be wrong }
function gst_buffer_get_parent_buffer_meta(b : longint) : PGstParentBufferMeta;

function gst_parent_buffer_meta_get_info:PGstMetaInfo;cdecl;external gstreamerlib;
function GST_PARENT_BUFFER_META_INFO : longint; { return type might be wrong }

function gst_reference_timestamp_meta_api_get_type:TGType;cdecl;external gstreamerlib;
function GST_REFERENCE_TIMESTAMP_META_API_TYPE : longint; { return type might be wrong }
function gst_reference_timestamp_meta_get_info:PGstMetaInfo;cdecl;external gstreamerlib;
function GST_REFERENCE_TIMESTAMP_META_INFO : longint; { return type might be wrong }






// === Konventiert am: 12-9-24 17:55:21 ===


implementation

function  GST_TYPE_BUFFER :TGType;
begin
  resu



{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BUFFER(obj : longint) : longint;
begin
  GST_IS_BUFFER:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_BUFFER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BUFFER_CAST(obj : longint) : PGstBuffer;
begin
  GST_BUFFER_CAST:=PGstBuffer(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER(obj : longint) : longint;
begin
  GST_BUFFER:=GST_BUFFER_CAST(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_FLAGS(buf : longint) : longint;
begin
  GST_BUFFER_FLAGS:=GST_MINI_OBJECT_FLAGS(buf);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_FLAG_IS_SET(buf,flag : longint) : longint;
begin
  GST_BUFFER_FLAG_IS_SET:=GST_MINI_OBJECT_FLAG_IS_SET(buf,flag);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_FLAG_SET(buf,flag : longint) : longint;
begin
  GST_BUFFER_FLAG_SET:=GST_MINI_OBJECT_FLAG_SET(buf,flag);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_FLAG_UNSET(buf,flag : longint) : longint;
begin
  GST_BUFFER_FLAG_UNSET:=GST_MINI_OBJECT_FLAG_UNSET(buf,flag);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_PTS(buf : longint) : longint;
begin
  GST_BUFFER_PTS:=(GST_BUFFER_CAST(buf))^.pts;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_DTS(buf : longint) : longint;
begin
  GST_BUFFER_DTS:=(GST_BUFFER_CAST(buf))^.dts;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_DTS_OR_PTS(buf : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if GST_BUFFER_DTS_IS_VALID(buf) then
    if_local1:=GST_BUFFER_DTS(buf)
  else
    if_local1:=GST_BUFFER_PTS(buf);
  GST_BUFFER_DTS_OR_PTS:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_DURATION(buf : longint) : longint;
begin
  GST_BUFFER_DURATION:=(GST_BUFFER_CAST(buf))^.duration;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_OFFSET(buf : longint) : longint;
begin
  GST_BUFFER_OFFSET:=(GST_BUFFER_CAST(buf))^.offset;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_OFFSET_END(buf : longint) : longint;
begin
  GST_BUFFER_OFFSET_END:=(GST_BUFFER_CAST(buf))^.offset_end;
end;

{ was #define dname def_expr }
function GST_BUFFER_OFFSET_NONE : Tguint64;
  begin
    GST_BUFFER_OFFSET_NONE:=Tguint64(-(1));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_DURATION_IS_VALID(buffer : longint) : longint;
begin
  GST_BUFFER_DURATION_IS_VALID:=GST_CLOCK_TIME_IS_VALID(GST_BUFFER_DURATION(buffer));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_PTS_IS_VALID(buffer : longint) : longint;
begin
  GST_BUFFER_PTS_IS_VALID:=GST_CLOCK_TIME_IS_VALID(GST_BUFFER_PTS(buffer));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_DTS_IS_VALID(buffer : longint) : longint;
begin
  GST_BUFFER_DTS_IS_VALID:=GST_CLOCK_TIME_IS_VALID(GST_BUFFER_DTS(buffer));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_OFFSET_IS_VALID(buffer : longint) : longint;
begin
  GST_BUFFER_OFFSET_IS_VALID:=(GST_BUFFER_OFFSET(buffer))<>GST_BUFFER_OFFSET_NONE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_OFFSET_END_IS_VALID(buffer : longint) : longint;
begin
  GST_BUFFER_OFFSET_END_IS_VALID:=(GST_BUFFER_OFFSET_END(buffer))<>GST_BUFFER_OFFSET_NONE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_IS_DISCONT(buffer : longint) : longint;
begin
  GST_BUFFER_IS_DISCONT:=GST_BUFFER_FLAG_IS_SET(buffer,GST_BUFFER_FLAG_DISCONT);
end;

{ was #define dname def_expr }
function GST_BUFFER_COPY_METADATA : TGstBufferCopyFlags;
  begin
    GST_BUFFER_COPY_METADATA:=TGstBufferCopyFlags((GST_BUFFER_COPY_FLAGS or GST_BUFFER_COPY_TIMESTAMPS) or GST_BUFFER_COPY_META);
  end;

{ was #define dname def_expr }
function GST_BUFFER_COPY_ALL : TGstBufferCopyFlags;
  begin
    GST_BUFFER_COPY_ALL:=TGstBufferCopyFlags(GST_BUFFER_COPY_METADATA or GST_BUFFER_COPY_MEMORY);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_buffer_is_writable(buf : longint) : longint;
begin
  gst_buffer_is_writable:=gst_mini_object_is_writable(GST_MINI_OBJECT_CAST(buf));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_buffer_make_writable(buf : longint) : longint;
begin
  gst_buffer_make_writable:=GST_BUFFER_CAST(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(buf)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_set_buffer(v,b : longint) : longint;
begin
  gst_value_set_buffer:=g_value_set_boxed(v,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_take_buffer(v,b : longint) : longint;
begin
  gst_value_take_buffer:=g_value_take_boxed(v,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_get_buffer(v : longint) : longint;
begin
  gst_value_get_buffer:=GST_BUFFER_CAST(g_value_get_boxed(v));
end;

{ was #define dname def_expr }
function GST_PARENT_BUFFER_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_PARENT_BUFFER_META_API_TYPE:=gst_parent_buffer_meta_api_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_parent_buffer_meta(b : longint) : PGstParentBufferMeta;
begin
  gst_buffer_get_parent_buffer_meta:=PGstParentBufferMeta(gst_buffer_get_meta(b,GST_PARENT_BUFFER_META_API_TYPE));
end;

{ was #define dname def_expr }
function GST_PARENT_BUFFER_META_INFO : longint; { return type might be wrong }
  begin
    GST_PARENT_BUFFER_META_INFO:=gst_parent_buffer_meta_get_info;
  end;

{ was #define dname def_expr }
function GST_REFERENCE_TIMESTAMP_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_REFERENCE_TIMESTAMP_META_API_TYPE:=gst_reference_timestamp_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_REFERENCE_TIMESTAMP_META_INFO : longint; { return type might be wrong }
  begin
    GST_REFERENCE_TIMESTAMP_META_INFO:=gst_reference_timestamp_meta_get_info;
  end;


end.
