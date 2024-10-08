
unit gstvautils;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvautils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvautils.h
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
PGstContext  = ^GstContext;
PGstElement  = ^GstElement;
PGstQuery  = ^GstQuery;
PGstVaDisplay  = ^GstVaDisplay;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2020 Igalia, S.L.
 *     Author: Víctor Jáquez <vjaquez@igalia.com>
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
{$include <gst/va/gstva.h>}
{$include <gst/va/va_fwd.h>}
(* Const before type ignored *)

function gst_va_ensure_element_data(element:Tgpointer; render_device_path:Pgchar; display_ptr:PPGstVaDisplay):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gst_va_context_query(element:PGstElement; context_type:Pgchar);cdecl;external;
(* Const before type ignored *)
function gst_va_handle_set_context(element:PGstElement; context:PGstContext; render_device_path:Pgchar; display_ptr:PPGstVaDisplay):Tgboolean;cdecl;external;
function gst_va_handle_context_query(element:PGstElement; query:PGstQuery; display:PGstVaDisplay):Tgboolean;cdecl;external;
procedure gst_va_element_propagate_display_context(element:PGstElement; display:PGstVaDisplay);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_context_get_va_display(context:PGstContext; type_name:Pgchar; render_device_path:Pgchar; display_ptr:PPGstVaDisplay):Tgboolean;cdecl;external;
procedure gst_context_set_va_display(context:PGstContext; display:PGstVaDisplay);cdecl;external;

implementation


end.
