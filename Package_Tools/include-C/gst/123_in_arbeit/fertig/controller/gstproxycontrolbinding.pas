unit gstproxycontrolbinding;

interface

uses
  glib280, gst124;

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


function gst_proxy_control_binding_get_type:TGType;cdecl;external libgstcontroller;
function gst_proxy_control_binding_new(object:PGstObject; property_name:Pgchar; ref_object:PGstObject; ref_property_name:Pgchar):PGstControlBinding;cdecl;external libgstcontroller;
{$endif}
{ __GST_PROXY_CONTROL_BINDING_H__  }

// === Konventiert am: 7-10-24 14:52:22 ===

function GST_TYPE_PROXY_CONTROL_BINDING : TGType;
function GST_PROXY_CONTROL_BINDING(obj : Pointer) : PGstProxyControlBinding;
function GST_PROXY_CONTROL_BINDING_CLASS(klass : Pointer) : PGstProxyControlBindingClass;
function GST_IS_PROXY_CONTROL_BINDING(obj : Pointer) : Tgboolean;
function GST_IS_PROXY_CONTROL_BINDING_CLASS(klass : Pointer) : Tgboolean;
function GST_PROXY_CONTROL_BINDING_GET_CLASS(obj : Pointer) : PGstProxyControlBindingClass;

implementation

function GST_TYPE_PROXY_CONTROL_BINDING : TGType;
  begin
    GST_TYPE_PROXY_CONTROL_BINDING:=gst_proxy_control_binding_get_type;
  end;

function GST_PROXY_CONTROL_BINDING(obj : Pointer) : PGstProxyControlBinding;
begin
  Result := PGstProxyControlBinding(g_type_check_instance_cast(obj, GST_TYPE_PROXY_CONTROL_BINDING));
end;

function GST_PROXY_CONTROL_BINDING_CLASS(klass : Pointer) : PGstProxyControlBindingClass;
begin
  Result := PGstProxyControlBindingClass(g_type_check_class_cast(klass, GST_TYPE_PROXY_CONTROL_BINDING));
end;

function GST_IS_PROXY_CONTROL_BINDING(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_PROXY_CONTROL_BINDING);
end;

function GST_IS_PROXY_CONTROL_BINDING_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_PROXY_CONTROL_BINDING);
end;

function GST_PROXY_CONTROL_BINDING_GET_CLASS(obj : Pointer) : PGstProxyControlBindingClass;
begin
  Result := PGstProxyControlBindingClass(PGTypeInstance(obj)^.g_class);
end;



end.
