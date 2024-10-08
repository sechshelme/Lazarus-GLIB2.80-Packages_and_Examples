unit gstvadisplay;

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
{$include <gst/gst.h>}
{$include <gst/va/va_fwd.h>}
{$include <gst/va/va-prelude.h>}
{*
 * GstVaImplementation:
 * @GST_VA_IMPLEMENTATION_MESA_GALLIUM: The mesa gallium implementation.
 * @GST_VA_IMPLEMENTATION_INTEL_I965: The legacy i965 intel implementation.
 * @GST_VA_IMPLEMENTATION_INTEL_IHD: The iHD intel implementation.
 * @GST_VA_IMPLEMENTATION_OTHER: Other implementation.
 * @GST_VA_IMPLEMENTATION_INVALID: Invalid implementation.
 *
 * Types of different VA API implemented drivers. These are the typical and
 * the most widely used VA drivers.
 *
 * Since: 1.20
  }
type
  PGstVaImplementation = ^TGstVaImplementation;
  TGstVaImplementation =  Longint;
  Const
    GST_VA_IMPLEMENTATION_MESA_GALLIUM = 0;
    GST_VA_IMPLEMENTATION_INTEL_I965 = 1;
    GST_VA_IMPLEMENTATION_INTEL_IHD = 2;
    GST_VA_IMPLEMENTATION_OTHER = 3;
    GST_VA_IMPLEMENTATION_INVALID = 4;
;
{*
 * GST_VA_DISPLAY_HANDLE_CONTEXT_TYPE_STR:
 *
 * Since: 1.20
  }
  GST_VA_DISPLAY_HANDLE_CONTEXT_TYPE_STR = 'gst.va.display.handle';  
{*
 * GST_CAPS_FEATURE_MEMORY_VA:
 *
 * Since: 1.20
  }
  GST_CAPS_FEATURE_MEMORY_VA = 'memory:VAMemory';  
{*
 * GST_VA_DISPLAY_IS_IMPLEMENTATION: (skip)
 *
 * Check whether the display is the implementation of the specified
 * #GstVaImplementation type.
 *
 * Since: 1.20
  }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_DISPLAY_IS_IMPLEMENTATION(display,impl : longint) : longint;

{*
 * GstVaDisplay:
 * @parent: parent #GstObject
 *
 * The common VA display object structure.
 *
 * Since: 1.20
  }
type
  PGstVaDisplay = ^TGstVaDisplay;
  TGstVaDisplay = record
      parent : TGstObject;
    end;

{*
 * GstVaDisplayClass:
 * @parent_class: parent #GstObjectClass
 *
 * The common VA display object class structure.
 *
 * Since: 1.20
  }
{*
   * GstVaDisplayClass::create_va_display:
   * @self: a #GstVaDisplay instance
   *
   * This is called when the subclass has to create the internal
   * VADisplay.
   *
   * Returns: The created VADisplay
    }
  PGstVaDisplayClass = ^TGstVaDisplayClass;
  TGstVaDisplayClass = record
      parent_class : TGstObjectClass;
      create_va_display : function (self:PGstVaDisplay):Tgpointer;cdecl;
    end;


function gst_va_display_get_type:TGType;cdecl;external libgstvap;
function gst_va_display_initialize(self:PGstVaDisplay):Tgboolean;cdecl;external libgstvap;
function gst_va_display_get_va_dpy(self:PGstVaDisplay):Tgpointer;cdecl;external libgstvap;
function gst_va_display_get_implementation(self:PGstVaDisplay):TGstVaImplementation;cdecl;external libgstvap;
function gst_va_display_check_version(self:PGstVaDisplay; major:Tguint; minor:Tguint):Tgboolean;cdecl;external libgstvap;
{*
 * gst_va_display_is_implementation:
 * @display: the #GstVaDisplay to check.
 * @impl: the specified #GstVaImplementation.
 *
 * Check whether the @display is the implementation of the @impl type.
 *
 * Returns: %TRUE if the @display is the implementation of the @impl type.
 *
 * Since: 1.20
  }
{ xxxxxxxxxxxxxxxxx }
{static inline gboolean }
{gst_va_display_is_implementation (GstVaDisplay * display, GstVaImplementation impl) }
{ }
{  return (gst_va_display_get_implementation (display) == impl); }
{ }

// === Konventiert am: 8-10-24 16:13:28 ===

function GST_TYPE_VA_DISPLAY : TGType;
function GST_VA_DISPLAY(obj : Pointer) : PGstVaDisplay;
function GST_VA_DISPLAY_CLASS(klass : Pointer) : PGstVaDisplayClass;
function GST_IS_VA_DISPLAY(obj : Pointer) : Tgboolean;
function GST_IS_VA_DISPLAY_CLASS(klass : Pointer) : Tgboolean;
function GST_VA_DISPLAY_GET_CLASS(obj : Pointer) : PGstVaDisplayClass;

implementation

function GST_TYPE_VA_DISPLAY : TGType;
  begin
    GST_TYPE_VA_DISPLAY:=gst_va_display_get_type;
  end;

function GST_VA_DISPLAY(obj : Pointer) : PGstVaDisplay;
begin
  Result := PGstVaDisplay(g_type_check_instance_cast(obj, GST_TYPE_VA_DISPLAY));
end;

function GST_VA_DISPLAY_CLASS(klass : Pointer) : PGstVaDisplayClass;
begin
  Result := PGstVaDisplayClass(g_type_check_class_cast(klass, GST_TYPE_VA_DISPLAY));
end;

function GST_IS_VA_DISPLAY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VA_DISPLAY);
end;

function GST_IS_VA_DISPLAY_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VA_DISPLAY);
end;

function GST_VA_DISPLAY_GET_CLASS(obj : Pointer) : PGstVaDisplayClass;
begin
  Result := PGstVaDisplayClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_DISPLAY_IS_IMPLEMENTATION(display,impl : longint) : longint;
begin
  GST_VA_DISPLAY_IS_IMPLEMENTATION:=gst_va_display_is_implementation(display,G_PASTE(GST_VA_IMPLEMENTATION_,impl));
end;


end.
