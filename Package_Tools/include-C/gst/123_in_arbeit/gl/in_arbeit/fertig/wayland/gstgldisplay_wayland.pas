unit gstgldisplay_wayland;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2013 Matthew Waters <ystreet00@gmail.com>
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
{$ifndef __GST_GL_DISPLAY_WAYLAND_H__}
{$define __GST_GL_DISPLAY_WAYLAND_H__}
{$include <gst/gst.h>}
{$include <wayland-client.h>}
{$include <gst/gl/gstgl_fwd.h>}
{$include <gst/gl/gstgldisplay.h>}

function gst_gl_display_wayland_get_type:TGType;cdecl;external libgstgl;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_DISPLAY_WAYLAND_CAST(obj : longint) : PGstGLDisplayWayland;

type
{*
 * GstGLDisplayWayland:
 *
 * the contents of a #GstGLDisplayWayland are private and should only be accessed
 * through the provided API
  }
{ unset  }
{ unset  }
{ unset  }
{ Basic shell, see private struct for others (e.g. XDG-shell)  }
{ unset  }
{< private > }
  PGstGLDisplayWayland = ^TGstGLDisplayWayland;
  TGstGLDisplayWayland = record
      parent : TGstGLDisplay;
      display : Pwl_display;
      registry : Pwl_registry;
      compositor : Pwl_compositor;
      subcompositor : Pwl_subcompositor;
      shell : Pwl_shell;
      foreign_display : Tgboolean;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

  PGstGLDisplayWaylandClass = ^TGstGLDisplayWaylandClass;
  TGstGLDisplayWaylandClass = record
      object_class : TGstGLDisplayClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_display_wayland_new(name:Pgchar):PGstGLDisplayWayland;cdecl;external libgstgl;
function gst_gl_display_wayland_new_with_display(display:Pwl_display):PGstGLDisplayWayland;cdecl;external libgstgl;
{$endif}
{ __GST_GL_DISPLAY_WAYLAND_H__  }

// === Konventiert am: 9-10-24 15:43:41 ===

function GST_TYPE_GL_DISPLAY_WAYLAND : TGType;
function GST_GL_DISPLAY_WAYLAND(obj : Pointer) : PGstGLDisplayWayland;
function GST_GL_DISPLAY_WAYLAND_CLASS(klass : Pointer) : PGstGLDisplayWaylandClass;
function GST_IS_GL_DISPLAY_WAYLAND(obj : Pointer) : Tgboolean;
function GST_IS_GL_DISPLAY_WAYLAND_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_GL_DISPLAY_WAYLAND : TGType;
  begin
    GST_TYPE_GL_DISPLAY_WAYLAND:=gst_gl_display_wayland_get_type;
  end;

function GST_GL_DISPLAY_WAYLAND(obj : Pointer) : PGstGLDisplayWayland;
begin
  Result := PGstGLDisplayWayland(g_type_check_instance_cast(obj, GST_TYPE_GL_DISPLAY_WAYLAND));
end;

function GST_GL_DISPLAY_WAYLAND_CLASS(klass : Pointer) : PGstGLDisplayWaylandClass;
begin
  Result := PGstGLDisplayWaylandClass(g_type_check_class_cast(klass, GST_TYPE_GL_DISPLAY_WAYLAND));
end;

function GST_IS_GL_DISPLAY_WAYLAND(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_GL_DISPLAY_WAYLAND);
end;

function GST_IS_GL_DISPLAY_WAYLAND_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_GL_DISPLAY_WAYLAND);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_DISPLAY_WAYLAND_CAST(obj : longint) : PGstGLDisplayWayland;
begin
  GST_GL_DISPLAY_WAYLAND_CAST:=PGstGLDisplayWayland(obj);
end;


end.
