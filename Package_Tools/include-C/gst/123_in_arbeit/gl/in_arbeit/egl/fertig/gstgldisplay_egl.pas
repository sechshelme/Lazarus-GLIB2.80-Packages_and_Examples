unit gstgldisplay_egl;

interface

uses
  glib280, gst124;

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

function gst_gl_display_egl_get_type:TGType;cdecl;external libgstgl;
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


function gst_gl_display_egl_new:PGstGLDisplayEGL;cdecl;external libgstgl;
function gst_gl_display_egl_new_surfaceless:PGstGLDisplayEGL;cdecl;external libgstgl;
function gst_gl_display_egl_new_with_egl_display(display:Tgpointer):PGstGLDisplayEGL;cdecl;external libgstgl;
function gst_gl_display_egl_from_gl_display(display:PGstGLDisplay):PGstGLDisplayEGL;cdecl;external libgstgl;
function gst_gl_display_egl_get_from_native(_type:TGstGLDisplayType; display:Tguintptr):Tgpointer;cdecl;external libgstgl;
const
  GST_GL_DISPLAY_EGL_NAME = 'gst.gl.display.egl';  
{$endif}
{ __GST_GL_DISPLAY_EGL_H__  }

// === Konventiert am: 9-10-24 09:01:09 ===

function GST_TYPE_GL_DISPLAY_EGL : TGType;
function GST_GL_DISPLAY_EGL(obj : Pointer) : PGstGLDisplayEGL;
function GST_GL_DISPLAY_EGL_CLASS(klass : Pointer) : PGstGLDisplayEGLClass;
function GST_IS_GL_DISPLAY_EGL(obj : Pointer) : Tgboolean;
function GST_IS_GL_DISPLAY_EGL_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_GL_DISPLAY_EGL : TGType;
  begin
    GST_TYPE_GL_DISPLAY_EGL:=gst_gl_display_egl_get_type;
  end;

function GST_GL_DISPLAY_EGL(obj : Pointer) : PGstGLDisplayEGL;
begin
  Result := PGstGLDisplayEGL(g_type_check_instance_cast(obj, GST_TYPE_GL_DISPLAY_EGL));
end;

function GST_GL_DISPLAY_EGL_CLASS(klass : Pointer) : PGstGLDisplayEGLClass;
begin
  Result := PGstGLDisplayEGLClass(g_type_check_class_cast(klass, GST_TYPE_GL_DISPLAY_EGL));
end;

function GST_IS_GL_DISPLAY_EGL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_GL_DISPLAY_EGL);
end;

function GST_IS_GL_DISPLAY_EGL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_GL_DISPLAY_EGL);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_DISPLAY_EGL_CAST(obj : longint) : PGstGLDisplayEGL;
begin
  GST_GL_DISPLAY_EGL_CAST:=PGstGLDisplayEGL(obj);
end;


end.
