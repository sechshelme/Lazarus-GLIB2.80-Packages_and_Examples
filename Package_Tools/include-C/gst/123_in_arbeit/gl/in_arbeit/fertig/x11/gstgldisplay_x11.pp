
unit gstgldisplay_x11;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstgldisplay_x11.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstgldisplay_x11.h
}

Type
PDisplay = ^TDisplay;
Pgchar = ^Tgchar;
PGstGLDisplayX11 = ^TGstGLDisplayX11;
PGstGLDisplayX11Class = ^TGstGLDisplayX11Class;
Pxcb_connection_t = ^Txcb_connection_t;

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
{$ifndef __GST_GL_DISPLAY_X11_H__}
{$define __GST_GL_DISPLAY_X11_H__}
{$include <gst/gst.h>}
{$include <X11/Xlib-xcb.h>}
{$include <gst/gl/gstgldisplay.h>}

function gst_gl_display_x11_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_DISPLAY_X11 : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_X11(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_X11_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_X11(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_X11_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_DISPLAY_X11_CAST(obj : longint) : PGstGLDisplayX11;

type
{*
 * GstGLDisplayX11:
 *
 * the contents of a #GstGLDisplayX11 are private and should only be accessed
 * through the provided API
  }
{< private > }
  PGstGLDisplayX11 = ^TGstGLDisplayX11;
  TGstGLDisplayX11 = record
      parent : TGstGLDisplay;
      name : Pgchar;
      display : PDisplay;
      xcb_connection : Pxcb_connection_t;
      foreign_display : Tgboolean;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

  PGstGLDisplayX11Class = ^TGstGLDisplayX11Class;
  TGstGLDisplayX11Class = record
      object_class : TGstGLDisplayClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

(* Const before declarator ignored *)

function gst_gl_display_x11_new(name:Pgchar):PGstGLDisplayX11;cdecl;external;
function gst_gl_display_x11_new_with_display(display:PDisplay):PGstGLDisplayX11;cdecl;external;
{$endif}
{ __GST_GL_DISPLAY_X11_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_DISPLAY_X11 : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_DISPLAY_X11:=gst_gl_display_x11_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_X11(obj : longint) : longint;
begin
  GST_GL_DISPLAY_X11:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_DISPLAY_X11,GstGLDisplayX11);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_X11_CLASS(klass : longint) : longint;
begin
  GST_GL_DISPLAY_X11_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_DISPLAY_X11,GstGLDisplayX11Class);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_X11(obj : longint) : longint;
begin
  GST_IS_GL_DISPLAY_X11:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_DISPLAY_X11);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_X11_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_DISPLAY_X11_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_DISPLAY_X11);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_DISPLAY_X11_CAST(obj : longint) : PGstGLDisplayX11;
begin
  GST_GL_DISPLAY_X11_CAST:=PGstGLDisplayX11(obj);
end;


end.
