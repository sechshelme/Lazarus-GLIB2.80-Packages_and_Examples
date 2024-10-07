
unit gstproxycontrolbinding;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstproxycontrolbinding.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstproxycontrolbinding.h
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
PGstControlBinding  = ^GstControlBinding;
PGstObject  = ^GstObject;
PGstProxyControlBinding  = ^GstProxyControlBinding;
PGstProxyControlBindingClass  = ^GstProxyControlBindingClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2016 Matthew Waters <matthew@centricular.com>
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
{$ifndef __GST_PROXY_CONTROL_BINDING_H__}
{$define __GST_PROXY_CONTROL_BINDING_H__}
{$include <gst/gst.h>}
{$include <gst/controller/controller-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_PROXY_CONTROL_BINDING : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PROXY_CONTROL_BINDING(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PROXY_CONTROL_BINDING_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PROXY_CONTROL_BINDING(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PROXY_CONTROL_BINDING_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PROXY_CONTROL_BINDING_GET_CLASS(obj : longint) : longint;

type
{*
 * GstProxyControlBinding:
 *
 * Opaque #GstProxyControlBinding struct
  }
{ <private>  }
  PGstProxyControlBinding = ^TGstProxyControlBinding;
  TGstProxyControlBinding = record
      parent : TGstControlBinding;
      ref_object : TGWeakRef;
      property_name : Pgchar;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstProxyControlBindingClass:
 *
 * Opaque #GstProxyControlBindingClass struct
  }
{ <private>  }
  PGstProxyControlBindingClass = ^TGstProxyControlBindingClass;
  TGstProxyControlBindingClass = record
      parent_class : TGstControlBindingClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_proxy_control_binding_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_proxy_control_binding_new(object:PGstObject; property_name:Pgchar; ref_object:PGstObject; ref_property_name:Pgchar):PGstControlBinding;cdecl;external;
{$endif}
{ __GST_PROXY_CONTROL_BINDING_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_PROXY_CONTROL_BINDING : longint; { return type might be wrong }
  begin
    GST_TYPE_PROXY_CONTROL_BINDING:=gst_proxy_control_binding_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PROXY_CONTROL_BINDING(obj : longint) : longint;
begin
  GST_PROXY_CONTROL_BINDING:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PROXY_CONTROL_BINDING,GstProxyControlBinding);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PROXY_CONTROL_BINDING_CLASS(klass : longint) : longint;
begin
  GST_PROXY_CONTROL_BINDING_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PROXY_CONTROL_BINDING,GstProxyControlBindingClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PROXY_CONTROL_BINDING(obj : longint) : longint;
begin
  GST_IS_PROXY_CONTROL_BINDING:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PROXY_CONTROL_BINDING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PROXY_CONTROL_BINDING_CLASS(klass : longint) : longint;
begin
  GST_IS_PROXY_CONTROL_BINDING_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PROXY_CONTROL_BINDING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PROXY_CONTROL_BINDING_GET_CLASS(obj : longint) : longint;
begin
  GST_PROXY_CONTROL_BINDING_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_CONTOL_SOURCE,GstProxyControlBindingClass);
end;


end.
