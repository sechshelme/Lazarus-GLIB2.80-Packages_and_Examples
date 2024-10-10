
unit gstgldisplay_egl;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstgldisplay_egl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstgldisplay_egl.h
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
PGstGLDisplay  = ^GstGLDisplay;
PGstGLDisplayEGL  = ^GstGLDisplayEGL;
PGstGLDisplayEGLClass  = ^GstGLDisplayEGLClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2014 Matthew Waters <ystreet00@gmail.com>
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
{$ifndef __GST_GL_DISPLAY_EGL_H__}
{$define __GST_GL_DISPLAY_EGL_H__}
{$include <gst/gl/gstgldisplay.h>}

function gst_gl_display_egl_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_DISPLAY_EGL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_EGL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_EGL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_EGL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_EGL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_DISPLAY_EGL_CAST(obj : longint) : PGstGLDisplayEGL;

type
{*
 * GstGLDisplayEGL:
 *
 * the contents of a #GstGLDisplayEGL are private and should only be accessed
 * through the provided API
  }
{< private > }
  PGstGLDisplayEGL = ^TGstGLDisplayEGL;
  TGstGLDisplayEGL = record
      parent : TGstGLDisplay;
      display : Tgpointer;
      foreign_display : Tgboolean;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

  PGstGLDisplayEGLClass = ^TGstGLDisplayEGLClass;
  TGstGLDisplayEGLClass = record
      object_class : TGstGLDisplayClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_display_egl_new:PGstGLDisplayEGL;cdecl;external;
function gst_gl_display_egl_new_surfaceless:PGstGLDisplayEGL;cdecl;external;
function gst_gl_display_egl_new_with_egl_display(display:Tgpointer):PGstGLDisplayEGL;cdecl;external;
function gst_gl_display_egl_from_gl_display(display:PGstGLDisplay):PGstGLDisplayEGL;cdecl;external;
function gst_gl_display_egl_get_from_native(_type:TGstGLDisplayType; display:Tguintptr):Tgpointer;cdecl;external;
const
  GST_GL_DISPLAY_EGL_NAME = 'gst.gl.display.egl';  
{$endif}
{ __GST_GL_DISPLAY_EGL_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_DISPLAY_EGL : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_DISPLAY_EGL:=gst_gl_display_egl_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_EGL(obj : longint) : longint;
begin
  GST_GL_DISPLAY_EGL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_DISPLAY_EGL,GstGLDisplayEGL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_EGL_CLASS(klass : longint) : longint;
begin
  GST_GL_DISPLAY_EGL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_DISPLAY_EGL,GstGLDisplayEGLClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_EGL(obj : longint) : longint;
begin
  GST_IS_GL_DISPLAY_EGL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_DISPLAY_EGL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_EGL_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_DISPLAY_EGL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_DISPLAY_EGL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_DISPLAY_EGL_CAST(obj : longint) : PGstGLDisplayEGL;
begin
  GST_GL_DISPLAY_EGL_CAST:=PGstGLDisplayEGL(obj);
end;


end.
