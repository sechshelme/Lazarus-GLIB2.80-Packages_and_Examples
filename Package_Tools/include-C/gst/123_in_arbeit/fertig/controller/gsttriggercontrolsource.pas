unit gsttriggercontrolsource;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2007 Sebastian Dröge <slomo@circular-chaos.org>
 *               2011 Stefan Sauer <ensonic@users.sf.net>
 *
 * gsttriggercontrolsource.h: Control source that provides some values at time-
 *                            stamps
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
{$ifndef __GST_TRIGGER_CONTROL_SOURCE_H__}
{$define __GST_TRIGGER_CONTROL_SOURCE_H__}
{$include <glib-object.h>}
{$include <gst/gst.h>}
{$include <gst/controller/gsttimedvaluecontrolsource.h>}

{ was #define dname def_expr }
function GST_TYPE_TRIGGER_WAVEFORM : longint; { return type might be wrong }

type
{*
 * GstTriggerControlSource:
 *
 * The instance structure of #GstControlSource.
  }
{< private > }
  PGstTriggerControlSource = ^TGstTriggerControlSource;
  TGstTriggerControlSource = record
      parent : TGstTimedValueControlSource;
      priv : PGstTriggerControlSourcePrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstTriggerControlSourceClass = ^TGstTriggerControlSourceClass;
  TGstTriggerControlSourceClass = record
      parent_class : TGstTimedValueControlSourceClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_trigger_control_source_get_type:TGType;cdecl;external libgstcontroller;
{ Functions  }
function gst_trigger_control_source_new:PGstControlSource;cdecl;external libgstcontroller;
{$endif}
{ __GST_TRIGGER_CONTROL_SOURCE_H__  }

// === Konventiert am: 7-10-24 14:52:38 ===

function GST_TYPE_TRIGGER_CONTROL_SOURCE : TGType;
function GST_TRIGGER_CONTROL_SOURCE(obj : Pointer) : PGstTriggerControlSource;
function GST_TRIGGER_CONTROL_SOURCE_CLASS(klass : Pointer) : PGstTriggerControlSourceClass;
function GST_IS_TRIGGER_CONTROL_SOURCE(obj : Pointer) : Tgboolean;
function GST_IS_TRIGGER_CONTROL_SOURCE_CLASS(klass : Pointer) : Tgboolean;
function GST_TRIGGER_CONTROL_SOURCE_GET_CLASS(obj : Pointer) : PGstTriggerControlSourceClass;

implementation

function GST_TYPE_TRIGGER_CONTROL_SOURCE : TGType;
  begin
    GST_TYPE_TRIGGER_CONTROL_SOURCE:=gst_trigger_control_source_get_type;
  end;

function GST_TRIGGER_CONTROL_SOURCE(obj : Pointer) : PGstTriggerControlSource;
begin
  Result := PGstTriggerControlSource(g_type_check_instance_cast(obj, GST_TYPE_TRIGGER_CONTROL_SOURCE));
end;

function GST_TRIGGER_CONTROL_SOURCE_CLASS(klass : Pointer) : PGstTriggerControlSourceClass;
begin
  Result := PGstTriggerControlSourceClass(g_type_check_class_cast(klass, GST_TYPE_TRIGGER_CONTROL_SOURCE));
end;

function GST_IS_TRIGGER_CONTROL_SOURCE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_TRIGGER_CONTROL_SOURCE);
end;

function GST_IS_TRIGGER_CONTROL_SOURCE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_TRIGGER_CONTROL_SOURCE);
end;

function GST_TRIGGER_CONTROL_SOURCE_GET_CLASS(obj : Pointer) : PGstTriggerControlSourceClass;
begin
  Result := PGstTriggerControlSourceClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function GST_TYPE_TRIGGER_WAVEFORM : longint; { return type might be wrong }
  begin
    GST_TYPE_TRIGGER_WAVEFORM:=gst_trigger_waveform_get_type;
  end;


end.
