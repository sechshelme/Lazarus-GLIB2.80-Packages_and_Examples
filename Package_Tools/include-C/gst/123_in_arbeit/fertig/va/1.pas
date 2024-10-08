unit 1;

interface

uses
  glib280, gst124;

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

function gst_va_allocator_get_type:TGType;cdecl;external libgstva;
function gst_va_allocator_new(display:PGstVaDisplay; surface_formats:PGArray):PGstAllocator;cdecl;external libgstva;
function gst_va_allocator_alloc(allocator:PGstAllocator):PGstMemory;cdecl;external libgstva;
function gst_va_allocator_setup_buffer(allocator:PGstAllocator; buffer:PGstBuffer):Tgboolean;cdecl;external libgstva;
function gst_va_allocator_prepare_buffer(allocator:PGstAllocator; buffer:PGstBuffer):Tgboolean;cdecl;external libgstva;
procedure gst_va_allocator_flush(allocator:PGstAllocator);cdecl;external libgstva;
function gst_va_allocator_set_format(allocator:PGstAllocator; info:PGstVideoInfo; usage_hint:Tguint; feat_use_derived:TGstVaFeature):Tgboolean;cdecl;external libgstva;
function gst_va_allocator_get_format(allocator:PGstAllocator; info:PGstVideoInfo; usage_hint:Pguint; use_derived:Pgboolean):Tgboolean;cdecl;external libgstva;
procedure gst_va_allocator_set_hacks(allocator:PGstAllocator; hacks:Tguint32);cdecl;external libgstva;
function gst_va_allocator_peek_display(allocator:PGstAllocator):PGstVaDisplay;cdecl;external libgstva;
function gst_va_memory_get_surface(mem:PGstMemory):TVASurfaceID;cdecl;external libgstva;
function gst_va_memory_peek_display(mem:PGstMemory):PGstVaDisplay;cdecl;external libgstva;
function gst_va_buffer_get_surface(buffer:PGstBuffer):TVASurfaceID;cdecl;external libgstva;
function gst_va_buffer_create_aux_surface(buffer:PGstBuffer):Tgboolean;cdecl;external libgstva;
function gst_va_buffer_get_aux_surface(buffer:PGstBuffer):TVASurfaceID;cdecl;external libgstva;
function gst_va_buffer_peek_display(buffer:PGstBuffer):PGstVaDisplay;cdecl;external libgstva;

// === Konventiert am: 8-10-24 16:35:35 ===

function GST_TYPE_VA_ALLOCATOR : TGType;
function GST_VA_ALLOCATOR(obj : Pointer) : PGstVaAllocator;
function GST_VA_ALLOCATOR_CLASS(klass : Pointer) : PGstVaAllocatorClass;
function GST_IS_VA_ALLOCATOR(obj : Pointer) : Tgboolean;
function GST_IS_VA_ALLOCATOR_CLASS(klass : Pointer) : Tgboolean;
function GST_VA_ALLOCATOR_GET_CLASS(obj : Pointer) : PGstVaAllocatorClass;

implementation

function GST_TYPE_VA_ALLOCATOR : TGType;
  begin
    GST_TYPE_VA_ALLOCATOR:=gst_va_allocator_get_type;
  end;

function GST_VA_ALLOCATOR(obj : Pointer) : PGstVaAllocator;
begin
  Result := PGstVaAllocator(g_type_check_instance_cast(obj, GST_TYPE_VA_ALLOCATOR));
end;

function GST_VA_ALLOCATOR_CLASS(klass : Pointer) : PGstVaAllocatorClass;
begin
  Result := PGstVaAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_VA_ALLOCATOR));
end;

function GST_IS_VA_ALLOCATOR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VA_ALLOCATOR);
end;

function GST_IS_VA_ALLOCATOR_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VA_ALLOCATOR);
end;

function GST_VA_ALLOCATOR_GET_CLASS(obj : Pointer) : PGstVaAllocatorClass;
begin
  Result := PGstVaAllocatorClass(PGTypeInstance(obj)^.g_class);
end;



end.
