
unit gstwlshmallocator;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstwlshmallocator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstwlshmallocator.h
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
PGstMemory  = ^GstMemory;
PGstVideoInfo  = ^GstVideoInfo;
PGstWlDisplay  = ^GstWlDisplay;
Pwl_buffer  = ^wl_buffer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Wayland Library
 *
 * Copyright (C) 2012 Intel Corporation
 * Copyright (C) 2012 Sreerenj Balachandran <sreerenj.balachandran@intel.com>
 * Copyright (C) 2014 Collabora Ltd.
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
{$include <gst/wayland/wayland.h>}
{$include <gst/allocators/allocators.h>}
{$include <gst/video/video.h>}
(* Const before type ignored *)

function gst_wl_shm_memory_construct_wl_buffer(mem:PGstMemory; display:PGstWlDisplay; info:PGstVideoInfo):Pwl_buffer;cdecl;external;

implementation


end.
