
unit gstwlwindow;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstwlwindow.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstwlwindow.h
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
PGMutex  = ^GMutex;
PGstVideoInfo  = ^GstVideoInfo;
PGstVideoRectangle  = ^GstVideoRectangle;
PGstWlBuffer  = ^GstWlBuffer;
PGstWlDisplay  = ^GstWlDisplay;
PGstWlWindow  = ^GstWlWindow;
Pwl_subsurface  = ^wl_subsurface;
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
{$include <gst/video/video.h>}

{ was #define dname def_expr }
function GST_TYPE_WL_WINDOW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GstWlWindow, gst_wl_window, GST, WL_WINDOW, GObject); }
type
  PGstWlWindow = ^TGstWlWindow;
  TGstWlWindow = record
      parent_instance : TGObject;
    end;


procedure gst_wl_window_ensure_fullscreen(self:PGstWlWindow; fullscreen:Tgboolean);cdecl;external;
(* Const before type ignored *)
function gst_wl_window_new_toplevel(display:PGstWlDisplay; info:PGstVideoInfo; fullscreen:Tgboolean; render_lock:PGMutex):PGstWlWindow;cdecl;external;
function gst_wl_window_new_in_surface(display:PGstWlDisplay; parent:Pwl_surface; render_lock:PGMutex):PGstWlWindow;cdecl;external;
function gst_wl_window_get_display(self:PGstWlWindow):PGstWlDisplay;cdecl;external;
function gst_wl_window_get_wl_surface(self:PGstWlWindow):Pwl_surface;cdecl;external;
function gst_wl_window_get_subsurface(self:PGstWlWindow):Pwl_subsurface;cdecl;external;
function gst_wl_window_is_toplevel(self:PGstWlWindow):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_wl_window_render(self:PGstWlWindow; buffer:PGstWlBuffer; info:PGstVideoInfo):Tgboolean;cdecl;external;
procedure gst_wl_window_set_render_rectangle(self:PGstWlWindow; x:Tgint; y:Tgint; w:Tgint; h:Tgint);cdecl;external;
(* Const before type ignored *)
function gst_wl_window_get_render_rectangle(self:PGstWlWindow):PGstVideoRectangle;cdecl;external;
procedure gst_wl_window_set_rotate_method(self:PGstWlWindow; rotate_method:TGstVideoOrientationMethod);cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_WL_WINDOW : longint; { return type might be wrong }
  begin
    GST_TYPE_WL_WINDOW:=gst_wl_window_get_type;
  end;


end.
