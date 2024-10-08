
unit gstwlcontext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstwlcontext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstwlcontext.h
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
PGstContext  = ^GstContext;
PGstMessage  = ^GstMessage;
Pwl_display  = ^wl_display;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Wayland Library
 *
 * Copyright (C) 2022 Collabora Ltd.
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
 * License along with this library; if not, write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA.
  }
(** unsupported pragma#pragma once*)
{$include <gst/wayland/wayland.h>}
{ The type of GstContext used to pass the wl_display pointer
 * from the application to the sink  }

const
  GST_WL_DISPLAY_HANDLE_CONTEXT_TYPE = 'GstWlDisplayHandleContextType';  

function gst_is_wl_display_handle_need_context_message(msg:PGstMessage):Tgboolean;cdecl;external;
function gst_wl_display_handle_context_new(display:Pwl_display):PGstContext;cdecl;external;
function gst_wl_display_handle_context_get_handle(context:PGstContext):Pwl_display;cdecl;external;

implementation


end.
