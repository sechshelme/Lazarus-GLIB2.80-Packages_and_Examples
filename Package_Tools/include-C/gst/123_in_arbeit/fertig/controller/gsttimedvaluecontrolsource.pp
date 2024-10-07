
unit gsttimedvaluecontrolsource;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsttimedvaluecontrolsource.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttimedvaluecontrolsource.h
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
PGList  = ^GList;
PGSequence  = ^GSequence;
PGSequenceIter  = ^GSequenceIter;
PGSList  = ^GSList;
PGstControlPoint  = ^GstControlPoint;
PGstTimedValueControlSource  = ^GstTimedValueControlSource;
PGstTimedValueControlSourceClass  = ^GstTimedValueControlSourceClass;
PGstTimedValueControlSourcePrivate  = ^GstTimedValueControlSourcePrivate;
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

{ was #define dname def_expr }
function GST_TYPE_TIMED_VALUE_CONTROL_SOURCE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIMED_VALUE_CONTROL_SOURCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIMED_VALUE_CONTROL_SOURCE_CLASS(vtable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TIMED_VALUE_CONTROL_SOURCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TIMED_VALUE_CONTROL_SOURCE_CLASS(vtable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIMED_VALUE_CONTROL_SOURCE_GET_CLASS(inst : longint) : longint;

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


function gst_control_point_get_type:TGType;cdecl;external;
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

function GST_TIMED_VALUE_CONTROL_SOURCE_LOCK(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIMED_VALUE_CONTROL_SOURCE_UNLOCK(o : longint) : longint;

function gst_timed_value_control_source_get_type:TGType;cdecl;external;
{ Functions  }
function gst_timed_value_control_source_find_control_point_iter(self:PGstTimedValueControlSource; timestamp:TGstClockTime):PGSequenceIter;cdecl;external;
(* Const before type ignored *)
function gst_timed_value_control_source_set(self:PGstTimedValueControlSource; timestamp:TGstClockTime; value:Tgdouble):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_timed_value_control_source_set_from_list(self:PGstTimedValueControlSource; timedvalues:PGSList):Tgboolean;cdecl;external;
function gst_timed_value_control_source_unset(self:PGstTimedValueControlSource; timestamp:TGstClockTime):Tgboolean;cdecl;external;
procedure gst_timed_value_control_source_unset_all(self:PGstTimedValueControlSource);cdecl;external;
function gst_timed_value_control_source_get_all(self:PGstTimedValueControlSource):PGList;cdecl;external;
function gst_timed_value_control_source_get_count(self:PGstTimedValueControlSource):Tgint;cdecl;external;
procedure gst_timed_value_control_invalidate_cache(self:PGstTimedValueControlSource);cdecl;external;
procedure gst_control_point_free(cp:PGstControlPoint);cdecl;external;
function gst_control_point_copy(cp:PGstControlPoint):PGstControlPoint;cdecl;external;
{$endif}
{ __GST_TIMED_VALUE_CONTROL_SOURCE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_TIMED_VALUE_CONTROL_SOURCE : longint; { return type might be wrong }
  begin
    GST_TYPE_TIMED_VALUE_CONTROL_SOURCE:=gst_timed_value_control_source_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIMED_VALUE_CONTROL_SOURCE(obj : longint) : longint;
begin
  GST_TIMED_VALUE_CONTROL_SOURCE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_TIMED_VALUE_CONTROL_SOURCE,GstTimedValueControlSource);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIMED_VALUE_CONTROL_SOURCE_CLASS(vtable : longint) : longint;
begin
  GST_TIMED_VALUE_CONTROL_SOURCE_CLASS:=G_TYPE_CHECK_CLASS_CAST(vtable,GST_TYPE_TIMED_VALUE_CONTROL_SOURCE,GstTimedValueControlSourceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TIMED_VALUE_CONTROL_SOURCE(obj : longint) : longint;
begin
  GST_IS_TIMED_VALUE_CONTROL_SOURCE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_TIMED_VALUE_CONTROL_SOURCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TIMED_VALUE_CONTROL_SOURCE_CLASS(vtable : longint) : longint;
begin
  GST_IS_TIMED_VALUE_CONTROL_SOURCE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(vtable,GST_TYPE_TIMED_VALUE_CONTROL_SOURCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIMED_VALUE_CONTROL_SOURCE_GET_CLASS(inst : longint) : longint;
begin
  GST_TIMED_VALUE_CONTROL_SOURCE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,GST_TYPE_TIMED_VALUE_CONTROL_SOURCE,GstTimedValueControlSourceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIMED_VALUE_CONTROL_SOURCE_LOCK(o : longint) : longint;
begin
  GST_TIMED_VALUE_CONTROL_SOURCE_LOCK:=g_mutex_lock(@((PGstTimedValueControlSource(o))^.lock));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TIMED_VALUE_CONTROL_SOURCE_UNLOCK(o : longint) : longint;
begin
  GST_TIMED_VALUE_CONTROL_SOURCE_UNLOCK:=g_mutex_unlock(@((PGstTimedValueControlSource(o))^.lock));
end;


end.
