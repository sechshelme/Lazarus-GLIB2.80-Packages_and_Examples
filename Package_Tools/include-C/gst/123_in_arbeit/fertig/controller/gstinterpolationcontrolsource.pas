unit gstinterpolationcontrolsource;

interface

uses
  glib280, gst124;

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


function gst_interpolation_control_source_get_type:TGType;cdecl;external libgstcontroller;
{ Functions  }
function gst_interpolation_control_source_new:PGstControlSource;cdecl;external libgstcontroller;
{$endif}
{ __GST_INTERPOLATION_CONTROL_SOURCE_H__  }

// === Konventiert am: 7-10-24 14:52:09 ===

function GST_TYPE_INTERPOLATION_CONTROL_SOURCE : TGType;
function GST_INTERPOLATION_CONTROL_SOURCE(obj : Pointer) : PGstInterpolationControlSource;
function GST_INTERPOLATION_CONTROL_SOURCE_CLASS(klass : Pointer) : PGstInterpolationControlSourceClass;
function GST_IS_INTERPOLATION_CONTROL_SOURCE(obj : Pointer) : Tgboolean;
function GST_IS_INTERPOLATION_CONTROL_SOURCE_CLASS(klass : Pointer) : Tgboolean;
function GST_INTERPOLATION_CONTROL_SOURCE_GET_CLASS(obj : Pointer) : PGstInterpolationControlSourceClass;

implementation

function GST_TYPE_INTERPOLATION_CONTROL_SOURCE : TGType;
  begin
    GST_TYPE_INTERPOLATION_CONTROL_SOURCE:=gst_interpolation_control_source_get_type;
  end;

function GST_INTERPOLATION_CONTROL_SOURCE(obj : Pointer) : PGstInterpolationControlSource;
begin
  Result := PGstInterpolationControlSource(g_type_check_instance_cast(obj, GST_TYPE_INTERPOLATION_CONTROL_SOURCE));
end;

function GST_INTERPOLATION_CONTROL_SOURCE_CLASS(klass : Pointer) : PGstInterpolationControlSourceClass;
begin
  Result := PGstInterpolationControlSourceClass(g_type_check_class_cast(klass, GST_TYPE_INTERPOLATION_CONTROL_SOURCE));
end;

function GST_IS_INTERPOLATION_CONTROL_SOURCE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_INTERPOLATION_CONTROL_SOURCE);
end;

function GST_IS_INTERPOLATION_CONTROL_SOURCE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_INTERPOLATION_CONTROL_SOURCE);
end;

function GST_INTERPOLATION_CONTROL_SOURCE_GET_CLASS(obj : Pointer) : PGstInterpolationControlSourceClass;
begin
  Result := PGstInterpolationControlSourceClass(PGTypeInstance(obj)^.g_class);
end;



end.
