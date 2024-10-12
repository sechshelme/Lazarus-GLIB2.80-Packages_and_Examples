
unit gstcamerabinpreview;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstcamerabinpreview.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstcamerabinpreview.h
}

Type
PGstCaps = ^TGstCaps;
PGstElement = ^TGstElement;
PGstSample = ^TGstSample;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2008 Nokia Corporation <multimedia@maemo.org>
 * Copyright (C) 2010 Thiago Santos <thiago.sousa.santos@collabora.co.uk>
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
{$ifndef __CAMERABIN_PREVIEW_H_}
{$define __CAMERABIN_PREVIEW_H_}
{$ifndef GST_USE_UNSTABLE_API}
{#warning "camera bin preview is unstable API and may change in future." }
{#warning "You can define GST_USE_UNSTABLE_API to avoid this warning." }
{$endif}
{$include <gst/gst.h>}
{$include "basecamerabinsrc-prelude.h"}
{*
 * GstCameraBinPreviewPipelineData: (skip)
  }
type
  PGstCameraBinPreviewPipelineData = ^TGstCameraBinPreviewPipelineData;
  TGstCameraBinPreviewPipelineData = record
      pipeline : PGstElement;
      appsrc : PGstElement;
      filter : PGstElement;
      appsink : PGstElement;
      vscale : PGstElement;
      element : PGstElement;
      pending_preview_caps : PGstCaps;
      processing : Tguint;
      processing_lock : TGMutex;
      processing_cond : TGCond;
    end;

function gst_camerabin_create_preview_pipeline(element:PGstElement; filter:PGstElement):PGstCameraBinPreviewPipelineData;cdecl;external;
procedure gst_camerabin_destroy_preview_pipeline(preview:PGstCameraBinPreviewPipelineData);cdecl;external;
function gst_camerabin_preview_pipeline_post(preview:PGstCameraBinPreviewPipelineData; sample:PGstSample):Tgboolean;cdecl;external;
procedure gst_camerabin_preview_set_caps(preview:PGstCameraBinPreviewPipelineData; caps:PGstCaps);cdecl;external;
function gst_camerabin_preview_set_filter(preview:PGstCameraBinPreviewPipelineData; filter:PGstElement):Tgboolean;cdecl;external;
{$endif}
{ #ifndef __CAMERABIN_PREVIEW_H_  }

implementation


end.
