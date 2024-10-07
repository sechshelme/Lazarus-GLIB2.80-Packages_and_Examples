unit gsttimedvaluecontrolsource;

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
 * gsttimedvaluecontrolsource.h: Base class for timeed value based control
 *                               sources
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
{$ifndef __GST_TIMED_VALUE_CONTROL_SOURCE_H__}
{$define __GST_TIMED_VALUE_CONTROL_SOURCE_H__}
{$include <glib-object.h>}
{$include <gst/gst.h>}
{$include <gst/controller/controller-prelude.h>}

type
{*
 * GstControlPoint:
 * @timestamp: timestamp of the value change
 * @value: the new value
 *
 * An internal structure for value+time and various temporary
 * values used for interpolation. This "inherits" from
 * GstTimedValue.
  }
{ fields from GstTimedValue. DO NOT CHANGE!  }
{< private > }
{ Caches for the interpolators  }
{ FIXME: we should not have this here already ...  }
{ 16 bytes  }
{ 24 bytes  }
  PGstControlPoint = ^TGstControlPoint;
  TGstControlPoint = record
      timestamp : TGstClockTime;
      value : Tgdouble;
      cache : record
          case longint of
            0 : ( cubic : record
                h : Tgdouble;
                z : Tgdouble;
              end );
            1 : ( cubic_monotonic : record
                c1s : Tgdouble;
                c2s : Tgdouble;
                c3s : Tgdouble;
              end );
            2 : ( _gst_reserved : array[0..63] of Tguint8 );
          end;
    end;


function gst_control_point_get_type:TGType;cdecl;external libgstcontroller;
{*
 * GstTimedValueControlSource:
 *
 * The instance structure of #GstControlSource.
  }
{< protected > }
{ List of GstControlPoint  }
{ Number of control points  }
{< private > }
type
  PGstTimedValueControlSource = ^TGstTimedValueControlSource;
  TGstTimedValueControlSource = record
      parent : TGstControlSource;
      lock : TGMutex;
      values : PGSequence;
      nvalues : Tgint;
      valid_cache : Tgboolean;
      priv : PGstTimedValueControlSourcePrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstTimedValueControlSourceClass = ^TGstTimedValueControlSourceClass;
  TGstTimedValueControlSourceClass = record
      parent_class : TGstControlSourceClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_TIMED_VALUE_CONTROL_SOURCE_LOCK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIMED_VALUE_CONTROL_SOURCE_UNLOCK(obj : longint) : longint;

function gst_timed_value_control_source_get_type:TGType;cdecl;external libgstcontroller;
{ Functions  }
function gst_timed_value_control_source_find_control_point_iter(self:PGstTimedValueControlSource; timestamp:TGstClockTime):PGSequenceIter;cdecl;external libgstcontroller;
function gst_timed_value_control_source_set(self:PGstTimedValueControlSource; timestamp:TGstClockTime; value:Tgdouble):Tgboolean;cdecl;external libgstcontroller;
function gst_timed_value_control_source_set_from_list(self:PGstTimedValueControlSource; timedvalues:PGSList):Tgboolean;cdecl;external libgstcontroller;
function gst_timed_value_control_source_unset(self:PGstTimedValueControlSource; timestamp:TGstClockTime):Tgboolean;cdecl;external libgstcontroller;
procedure gst_timed_value_control_source_unset_all(self:PGstTimedValueControlSource);cdecl;external libgstcontroller;
function gst_timed_value_control_source_get_all(self:PGstTimedValueControlSource):PGList;cdecl;external libgstcontroller;
function gst_timed_value_control_source_get_count(self:PGstTimedValueControlSource):Tgint;cdecl;external libgstcontroller;
procedure gst_timed_value_control_invalidate_cache(self:PGstTimedValueControlSource);cdecl;external libgstcontroller;
procedure gst_control_point_free(cp:PGstControlPoint);cdecl;external libgstcontroller;
function gst_control_point_copy(cp:PGstControlPoint):PGstControlPoint;cdecl;external libgstcontroller;
{$endif}
{ __GST_TIMED_VALUE_CONTROL_SOURCE_H__  }

// === Konventiert am: 7-10-24 14:52:28 ===

function GST_TYPE_TIMED_VALUE_CONTROL_SOURCE : TGType;
function GST_TIMED_VALUE_CONTROL_SOURCE(obj : Pointer) : PGstTimedValueControlSource;
function GST_TIMED_VALUE_CONTROL_SOURCE_CLASS(klass : Pointer) : PGstTimedValueControlSourceClass;
function GST_IS_TIMED_VALUE_CONTROL_SOURCE(obj : Pointer) : Tgboolean;
function GST_IS_TIMED_VALUE_CONTROL_SOURCE_CLASS(klass : Pointer) : Tgboolean;
function GST_TIMED_VALUE_CONTROL_SOURCE_GET_CLASS(obj : Pointer) : PGstTimedValueControlSourceClass;

implementation

function GST_TYPE_TIMED_VALUE_CONTROL_SOURCE : TGType;
  begin
    GST_TYPE_TIMED_VALUE_CONTROL_SOURCE:=gst_timed_value_control_source_get_type;
  end;

function GST_TIMED_VALUE_CONTROL_SOURCE(obj : Pointer) : PGstTimedValueControlSource;
begin
  Result := PGstTimedValueControlSource(g_type_check_instance_cast(obj, GST_TYPE_TIMED_VALUE_CONTROL_SOURCE));
end;

function GST_TIMED_VALUE_CONTROL_SOURCE_CLASS(klass : Pointer) : PGstTimedValueControlSourceClass;
begin
  Result := PGstTimedValueControlSourceClass(g_type_check_class_cast(klass, GST_TYPE_TIMED_VALUE_CONTROL_SOURCE));
end;

function GST_IS_TIMED_VALUE_CONTROL_SOURCE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_TIMED_VALUE_CONTROL_SOURCE);
end;

function GST_IS_TIMED_VALUE_CONTROL_SOURCE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_TIMED_VALUE_CONTROL_SOURCE);
end;

function GST_TIMED_VALUE_CONTROL_SOURCE_GET_CLASS(obj : Pointer) : PGstTimedValueControlSourceClass;
begin
  Result := PGstTimedValueControlSourceClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIMED_VALUE_CONTROL_SOURCE_LOCK(obj : longint) : longint;
begin
  GST_TIMED_VALUE_CONTROL_SOURCE_LOCK:=g_mutex_lock(@((PGstTimedValueControlSource(o))^.lock));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIMED_VALUE_CONTROL_SOURCE_UNLOCK(obj : longint) : longint;
begin
  GST_TIMED_VALUE_CONTROL_SOURCE_UNLOCK:=g_mutex_unlock(@((PGstTimedValueControlSource(o))^.lock));
end;


end.
