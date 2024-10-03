
unit gstsourcebufferlist;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstsourcebufferlist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstsourcebufferlist.h
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
PGstSourceBuffer  = ^GstSourceBuffer;
PGstSourceBufferList  = ^GstSourceBufferList;
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

{ was #define dname def_expr }
function GST_TYPE_SOURCE_BUFFER_LIST : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GstSourceBufferList, gst_source_buffer_list, GST, SOURCE_BUFFER_LIST, GstObject); }
function gst_source_buffer_list_index(self:PGstSourceBufferList; index:Tguint):PGstSourceBuffer;cdecl;external;
function gst_source_buffer_list_get_length(self:PGstSourceBufferList):Tguint;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_SOURCE_BUFFER_LIST : longint; { return type might be wrong }
  begin
    GST_TYPE_SOURCE_BUFFER_LIST:=gst_source_buffer_list_get_type;
  end;


end.
