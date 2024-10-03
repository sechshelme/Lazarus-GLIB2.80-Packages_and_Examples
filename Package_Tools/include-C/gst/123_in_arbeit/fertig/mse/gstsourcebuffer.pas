unit gstsourcebuffer;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * SPDX-License-Identifier: LGPL-2.1
 *
 * Copyright (C) 2013 Google Inc. All rights reserved.
 * Copyright (C) 2013 Orange
 * Copyright (C) 2013-2020 Apple Inc. All rights reserved.
 * Copyright (C) 2014 Sebastian Dröge <sebastian@centricular.com>
 * Copyright (C) 2015, 2016, 2017 Igalia, S.L
 * Copyright (C) 2015, 2016, 2017 Metrological Group B.V.
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
{$include <glib-object.h>}
{$include <gst/mse/mse-prelude.h>}
{*
 * GstSourceBufferAppendMode:
 * @GST_SOURCE_BUFFER_APPEND_MODE_SEGMENTS:
 * @GST_SOURCE_BUFFER_APPEND_MODE_SEQUENCE:
 *
 * [Specification](https://www.w3.org/TR/media-source-2/#dom-appendmode)
 *
 * Since: 1.24
  }
type
  PGstSourceBufferAppendMode = ^TGstSourceBufferAppendMode;
  TGstSourceBufferAppendMode =  Longint;
  Const
    GST_SOURCE_BUFFER_APPEND_MODE_SEGMENTS = 0;
    GST_SOURCE_BUFFER_APPEND_MODE_SEQUENCE = 1;
;
{*
 * GstSourceBufferInterval:
 *
 * Since: 1.24
  }
type
  PGstSourceBufferInterval = ^TGstSourceBufferInterval;
  TGstSourceBufferInterval = record
      start : TGstClockTime;
      end : TGstClockTime;
    end;

{G_DECLARE_FINAL_TYPE (GstSourceBuffer, gst_source_buffer, GST, SOURCE_BUFFER, GstObject); }
function gst_source_buffer_get_append_mode(self:PGstSourceBuffer):TGstSourceBufferAppendMode;cdecl;external libgstmse;
function gst_source_buffer_set_append_mode(self:PGstSourceBuffer; mode:TGstSourceBufferAppendMode; error:PPGError):Tgboolean;cdecl;external libgstmse;
function gst_source_buffer_get_content_type(self:PGstSourceBuffer):Pgchar;cdecl;external libgstmse;
function gst_source_buffer_get_updating(self:PGstSourceBuffer):Tgboolean;cdecl;external libgstmse;
function gst_source_buffer_get_buffered(self:PGstSourceBuffer; error:PPGError):PGArray;cdecl;external libgstmse;
function gst_source_buffer_set_timestamp_offset(self:PGstSourceBuffer; offset:TGstClockTime; error:PPGError):Tgboolean;cdecl;external libgstmse;
function gst_source_buffer_get_timestamp_offset(self:PGstSourceBuffer):TGstClockTime;cdecl;external libgstmse;
function gst_source_buffer_set_append_window_start(self:PGstSourceBuffer; start:TGstClockTime; error:PPGError):Tgboolean;cdecl;external libgstmse;
function gst_source_buffer_get_append_window_start(self:PGstSourceBuffer):TGstClockTime;cdecl;external libgstmse;
function gst_source_buffer_set_append_window_end(self:PGstSourceBuffer; end:TGstClockTime; error:PPGError):Tgboolean;cdecl;external libgstmse;
function gst_source_buffer_get_append_window_end(self:PGstSourceBuffer):TGstClockTime;cdecl;external libgstmse;
function gst_source_buffer_append_buffer(self:PGstSourceBuffer; buf:PGstBuffer; error:PPGError):Tgboolean;cdecl;external libgstmse;
function gst_source_buffer_abort(self:PGstSourceBuffer; error:PPGError):Tgboolean;cdecl;external libgstmse;
function gst_source_buffer_change_content_type(self:PGstSourceBuffer; _type:Pgchar; error:PPGError):Tgboolean;cdecl;external libgstmse;
function gst_source_buffer_remove(self:PGstSourceBuffer; start:TGstClockTime; end:TGstClockTime; error:PPGError):Tgboolean;cdecl;external libgstmse;

// === Konventiert am: 3-10-24 17:29:05 ===

function GST_TYPE_SOURCE_BUFFER: TGType;
function GST_SOURCE_BUFFER(obj: Pointer): PGstSourceBuffer;
function GST_IS_SOURCE_BUFFER(obj: Pointer): Tgboolean;

implementation

function GST_TYPE_SOURCE_BUFFER: TGType;
begin
  Result := gst_source_buffer_get_type;
end;

function GST_SOURCE_BUFFER(obj: Pointer): PGstSourceBuffer;
begin
  Result := PGstSourceBuffer(g_type_check_instance_cast(obj, GST_TYPE_SOURCE_BUFFER));
end;

function GST_IS_SOURCE_BUFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_SOURCE_BUFFER);
end;

type 
  TGstSourceBuffer = record
  end;
  PGstSourceBuffer = ^TGstSourceBuffer;

  TGstSourceBufferClass = record
    parent_class: TGstObjectClass;
  end;
  PGstSourceBufferClass = ^TGstSourceBufferClass;

function gst_source_buffer_get_type: TGType; cdecl; external libgxxxxxxx;



end.
