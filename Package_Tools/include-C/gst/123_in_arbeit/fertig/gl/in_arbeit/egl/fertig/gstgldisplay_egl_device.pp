
unit gstgldisplay_egl_device;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstgldisplay_egl_device.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstgldisplay_egl_device.h
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
PGstGLDisplayEGLDevice  = ^GstGLDisplayEGLDevice;
PGstGLDisplayEGLDeviceClass  = ^GstGLDisplayEGLDeviceClass;
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

function gst_gl_display_egl_device_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_DISPLAY_EGL_DEVICE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_EGL_DEVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_EGL_DEVICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_EGL_DEVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_EGL_DEVICE_CLASS(klass : longint) : longint;

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


function gst_gl_display_egl_device_new(device_index:Tguint):PGstGLDisplayEGLDevice;cdecl;external;
function gst_gl_display_egl_device_new_with_egl_device(device:Tgpointer):PGstGLDisplayEGLDevice;cdecl;external;
{$endif}
{ __GST_GL_DISPLAY_EGL_DEVICE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_DISPLAY_EGL_DEVICE : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_DISPLAY_EGL_DEVICE:=gst_gl_display_egl_device_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_EGL_DEVICE(obj : longint) : longint;
begin
  GST_GL_DISPLAY_EGL_DEVICE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_DISPLAY_EGL_DEVICE,GstGLDisplayEGLDevice);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_DISPLAY_EGL_DEVICE_CLASS(klass : longint) : longint;
begin
  GST_GL_DISPLAY_EGL_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_DISPLAY_EGL_DEVICE,GstGLDisplayEGLDeviceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_EGL_DEVICE(obj : longint) : longint;
begin
  GST_IS_GL_DISPLAY_EGL_DEVICE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_DISPLAY_EGL_DEVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_DISPLAY_EGL_DEVICE_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_DISPLAY_EGL_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_DISPLAY_EGL_DEVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_DISPLAY_EGL_DEVICE_CAST(obj : longint) : PGstGLDisplayEGLDevice;
begin
  GST_GL_DISPLAY_EGL_DEVICE_CAST:=PGstGLDisplayEGLDevice(obj);
end;


end.
