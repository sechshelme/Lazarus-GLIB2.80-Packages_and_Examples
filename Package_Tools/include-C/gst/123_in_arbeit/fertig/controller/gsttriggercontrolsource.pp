
unit gsttriggercontrolsource;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsttriggercontrolsource.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttriggercontrolsource.h
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
PGstControlSource  = ^GstControlSource;
PGstTriggerControlSource  = ^GstTriggerControlSource;
PGstTriggerControlSourceClass  = ^GstTriggerControlSourceClass;
PGstTriggerControlSourcePrivate  = ^GstTriggerControlSourcePrivate;
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
function GST_TYPE_TRIGGER_CONTROL_SOURCE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRIGGER_CONTROL_SOURCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRIGGER_CONTROL_SOURCE_CLASS(vtable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRIGGER_CONTROL_SOURCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRIGGER_CONTROL_SOURCE_CLASS(vtable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRIGGER_CONTROL_SOURCE_GET_CLASS(inst : longint) : longint;

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


function gst_trigger_control_source_get_type:TGType;cdecl;external;
{ Functions  }
function gst_trigger_control_source_new:PGstControlSource;cdecl;external;
{$endif}
{ __GST_TRIGGER_CONTROL_SOURCE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_TRIGGER_CONTROL_SOURCE : longint; { return type might be wrong }
  begin
    GST_TYPE_TRIGGER_CONTROL_SOURCE:=gst_trigger_control_source_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRIGGER_CONTROL_SOURCE(obj : longint) : longint;
begin
  GST_TRIGGER_CONTROL_SOURCE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_TRIGGER_CONTROL_SOURCE,GstTriggerControlSource);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRIGGER_CONTROL_SOURCE_CLASS(vtable : longint) : longint;
begin
  GST_TRIGGER_CONTROL_SOURCE_CLASS:=G_TYPE_CHECK_CLASS_CAST(vtable,GST_TYPE_TRIGGER_CONTROL_SOURCE,GstTriggerControlSourceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRIGGER_CONTROL_SOURCE(obj : longint) : longint;
begin
  GST_IS_TRIGGER_CONTROL_SOURCE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_TRIGGER_CONTROL_SOURCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TRIGGER_CONTROL_SOURCE_CLASS(vtable : longint) : longint;
begin
  GST_IS_TRIGGER_CONTROL_SOURCE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(vtable,GST_TYPE_TRIGGER_CONTROL_SOURCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TRIGGER_CONTROL_SOURCE_GET_CLASS(inst : longint) : longint;
begin
  GST_TRIGGER_CONTROL_SOURCE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,GST_TYPE_TRIGGER_CONTROL_SOURCE,GstTriggerControlSourceClass);
end;

{ was #define dname def_expr }
function GST_TYPE_TRIGGER_WAVEFORM : longint; { return type might be wrong }
  begin
    GST_TYPE_TRIGGER_WAVEFORM:=gst_trigger_waveform_get_type;
  end;


end.
