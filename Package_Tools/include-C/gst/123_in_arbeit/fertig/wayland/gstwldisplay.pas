unit gstwldisplay;

interface

uses
  glib280, gst124;

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
{$include <gst/video/video-info.h>}

{G_DECLARE_FINAL_TYPE (GstWlDisplay, gst_wl_display, GST, WL_DISPLAY, GObject); }
type
  PGstWlDisplay = ^TGstWlDisplay;
  TGstWlDisplay = record
      parent_instance : TGObject;
    end;


function gst_wl_display_new(name:Pgchar; error:PPGError):PGstWlDisplay;cdecl;external libgstwayland;
function gst_wl_display_new_existing(display:Pwl_display; take_ownership:Tgboolean; error:PPGError):PGstWlDisplay;cdecl;external libgstwayland;
{ see wlbuffer.c for explanation  }
procedure gst_wl_display_register_buffer(self:PGstWlDisplay; gstmem:Tgpointer; wlbuffer:Tgpointer);cdecl;external libgstwayland;
procedure gst_wl_display_unregister_buffer(self:PGstWlDisplay; gstmem:Tgpointer);cdecl;external libgstwayland;
function gst_wl_display_sync(self:PGstWlDisplay; listener:Pwl_callback_listener; data:Tgpointer):Pwl_callback;cdecl;external libgstwayland;
procedure gst_wl_display_callback_destroy(self:PGstWlDisplay; callback:PPwl_callback);cdecl;external libgstwayland;
function gst_wl_display_lookup_buffer(self:PGstWlDisplay; gstmem:Tgpointer):Tgpointer;cdecl;external libgstwayland;
function gst_wl_display_check_format_for_shm(self:PGstWlDisplay; video_info:PGstVideoInfo):Tgboolean;cdecl;external libgstwayland;
function gst_wl_display_check_format_for_dmabuf(self:PGstWlDisplay; drm_info:PGstVideoInfoDmaDrm):Tgboolean;cdecl;external libgstwayland;
function gst_wl_display_get_display(self:PGstWlDisplay):Pwl_display;cdecl;external libgstwayland;
function gst_wl_display_get_event_queue(self:PGstWlDisplay):Pwl_event_queue;cdecl;external libgstwayland;
function gst_wl_display_get_compositor(self:PGstWlDisplay):Pwl_compositor;cdecl;external libgstwayland;
function gst_wl_display_get_subcompositor(self:PGstWlDisplay):Pwl_subcompositor;cdecl;external libgstwayland;
function gst_wl_display_get_xdg_wm_base(self:PGstWlDisplay):Pxdg_wm_base;cdecl;external libgstwayland;
function gst_wl_display_get_fullscreen_shell_v1(self:PGstWlDisplay):Pzwp_fullscreen_shell_v1;cdecl;external libgstwayland;
function gst_wl_display_get_viewporter(self:PGstWlDisplay):Pwp_viewporter;cdecl;external libgstwayland;
function gst_wl_display_get_shm(self:PGstWlDisplay):Pwl_shm;cdecl;external libgstwayland;
function gst_wl_display_get_shm_formats(self:PGstWlDisplay):PGArray;cdecl;external libgstwayland;
function gst_wl_display_get_dmabuf_formats(self:PGstWlDisplay):PGArray;cdecl;external libgstwayland;
function gst_wl_display_get_dmabuf_modifiers(self:PGstWlDisplay):PGArray;cdecl;external libgstwayland;
function gst_wl_display_get_dmabuf_v1(self:PGstWlDisplay):Pzwp_linux_dmabuf_v1;cdecl;external libgstwayland;
function gst_wl_display_get_single_pixel_buffer_manager_v1(self:PGstWlDisplay):Pwp_single_pixel_buffer_manager_v1;cdecl;external libgstwayland;
function gst_wl_display_has_own_display(self:PGstWlDisplay):Tgboolean;cdecl;external libgstwayland;

// === Konventiert am: 8-10-24 14:15:30 ===

function GST_TYPE_WL_DISPLAY: TGType;
function GST_WL_DISPLAY(obj: Pointer): PGstWlDisplay;
function GST_IS_WL_DISPLAY(obj: Pointer): Tgboolean;

implementation

function GST_TYPE_WL_DISPLAY: TGType;
begin
  Result := gst_wl_display_get_type;
end;

function GST_WL_DISPLAY(obj: Pointer): PGstWlDisplay;
begin
  Result := PGstWlDisplay(g_type_check_instance_cast(obj, GST_TYPE_WL_DISPLAY));
end;

function GST_IS_WL_DISPLAY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WL_DISPLAY);
end;

type 
  TGstWlDisplay = record
  end;
  PGstWlDisplay = ^TGstWlDisplay;

  TGstWlDisplayClass = record
    parent_class: TGObjectClass;
  end;
  PGstWlDisplayClass = ^TGstWlDisplayClass;

function gst_wl_display_get_type: TGType; cdecl; external libgxxxxxxx;



end.
