
unit gstplay_video_renderer;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstplay_video_renderer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstplay_video_renderer.h
}

Type
PGstElement = ^TGstElement;
PGstPlay = ^TGstPlay;
PGstPlayVideoRenderer = ^TGstPlayVideoRenderer;
PGstPlayVideoRendererInterface = ^TGstPlayVideoRendererInterface;

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
{$ifndef __GST_PLAY_VIDEO_RENDERER_H__}
{$define __GST_PLAY_VIDEO_RENDERER_H__}
{$include <gst/gst.h>}
{$include <gst/play/gstplay-types.h>}
{*
 * GstPlayVideoRenderer:
 * Since: 1.20
  }
type

{ was #define dname def_expr }
function GST_TYPE_PLAY_VIDEO_RENDERER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY_VIDEO_RENDERER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAY_VIDEO_RENDERER(obj : longint) : longint;

{*
 * GST_PLAY_VIDEO_RENDERER_GET_INTERFACE:
 * Since: 1.20
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY_VIDEO_RENDERER_GET_INTERFACE(inst : longint) : longint;

type
  PGstPlayVideoRendererInterface = ^TGstPlayVideoRendererInterface;
  TGstPlayVideoRendererInterface = record
      parent_iface : TGTypeInterface;
      create_video_sink : function (self:PGstPlayVideoRenderer; play:PGstPlay):PGstElement;cdecl;
    end;

{$ifdef G_DEFINE_AUTOPTR_CLEANUP_FUNC}
{$endif}

function gst_play_video_renderer_get_type:TGType;cdecl;external;
{$endif}
{ __GST_PLAY_VIDEO_RENDERER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_PLAY_VIDEO_RENDERER : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAY_VIDEO_RENDERER:=gst_play_video_renderer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY_VIDEO_RENDERER(obj : longint) : longint;
begin
  GST_PLAY_VIDEO_RENDERER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLAY_VIDEO_RENDERER,GstPlayVideoRenderer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAY_VIDEO_RENDERER(obj : longint) : longint;
begin
  GST_IS_PLAY_VIDEO_RENDERER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLAY_VIDEO_RENDERER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY_VIDEO_RENDERER_GET_INTERFACE(inst : longint) : longint;
begin
  GST_PLAY_VIDEO_RENDERER_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,GST_TYPE_PLAY_VIDEO_RENDERER,GstPlayVideoRendererInterface);
end;


end.
