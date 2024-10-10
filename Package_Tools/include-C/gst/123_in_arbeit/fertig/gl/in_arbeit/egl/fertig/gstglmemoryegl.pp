
unit gstglmemoryegl;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglmemoryegl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglmemoryegl.h
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
PGstEGLImage  = ^GstEGLImage;
PGstGLMemoryEGL  = ^GstGLMemoryEGL;
PGstGLMemoryEGLAllocator  = ^GstGLMemoryEGLAllocator;
PGstGLMemoryEGLAllocatorClass  = ^GstGLMemoryEGLAllocatorClass;
PGstMemory  = ^GstMemory;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2012 Collabora Ltd.
 *   @author: Sebastian Dröge <sebastian.droege@collabora.co.uk>
 * Copyright (C) 2014 Julien Isorce <julien.isorce@gmail.com>
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
{$ifndef _GST_GL_MEMORY_EGL_H_}
{$define _GST_GL_MEMORY_EGL_H_}
{$include <gst/gl/gstglmemory.h>}
{$include <gst/gl/egl/gsteglimage.h>}
{$include <gst/gl/egl/gstgldisplay_egl.h>}

function gst_gl_memory_egl_allocator_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_MEMORY_EGL_ALLOCATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_EGL_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_EGL_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MEMORY_EGL_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MEMORY_EGL_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_EGL_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_MEMORY_EGL_ALLOCATOR_CAST(obj : longint) : PGstGLMemoryEGLAllocator;

type
{*
 * GstGLMemoryEGL:
 *
 * Private instance
  }
{< private > }
  PGstGLMemoryEGL = ^TGstGLMemoryEGL;
  TGstGLMemoryEGL = record
      mem : TGstGLMemory;
      image : PGstEGLImage;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GST_GL_MEMORY_EGL_ALLOCATOR_NAME:
 *
 * The name of the GL Memory EGL allocator
  }

const
  GST_GL_MEMORY_EGL_ALLOCATOR_NAME = 'GLMemoryEGL';  
{*
 * GST_TYPE_GL_MEMORY_EGL:
 *
 * Since: 1.20
 * Deprecated: 1.22: This type has no use.
  }

{ was #define dname def_expr }
function GST_TYPE_GL_MEMORY_EGL : longint; { return type might be wrong }

function gst_gl_memory_egl_get_type:TGType;cdecl;external;
procedure gst_gl_memory_egl_init_once;cdecl;external;
function gst_is_gl_memory_egl(mem:PGstMemory):Tgboolean;cdecl;external;
function gst_gl_memory_egl_get_image(mem:PGstGLMemoryEGL):Tgpointer;cdecl;external;
function gst_gl_memory_egl_get_display(mem:PGstGLMemoryEGL):Tgpointer;cdecl;external;
{*
 * GstGLMemoryEGLAllocator:
 *
 * Opaque #GstGLMemoryEGLAllocator struct
  }
{< private > }
type
  PGstGLMemoryEGLAllocator = ^TGstGLMemoryEGLAllocator;
  TGstGLMemoryEGLAllocator = record
      parent : TGstGLMemoryAllocator;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLMemoryEGLAllocatorClass:
 *
 * The #GstGLMemoryEGLAllocatorClass only contains private data
  }
{< private > }
  PGstGLMemoryEGLAllocatorClass = ^TGstGLMemoryEGLAllocatorClass;
  TGstGLMemoryEGLAllocatorClass = record
      parent_class : TGstGLMemoryAllocatorClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{$endif}
{ _GST_GL_MEMORY_EGL_H_  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_MEMORY_EGL_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_MEMORY_EGL_ALLOCATOR:=gst_gl_memory_egl_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_EGL_ALLOCATOR(obj : longint) : longint;
begin
  GST_GL_MEMORY_EGL_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_MEMORY_EGL_ALLOCATOR,GstGLMemoryEGLAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_EGL_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_GL_MEMORY_EGL_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_MEMORY_EGL_ALLOCATOR,GstGLMemoryEGLAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MEMORY_EGL_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_GL_MEMORY_EGL_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_MEMORY_EGL_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MEMORY_EGL_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_MEMORY_EGL_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_MEMORY_EGL_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MEMORY_EGL_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_GL_MEMORY_EGL_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_GL_MEMORY_EGL_ALLOCATOR,GstGLMemoryEGLAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_MEMORY_EGL_ALLOCATOR_CAST(obj : longint) : PGstGLMemoryEGLAllocator;
begin
  GST_GL_MEMORY_EGL_ALLOCATOR_CAST:=PGstGLMemoryEGLAllocator(obj);
end;

{ was #define dname def_expr }
function GST_TYPE_GL_MEMORY_EGL : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_MEMORY_EGL:=gst_gl_memory_egl_get_type;
  end;


end.
