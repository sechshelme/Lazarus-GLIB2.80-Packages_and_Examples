
unit gstopencvvideofilter;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstopencvvideofilter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstopencvvideofilter.h
}

Type
PGstBuffer = ^TGstBuffer;
PGstOpencvVideoFilter = ^TGstOpencvVideoFilter;
PGstOpencvVideoFilterClass = ^TGstOpencvVideoFilterClass;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2010 Thiago Santos <thiago.sousa.santos@collabora.co.uk>
 * Copyright (C) 2018 Nicola Murino <nicola.murino@gmail.com>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * Alternatively, the contents of this file may be used under the
 * GNU Lesser General Public License Version 2.1 (the "LGPL"), in
 * which case the following provisions apply instead of the ones
 * mentioned above:
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
{$ifndef __GST_OPENCV_VIDEO_FILTER_H__}
{$define __GST_OPENCV_VIDEO_FILTER_H__}
{$include <gst/gst.h>}
{$include <gst/video/gstvideofilter.h>}
{$include <gst/opencv/opencv-prelude.h>}
{$include <opencv2/core.hpp>}
{ forward declare opencv type to avoid exposing them in this API  }
{typedef struct _IplImage IplImage; }
{ #defines don't like whitespacey bits  }

{ was #define dname def_expr }
function GST_TYPE_OPENCV_VIDEO_FILTER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_OPENCV_VIDEO_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_OPENCV_VIDEO_FILTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_OPENCV_VIDEO_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_OPENCV_VIDEO_FILTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_OPENCV_VIDEO_FILTER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_OPENCV_VIDEO_FILTER_CAST(obj : longint) : PGstOpencvVideoFilter;

type

  TGstOpencvVideoFilterTransformIPFunc = function (transform:PGstOpencvVideoFilter; buffer:PGstBuffer; img:Tcv_Mat):TGstFlowReturn;cdecl;

  TGstOpencvVideoFilterTransformFunc = function (transform:PGstOpencvVideoFilter; buffer:PGstBuffer; img:Tcv_Mat; outbuf:PGstBuffer; outimg:Tcv_Mat):TGstFlowReturn;cdecl;

  TGstOpencvVideoFilterSetCaps = function (transform:PGstOpencvVideoFilter; in_width:Tgint; in_height:Tgint; in_cv_type:longint; out_width:Tgint; 
               out_height:Tgint; out_cv_type:longint):Tgboolean;cdecl;
  PGstOpencvVideoFilter = ^TGstOpencvVideoFilter;
  TGstOpencvVideoFilter = record
      trans : TGstVideoFilter;cdecl;
      in_place : Tgboolean;
      cvImage : Tcv_Mat;
      out_cvImage : Tcv_Mat;
    end;

  PGstOpencvVideoFilterClass = ^TGstOpencvVideoFilterClass;
  TGstOpencvVideoFilterClass = record
      parent_class : TGstVideoFilterClass;
      cv_trans_func : TGstOpencvVideoFilterTransformFunc;
      cv_trans_ip_func : TGstOpencvVideoFilterTransformIPFunc;
      cv_set_caps : TGstOpencvVideoFilterSetCaps;
    end;


function gst_opencv_video_filter_get_type:TGType;cdecl;external;
procedure gst_opencv_video_filter_set_in_place(transform:PGstOpencvVideoFilter; ip:Tgboolean);cdecl;external;
{$endif}
{ __GST_OPENCV_VIDEO_FILTER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_OPENCV_VIDEO_FILTER : longint; { return type might be wrong }
  begin
    GST_TYPE_OPENCV_VIDEO_FILTER:=gst_opencv_video_filter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_OPENCV_VIDEO_FILTER(obj : longint) : longint;
begin
  GST_OPENCV_VIDEO_FILTER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_OPENCV_VIDEO_FILTER,GstOpencvVideoFilter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_OPENCV_VIDEO_FILTER_CLASS(klass : longint) : longint;
begin
  GST_OPENCV_VIDEO_FILTER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_OPENCV_VIDEO_FILTER,GstOpencvVideoFilterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_OPENCV_VIDEO_FILTER(obj : longint) : longint;
begin
  GST_IS_OPENCV_VIDEO_FILTER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_OPENCV_VIDEO_FILTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_OPENCV_VIDEO_FILTER_CLASS(klass : longint) : longint;
begin
  GST_IS_OPENCV_VIDEO_FILTER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_OPENCV_VIDEO_FILTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_OPENCV_VIDEO_FILTER_GET_CLASS(obj : longint) : longint;
begin
  GST_OPENCV_VIDEO_FILTER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_OPENCV_VIDEO_FILTER,GstOpencvVideoFilterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_OPENCV_VIDEO_FILTER_CAST(obj : longint) : PGstOpencvVideoFilter;
begin
  GST_OPENCV_VIDEO_FILTER_CAST:=PGstOpencvVideoFilter(obj);
end;


end.
