unit gstvautils;

interface

uses
  glib280, gst124;

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

function gst_va_ensure_element_data(element:Tgpointer; render_device_path:Pgchar; display_ptr:PPGstVaDisplay):Tgboolean;cdecl;external libgstvap;
procedure gst_va_context_query(element:PGstElement; context_type:Pgchar);cdecl;external libgstvap;
function gst_va_handle_set_context(element:PGstElement; context:PGstContext; render_device_path:Pgchar; display_ptr:PPGstVaDisplay):Tgboolean;cdecl;external libgstvap;
function gst_va_handle_context_query(element:PGstElement; query:PGstQuery; display:PGstVaDisplay):Tgboolean;cdecl;external libgstvap;
procedure gst_va_element_propagate_display_context(element:PGstElement; display:PGstVaDisplay);cdecl;external libgstvap;
function gst_context_get_va_display(context:PGstContext; type_name:Pgchar; render_device_path:Pgchar; display_ptr:PPGstVaDisplay):Tgboolean;cdecl;external libgstvap;
procedure gst_context_set_va_display(context:PGstContext; display:PGstVaDisplay);cdecl;external libgstvap;

// === Konventiert am: 8-10-24 16:14:23 ===


implementation



end.
