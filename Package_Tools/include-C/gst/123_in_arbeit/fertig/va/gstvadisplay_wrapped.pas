unit gstvadisplay_wrapped;

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
{$include <gst/va/gstva.h>}
{$include <gst/va/va_fwd.h>}

function gst_va_display_wrapped_get_type:TGType;cdecl;external libgstvap;
function gst_va_display_wrapped_new(handle:Tgpointer):PGstVaDisplay;cdecl;external libgstvap;

// === Konventiert am: 8-10-24 16:14:04 ===

function GST_TYPE_VA_DISPLAY_WRAPPED : TGType;
function GST_VA_DISPLAY_WRAPPED(obj : Pointer) : PGstVaDisplayWrapped;
function GST_VA_DISPLAY_WRAPPED_CLASS(klass : Pointer) : PGstVaDisplayWrappedClass;
function GST_IS_VA_DISPLAY_WRAPPED(obj : Pointer) : Tgboolean;
function GST_IS_VA_DISPLAY_WRAPPED_CLASS(klass : Pointer) : Tgboolean;
function GST_VA_DISPLAY_WRAPPED_GET_CLASS(obj : Pointer) : PGstVaDisplayWrappedClass;

implementation

function GST_TYPE_VA_DISPLAY_WRAPPED : TGType;
  begin
    GST_TYPE_VA_DISPLAY_WRAPPED:=gst_va_display_wrapped_get_type;
  end;

function GST_VA_DISPLAY_WRAPPED(obj : Pointer) : PGstVaDisplayWrapped;
begin
  Result := PGstVaDisplayWrapped(g_type_check_instance_cast(obj, GST_TYPE_VA_DISPLAY_WRAPPED));
end;

function GST_VA_DISPLAY_WRAPPED_CLASS(klass : Pointer) : PGstVaDisplayWrappedClass;
begin
  Result := PGstVaDisplayWrappedClass(g_type_check_class_cast(klass, GST_TYPE_VA_DISPLAY_WRAPPED));
end;

function GST_IS_VA_DISPLAY_WRAPPED(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VA_DISPLAY_WRAPPED);
end;

function GST_IS_VA_DISPLAY_WRAPPED_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VA_DISPLAY_WRAPPED);
end;

function GST_VA_DISPLAY_WRAPPED_GET_CLASS(obj : Pointer) : PGstVaDisplayWrappedClass;
begin
  Result := PGstVaDisplayWrappedClass(PGTypeInstance(obj)^.g_class);
end;



end.
