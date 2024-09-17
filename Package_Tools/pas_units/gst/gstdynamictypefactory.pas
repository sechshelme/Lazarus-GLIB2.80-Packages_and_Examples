unit gstdynamictypefactory;

interface

uses
  glib280, common_GST, gstobject;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2015 Jan Schmidt <jan@centricular.com>
 *
 * gstdynamictypefactory.h: Header for GstDynamicTypeFactory
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
{$ifndef __GST_DYNAMIC_TYPE_FACTORY_H__}
{$define __GST_DYNAMIC_TYPE_FACTORY_H__}
{*
 * GST_DYNAMIC_TYPE_REGISTER_DEFINE:
 * @t_n: The dynamic type name in lower case, with words separated by '_'.
 * Used to generate `gst_dynamic_type_register_*(GstPlugin* plugin)`.
 * @t: The #GType of the dynamic type

 * A convenience macro to define the entry point of a
 * dynamic type `gst_dynamic_type_register_*(GstPlugin* plugin)`.
 *
 * Since: 1.20
  }
{*
 * GST_DYNAMIC_TYPE_REGISTER_DECLARE:
 * @t_f: The dynamic type name in lower case, with words separated by '_'.
 *
 * This macro can be used to declare a new dynamic type.
 * It has to be used in combination with #GST_DYNAMIC_TYPE_REGISTER_DEFINE macro
 * and must be placed outside any block to declare the type find registration
 * function.
 *
 * Since: 1.20
  }
{*
 * GST_DYNAMIC_TYPE_REGISTER:
 * @t_n: The dynamic type name to register
 * @plugin: The #GstPlugin where to register the dynamic type.
 *
 * This macro can be used to register a dynamic type into a #GstPlugin.
 * This method will be usually called in the plugin init function
 * but can also be called with a NULL plugin.
 *
 * Since: 1.20
  }
{#define GST_DYNAMIC_TYPE_REGISTER(t_n, plugin) G_PASTE(gst_dynamic_type_register_, t_n) (plugin) }
{*
 * GstDynamicTypeFactory:
 *
 * The opaque #GstDynamicTypeFactory data structure.
 *
 * Since: 1.12
  }
type
{$include <gst/gstconfig.h>}
{$include <gst/gstplugin.h>}
{$include <gst/gstpluginfeature.h>}

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_DYNAMIC_TYPE_FACTORY_CAST(obj : longint) : PGstDynamicTypeFactory;

{#define GST_DYNAMIC_TYPE_CLASS(klass)           (G_TYPE_CHECK_CLASS_CAST((klass),GST_TYPE_DYNAMIC_TYPE_FACTORY,\ }
{                                                 GstDynamicTypeFactoryClass)) }
function gst_dynamic_type_factory_get_type:TGType;cdecl;external gstreamerlib;
function gst_dynamic_type_factory_load(factoryname:Pgchar):TGType;cdecl;external gstreamerlib;
function gst_dynamic_type_register(plugin:PGstPlugin; _type:TGType):Tgboolean;cdecl;external gstreamerlib;
{$endif}

// === Konventiert am: 17-9-24 16:00:47 ===

function GST_TYPE_DYNAMIC_TYPE_FACTORY : TGType;
function GST_DYNAMIC_TYPE_FACTORY(obj : Pointer) : PGstDynamicTypeFactory;
function GST_DYNAMIC_TYPE_FACTORY_CLASS(klass : Pointer) : PGstDynamicTypeFactoryClass;
function GST_IS_DYNAMIC_TYPE_FACTORY(obj : Pointer) : Tgboolean;
function GST_IS_DYNAMIC_TYPE_FACTORY_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_DYNAMIC_TYPE_FACTORY : TGType;
  begin
    GST_TYPE_DYNAMIC_TYPE_FACTORY:=gst_dynamic_type_factory_get_type;
  end;

function GST_DYNAMIC_TYPE_FACTORY(obj : Pointer) : PGstDynamicTypeFactory;
begin
  Result := PGstDynamicTypeFactory(g_type_check_instance_cast(obj, GST_TYPE_DYNAMIC_TYPE_FACTORY));
end;

function GST_DYNAMIC_TYPE_FACTORY_CLASS(klass : Pointer) : PGstDynamicTypeFactoryClass;
begin
  Result := PGstDynamicTypeFactoryClass(g_type_check_class_cast(klass, GST_TYPE_DYNAMIC_TYPE_FACTORY));
end;

function GST_IS_DYNAMIC_TYPE_FACTORY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_DYNAMIC_TYPE_FACTORY);
end;

function GST_IS_DYNAMIC_TYPE_FACTORY_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_DYNAMIC_TYPE_FACTORY);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_DYNAMIC_TYPE_FACTORY_CAST(obj : longint) : PGstDynamicTypeFactory;
begin
  GST_DYNAMIC_TYPE_FACTORY_CAST:=PGstDynamicTypeFactory(obj);
end;


end.
