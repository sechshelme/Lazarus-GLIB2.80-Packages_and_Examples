unit gstargbcontrolbinding;

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


function gst_argb_control_binding_get_type:TGType;cdecl;external libgstcontroller;
{ Functions  }
function gst_argb_control_binding_new(object:PGstObject; property_name:Pgchar; cs_a:PGstControlSource; cs_r:PGstControlSource; cs_g:PGstControlSource; 
           cs_b:PGstControlSource):PGstControlBinding;cdecl;external libgstcontroller;
{$endif}
{ __GST_ARGB_CONTROL_BINDING_H__  }

// === Konventiert am: 7-10-24 14:51:56 ===

function GST_TYPE_ARGB_CONTROL_BINDING : TGType;
function GST_ARGB_CONTROL_BINDING(obj : Pointer) : PGstARGBControlBinding;
function GST_ARGB_CONTROL_BINDING_CLASS(klass : Pointer) : PGstARGBControlBindingClass;
function GST_IS_ARGB_CONTROL_BINDING(obj : Pointer) : Tgboolean;
function GST_IS_ARGB_CONTROL_BINDING_CLASS(klass : Pointer) : Tgboolean;
function GST_ARGB_CONTROL_BINDING_GET_CLASS(obj : Pointer) : PGstARGBControlBindingClass;

implementation

function GST_TYPE_ARGB_CONTROL_BINDING : TGType;
  begin
    GST_TYPE_ARGB_CONTROL_BINDING:=gst_argb_control_binding_get_type;
  end;

function GST_ARGB_CONTROL_BINDING(obj : Pointer) : PGstARGBControlBinding;
begin
  Result := PGstARGBControlBinding(g_type_check_instance_cast(obj, GST_TYPE_ARGB_CONTROL_BINDING));
end;

function GST_ARGB_CONTROL_BINDING_CLASS(klass : Pointer) : PGstARGBControlBindingClass;
begin
  Result := PGstARGBControlBindingClass(g_type_check_class_cast(klass, GST_TYPE_ARGB_CONTROL_BINDING));
end;

function GST_IS_ARGB_CONTROL_BINDING(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_ARGB_CONTROL_BINDING);
end;

function GST_IS_ARGB_CONTROL_BINDING_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_ARGB_CONTROL_BINDING);
end;

function GST_ARGB_CONTROL_BINDING_GET_CLASS(obj : Pointer) : PGstARGBControlBindingClass;
begin
  Result := PGstARGBControlBindingClass(PGTypeInstance(obj)^.g_class);
end;



end.
