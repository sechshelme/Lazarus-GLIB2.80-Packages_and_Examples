
unit gstinterpolationcontrolsource;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstinterpolationcontrolsource.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstinterpolationcontrolsource.h
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
PGstInterpolationControlSource  = ^GstInterpolationControlSource;
PGstInterpolationControlSourceClass  = ^GstInterpolationControlSourceClass;
PGstInterpolationControlSourcePrivate  = ^GstInterpolationControlSourcePrivate;
PGstInterpolationMode  = ^GstInterpolationMode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2007 Sebastian Dröge <slomo@circular-chaos.org>
 *
 * gstinterpolationcontrolsource.h: Control source that provides several
 *                                  interpolation methods
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
{$ifndef __GST_INTERPOLATION_CONTROL_SOURCE_H__}
{$define __GST_INTERPOLATION_CONTROL_SOURCE_H__}
{$include <glib-object.h>}
{$include <gst/gst.h>}
{$include <gst/controller/gsttimedvaluecontrolsource.h>}
{$include <gst/controller/controller-enumtypes.h>}

{ was #define dname def_expr }
function GST_TYPE_INTERPOLATION_CONTROL_SOURCE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_INTERPOLATION_CONTROL_SOURCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_INTERPOLATION_CONTROL_SOURCE_CLASS(vtable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_INTERPOLATION_CONTROL_SOURCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_INTERPOLATION_CONTROL_SOURCE_CLASS(vtable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_INTERPOLATION_CONTROL_SOURCE_GET_CLASS(inst : longint) : longint;

type
{*
 * GstInterpolationMode:
 * @GST_INTERPOLATION_MODE_NONE: steps-like interpolation, default
 * @GST_INTERPOLATION_MODE_LINEAR: linear interpolation
 * @GST_INTERPOLATION_MODE_CUBIC: cubic interpolation (natural), may overshoot
 *   the min or max values set by the control point, but is more 'curvy'
 * @GST_INTERPOLATION_MODE_CUBIC_MONOTONIC: monotonic cubic interpolation, will not
 *   produce any values outside of the min-max range set by the control points
 *   (Since: 1.8)
 *
 * The various interpolation modes available.
  }

  PGstInterpolationMode = ^TGstInterpolationMode;
  TGstInterpolationMode =  Longint;
  Const
    GST_INTERPOLATION_MODE_NONE = 0;
    GST_INTERPOLATION_MODE_LINEAR = 1;
    GST_INTERPOLATION_MODE_CUBIC = 2;
    GST_INTERPOLATION_MODE_CUBIC_MONOTONIC = 3;
;
{*
 * GstInterpolationControlSource:
 *
 * The instance structure of #GstControlSource.
  }
{< private > }
type
  PGstInterpolationControlSource = ^TGstInterpolationControlSource;
  TGstInterpolationControlSource = record
      parent : TGstTimedValueControlSource;
      priv : PGstInterpolationControlSourcePrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstInterpolationControlSourceClass = ^TGstInterpolationControlSourceClass;
  TGstInterpolationControlSourceClass = record
      parent_class : TGstTimedValueControlSourceClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_interpolation_control_source_get_type:TGType;cdecl;external;
{ Functions  }
function gst_interpolation_control_source_new:PGstControlSource;cdecl;external;
{$endif}
{ __GST_INTERPOLATION_CONTROL_SOURCE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_INTERPOLATION_CONTROL_SOURCE : longint; { return type might be wrong }
  begin
    GST_TYPE_INTERPOLATION_CONTROL_SOURCE:=gst_interpolation_control_source_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_INTERPOLATION_CONTROL_SOURCE(obj : longint) : longint;
begin
  GST_INTERPOLATION_CONTROL_SOURCE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_INTERPOLATION_CONTROL_SOURCE,GstInterpolationControlSource);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_INTERPOLATION_CONTROL_SOURCE_CLASS(vtable : longint) : longint;
begin
  GST_INTERPOLATION_CONTROL_SOURCE_CLASS:=G_TYPE_CHECK_CLASS_CAST(vtable,GST_TYPE_INTERPOLATION_CONTROL_SOURCE,GstInterpolationControlSourceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_INTERPOLATION_CONTROL_SOURCE(obj : longint) : longint;
begin
  GST_IS_INTERPOLATION_CONTROL_SOURCE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_INTERPOLATION_CONTROL_SOURCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_INTERPOLATION_CONTROL_SOURCE_CLASS(vtable : longint) : longint;
begin
  GST_IS_INTERPOLATION_CONTROL_SOURCE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(vtable,GST_TYPE_INTERPOLATION_CONTROL_SOURCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_INTERPOLATION_CONTROL_SOURCE_GET_CLASS(inst : longint) : longint;
begin
  GST_INTERPOLATION_CONTROL_SOURCE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,GST_TYPE_INTERPOLATION_CONTROL_SOURCE,GstInterpolationControlSourceClass);
end;


end.
