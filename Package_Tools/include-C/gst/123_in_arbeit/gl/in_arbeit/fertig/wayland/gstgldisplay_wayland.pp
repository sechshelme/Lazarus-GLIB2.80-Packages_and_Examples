
unit gstgldisplay_wayland;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstgldisplay_wayland.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstgldisplay_wayland.h
}

Type
Pgchar = ^Tgchar;
PGstGLDisplayWayland = ^TGstGLDisplayWayland;
PGstGLDisplayWaylandClass = ^TGstGLDisplayWaylandClass;
Pwl_compositor = ^Twl_compositor;
Pwl_display = ^Twl_display;
Pwl_registry = ^Twl_registry;
Pwl_shell = ^Twl_shell;
Pwl_subcompositor = ^Twl_subcompositor;

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

function gst_gl_display_wayland_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_DISPLAY_WAYLAND : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_WAYLAND(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_WAYLAND_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_WAYLAND(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_WAYLAND_CLASS(klass : longint) : longint;

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

(* Const before declarator ignored *)

function gst_gl_display_wayland_new(name:Pgchar):PGstGLDisplayWayland;cdecl;external;
function gst_gl_display_wayland_new_with_display(display:Pwl_display):PGstGLDisplayWayland;cdecl;external;
{$endif}
{ __GST_GL_DISPLAY_WAYLAND_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_DISPLAY_WAYLAND : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_DISPLAY_WAYLAND:=gst_gl_display_wayland_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_WAYLAND(obj : longint) : longint;
begin
  GST_GL_DISPLAY_WAYLAND:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_DISPLAY_WAYLAND,GstGLDisplayWayland);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_WAYLAND_CLASS(klass : longint) : longint;
begin
  GST_GL_DISPLAY_WAYLAND_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_DISPLAY_WAYLAND,GstGLDisplayWaylandClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_WAYLAND(obj : longint) : longint;
begin
  GST_IS_GL_DISPLAY_WAYLAND:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_DISPLAY_WAYLAND);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_WAYLAND_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_DISPLAY_WAYLAND_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_DISPLAY_WAYLAND);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_DISPLAY_WAYLAND_CAST(obj : longint) : PGstGLDisplayWayland;
begin
  GST_GL_DISPLAY_WAYLAND_CAST:=PGstGLDisplayWayland(obj);
end;


end.
