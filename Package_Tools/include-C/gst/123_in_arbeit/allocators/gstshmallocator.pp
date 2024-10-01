
unit gstshmallocator;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstshmallocator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstshmallocator.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer shared memory allocator
 *
 * Copyright (C) 2012 Intel Corporation
 * Copyright (C) 2012 Sreerenj Balachandran <sreerenj.balachandran@intel.com>
 * Copyright (C) 2023 Netflix Inc.
 *  Author: Xavier Claessens <xavier.claessens@collabora.com>
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
{$include <gst/allocators/gstfdmemory.h>}
{#define GST_TYPE_SHM_ALLOCATOR gst_shm_allocator_get_type () }
{G_DECLARE_FINAL_TYPE (GstShmAllocator, gst_shm_allocator, GST, SHM_ALLOCATOR, GstFdAllocator) }

{*
 * GST_ALLOCATOR_SHM:
 *
 * Name of this allocator, to be used for example with gst_allocator_find() and
 * gst_memory_is_type().
 *
 * Since: 1.24
  }

const
  GST_ALLOCATOR_SHM = 'shm';  
{*
 * GstShmAllocator:
 *
 * Private intance object for #GstShmAllocator.
 *
 * Since: 1.24
  }
{*
 * GstShmAllocatorClass.parent_class:
 *
 * Parent Class.
 *
 * Since: 1.24
  }
{*
 * GST_TYPE_SHM_ALLOCATOR:
 *
 * Macro that returns the #GstShmAllocator type.
 *
 * Since: 1.24
  }

procedure gst_shm_allocator_init_once;cdecl;external;
function gst_shm_allocator_get:PGstAllocator;cdecl;external;

implementation


end.
