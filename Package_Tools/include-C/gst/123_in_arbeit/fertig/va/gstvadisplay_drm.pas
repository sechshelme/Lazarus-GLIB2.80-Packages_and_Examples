unit gstvadisplay_drm;

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

function gst_va_display_drm_get_type:TGType;cdecl;external libgstvap;
function gst_va_display_drm_new_from_path(path:Pgchar):PGstVaDisplay;cdecl;external libgstvap;

// === Konventiert am: 8-10-24 16:13:58 ===

function GST_TYPE_VA_DISPLAY_DRM : TGType;
function GST_VA_DISPLAY_DRM(obj : Pointer) : PGstVaDisplayDrm;
function GST_VA_DISPLAY_DRM_CLASS(klass : Pointer) : PGstVaDisplayDrmClass;
function GST_IS_VA_DISPLAY_DRM(obj : Pointer) : Tgboolean;
function GST_IS_VA_DISPLAY_DRM_CLASS(klass : Pointer) : Tgboolean;
function GST_VA_DISPLAY_DRM_GET_CLASS(obj : Pointer) : PGstVaDisplayDrmClass;

implementation

function GST_TYPE_VA_DISPLAY_DRM : TGType;
  begin
    GST_TYPE_VA_DISPLAY_DRM:=gst_va_display_drm_get_type;
  end;

function GST_VA_DISPLAY_DRM(obj : Pointer) : PGstVaDisplayDrm;
begin
  Result := PGstVaDisplayDrm(g_type_check_instance_cast(obj, GST_TYPE_VA_DISPLAY_DRM));
end;

function GST_VA_DISPLAY_DRM_CLASS(klass : Pointer) : PGstVaDisplayDrmClass;
begin
  Result := PGstVaDisplayDrmClass(g_type_check_class_cast(klass, GST_TYPE_VA_DISPLAY_DRM));
end;

function GST_IS_VA_DISPLAY_DRM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VA_DISPLAY_DRM);
end;

function GST_IS_VA_DISPLAY_DRM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VA_DISPLAY_DRM);
end;

function GST_VA_DISPLAY_DRM_GET_CLASS(obj : Pointer) : PGstVaDisplayDrmClass;
begin
  Result := PGstVaDisplayDrmClass(PGTypeInstance(obj)^.g_class);
end;



end.
