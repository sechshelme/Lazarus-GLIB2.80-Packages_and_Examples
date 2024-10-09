
unit gstglbasememory;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglbasememory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglbasememory.h
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
PGError  = ^GError;
PGstAllocationParams  = ^GstAllocationParams;
PGstAllocator  = ^GstAllocator;
PGstGLAllocationParams  = ^GstGLAllocationParams;
PGstGLBaseMemory  = ^GstGLBaseMemory;
PGstGLBaseMemoryAllocator  = ^GstGLBaseMemoryAllocator;
PGstGLBaseMemoryAllocatorAllocFunction  = ^GstGLBaseMemoryAllocatorAllocFunction;
PGstGLBaseMemoryAllocatorClass  = ^GstGLBaseMemoryAllocatorClass;
PGstGLBaseMemoryAllocatorCopyFunction  = ^GstGLBaseMemoryAllocatorCopyFunction;
PGstGLBaseMemoryError  = ^GstGLBaseMemoryError;
PGstGLBaseMemoryTransfer  = ^GstGLBaseMemoryTransfer;
PGstGLContext  = ^GstGLContext;
PGstGLQuery  = ^GstGLQuery;
PGstMapInfo  = ^GstMapInfo;
PGstMemory  = ^GstMemory;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2015 Matthew Waters <matthew@centricular.com>
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
{$ifndef _GST_GL_BASE_MEMORY_H_}
{$define _GST_GL_BASE_MEMORY_H_}
{$include <gst/gst.h>}
{$include <gst/gstallocator.h>}
{$include <gst/gstmemory.h>}
{$include <gst/gl/gstgl_fwd.h>}
{*
 * GST_TYPE_GL_BASE_MEMORY:
 *
 * Deprecated: 1.22: This type has no use.
  }

function gst_gl_base_memory_get_type:TGType;cdecl;external;
function gst_gl_base_memory_allocator_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_BASE_MEMORY_ALLOCATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MEMORY_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_MEMORY_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MEMORY_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_BASE_MEMORY_ALLOCATOR_CAST(obj : longint) : PGstGLBaseMemoryAllocator;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_BASE_MEMORY_CAST(mem : longint) : PGstGLBaseMemory;

{ was #define dname def_expr }
function GST_TYPE_GL_BASE_MEMORY : longint; { return type might be wrong }

function gst_gl_base_memory_error_quark:TGQuark;cdecl;external;
{*
 * GST_GL_BASE_MEMORY_ERROR:
 *
 * Error domain for GStreamer's GL memory module. Errors in this domain will be
 * from the #GstGLBaseMemoryError enumeration
  }
{ was #define dname def_expr }
function GST_GL_BASE_MEMORY_ERROR : longint; { return type might be wrong }

{*
 * GstGLBaseMemoryError:
 * @GST_GL_BASE_MEMORY_ERROR_FAILED: generic failure
 * @GST_GL_BASE_MEMORY_ERROR_OLD_LIBS: the implementation is too old and doesn't
 *                                     implement enough features
 * @GST_GL_BASE_MEMORY_ERROR_RESOURCE_UNAVAILABLE: a resource could not be found
  }
type
  PGstGLBaseMemoryError = ^TGstGLBaseMemoryError;
  TGstGLBaseMemoryError =  Longint;
  Const
    GST_GL_BASE_MEMORY_ERROR_FAILED = 0;
    GST_GL_BASE_MEMORY_ERROR_OLD_LIBS = 1;
    GST_GL_BASE_MEMORY_ERROR_RESOURCE_UNAVAILABLE = 2;
;
{*
 * GstGLBaseMemoryTransfer:
 * @GST_GL_BASE_MEMORY_TRANSFER_NEED_DOWNLOAD: the texture needs downloading
 *                                             to the data pointer
 * @GST_GL_BASE_MEMORY_TRANSFER_NEED_UPLOAD:   the data pointer needs uploading
 *                                             to the texture
  }
type
  PGstGLBaseMemoryTransfer = ^TGstGLBaseMemoryTransfer;
  TGstGLBaseMemoryTransfer =  Longint;
  Const
    GST_GL_BASE_MEMORY_TRANSFER_NEED_DOWNLOAD = GST_MEMORY_FLAG_LAST shl 0;
    GST_GL_BASE_MEMORY_TRANSFER_NEED_UPLOAD = GST_MEMORY_FLAG_LAST shl 1;
;
{*
 * GST_MAP_GL:
 *
 * Flag indicating that we should map the GL object instead of to system memory.
 *
 * Combining #GST_MAP_GL with #GST_MAP_WRITE has the same semantics as though
 * you are writing to OpenGL. Conversely, combining #GST_MAP_GL with
 * #GST_MAP_READ has the same semantics as though you are reading from OpenGL.
  }
  GST_MAP_GL = GST_MAP_FLAG_LAST shl 1;  
{*
 * GstGLBaseMemory:
 * @mem: the parent object
 * @context: the #GstGLContext to use for GL operations
 *
 * Represents information about a GL memory object
  }
{< protected > }
{ cumulative map flags  }
{< private > }
{ because maxsize is used for mapping  }
type
  PGstGLBaseMemory = ^TGstGLBaseMemory;
  TGstGLBaseMemory = record
      mem : TGstMemory;
      context : PGstGLContext;
      lock : TGMutex;
      map_flags : TGstMapFlags;
      map_count : Tgint;
      gl_map_count : Tgint;
      data : Tgpointer;
      query : PGstGLQuery;
      alloc_size : Tgsize;
      alloc_data : Tgpointer;
      notify : TGDestroyNotify;
      user_data : Tgpointer;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLAllocationParamsCopyFunc:
 * @src: the source #GstGLAllocationParams to copy from
 * @dest: the source #GstGLAllocationParams to copy
 *
 * Copies the parameters from @src into @dest.  The subclass must compose copy
 * functions from the superclass.
  }

  TGstGLAllocationParamsCopyFunc = procedure (src:PGstGLAllocationParams; dest:PGstGLAllocationParams);cdecl;
{*
 * GstGLAllocationParamsFreeFunc:
 * @params: a #GstGLAllocationParams
 *
 * Free any dynamically allocated data.  The subclass must call the superclass'
 * free.
  }

  TGstGLAllocationParamsFreeFunc = procedure (params:Tgpointer);cdecl;

{ was #define dname def_expr }
function GST_TYPE_GL_ALLOCATION_PARAMS : longint; { return type might be wrong }

function gst_gl_allocation_params_get_type:TGType;cdecl;external;
{*
 * GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_ALLOC:
 *
 * GL Allocation flag indicating that the implementation should allocate the
 * necessary resources.
  }
const
  GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_ALLOC = 1 shl 0;  
{*
 * GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_WRAP_SYSMEM:
 *
 * GL Allocation flag for using the provided system memory data as storage.
  }
  GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_WRAP_SYSMEM = 1 shl 1;  
{*
 * GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_WRAP_GPU_HANDLE:
 *
 * GL Allocation flag for using the provided GPU handle as storage.
  }
  GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_WRAP_GPU_HANDLE = 1 shl 2;  
{*
 * GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_USER:
 *
 * Values >= than #GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_USER can be used for
 * user-defined purposes.
  }
  GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_USER = 1 shl 16;  
{*
 * GstGLAllocationParams:
 * @struct_size: the size of the struct (including and subclass data)
 * @copy: a #GstGLAllocationParamsCopyFunc
 * @free: a #GstGLAllocationParamsFreeFunc
 * @alloc_flags: allocation flags
 * @alloc_size: the allocation size
 * @alloc_params: the #GstAllocationParams
 * @context: a #GstGLContext
 * @notify: a #GDestroyNotify
 * @user_data: argument to call @notify with
 * @wrapped_data: the wrapped data pointer
 * @gl_handle: the wrapped OpenGL handle
  }
{ Because GstAllocationParams is not subclassable, start our own subclass
 * chain.  FIXME: 2.0 make GstAllocationParams subclassable  }
{ GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_WRAP_SYSMEM only  }
{ GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_WRAP_GPU_HANDLE only  }
{< private > }
type
  PGstGLAllocationParams = ^TGstGLAllocationParams;
  TGstGLAllocationParams = record
      struct_size : Tgsize;cdecl;
      copy : TGstGLAllocationParamsCopyFunc;
      free : TGstGLAllocationParamsFreeFunc;
      alloc_flags : Tguint;
      alloc_size : Tgsize;
      alloc_params : PGstAllocationParams;
      context : PGstGLContext;
      notify : TGDestroyNotify;
      user_data : Tgpointer;
      wrapped_data : Tgpointer;
      gl_handle : Tgpointer;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

(* Const before type ignored *)

function gst_gl_allocation_params_init(params:PGstGLAllocationParams; struct_size:Tgsize; alloc_flags:Tguint; copy:TGstGLAllocationParamsCopyFunc; free:TGstGLAllocationParamsFreeFunc; 
           context:PGstGLContext; alloc_size:Tgsize; alloc_params:PGstAllocationParams; wrapped_data:Tgpointer; gl_handle:Tgpointer; 
           user_data:Tgpointer; notify:TGDestroyNotify):Tgboolean;cdecl;external;
{ free with gst_gl_allocation_params_free  }
function gst_gl_allocation_params_copy(src:PGstGLAllocationParams):PGstGLAllocationParams;cdecl;external;
procedure gst_gl_allocation_params_free(params:PGstGLAllocationParams);cdecl;external;
{ subclass usage  }
procedure gst_gl_allocation_params_free_data(params:PGstGLAllocationParams);cdecl;external;
{ subclass usage  }
procedure gst_gl_allocation_params_copy_data(src:PGstGLAllocationParams; dest:PGstGLAllocationParams);cdecl;external;
{*
 * GstGLBaseMemoryAllocatorAllocFunction:
 * @allocator: a #GstGLBaseMemoryAllocator
 * @params: the #GstGLAllocationParams to allocate the memory with
 *
 * Note: not called with a GL context current
 *
 * Returns: (transfer full) (nullable): a newly allocated #GstGLBaseMemory from @allocator and @params
 *
 * Since: 1.8
  }
type
  PGstGLBaseMemoryAllocatorAllocFunction = ^TGstGLBaseMemoryAllocatorAllocFunction;
  TGstGLBaseMemoryAllocatorAllocFunction = function (allocator:PGstGLBaseMemoryAllocator; params:PGstGLAllocationParams):PGstGLBaseMemory;cdecl;
{*
 * GstGLBaseMemoryAllocatorCreateFunction:
 * @mem: a #GstGLBaseMemory
 * @error: a #GError to use on failure
 *
 * As this virtual method is called with an OpenGL context current, use this
 * function to allocate and OpenGL resources needed for your application
 *
 * Returns: whether the creation succeeded
 *
 * Since: 1.8
  }

  TGstGLBaseMemoryAllocatorCreateFunction = function (mem:PGstGLBaseMemory; error:PPGError):Tgboolean;cdecl;
{*
 * GstGLBaseMemoryAllocatorMapFunction:
 * @mem: a #GstGLBaseMemory
 * @info: a #GstMapInfo to map with
 * @maxsize: the size to map
 *
 * Also see gst_memory_map();
 *
 * Returns: the mapped pointer
 *
 * Since: 1.8
  }

  TGstGLBaseMemoryAllocatorMapFunction = function (mem:PGstGLBaseMemory; info:PGstMapInfo; maxsize:Tgsize):Tgpointer;cdecl;
{*
 * GstGLBaseMemoryAllocatorUnmapFunction:
 * @mem: a #GstGLBaseMemory
 * @info: a #GstMapInfo to map with
 *
 * Also see gst_memory_unmap();
 *
 * Since: 1.8
  }

  TGstGLBaseMemoryAllocatorUnmapFunction = procedure (mem:PGstGLBaseMemory; info:PGstMapInfo);cdecl;
{*
 * GstGLBaseMemoryAllocatorCopyFunction:
 * @mem: a #GstGLBaseMemory
 * @offset: the offset to copy from
 * @size: the number of bytes to copy
 *
 * Also see gst_memory_copy();
 *
 * Returns: (transfer full) (nullable): the newly copied #GstGLMemory or %NULL
 *
 * Since: 1.8
  }

  PGstGLBaseMemoryAllocatorCopyFunction = ^TGstGLBaseMemoryAllocatorCopyFunction;
  TGstGLBaseMemoryAllocatorCopyFunction = function (mem:PGstGLBaseMemory; offset:Tgssize; size:Tgssize):PGstGLBaseMemory;cdecl;
{*
 * GstGLBaseMemoryAllocatorDestroyFunction:
 * @mem: a #GstGLBaseMemory
 *
 * Destroy any resources allocated throughout the lifetime of @mem
 *
 * Since: 1.8
  }

  TGstGLBaseMemoryAllocatorDestroyFunction = procedure (mem:PGstGLBaseMemory);cdecl;
{*
 * GstGLBaseMemoryAllocator:
 *
 * Opaque #GstGLBaseMemoryAllocator struct
 *
 * Since: 1.8
  }
{< private > }
  PGstGLBaseMemoryAllocator = ^TGstGLBaseMemoryAllocator;
  TGstGLBaseMemoryAllocator = record
      parent : TGstAllocator;cdecl;
      fallback_mem_copy : TGstMemoryCopyFunction;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLBaseMemoryAllocatorClass:
 * @parent_class: the parent class
 * @alloc: a #GstGLBaseMemoryAllocatorAllocFunction
 * @create: a #GstGLBaseMemoryAllocatorCreateFunction
 * @map: a #GstGLBaseMemoryAllocatorMapFunction
 * @unmap: a #GstGLBaseMemoryAllocatorUnmapFunction
 * @copy: a #GstGLBaseMemoryAllocatorCopyFunction
 * @destroy: a #GstGLBaseMemoryAllocatorDestroyFunction
 *
 * Since: 1.8
  }
{< private > }
  PGstGLBaseMemoryAllocatorClass = ^TGstGLBaseMemoryAllocatorClass;
  TGstGLBaseMemoryAllocatorClass = record
      parent_class : TGstAllocatorClass;
      alloc : TGstGLBaseMemoryAllocatorAllocFunction;
      create : TGstGLBaseMemoryAllocatorCreateFunction;
      map : TGstGLBaseMemoryAllocatorMapFunction;
      unmap : TGstGLBaseMemoryAllocatorUnmapFunction;
      copy : TGstGLBaseMemoryAllocatorCopyFunction;
      destroy : TGstGLBaseMemoryAllocatorDestroyFunction;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{$include <gst/gl/gstglconfig.h>}
{$include <gst/gl/gstglformat.h>}
{*
 * GST_GL_BASE_MEMORY_ALLOCATOR_NAME:
 *
 * The name of the GL buffer allocator
 *
 * Since: 1.8
  }

const
  GST_GL_BASE_MEMORY_ALLOCATOR_NAME = 'GLBaseMemory';  

procedure gst_gl_base_memory_init_once;cdecl;external;
function gst_is_gl_base_memory(mem:PGstMemory):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gst_gl_base_memory_init(mem:PGstGLBaseMemory; allocator:PGstAllocator; parent:PGstMemory; context:PGstGLContext; params:PGstAllocationParams; 
            size:Tgsize; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
function gst_gl_base_memory_alloc_data(gl_mem:PGstGLBaseMemory):Tgboolean;cdecl;external;
function gst_gl_base_memory_memcpy(src:PGstGLBaseMemory; dest:PGstGLBaseMemory; offset:Tgssize; size:Tgssize):Tgboolean;cdecl;external;
function gst_gl_base_memory_alloc(allocator:PGstGLBaseMemoryAllocator; params:PGstGLAllocationParams):PGstGLBaseMemory;cdecl;external;
{$endif}
{ _GST_GL_BUFFER_H_  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_BASE_MEMORY_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_BASE_MEMORY_ALLOCATOR:=gst_gl_base_memory_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MEMORY_ALLOCATOR(obj : longint) : longint;
begin
  GST_GL_BASE_MEMORY_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_BASE_MEMORY_ALLOCATOR,GstGLBaseMemoryAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_GL_BASE_MEMORY_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_BASE_MEMORY_ALLOCATOR,GstGLBaseMemoryAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_MEMORY_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_GL_BASE_MEMORY_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_BASE_MEMORY_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_BASE_MEMORY_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_BASE_MEMORY_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MEMORY_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_GL_BASE_MEMORY_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_GL_BASE_MEMORY_ALLOCATOR,GstGLBaseMemoryAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_BASE_MEMORY_ALLOCATOR_CAST(obj : longint) : PGstGLBaseMemoryAllocator;
begin
  GST_GL_BASE_MEMORY_ALLOCATOR_CAST:=PGstGLBaseMemoryAllocator(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_BASE_MEMORY_CAST(mem : longint) : PGstGLBaseMemory;
begin
  GST_GL_BASE_MEMORY_CAST:=PGstGLBaseMemory(mem);
end;

{ was #define dname def_expr }
function GST_TYPE_GL_BASE_MEMORY : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_BASE_MEMORY:=gst_gl_base_memory_get_type;
  end;

{ was #define dname def_expr }
function GST_GL_BASE_MEMORY_ERROR : longint; { return type might be wrong }
  begin
    GST_GL_BASE_MEMORY_ERROR:=gst_gl_base_memory_error_quark;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_ALLOCATION_PARAMS : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_ALLOCATION_PARAMS:=gst_gl_allocation_params_get_type;
  end;


end.
