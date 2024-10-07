
unit gstargbcontrolbinding;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstargbcontrolbinding.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstargbcontrolbinding.h
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
PGstARGBControlBinding  = ^GstARGBControlBinding;
PGstARGBControlBindingClass  = ^GstARGBControlBindingClass;
PGstControlBinding  = ^GstControlBinding;
PGstControlSource  = ^GstControlSource;
PGstObject  = ^GstObject;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2011 Stefan Sauer <ensonic@users.sf.net>
 *
 * gstargbcontrolbinding.h: Attachment for multiple control sources to gargb
 *                            properties
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
{$ifndef __GST_ARGB_CONTROL_BINDING_H__}
{$define __GST_ARGB_CONTROL_BINDING_H__}
{$include <gst/gstconfig.h>}
{$include <glib-object.h>}
{$include <gst/gstcontrolsource.h>}
{$include <gst/controller/controller-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_ARGB_CONTROL_BINDING : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ARGB_CONTROL_BINDING(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ARGB_CONTROL_BINDING_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ARGB_CONTROL_BINDING(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ARGB_CONTROL_BINDING_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ARGB_CONTROL_BINDING_GET_CLASS(obj : longint) : longint;

type
{*
 * GstARGBControlBinding:
 * @name: name of the property of this binding
 *
 * The instance structure of #GstARGBControlBinding.
  }
{< private > }
{ GstControlSources for this property  }
  PGstARGBControlBinding = ^TGstARGBControlBinding;
  TGstARGBControlBinding = record
      parent : TGstControlBinding;
      cs_a : PGstControlSource;
      cs_r : PGstControlSource;
      cs_g : PGstControlSource;
      cs_b : PGstControlSource;
      cur_value : TGValue;
      last_value : Tguint32;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstARGBControlBindingClass:
 * @parent_class: Parent class
 * @convert: Class method to convert control-values
 *
 * The class structure of #GstARGBControlBinding.
  }
{< private > }
  PGstARGBControlBindingClass = ^TGstARGBControlBindingClass;
  TGstARGBControlBindingClass = record
      parent_class : TGstControlBindingClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_argb_control_binding_get_type:TGType;cdecl;external;
{ Functions  }
(* Const before type ignored *)
function gst_argb_control_binding_new(object:PGstObject; property_name:Pgchar; cs_a:PGstControlSource; cs_r:PGstControlSource; cs_g:PGstControlSource; 
           cs_b:PGstControlSource):PGstControlBinding;cdecl;external;
{$endif}
{ __GST_ARGB_CONTROL_BINDING_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_ARGB_CONTROL_BINDING : longint; { return type might be wrong }
  begin
    GST_TYPE_ARGB_CONTROL_BINDING:=gst_argb_control_binding_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ARGB_CONTROL_BINDING(obj : longint) : longint;
begin
  GST_ARGB_CONTROL_BINDING:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_ARGB_CONTROL_BINDING,GstARGBControlBinding);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ARGB_CONTROL_BINDING_CLASS(klass : longint) : longint;
begin
  GST_ARGB_CONTROL_BINDING_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_ARGB_CONTROL_BINDING,GstARGBControlBindingClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ARGB_CONTROL_BINDING(obj : longint) : longint;
begin
  GST_IS_ARGB_CONTROL_BINDING:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_ARGB_CONTROL_BINDING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ARGB_CONTROL_BINDING_CLASS(klass : longint) : longint;
begin
  GST_IS_ARGB_CONTROL_BINDING_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_ARGB_CONTROL_BINDING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ARGB_CONTROL_BINDING_GET_CLASS(obj : longint) : longint;
begin
  GST_ARGB_CONTROL_BINDING_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_CONTOL_SOURCE,GstARGBControlBindingClass);
end;


end.
