unit gstplayer_video_overlay_video_renderer;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2014-2015 Sebastian Dröge <sebastian@centricular.com>
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
{$ifndef __GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_H__}
{$define __GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_H__}
{$include <gst/player/gstplayer-types.h>}
{$include <gst/player/gstplayer-video-renderer.h>}
type

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CAST(obj : longint) : PGstPlayerVideoOverlayVideoRenderer;

function gst_player_video_overlay_video_renderer_get_type:TGType;cdecl;external libgstplayer;
function gst_player_video_overlay_video_renderer_new(window_handle:Tgpointer):PGstPlayerVideoRenderer;cdecl;external libgstplayer;
function gst_player_video_overlay_video_renderer_new_with_sink(window_handle:Tgpointer; video_sink:PGstElement):PGstPlayerVideoRenderer;cdecl;external libgstplayer;
procedure gst_player_video_overlay_video_renderer_set_window_handle(self:PGstPlayerVideoOverlayVideoRenderer; window_handle:Tgpointer);cdecl;external libgstplayer;
function gst_player_video_overlay_video_renderer_get_window_handle(self:PGstPlayerVideoOverlayVideoRenderer):Tgpointer;cdecl;external libgstplayer;
procedure gst_player_video_overlay_video_renderer_expose(self:PGstPlayerVideoOverlayVideoRenderer);cdecl;external libgstplayer;
procedure gst_player_video_overlay_video_renderer_set_render_rectangle(self:PGstPlayerVideoOverlayVideoRenderer; x:Tgint; y:Tgint; width:Tgint; height:Tgint);cdecl;external libgstplayer;
procedure gst_player_video_overlay_video_renderer_get_render_rectangle(self:PGstPlayerVideoOverlayVideoRenderer; x:Pgint; y:Pgint; width:Pgint; height:Pgint);cdecl;external libgstplayer;
{$endif}
{ __GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_H__  }

// === Konventiert am: 8-10-24 18:50:30 ===

function GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER : TGType;
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER(obj : Pointer) : PGstPlayerVideoOverlayVideoRenderer;
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass : Pointer) : PGstPlayerVideoOverlayVideoRendererClass;
function GST_IS_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER(obj : Pointer) : Tgboolean;
function GST_IS_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass : Pointer) : Tgboolean;
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_GET_CLASS(obj : Pointer) : PGstPlayerVideoOverlayVideoRendererClass;

implementation

function GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER : TGType;
  begin
    GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER:=gst_player_video_overlay_video_renderer_get_type;
  end;

function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER(obj : Pointer) : PGstPlayerVideoOverlayVideoRenderer;
begin
  Result := PGstPlayerVideoOverlayVideoRenderer(g_type_check_instance_cast(obj, GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER));
end;

function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass : Pointer) : PGstPlayerVideoOverlayVideoRendererClass;
begin
  Result := PGstPlayerVideoOverlayVideoRendererClass(g_type_check_class_cast(klass, GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER));
end;

function GST_IS_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER);
end;

function GST_IS_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER);
end;

function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_GET_CLASS(obj : Pointer) : PGstPlayerVideoOverlayVideoRendererClass;
begin
  Result := PGstPlayerVideoOverlayVideoRendererClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CAST(obj : longint) : PGstPlayerVideoOverlayVideoRenderer;
begin
  GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CAST:=PGstPlayerVideoOverlayVideoRenderer(obj);
end;


end.
