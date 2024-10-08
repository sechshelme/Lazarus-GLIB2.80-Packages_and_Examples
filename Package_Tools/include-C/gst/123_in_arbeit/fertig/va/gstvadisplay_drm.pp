
unit gstvadisplay_drm;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvadisplay_drm.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvadisplay_drm.h
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
{$include <gst/va/gstva.h>}
{$include <gst/va/va_fwd.h>}

{ was #define dname def_expr }
function GST_TYPE_VA_DISPLAY_DRM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_DISPLAY_DRM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_DISPLAY_DRM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_DISPLAY_DRM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_DISPLAY_DRM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_DISPLAY_DRM_GET_CLASS(obj : longint) : longint;

function gst_va_display_drm_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_va_display_drm_new_from_path(path:Pgchar):PGstVaDisplay;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_VA_DISPLAY_DRM : longint; { return type might be wrong }
  begin
    GST_TYPE_VA_DISPLAY_DRM:=gst_va_display_drm_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_DISPLAY_DRM(obj : longint) : longint;
begin
  GST_VA_DISPLAY_DRM:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VA_DISPLAY_DRM,GstVaDisplayDrm);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_DISPLAY_DRM_CLASS(klass : longint) : longint;
begin
  GST_VA_DISPLAY_DRM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VA_DISPLAY_DRM,GstVaDisplayDrmClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_DISPLAY_DRM(obj : longint) : longint;
begin
  GST_IS_VA_DISPLAY_DRM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VA_DISPLAY_DRM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_DISPLAY_DRM_CLASS(klass : longint) : longint;
begin
  GST_IS_VA_DISPLAY_DRM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VA_DISPLAY_DRM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_DISPLAY_DRM_GET_CLASS(obj : longint) : longint;
begin
  GST_VA_DISPLAY_DRM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VA_DISPLAY_DRM,GstVaDisplayDrmClass);
end;


end.
