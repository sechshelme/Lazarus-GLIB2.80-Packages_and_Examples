unit gstdirectcontrolbinding;

interface

uses
  glib280, gst124;

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


function gst_direct_control_binding_get_type:TGType;cdecl;external libgstcontroller;
{ Functions  }
function gst_direct_control_binding_new(object:PGstObject; property_name:Pgchar; cs:PGstControlSource):PGstControlBinding;cdecl;external libgstcontroller;
function gst_direct_control_binding_new_absolute(object:PGstObject; property_name:Pgchar; cs:PGstControlSource):PGstControlBinding;cdecl;external libgstcontroller;
{$endif}
{ __GST_DIRECT_CONTROL_BINDING_H__  }

// === Konventiert am: 7-10-24 14:52:03 ===

function GST_TYPE_DIRECT_CONTROL_BINDING : TGType;
function GST_DIRECT_CONTROL_BINDING(obj : Pointer) : PGstDirectControlBinding;
function GST_DIRECT_CONTROL_BINDING_CLASS(klass : Pointer) : PGstDirectControlBindingClass;
function GST_IS_DIRECT_CONTROL_BINDING(obj : Pointer) : Tgboolean;
function GST_IS_DIRECT_CONTROL_BINDING_CLASS(klass : Pointer) : Tgboolean;
function GST_DIRECT_CONTROL_BINDING_GET_CLASS(obj : Pointer) : PGstDirectControlBindingClass;

implementation

function GST_TYPE_DIRECT_CONTROL_BINDING : TGType;
  begin
    GST_TYPE_DIRECT_CONTROL_BINDING:=gst_direct_control_binding_get_type;
  end;

function GST_DIRECT_CONTROL_BINDING(obj : Pointer) : PGstDirectControlBinding;
begin
  Result := PGstDirectControlBinding(g_type_check_instance_cast(obj, GST_TYPE_DIRECT_CONTROL_BINDING));
end;

function GST_DIRECT_CONTROL_BINDING_CLASS(klass : Pointer) : PGstDirectControlBindingClass;
begin
  Result := PGstDirectControlBindingClass(g_type_check_class_cast(klass, GST_TYPE_DIRECT_CONTROL_BINDING));
end;

function GST_IS_DIRECT_CONTROL_BINDING(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_DIRECT_CONTROL_BINDING);
end;

function GST_IS_DIRECT_CONTROL_BINDING_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_DIRECT_CONTROL_BINDING);
end;

function GST_DIRECT_CONTROL_BINDING_GET_CLASS(obj : Pointer) : PGstDirectControlBindingClass;
begin
  Result := PGstDirectControlBindingClass(PGTypeInstance(obj)^.g_class);
end;



end.
