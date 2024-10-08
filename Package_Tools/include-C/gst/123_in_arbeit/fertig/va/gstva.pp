
unit gstva;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstva.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstva.h
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
PGstVaFeature  = ^GstVaFeature;
Pxxx  = ^xxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *  Copyright (C) 2021 Intel Corporation
 *     Author: He Junyan <junyan.he@intel.com>
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
(** unsupported pragma#pragma once*)
{$ifndef GST_USE_UNSTABLE_API}
{#pragma message ("The va library from gst-plugins-bad is unstable API and may change in future.") }
{#pragma message ("You can define GST_USE_UNSTABLE_API to avoid this warning.") }
{$endif}
{*
 * GstVaFeature:
 * @GST_VA_FEATURE_DISABLED: The feature is disabled.
 * @GST_VA_FEATURE_ENABLED: The feature is enabled.
 * @GST_VA_FEATURE_AUTO: The feature is enabled automatically.
 *
 * Since: 1.22
  }
type
  PGstVaFeature = ^TGstVaFeature;
  TGstVaFeature =  Longint;
  Const
    GST_VA_FEATURE_DISABLED = 0;
    GST_VA_FEATURE_ENABLED = 1;
    GST_VA_FEATURE_AUTO = 2;
;
{ jpeg decoder in i965 driver cannot create surfaces with fourcc  }
type
  Pxxx = ^Txxx;
  Txxx =  Longint;
  Const
    GST_VA_HACK_SURFACE_NO_FOURCC = 1 shl 0;
;
{$include <gst/va/va-prelude.h>}
{$include <gst/va/va-enumtypes.h>}
{$include <gst/va/gstvadisplay.h>}
{$ifdef G_OS_WIN32}
{$include <gst/va/gstvadisplay_win32.h>}
{$else}
{$include <gst/va/gstvadisplay_drm.h>}
{$endif}
{$include <gst/va/gstvadisplay_wrapped.h>}
{$include <gst/va/gstvaallocator.h>}
{$include <gst/va/gstvapool.h>}
{$include <gst/va/gstvautils.h>}

implementation


end.
