unit gstgldisplay_egl_device;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2014 Matthew Waters <ystreet00@gmail.com>
 * Copyright (C) 2019 Seungha Yang <seungha.yang@navercorp.com>
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
{$ifndef __GST_GL_DISPLAY_EGL_DEVICE_H__}
{$define __GST_GL_DISPLAY_EGL_DEVICE_H__}
{$include <gst/gl/gstgldisplay.h>}

function gst_gl_display_egl_device_get_type:TGType;cdecl;external libgstgl;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_DISPLAY_EGL_DEVICE_CAST(obj : longint) : PGstGLDisplayEGLDevice;

type
{*
 * GstGLDisplayEGLDevice:
 *
 * the contents of a #GstGLDisplayEGLDevice are private and should only be accessed
 * through the provided API
 *
 * Since: 1.18
  }
  PGstGLDisplayEGLDevice = ^TGstGLDisplayEGLDevice;
  TGstGLDisplayEGLDevice = record
      parent : TGstGLDisplay;
      device : Tgpointer;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLDisplayEGLDeviceClass:
 *
 * Opaque #GstGLDisplayEGLDeviceClass struct
 *
 * Since: 1.18
  }
  PGstGLDisplayEGLDeviceClass = ^TGstGLDisplayEGLDeviceClass;
  TGstGLDisplayEGLDeviceClass = record
      object_class : TGstGLDisplayClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_display_egl_device_new(device_index:Tguint):PGstGLDisplayEGLDevice;cdecl;external libgstgl;
function gst_gl_display_egl_device_new_with_egl_device(device:Tgpointer):PGstGLDisplayEGLDevice;cdecl;external libgstgl;
{$endif}
{ __GST_GL_DISPLAY_EGL_DEVICE_H__  }

// === Konventiert am: 9-10-24 09:01:17 ===

function GST_TYPE_GL_DISPLAY_EGL_DEVICE : TGType;
function GST_GL_DISPLAY_EGL_DEVICE(obj : Pointer) : PGstGLDisplayEGLDevice;
function GST_GL_DISPLAY_EGL_DEVICE_CLASS(klass : Pointer) : PGstGLDisplayEGLDeviceClass;
function GST_IS_GL_DISPLAY_EGL_DEVICE(obj : Pointer) : Tgboolean;
function GST_IS_GL_DISPLAY_EGL_DEVICE_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_GL_DISPLAY_EGL_DEVICE : TGType;
  begin
    GST_TYPE_GL_DISPLAY_EGL_DEVICE:=gst_gl_display_egl_device_get_type;
  end;

function GST_GL_DISPLAY_EGL_DEVICE(obj : Pointer) : PGstGLDisplayEGLDevice;
begin
  Result := PGstGLDisplayEGLDevice(g_type_check_instance_cast(obj, GST_TYPE_GL_DISPLAY_EGL_DEVICE));
end;

function GST_GL_DISPLAY_EGL_DEVICE_CLASS(klass : Pointer) : PGstGLDisplayEGLDeviceClass;
begin
  Result := PGstGLDisplayEGLDeviceClass(g_type_check_class_cast(klass, GST_TYPE_GL_DISPLAY_EGL_DEVICE));
end;

function GST_IS_GL_DISPLAY_EGL_DEVICE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_GL_DISPLAY_EGL_DEVICE);
end;

function GST_IS_GL_DISPLAY_EGL_DEVICE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_GL_DISPLAY_EGL_DEVICE);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_DISPLAY_EGL_DEVICE_CAST(obj : longint) : PGstGLDisplayEGLDevice;
begin
  GST_GL_DISPLAY_EGL_DEVICE_CAST:=PGstGLDisplayEGLDevice(obj);
end;


end.
