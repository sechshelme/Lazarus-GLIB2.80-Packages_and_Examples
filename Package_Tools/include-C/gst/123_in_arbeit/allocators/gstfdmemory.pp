
unit gstfdmemory;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstfdmemory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstfdmemory.h
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
PGstAllocator  = ^GstAllocator;
PGstFdAllocator  = ^GstFdAllocator;
PGstFdAllocatorClass  = ^GstFdAllocatorClass;
PGstFdMemoryFlags  = ^GstFdMemoryFlags;
PGstMemory  = ^GstMemory;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer fd memory
 * Copyright (C) 2013 Linaro SA
 * Author: Benjamin Gaignard <benjamin.gaignard@linaro.org> for Linaro.
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
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __GST_FD_ALLOCATOR_H__}
{$define __GST_FD_ALLOCATOR_H__}
{$include <gst/gst.h>}
{$include <gst/allocators/allocators-prelude.h>}
type

const
  GST_ALLOCATOR_FD = 'fd';  

{ was #define dname def_expr }
function GST_TYPE_FD_ALLOCATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_FD_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_FD_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_FD_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_FD_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_FD_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_FD_ALLOCATOR_CAST(obj : longint) : PGstFdAllocator;

{*
 * GstFdMemoryFlags:
 * @GST_FD_MEMORY_FLAG_NONE: no flag
 * @GST_FD_MEMORY_FLAG_KEEP_MAPPED: once the memory is mapped,
 *        keep it mapped until the memory is destroyed.
 * @GST_FD_MEMORY_FLAG_MAP_PRIVATE: do a private mapping instead of
 *        the default shared mapping.
 * @GST_FD_MEMORY_FLAG_DONT_CLOSE: don't close the file descriptor when
 *        the memory is freed. Since: 1.10
 *
 * Various flags to control the operation of the fd backed memory.
 *
 * Since: 1.6
  }
type
  PGstFdMemoryFlags = ^TGstFdMemoryFlags;
  TGstFdMemoryFlags =  Longint;
  Const
    GST_FD_MEMORY_FLAG_NONE = 0;
    GST_FD_MEMORY_FLAG_KEEP_MAPPED = 1 shl 0;
    GST_FD_MEMORY_FLAG_MAP_PRIVATE = 1 shl 1;
    GST_FD_MEMORY_FLAG_DONT_CLOSE = 1 shl 2;
;
{*
 * GstFdAllocator:
 *
 * Base class for allocators with fd-backed memory
 *
 * Since: 1.6
  }
type
  PGstFdAllocator = ^TGstFdAllocator;
  TGstFdAllocator = record
      parent : TGstAllocator;
    end;

  PGstFdAllocatorClass = ^TGstFdAllocatorClass;
  TGstFdAllocatorClass = record
      parent_class : TGstAllocatorClass;
    end;


function gst_fd_allocator_get_type:TGType;cdecl;external;
function gst_fd_allocator_new:PGstAllocator;cdecl;external;
function gst_fd_allocator_alloc(allocator:PGstAllocator; fd:Tgint; size:Tgsize; flags:TGstFdMemoryFlags):PGstMemory;cdecl;external;
function gst_is_fd_memory(mem:PGstMemory):Tgboolean;cdecl;external;
function gst_fd_memory_get_fd(mem:PGstMemory):Tgint;cdecl;external;
{$endif}
{ __GST_FD_ALLOCATOR_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_FD_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_FD_ALLOCATOR:=gst_fd_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_FD_ALLOCATOR(obj : longint) : longint;
begin
  GST_FD_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_FD_ALLOCATOR,GstFdAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_FD_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_FD_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_FD_ALLOCATOR,GstFdAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_FD_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_FD_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_FD_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_FD_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_FD_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_FD_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_FD_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_FD_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_FD_ALLOCATOR,GstFdAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_FD_ALLOCATOR_CAST(obj : longint) : PGstFdAllocator;
begin
  GST_FD_ALLOCATOR_CAST:=PGstFdAllocator(obj);
end;


end.
