
unit gstmemory;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstmemory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstmemory.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
Pgsize  = ^gsize;
PGstAllocator  = ^GstAllocator;
PGstMapFlags  = ^GstMapFlags;
PGstMapInfo  = ^GstMapInfo;
PGstMemory  = ^GstMemory;
PGstMemoryCopyFunction  = ^GstMemoryCopyFunction;
PGstMemoryFlags  = ^GstMemoryFlags;
PGstMemoryMapInfo  = ^GstMemoryMapInfo;
PGstMemoryShareFunction  = ^GstMemoryShareFunction;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2009 Wim Taymans <wim.taymans@gmail.be>
 *
 * gstmemory.h: Header for memory blocks
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_MEMORY_H__}
{$define __GST_MEMORY_H__}
{$include <gst/gstconfig.h>}
{$include <glib-object.h>}
{$include <gst/gstminiobject.h>}
{$include <gst/gstobject.h>}
  var
    _gst_memory_type : TGType;cvar;external;

const
  GST_TYPE_MEMORY = _gst_memory_type;  

function gst_memory_get_type:TGType;cdecl;external;
type
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_MEMORY_CAST(mem : longint) : PGstMemory;

{*
 * GstMemoryFlags:
 * @GST_MEMORY_FLAG_READONLY: memory is readonly. It is not allowed to map the
 * memory with #GST_MAP_WRITE.
 * @GST_MEMORY_FLAG_NO_SHARE: memory must not be shared. Copies will have to be
 * made when this memory needs to be shared between buffers. (DEPRECATED:
 * do not use in new code, instead you should create a custom GstAllocator for
 * memory pooling instead of relying on the GstBuffer they were originally
 * attached to.)
 * @GST_MEMORY_FLAG_ZERO_PREFIXED: the memory prefix is filled with 0 bytes
 * @GST_MEMORY_FLAG_ZERO_PADDED: the memory padding is filled with 0 bytes
 * @GST_MEMORY_FLAG_PHYSICALLY_CONTIGUOUS: the memory is physically
 * contiguous. (Since: 1.2)
 * @GST_MEMORY_FLAG_NOT_MAPPABLE: the memory can't be mapped via
 * gst_memory_map() without any preconditions. (Since: 1.2)
 * @GST_MEMORY_FLAG_LAST: first flag that can be used for custom purposes
 *
 * Flags for wrapped memory.
  }
type
  PGstMemoryFlags = ^TGstMemoryFlags;
  TGstMemoryFlags =  Longint;
  Const
    GST_MEMORY_FLAG_READONLY = GST_MINI_OBJECT_FLAG_LOCK_READONLY;
    GST_MEMORY_FLAG_NO_SHARE = GST_MINI_OBJECT_FLAG_LAST shl 0;
    GST_MEMORY_FLAG_ZERO_PREFIXED = GST_MINI_OBJECT_FLAG_LAST shl 1;
    GST_MEMORY_FLAG_ZERO_PADDED = GST_MINI_OBJECT_FLAG_LAST shl 2;
    GST_MEMORY_FLAG_PHYSICALLY_CONTIGUOUS = GST_MINI_OBJECT_FLAG_LAST shl 3;
    GST_MEMORY_FLAG_NOT_MAPPABLE = GST_MINI_OBJECT_FLAG_LAST shl 4;
    GST_MEMORY_FLAG_LAST = GST_MINI_OBJECT_FLAG_LAST shl 16;
;
{*
 * GST_MEMORY_FLAGS:
 * @mem: a #GstMemory.
 *
 * A flags word containing #GstMemoryFlags flags set on @mem
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_MEMORY_FLAGS(mem : longint) : longint;

{*
 * GST_MEMORY_FLAG_IS_SET:
 * @mem: a #GstMemory.
 * @flag: the #GstMemoryFlags to check.
 *
 * Gives the status of a specific flag on a @mem.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_FLAG_IS_SET(mem,flag : longint) : longint;

{*
 * GST_MEMORY_FLAG_UNSET:
 * @mem: a #GstMemory.
 * @flag: the #GstMemoryFlags to clear.
 *
 * Clear a specific flag on a @mem.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_FLAG_UNSET(mem,flag : longint) : longint;

{*
 * GST_MEMORY_IS_READONLY:
 * @mem: a #GstMemory.
 *
 * Check if @mem is readonly.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_IS_READONLY(mem : longint) : longint;

{*
 * GST_MEMORY_IS_NO_SHARE:
 * @mem: a #GstMemory.
 *
 * Check if @mem cannot be shared between buffers
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_IS_NO_SHARE(mem : longint) : longint;

{*
 * GST_MEMORY_IS_ZERO_PREFIXED:
 * @mem: a #GstMemory.
 *
 * Check if the prefix in @mem is 0 filled.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_IS_ZERO_PREFIXED(mem : longint) : longint;

{*
 * GST_MEMORY_IS_ZERO_PADDED:
 * @mem: a #GstMemory.
 *
 * Check if the padding in @mem is 0 filled.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_IS_ZERO_PADDED(mem : longint) : longint;

{*
 * GST_MEMORY_IS_PHYSICALLY_CONTIGUOUS:
 * @mem: a #GstMemory.
 *
 * Check if @mem is physically contiguous.
 *
 * Since: 1.2
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_IS_PHYSICALLY_CONTIGUOUS(mem : longint) : longint;

{*
 * GST_MEMORY_IS_NOT_MAPPABLE:
 * @mem: a #GstMemory.
 *
 * Check if @mem can't be mapped via gst_memory_map() without any preconditions
 *
 * Since: 1.2
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_IS_NOT_MAPPABLE(mem : longint) : longint;

{*
 * GstMemory:
 * @mini_object: parent structure
 * @allocator: pointer to the #GstAllocator
 * @parent: parent memory block
 * @maxsize: the maximum size allocated
 * @align: the alignment of the memory
 * @offset: the offset where valid data starts
 * @size: the size of valid data
 *
 * Base structure for memory implementations. Custom memory will put this structure
 * as the first member of their structure.
  }
type
  PGstMemory = ^TGstMemory;
  TGstMemory = record
      mini_object : TGstMiniObject;
      allocator : PGstAllocator;
      parent : PGstMemory;
      maxsize : Tgsize;
      align : Tgsize;
      offset : Tgsize;
      size : Tgsize;
    end;

{*
 * GstMapFlags:
 * @GST_MAP_READ: map for read access
 * @GST_MAP_WRITE: map for write access
 * @GST_MAP_FLAG_LAST: first flag that can be used for custom purposes
 *
 * Flags used when mapping memory
  }

  PGstMapFlags = ^TGstMapFlags;
  TGstMapFlags =  Longint;
  Const
    GST_MAP_READ = GST_LOCK_FLAG_READ;
    GST_MAP_WRITE = GST_LOCK_FLAG_WRITE;
    GST_MAP_FLAG_LAST = 1 shl 16;
;
{*
 * GST_MAP_READWRITE: (value 3) (type GstMapFlags)
 *
 * GstMapFlags value alias for GST_MAP_READ | GST_MAP_WRITE
  }

{ was #define dname def_expr }
function GST_MAP_READWRITE : TGstMapFlags;  

{*
 * GstMapInfo:
 * @memory: a pointer to the mapped memory
 * @flags: flags used when mapping the memory
 * @data: (array length=size): a pointer to the mapped data
 * @size: the valid size in @data
 * @maxsize: the maximum bytes in @data
 * @user_data: extra private user_data that the implementation of the memory
 *             can use to store extra info.
 *
 * A structure containing the result of a map operation such as
 * gst_memory_map(). It contains the data and size.
 *
 * #GstMapInfo cannot be used with g_auto() because it is ambiguous whether it
 * needs to be unmapped using gst_buffer_unmap() or gst_memory_unmap(). Instead,
 * #GstBufferMapInfo and #GstMemoryMapInfo can be used in that case.
  }
{< protected > }
{< private > }
type
  PGstMapInfo = ^TGstMapInfo;
  TGstMapInfo = record
      memory : PGstMemory;
      flags : TGstMapFlags;
      data : Pguint8;
      size : Tgsize;
      maxsize : Tgsize;
      user_data : array[0..3] of Tgpointer;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
{*
 * GST_MAP_INFO_INIT:
 *
 * Initializer for #GstMapInfo
  }
{#define GST_MAP_INFO_INIT  NULL, (GstMapFlags) 0, NULL, 0, 0,  NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL }
{*
 * GstMemoryMapFunction:
 * @mem: a #GstMemory
 * @maxsize: size to map
 * @flags: access mode for the memory
 *
 * Get the memory of @mem that can be accessed according to the mode specified
 * in @flags. The function should return a pointer that contains at least
 * @maxsize bytes.
 *
 * Returns: a pointer to memory of which at least @maxsize bytes can be
 * accessed according to the access pattern in @flags.
  }

  TGstMemoryMapFunction = function (mem:PGstMemory; maxsize:Tgsize; flags:TGstMapFlags):Tgpointer;cdecl;
{*
 * GstMemoryMapFullFunction:
 * @mem: a #GstMemory
 * @info: the #GstMapInfo to map with
 * @maxsize: size to map
 *
 * Get the memory of @mem that can be accessed according to the mode specified
 * in @info's flags. The function should return a pointer that contains at least
 * @maxsize bytes.
 *
 * Returns: a pointer to memory of which at least @maxsize bytes can be
 * accessed according to the access pattern in @info's flags.
  }

  TGstMemoryMapFullFunction = function (mem:PGstMemory; info:PGstMapInfo; maxsize:Tgsize):Tgpointer;cdecl;
{*
 * GstMemoryUnmapFunction:
 * @mem: a #GstMemory
 *
 * Release the pointer previously retrieved with gst_memory_map().
  }

  TGstMemoryUnmapFunction = procedure (mem:PGstMemory);cdecl;
{*
 * GstMemoryUnmapFullFunction:
 * @mem: a #GstMemory
 * @info: a #GstMapInfo
 *
 * Release the pointer previously retrieved with gst_memory_map() with @info.
  }

  TGstMemoryUnmapFullFunction = procedure (mem:PGstMemory; info:PGstMapInfo);cdecl;
{*
 * GstMemoryCopyFunction:
 * @mem: a #GstMemory
 * @offset: an offset
 * @size: a size or -1
 *
 * Copy @size bytes from @mem starting at @offset and return them wrapped in a
 * new GstMemory object.
 * If @size is set to -1, all bytes starting at @offset are copied.
 *
 * Returns: a new #GstMemory object wrapping a copy of the requested region in
 * @mem.
  }

  PGstMemoryCopyFunction = ^TGstMemoryCopyFunction;
  TGstMemoryCopyFunction = function (mem:PGstMemory; offset:Tgssize; size:Tgssize):PGstMemory;cdecl;
{*
 * GstMemoryShareFunction:
 * @mem: a #GstMemory
 * @offset: an offset
 * @size: a size or -1
 *
 * Share @size bytes from @mem starting at @offset and return them wrapped in a
 * new GstMemory object. If @size is set to -1, all bytes starting at @offset are
 * shared. This function does not make a copy of the bytes in @mem.
 *
 * Returns: a new #GstMemory object sharing the requested region in @mem.
  }

  PGstMemoryShareFunction = ^TGstMemoryShareFunction;
  TGstMemoryShareFunction = function (mem:PGstMemory; offset:Tgssize; size:Tgssize):PGstMemory;cdecl;
{*
 * GstMemoryIsSpanFunction:
 * @mem1: a #GstMemory
 * @mem2: a #GstMemory
 * @offset: a result offset
 *
 * Check if @mem1 and @mem2 occupy contiguous memory and return the offset of
 * @mem1 in the parent buffer in @offset.
 *
 * Returns: %TRUE if @mem1 and @mem2 are in contiguous memory.
  }

  TGstMemoryIsSpanFunction = function (mem1:PGstMemory; mem2:PGstMemory; offset:Pgsize):Tgboolean;cdecl;

procedure gst_memory_init(mem:PGstMemory; flags:TGstMemoryFlags; allocator:PGstAllocator; parent:PGstMemory; maxsize:Tgsize; 
            align:Tgsize; offset:Tgsize; size:Tgsize);cdecl;external;
(* Const before type ignored *)
function gst_memory_is_type(mem:PGstMemory; mem_type:Pgchar):Tgboolean;cdecl;external;
function gst_memory_ref(memory:PGstMemory):PGstMemory;cdecl;external;
procedure gst_memory_unref(memory:PGstMemory);cdecl;external;
{ getting/setting memory properties  }
function gst_memory_get_sizes(mem:PGstMemory; offset:Pgsize; maxsize:Pgsize):Tgsize;cdecl;external;
procedure gst_memory_resize(mem:PGstMemory; offset:Tgssize; size:Tgsize);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_memory_lock(m,f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_memory_unlock(m,f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_memory_is_writable(m : longint) : longint;

{*
 * gst_memory_make_writable:
 * @m: (transfer full): a #GstMemory
 *
 * Returns a writable copy of @m. If the source memory is
 * already writable, this will simply return the same memory.
 *
 * Returns: (transfer full) (nullable): a writable memory (which may or may not be the
 *     same as @m) or %NULL if copying is required but not possible.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_memory_make_writable(m : longint) : longint;

{ retrieving data  }
function gst_memory_make_mapped(mem:PGstMemory; info:PGstMapInfo; flags:TGstMapFlags):PGstMemory;cdecl;external;
function gst_memory_map(mem:PGstMemory; info:PGstMapInfo; flags:TGstMapFlags):Tgboolean;cdecl;external;
procedure gst_memory_unmap(mem:PGstMemory; info:PGstMapInfo);cdecl;external;
{ copy and subregions  }
function gst_memory_copy(mem:PGstMemory; offset:Tgssize; size:Tgssize):PGstMemory;cdecl;external;
function gst_memory_share(mem:PGstMemory; offset:Tgssize; size:Tgssize):PGstMemory;cdecl;external;
{ span memory  }
function gst_memory_is_span(mem1:PGstMemory; mem2:PGstMemory; offset:Pgsize):Tgboolean;cdecl;external;
{*
 * GstMemoryMapInfo: (skip):
 *
 * Alias for #GstMapInfo to be used with g_auto():
 * ```c
 * void my_func(GstMemory *mem)
 * 
 *   g_auto(GstMemoryMapInfo) map = GST_MAP_INFO_INIT;
 *   if (!gst_memory_map(mem, &map, GST_MAP_READWRITE))
 *     return;
 *   ...
 *   // No need to call gst_memory_unmap()
 * 
 * ```
 *
 * #GstMapInfo cannot be used with g_auto() because it is ambiguous whether it
 * needs to be unmapped using gst_buffer_unmap() or gst_memory_unmap().
 *
 * See also #GstBufferMapInfo.
 *
 * Since: 1.22
  }
type
  PGstMemoryMapInfo = ^TGstMemoryMapInfo;
  TGstMemoryMapInfo = TGstMapInfo;
{ xxxxxxxxxxxxxxxxxxxx }
{static inline void _gst_memory_map_info_clear(GstMemoryMapInfo *info) }
{ }
{  if (G_LIKELY (info->memory))  }
{    gst_memory_unmap (info->memory, info); }
{   }
{ }
{G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(GstMemoryMapInfo, _gst_memory_map_info_clear) }
{$endif}
{ __GST_MEMORY_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_MEMORY_CAST(mem : longint) : PGstMemory;
begin
  GST_MEMORY_CAST:=PGstMemory(mem);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_FLAGS(mem : longint) : longint;
begin
  GST_MEMORY_FLAGS:=GST_MINI_OBJECT_FLAGS(mem);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_FLAG_IS_SET(mem,flag : longint) : longint;
begin
  GST_MEMORY_FLAG_IS_SET:=GST_MINI_OBJECT_FLAG_IS_SET(mem,flag);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_FLAG_UNSET(mem,flag : longint) : longint;
begin
  GST_MEMORY_FLAG_UNSET:=GST_MINI_OBJECT_FLAG_UNSET(mem,flag);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_IS_READONLY(mem : longint) : longint;
begin
  GST_MEMORY_IS_READONLY:=GST_MEMORY_FLAG_IS_SET(mem,GST_MEMORY_FLAG_READONLY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_IS_NO_SHARE(mem : longint) : longint;
begin
  GST_MEMORY_IS_NO_SHARE:=GST_MEMORY_FLAG_IS_SET(mem,GST_MEMORY_FLAG_NO_SHARE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_IS_ZERO_PREFIXED(mem : longint) : longint;
begin
  GST_MEMORY_IS_ZERO_PREFIXED:=GST_MEMORY_FLAG_IS_SET(mem,GST_MEMORY_FLAG_ZERO_PREFIXED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_IS_ZERO_PADDED(mem : longint) : longint;
begin
  GST_MEMORY_IS_ZERO_PADDED:=GST_MEMORY_FLAG_IS_SET(mem,GST_MEMORY_FLAG_ZERO_PADDED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_IS_PHYSICALLY_CONTIGUOUS(mem : longint) : longint;
begin
  GST_MEMORY_IS_PHYSICALLY_CONTIGUOUS:=GST_MEMORY_FLAG_IS_SET(mem,GST_MEMORY_FLAG_PHYSICALLY_CONTIGUOUS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MEMORY_IS_NOT_MAPPABLE(mem : longint) : longint;
begin
  GST_MEMORY_IS_NOT_MAPPABLE:=GST_MEMORY_FLAG_IS_SET(mem,GST_MEMORY_FLAG_NOT_MAPPABLE);
end;

{ was #define dname def_expr }
function GST_MAP_READWRITE : TGstMapFlags;
  begin
    GST_MAP_READWRITE:=TGstMapFlags(GST_MAP_READ or GST_MAP_WRITE);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_memory_lock(m,f : longint) : longint;
begin
  gst_memory_lock:=gst_mini_object_lock(GST_MINI_OBJECT_CAST(m),f);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_memory_unlock(m,f : longint) : longint;
begin
  gst_memory_unlock:=gst_mini_object_unlock(GST_MINI_OBJECT_CAST(m),f);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_memory_is_writable(m : longint) : longint;
begin
  gst_memory_is_writable:=gst_mini_object_is_writable(GST_MINI_OBJECT_CAST(m));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_memory_make_writable(m : longint) : longint;
begin
  gst_memory_make_writable:=GST_MEMORY_CAST(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(m)));
end;


end.
