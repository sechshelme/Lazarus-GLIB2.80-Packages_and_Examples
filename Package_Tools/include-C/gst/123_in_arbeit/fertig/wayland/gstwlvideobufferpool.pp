
unit gstwlvideobufferpool;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstwlvideobufferpool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstwlvideobufferpool.h
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
PGstBufferPool  = ^GstBufferPool;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Wayland Library
 *
 * Copyright (C) 2017 Collabora Ltd.
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
{$include <gst/video/video.h>}
{ A GstVideoBufferPool subclass that modify the options to remove
 * VideoAlignment. To support VideoAlignment we would need to pass the padded
 * width/height + stride and use the viewporter interface to crop, a bit like
 * we use to do with XV. It would still be quite limited. It's a bit retro,
 * hopefully there will be a better Wayland interface in the future. This buffer
 * pool also support GstDRMDumbAllocator.  }

{ was #define dname def_expr }
function GST_TYPE_WL_VIDEO_BUFFER_POOL : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GstWlVideoBufferPool, gst_wl_video_buffer_pool, GST, WL_VIDEO_BUFFER_POOL, GstVideoBufferPool); }
function gst_wl_video_buffer_pool_new:PGstBufferPool;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_WL_VIDEO_BUFFER_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_WL_VIDEO_BUFFER_POOL:=gst_wl_video_buffer_pool_get_type;
  end;


end.