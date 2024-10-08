
unit gstwlbuffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstwlbuffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstwlbuffer.h
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
PGstBuffer  = ^GstBuffer;
PGstWlBuffer  = ^GstWlBuffer;
PGstWlDisplay  = ^GstWlDisplay;
Pwl_buffer  = ^wl_buffer;
Pwl_surface  = ^wl_surface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Wayland Library
 *
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

{ was #define dname def_expr }
function GST_TYPE_WL_BUFFER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GstWlBuffer, gst_wl_buffer, GST, WL_BUFFER, GObject); }
type
  PGstWlBuffer = ^TGstWlBuffer;
  TGstWlBuffer = record
      parent_instance : TGObject;
    end;


function gst_buffer_add_wl_buffer(gstbuffer:PGstBuffer; wlbuffer:Pwl_buffer; display:PGstWlDisplay):PGstWlBuffer;cdecl;external;
function gst_buffer_get_wl_buffer(display:PGstWlDisplay; gstbuffer:PGstBuffer):PGstWlBuffer;cdecl;external;
procedure gst_wl_buffer_force_release_and_unref(buf:PGstBuffer; self:PGstWlBuffer);cdecl;external;
procedure gst_wl_buffer_attach(self:PGstWlBuffer; surface:Pwl_surface);cdecl;external;
procedure gst_wl_buffer_ref_gst_buffer(self:PGstWlBuffer);cdecl;external;
procedure gst_wl_buffer_unref_buffer(self:PGstWlBuffer);cdecl;external;
function gst_wl_buffer_get_display(self:PGstWlBuffer):PGstWlDisplay;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_WL_BUFFER : longint; { return type might be wrong }
  begin
    GST_TYPE_WL_BUFFER:=gst_wl_buffer_get_type;
  end;


end.
