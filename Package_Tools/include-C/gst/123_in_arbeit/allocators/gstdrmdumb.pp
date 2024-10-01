
unit gstdrmdumb;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstdrmdumb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstdrmdumb.h
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
PGstAllocator  = ^GstAllocator;
PGstMemory  = ^GstMemory;
Pguint32  = ^guint32;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2016 Igalia
 * Copyright (C) 2023 Collabora
 *
 * Authors:
 *  Víctor Manuel Jáquez Leal <vjaquez@igalia.com>
 *  Javier Martin <javiermartin@by.com.es>
 *  Colin Kinloch <colin.kinloch@collabora.com>
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
 *
  }
(** unsupported pragma#pragma once*)
{$include <gst/gst.h>}
{$include <gst/allocators/allocators-prelude.h>}
{*
 * GstDRMDumbAllocator:
 *
 * Private intance object for #GstDRMDumbAllocator.
 *
 * Since: 1.24
  }
{*
 * GstDRMDumbAllocatorClass.parent_class:
 *
 * Parent Class.
 *
 * Since: 1.24
  }
{*
 * GST_TYPE_DRM_DUMB_ALLOCATOR:
 *
 * Macro that returns the #GstDRMDumbAllocator type.
 *
 * Since: 1.24
  }

{ was #define dname def_expr }
function GST_TYPE_DRM_DUMB_ALLOCATOR : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GstDRMDumbAllocator, gst_drm_dumb_allocator, GST, DRM_DUMB_ALLOCATOR, GstAllocator) }
function gst_is_drm_dumb_memory(mem:PGstMemory):Tgboolean;cdecl;external;
function gst_drm_dumb_memory_get_handle(mem:PGstMemory):Tguint32;cdecl;external;
function gst_drm_dumb_memory_export_dmabuf(mem:PGstMemory):PGstMemory;cdecl;external;
function gst_drm_dumb_allocator_new_with_fd(drm_fd:Tgint):PGstAllocator;cdecl;external;
(* Const before type ignored *)
function gst_drm_dumb_allocator_new_with_device_path(drm_device_path:Pgchar):PGstAllocator;cdecl;external;
function gst_drm_dumb_allocator_alloc(allocator:PGstAllocator; drm_fourcc:Tguint32; width:Tguint32; height:Tguint32; out_pitch:Pguint32):PGstMemory;cdecl;external;
function gst_drm_dumb_allocator_has_prime_export(allocator:PGstAllocator):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_DRM_DUMB_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_DRM_DUMB_ALLOCATOR:=gst_drm_dumb_allocator_get_type;
  end;


end.
