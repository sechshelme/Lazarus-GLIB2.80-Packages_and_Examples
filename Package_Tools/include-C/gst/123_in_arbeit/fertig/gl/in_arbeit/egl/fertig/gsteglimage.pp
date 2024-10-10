
unit gsteglimage;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsteglimage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsteglimage.h
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
Pgint  = ^gint;
Pgsize  = ^gsize;
PGstEGLImage  = ^GstEGLImage;
PGstGLContext  = ^GstGLContext;
PGstGLMemory  = ^GstGLMemory;
PGstVideoInfo  = ^GstVideoInfo;
PGstVideoInfoDmaDrm  = ^GstVideoInfoDmaDrm;
Pguintptr  = ^guintptr;
Plongint  = ^longint;
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
{$ifndef _GST_EGL_IMAGE_H_}
{$define _GST_EGL_IMAGE_H_}
{$include <gst/gl/gstgl_fwd.h>}
{$include <gst/gl/gstglformat.h>}

function gst_egl_image_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_EGL_IMAGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EGL_IMAGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_EGL_IMAGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_EGL_IMAGE_CAST(obj : longint) : PGstEGLImage;

type
{*
 * GstEGLImageDestroyNotify:
 * @image: a #GstEGLImage
 * @data: user data passed to gst_egl_image_new_wrapped()
 *
 * Function to be called when the GstEGLImage is destroyed. It should free
 * the associated `EGLImage` if necessary
  }

  TGstEGLImageDestroyNotify = procedure (image:PGstEGLImage; data:Tgpointer);cdecl;
{*
 * GstEGLImage:
 *
 * Opaque #GstEGLImage struct.
  }
{< private > }
  PGstEGLImage = ^TGstEGLImage;
  TGstEGLImage = record
      parent : TGstMiniObject;cdecl;
      context : PGstGLContext;
      image : Tgpointer;
      format : TGstGLFormat;
      destroy_data : Tgpointer;
      destroy_notify : TGstEGLImageDestroyNotify;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_egl_image_new_wrapped(context:PGstGLContext; image:Tgpointer; format:TGstGLFormat; user_data:Tgpointer; user_data_destroy:TGstEGLImageDestroyNotify):PGstEGLImage;cdecl;external;
function gst_egl_image_get_image(image:PGstEGLImage):Tgpointer;cdecl;external;
function gst_egl_image_from_texture(context:PGstGLContext; gl_mem:PGstGLMemory; attribs:Pguintptr):PGstEGLImage;cdecl;external;
{$if GST_GL_HAVE_DMABUF}
(* Const before type ignored *)

function gst_egl_image_from_dmabuf(context:PGstGLContext; dmabuf:Tgint; in_info:PGstVideoInfo; plane:Tgint; offset:Tgsize):PGstEGLImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_egl_image_from_dmabuf_direct(context:PGstGLContext; fd:Pgint; offset:Pgsize; in_info:PGstVideoInfo):PGstEGLImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_egl_image_from_dmabuf_direct_target(context:PGstGLContext; fd:Pgint; offset:Pgsize; in_info:PGstVideoInfo; target:TGstGLTextureTarget):PGstEGLImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_egl_image_from_dmabuf_direct_target_with_dma_drm(context:PGstGLContext; n_planes:Tguint; fd:Pgint; offset:Pgsize; in_info_dma:PGstVideoInfoDmaDrm; 
           target:TGstGLTextureTarget):PGstEGLImage;cdecl;external;
function gst_egl_image_export_dmabuf(image:PGstEGLImage; fd:Plongint; stride:Pgint; offset:Pgsize):Tgboolean;cdecl;external;
{$endif}
{*
 * gst_egl_image_ref:
 * @image: a #GstEGLImage.
 *
 * Increases the refcount of the given image by one.
 *
 * Returns: (transfer full): @image
  }
{ xxxxxxxxxxxxxxxx }
{static inline GstEGLImage * }
{gst_egl_image_ref (GstEGLImage * image) }
{ }
{  return (GstEGLImage *) gst_mini_object_ref (GST_MINI_OBJECT_CAST (image)); }
{ }
{*
 * gst_egl_image_unref:
 * @image: (transfer full): a #GstEGLImage.
 *
 * Decreases the refcount of the image. If the refcount reaches 0, the image
 * with the associated metadata and memory will be freed.
  }
{static inline void }
{gst_egl_image_unref (GstEGLImage * image) }
{ }
{  gst_mini_object_unref (GST_MINI_OBJECT_CAST (image)); }
{ }
{$endif}
{ _GST_EGL_IMAGE_H_  }

implementation

{ was #define dname def_expr }
function GST_TYPE_EGL_IMAGE : longint; { return type might be wrong }
  begin
    GST_TYPE_EGL_IMAGE:=gst_egl_image_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_EGL_IMAGE(obj : longint) : longint;
begin
  GST_EGL_IMAGE:=GST_EGL_IMAGE_CAST(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_EGL_IMAGE(obj : longint) : longint;
begin
  GST_IS_EGL_IMAGE:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_EGL_IMAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_EGL_IMAGE_CAST(obj : longint) : PGstEGLImage;
begin
  GST_EGL_IMAGE_CAST:=PGstEGLImage(obj);
end;


end.
