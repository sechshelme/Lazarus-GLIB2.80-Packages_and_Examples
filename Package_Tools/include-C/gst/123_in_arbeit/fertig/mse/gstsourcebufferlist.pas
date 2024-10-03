unit gstsourcebufferlist;

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
{$include "gstsourcebuffer.h"}

{G_DECLARE_FINAL_TYPE (GstSourceBufferList, gst_source_buffer_list, GST, SOURCE_BUFFER_LIST, GstObject); }
function gst_source_buffer_list_index(self:PGstSourceBufferList; index:Tguint):PGstSourceBuffer;cdecl;external libgstmse;
function gst_source_buffer_list_get_length(self:PGstSourceBufferList):Tguint;cdecl;external libgstmse;

// === Konventiert am: 3-10-24 17:29:11 ===

function GST_TYPE_SOURCE_BUFFER_LIST: TGType;
function GST_SOURCE_BUFFER_LIST(obj: Pointer): PGstSourceBufferList;
function GST_IS_SOURCE_BUFFER_LIST(obj: Pointer): Tgboolean;

implementation

function GST_TYPE_SOURCE_BUFFER_LIST: TGType;
begin
  Result := gst_source_buffer_list_get_type;
end;

function GST_SOURCE_BUFFER_LIST(obj: Pointer): PGstSourceBufferList;
begin
  Result := PGstSourceBufferList(g_type_check_instance_cast(obj, GST_TYPE_SOURCE_BUFFER_LIST));
end;

function GST_IS_SOURCE_BUFFER_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_SOURCE_BUFFER_LIST);
end;

type 
  TGstSourceBufferList = record
  end;
  PGstSourceBufferList = ^TGstSourceBufferList;

  TGstSourceBufferListClass = record
    parent_class: TGstObjectClass;
  end;
  PGstSourceBufferListClass = ^TGstSourceBufferListClass;

function gst_source_buffer_list_get_type: TGType; cdecl; external libgxxxxxxx;



end.
