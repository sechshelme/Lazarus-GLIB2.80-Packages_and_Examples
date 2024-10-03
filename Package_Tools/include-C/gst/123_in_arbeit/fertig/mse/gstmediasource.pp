
unit gstmediasource;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstmediasource.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstmediasource.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGstMediaSource  = ^GstMediaSource;
PGstMediaSourceEOSError  = ^GstMediaSourceEOSError;
PGstMediaSourceError  = ^GstMediaSourceError;
PGstMediaSourceRange  = ^GstMediaSourceRange;
PGstMediaSourceReadyState  = ^GstMediaSourceReadyState;
PGstMseSrc  = ^GstMseSrc;
PGstSourceBuffer  = ^GstSourceBuffer;
PGstSourceBufferList  = ^GstSourceBufferList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * SPDX-License-Identifier: LGPL-2.1
 *
 * Copyright (C) 2013 Google Inc. All rights reserved.
 * Copyright (C) 2013 Orange
 * Copyright (C) 2013-2017 Apple Inc. All rights reserved.
 * Copyright (C) 2014 Sebastian Dröge <sebastian@centricular.com>
 * Copyright (C) 2015, 2016 Igalia, S.L
 * Copyright (C) 2015, 2016 Metrological Group B.V.
 * Copyright (C) 2022, 2023 Collabora Ltd.
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
{$include <gst/gst.h>}
{$include <gst/mse/mse-prelude.h>}
{$include <gst/mse/gstmsesrc.h>}
{$include "gstsourcebufferlist.h"}
{*
 * GstMediaSourceReadyState:
 * @GST_MEDIA_SOURCE_READY_STATE_CLOSED: The #GstMediaSource is not connected to
 * any playback element.
 * @GST_MEDIA_SOURCE_READY_STATE_OPEN: The #GstMediaSource is connected to a
 * playback element and ready to append data to its #GstSourceBuffer (s).
 * @GST_MEDIA_SOURCE_READY_STATE_ENDED: gst_media_source_end_of_stream() has
 * been called on the current #GstMediaSource
 *
 * Describes the possible states of the Media Source.
 *
 * [Specification](https://www.w3.org/TR/media-source-2/#dom-readystate)
 *
 * Since: 1.24
  }
type
  PGstMediaSourceReadyState = ^TGstMediaSourceReadyState;
  TGstMediaSourceReadyState =  Longint;
  Const
    GST_MEDIA_SOURCE_READY_STATE_CLOSED = 0;
    GST_MEDIA_SOURCE_READY_STATE_OPEN = 1;
    GST_MEDIA_SOURCE_READY_STATE_ENDED = 2;
;
{*
 * GstMediaSourceError:
 * @GST_MEDIA_SOURCE_ERROR_INVALID_STATE:
 * @GST_MEDIA_SOURCE_ERROR_TYPE:
 * @GST_MEDIA_SOURCE_ERROR_NOT_SUPPORTED:
 * @GST_MEDIA_SOURCE_ERROR_NOT_FOUND:
 * @GST_MEDIA_SOURCE_ERROR_QUOTA_EXCEEDED:
 *
 * Any error that can occur within #GstMediaSource or #GstSourceBuffer APIs.
 * These values correspond directly to those in the Web IDL specification.
 *
 * [Specification](https://webidl.spec.whatwg.org/#idl-DOMException-error-names)
 *
 * Since: 1.24
  }
type
  PGstMediaSourceError = ^TGstMediaSourceError;
  TGstMediaSourceError =  Longint;
  Const
    GST_MEDIA_SOURCE_ERROR_INVALID_STATE = 0;
    GST_MEDIA_SOURCE_ERROR_TYPE = 1;
    GST_MEDIA_SOURCE_ERROR_NOT_SUPPORTED = 2;
    GST_MEDIA_SOURCE_ERROR_NOT_FOUND = 3;
    GST_MEDIA_SOURCE_ERROR_QUOTA_EXCEEDED = 4;
;
{*
 * GstMediaSourceEOSError:
 * @GST_MEDIA_SOURCE_EOS_ERROR_NONE: End the stream successfully
 * @GST_MEDIA_SOURCE_EOS_ERROR_NETWORK: End the stream due to a networking error
 * @GST_MEDIA_SOURCE_EOS_ERROR_DECODE: End the stream due to a decoding error
 *
 * Reasons for ending a #GstMediaSource using gst_media_source_end_of_stream().
 *
 * [Specification](https://www.w3.org/TR/media-source-2/#dom-endofstreamerror)
 *
 * Since: 1.24
  }
type
  PGstMediaSourceEOSError = ^TGstMediaSourceEOSError;
  TGstMediaSourceEOSError =  Longint;
  Const
    GST_MEDIA_SOURCE_EOS_ERROR_NONE = 0;
    GST_MEDIA_SOURCE_EOS_ERROR_NETWORK = 1;
    GST_MEDIA_SOURCE_EOS_ERROR_DECODE = 2;
;
{*
 * GstMediaSourceRange:
 * @start: The start of this range.
 * @end: The end of this range.
 *
 * A structure describing a simplified version of the TimeRanges concept in the
 * HTML specification, only representing a single @start and @end time.
 *
 * [Specification](https://html.spec.whatwg.org/multipage/media.html#timeranges)
 *
 * Since: 1.24
  }
type
  PGstMediaSourceRange = ^TGstMediaSourceRange;
  TGstMediaSourceRange = record
      start : TGstClockTime;
      end : TGstClockTime;
    end;
(* Const before type ignored *)

function gst_media_source_is_type_supported(_type:Pgchar):Tgboolean;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_MEDIA_SOURCE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_MEDIA_SOURCE_ERROR : longint; { return type might be wrong }

{*
 * gst_media_source_error_quark:
 *
 * Any error type that can be reported by the Media Source API.
 *
 * Since: 1.24
  }
function gst_media_source_error_quark:TGQuark;cdecl;external;
{G_DECLARE_FINAL_TYPE (GstMediaSource, gst_media_source, GST, MEDIA_SOURCE, GstObject); }
function gst_media_source_new:PGstMediaSource;cdecl;external;
procedure gst_media_source_attach(self:PGstMediaSource; element:PGstMseSrc);cdecl;external;
procedure gst_media_source_detach(self:PGstMediaSource);cdecl;external;
function gst_media_source_get_source_buffers(self:PGstMediaSource):PGstSourceBufferList;cdecl;external;
function gst_media_source_get_active_source_buffers(self:PGstMediaSource):PGstSourceBufferList;cdecl;external;
function gst_media_source_get_ready_state(self:PGstMediaSource):TGstMediaSourceReadyState;cdecl;external;
function gst_media_source_get_position(self:PGstMediaSource):TGstClockTime;cdecl;external;
function gst_media_source_get_duration(self:PGstMediaSource):TGstClockTime;cdecl;external;
function gst_media_source_set_duration(self:PGstMediaSource; duration:TGstClockTime; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_media_source_add_source_buffer(self:PGstMediaSource; _type:Pgchar; error:PPGError):PGstSourceBuffer;cdecl;external;
function gst_media_source_remove_source_buffer(self:PGstMediaSource; buffer:PGstSourceBuffer; error:PPGError):Tgboolean;cdecl;external;
function gst_media_source_end_of_stream(self:PGstMediaSource; eos_error:TGstMediaSourceEOSError; error:PPGError):Tgboolean;cdecl;external;
function gst_media_source_set_live_seekable_range(self:PGstMediaSource; start:TGstClockTime; end:TGstClockTime; error:PPGError):Tgboolean;cdecl;external;
function gst_media_source_clear_live_seekable_range(self:PGstMediaSource; error:PPGError):Tgboolean;cdecl;external;
procedure gst_media_source_get_live_seekable_range(self:PGstMediaSource; range:PGstMediaSourceRange);cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_MEDIA_SOURCE : longint; { return type might be wrong }
  begin
    GST_TYPE_MEDIA_SOURCE:=gst_media_source_get_type;
  end;

{ was #define dname def_expr }
function GST_MEDIA_SOURCE_ERROR : longint; { return type might be wrong }
  begin
    GST_MEDIA_SOURCE_ERROR:=gst_media_source_error_quark;
  end;


end.
