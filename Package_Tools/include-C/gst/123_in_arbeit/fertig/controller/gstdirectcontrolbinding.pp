
unit gstdirectcontrolbinding;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstdirectcontrolbinding.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstdirectcontrolbinding.h
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
PGstControlSource  = ^GstControlSource;
PGstDirectControlBinding  = ^GstDirectControlBinding;
PGstDirectControlBindingClass  = ^GstDirectControlBindingClass;
PGstObject  = ^GstObject;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2011 Stefan Sauer <ensonic@users.sf.net>
 *
 * gstdirectcontrolbinding.h: Direct attachment for control sources
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
{$ifndef __GST_DIRECT_CONTROL_BINDING_H__}
{$define __GST_DIRECT_CONTROL_BINDING_H__}
{$include <gst/gstconfig.h>}
{$include <glib-object.h>}
{$include <gst/gstcontrolsource.h>}
{$include <gst/controller/controller-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_DIRECT_CONTROL_BINDING : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DIRECT_CONTROL_BINDING(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DIRECT_CONTROL_BINDING_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DIRECT_CONTROL_BINDING(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DIRECT_CONTROL_BINDING_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DIRECT_CONTROL_BINDING_GET_CLASS(obj : longint) : longint;

type
{*
 * GstDirectControlBindingConvertValue:
 * @self: the #GstDirectControlBinding instance
 * @src_value: the value returned by the cotnrol source
 * @dest_value: the target location
 *
 * Function to map a control-value to the target plain data type.
  }

  TGstDirectControlBindingConvertValue = procedure (self:PGstDirectControlBinding; src_value:Tgdouble; dest_value:Tgpointer);cdecl;
{*
 * GstDirectControlBindingConvertGValue:
 * @self: the #GstDirectControlBinding instance
 * @src_value: the value returned by the cotnrol source
 * @dest_value: the target GValue
 *
 * Function to map a control-value to the target GValue.
  }

  TGstDirectControlBindingConvertGValue = procedure (self:PGstDirectControlBinding; src_value:Tgdouble; dest_value:PGValue);cdecl;
{*
 * GstDirectControlBinding:
 * @name: name of the property of this binding
 *
 * The instance structure of #GstDirectControlBinding.
  }
{< private > }
{ GstControlSource for this property  }
  PGstDirectControlBinding = ^TGstDirectControlBinding;
  TGstDirectControlBinding = record
      parent : TGstControlBinding;cdecl;
      cs : PGstControlSource;
      cur_value : TGValue;
      last_value : Tgdouble;
      byte_size : Tgint;
      convert_value : TGstDirectControlBindingConvertValue;
      convert_g_value : TGstDirectControlBindingConvertGValue;
      ABI : record
          case longint of
            0 : ( _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer );
            1 : ( abi : record
                want_absolute : Tgboolean;
              end );
          end;
    end;

{*
 * GstDirectControlBindingClass:
 * @parent_class: Parent class
 * @convert: Class method to convert control-values
 *
 * The class structure of #GstDirectControlBinding.
  }
{< private > }
  PGstDirectControlBindingClass = ^TGstDirectControlBindingClass;
  TGstDirectControlBindingClass = record
      parent_class : TGstControlBindingClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_direct_control_binding_get_type:TGType;cdecl;external;
{ Functions  }
(* Const before type ignored *)
function gst_direct_control_binding_new(object:PGstObject; property_name:Pgchar; cs:PGstControlSource):PGstControlBinding;cdecl;external;
(* Const before type ignored *)
function gst_direct_control_binding_new_absolute(object:PGstObject; property_name:Pgchar; cs:PGstControlSource):PGstControlBinding;cdecl;external;
{$endif}
{ __GST_DIRECT_CONTROL_BINDING_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_DIRECT_CONTROL_BINDING : longint; { return type might be wrong }
  begin
    GST_TYPE_DIRECT_CONTROL_BINDING:=gst_direct_control_binding_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DIRECT_CONTROL_BINDING(obj : longint) : longint;
begin
  GST_DIRECT_CONTROL_BINDING:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_DIRECT_CONTROL_BINDING,GstDirectControlBinding);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DIRECT_CONTROL_BINDING_CLASS(klass : longint) : longint;
begin
  GST_DIRECT_CONTROL_BINDING_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_DIRECT_CONTROL_BINDING,GstDirectControlBindingClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DIRECT_CONTROL_BINDING(obj : longint) : longint;
begin
  GST_IS_DIRECT_CONTROL_BINDING:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_DIRECT_CONTROL_BINDING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_DIRECT_CONTROL_BINDING_CLASS(klass : longint) : longint;
begin
  GST_IS_DIRECT_CONTROL_BINDING_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_DIRECT_CONTROL_BINDING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DIRECT_CONTROL_BINDING_GET_CLASS(obj : longint) : longint;
begin
  GST_DIRECT_CONTROL_BINDING_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_CONTOL_SOURCE,GstDirectControlBindingClass);
end;


end.
