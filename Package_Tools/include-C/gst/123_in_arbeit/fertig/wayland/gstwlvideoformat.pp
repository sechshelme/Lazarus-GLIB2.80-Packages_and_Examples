
unit gstwlvideoformat;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstwlvideoformat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstwlvideoformat.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Wayland Library
 *
 * Copyright (C) 2011 Intel Corporation
 * Copyright (C) 2011 Sreerenj Balachandran <sreerenj.balachandran@intel.com>
 * Copyright (C) 2012 Wim Taymans <wim.taymans@gmail.com>
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
 * License along with this library; if not, write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA.
  }
(** unsupported pragma#pragma once*)
{$include <gst/wayland/wayland.h>}
{$include <gst/video/video.h>}
{*
 * GST_WL_VIDEO_FORMATS:
 *
 * A list of supported video formats for use in cap templates.
 *
 * Since: 1.24
  }

const
  GST_WL_VIDEO_FORMATS = '{ AYUV, RGBA, ARGB, BGRA, ABGR, P010_10LE, v308, RGBx, xRGB, BGRx, xBGR, RGB, BGR, Y42B, NV16, NV61, YUY2, YVYU, UYVY, I420, YV12, NV12, NV21, Y41B, YUV9, YVU9, BGR16, RGB16 }';  

procedure gst_wl_videoformat_init_once;cdecl;external;
function gst_video_format_to_wl_shm_format(format:TGstVideoFormat):Twl_shm_format;cdecl;external;
function gst_video_format_to_wl_dmabuf_format(format:TGstVideoFormat):Tguint32;cdecl;external;
function gst_wl_shm_format_to_video_format(wl_format:Twl_shm_format):TGstVideoFormat;cdecl;external;
function gst_wl_dmabuf_format_to_video_format(wl_format:Tguint):TGstVideoFormat;cdecl;external;
(* Const before type ignored *)
function gst_wl_shm_format_to_string(wl_format:Twl_shm_format):Pgchar;cdecl;external;
function gst_wl_dmabuf_format_to_string(wl_format:Tguint; modifier:Tguint64):Pgchar;cdecl;external;

implementation


end.
