
unit gstvaallocator;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvaallocator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvaallocator.h
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
PGArray  = ^GArray;
Pgboolean  = ^gboolean;
PGstAllocator  = ^GstAllocator;
PGstBuffer  = ^GstBuffer;
PGstMemory  = ^GstMemory;
PGstVaDisplay  = ^GstVaDisplay;
PGstVideoInfo  = ^GstVideoInfo;
PGstVideoInfoDmaDrm  = ^GstVideoInfoDmaDrm;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2020 Igalia, S.L.
 *     Author: Víctor Jáquez <vjaquez@igalia.com>
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
(** unsupported pragma#pragma once*)
{$include <gst/allocators/allocators.h>}
{$include <gst/va/gstva.h>}
{$include <gst/video/video.h>}
{$include <stdint.h>}
{$include <va/va.h>}

{ was #define dname def_expr }
function GST_TYPE_VA_DMABUF_ALLOCATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_DMABUF_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_DMABUF_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_DMABUF_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_DMABUF_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_DMABUF_ALLOCATOR_GET_CLASS(obj : longint) : longint;

function gst_va_dmabuf_allocator_get_type:TGType;cdecl;external;
function gst_va_dmabuf_allocator_new(display:PGstVaDisplay):PGstAllocator;cdecl;external;
function gst_va_dmabuf_allocator_setup_buffer(allocator:PGstAllocator; buffer:PGstBuffer):Tgboolean;cdecl;external;
function gst_va_dmabuf_allocator_prepare_buffer(allocator:PGstAllocator; buffer:PGstBuffer):Tgboolean;cdecl;external;
procedure gst_va_dmabuf_allocator_flush(allocator:PGstAllocator);cdecl;external;
function gst_va_dmabuf_allocator_set_format(allocator:PGstAllocator; info:PGstVideoInfoDmaDrm; usage_hint:Tguint):Tgboolean;cdecl;external;
function gst_va_dmabuf_allocator_get_format(allocator:PGstAllocator; info:PGstVideoInfoDmaDrm; usage_hint:Pguint):Tgboolean;cdecl;external;
function gst_va_dmabuf_memories_setup(display:PGstVaDisplay; drm_info:PGstVideoInfoDmaDrm; mem:array[0..(GST_VIDEO_MAX_PLANES)-1] of PGstMemory; fds:array[0..(GST_VIDEO_MAX_PLANES)-1] of Tuintptr_t; offset:array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgsize; 
           usage_hint:Tguint):Tgboolean;cdecl;external;
function gst_va_dmabuf_get_modifier_for_format(display:PGstVaDisplay; format:TGstVideoFormat; usage_hint:Tguint):Tguint64;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_VA_ALLOCATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{*
 * GST_ALLOCATOR_VASURFACE:
 *
 * Since: 1.22
  }
const
  GST_ALLOCATOR_VASURFACE = 'VAMemory';  
{*
 * GST_MAP_VA:
 *
 * Flag indicating that we should map the VASurfaceID instead of to
 * system memory, so users can use libva primitives to operate with
 * that surface.
 *
 * Since: 1.22
  }
  GST_MAP_VA = GST_MAP_FLAG_LAST shl 1;  

function gst_va_allocator_get_type:TGType;cdecl;external;
function gst_va_allocator_new(display:PGstVaDisplay; surface_formats:PGArray):PGstAllocator;cdecl;external;
function gst_va_allocator_alloc(allocator:PGstAllocator):PGstMemory;cdecl;external;
function gst_va_allocator_setup_buffer(allocator:PGstAllocator; buffer:PGstBuffer):Tgboolean;cdecl;external;
function gst_va_allocator_prepare_buffer(allocator:PGstAllocator; buffer:PGstBuffer):Tgboolean;cdecl;external;
procedure gst_va_allocator_flush(allocator:PGstAllocator);cdecl;external;
function gst_va_allocator_set_format(allocator:PGstAllocator; info:PGstVideoInfo; usage_hint:Tguint; feat_use_derived:TGstVaFeature):Tgboolean;cdecl;external;
function gst_va_allocator_get_format(allocator:PGstAllocator; info:PGstVideoInfo; usage_hint:Pguint; use_derived:Pgboolean):Tgboolean;cdecl;external;
procedure gst_va_allocator_set_hacks(allocator:PGstAllocator; hacks:Tguint32);cdecl;external;
function gst_va_allocator_peek_display(allocator:PGstAllocator):PGstVaDisplay;cdecl;external;
function gst_va_memory_get_surface(mem:PGstMemory):TVASurfaceID;cdecl;external;
function gst_va_memory_peek_display(mem:PGstMemory):PGstVaDisplay;cdecl;external;
function gst_va_buffer_get_surface(buffer:PGstBuffer):TVASurfaceID;cdecl;external;
function gst_va_buffer_create_aux_surface(buffer:PGstBuffer):Tgboolean;cdecl;external;
function gst_va_buffer_get_aux_surface(buffer:PGstBuffer):TVASurfaceID;cdecl;external;
function gst_va_buffer_peek_display(buffer:PGstBuffer):PGstVaDisplay;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_VA_DMABUF_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_VA_DMABUF_ALLOCATOR:=gst_va_dmabuf_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_DMABUF_ALLOCATOR(obj : longint) : longint;
begin
  GST_VA_DMABUF_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VA_DMABUF_ALLOCATOR,GstVaDmabufAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_DMABUF_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_VA_DMABUF_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VA_DMABUF_ALLOCATOR,GstVaDmabufAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_DMABUF_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_VA_DMABUF_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VA_DMABUF_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_DMABUF_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_VA_DMABUF_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VA_DMABUF_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_DMABUF_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_VA_DMABUF_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VA_DMABUF_ALLOCATOR,GstVaDmabufAllocatorClass);
end;

{ was #define dname def_expr }
function GST_TYPE_VA_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_VA_ALLOCATOR:=gst_va_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_ALLOCATOR(obj : longint) : longint;
begin
  GST_VA_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VA_ALLOCATOR,GstVaAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_VA_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VA_ALLOCATOR,GstVaAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_VA_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VA_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_VA_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VA_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_VA_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VA_ALLOCATOR,GstVaAllocatorClass);
end;


end.
