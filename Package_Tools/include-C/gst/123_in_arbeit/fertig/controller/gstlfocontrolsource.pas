unit gstlfocontrolsource;

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
 * gstlfocontrolsource.h: Control source that provides some periodic waveforms
 *                        as control values.
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
{$ifndef __GST_LFO_CONTROL_SOURCE_H__}
{$define __GST_LFO_CONTROL_SOURCE_H__}
{$include <glib-object.h>}
{$include <gst/gst.h>}
{$include <gst/controller/controller-enumtypes.h>}

type
{*
 * GstLFOWaveform:
 * @GST_LFO_WAVEFORM_SINE: sine waveform
 * @GST_LFO_WAVEFORM_SQUARE: square waveform
 * @GST_LFO_WAVEFORM_SAW: saw waveform
 * @GST_LFO_WAVEFORM_REVERSE_SAW: reverse saw waveform
 * @GST_LFO_WAVEFORM_TRIANGLE: triangle waveform
 *
 * The various waveform modes available.
  }

  PGstLFOWaveform = ^TGstLFOWaveform;
  TGstLFOWaveform =  Longint;
  Const
    GST_LFO_WAVEFORM_SINE = 0;
    GST_LFO_WAVEFORM_SQUARE = 1;
    GST_LFO_WAVEFORM_SAW = 2;
    GST_LFO_WAVEFORM_REVERSE_SAW = 3;
    GST_LFO_WAVEFORM_TRIANGLE = 4;
;
{*
 * GstLFOControlSource:
 *
 * The instance structure of #GstControlSource.
  }
{ <private>  }
type
  PGstLFOControlSource = ^TGstLFOControlSource;
  TGstLFOControlSource = record
      parent : TGstControlSource;
      priv : PGstLFOControlSourcePrivate;
      lock : TGMutex;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstLFOControlSourceClass = ^TGstLFOControlSourceClass;
  TGstLFOControlSourceClass = record
      parent_class : TGstControlSourceClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_lfo_control_source_get_type:TGType;cdecl;external libgstcontroller;
{ Functions  }
function gst_lfo_control_source_new:PGstControlSource;cdecl;external libgstcontroller;
{$endif}
{ __GST_LFO_CONTROL_SOURCE_H__  }

// === Konventiert am: 7-10-24 14:52:16 ===

function GST_TYPE_LFO_CONTROL_SOURCE : TGType;
function GST_LFO_CONTROL_SOURCE(obj : Pointer) : PGstLFOControlSource;
function GST_LFO_CONTROL_SOURCE_CLASS(klass : Pointer) : PGstLFOControlSourceClass;
function GST_IS_LFO_CONTROL_SOURCE(obj : Pointer) : Tgboolean;
function GST_IS_LFO_CONTROL_SOURCE_CLASS(klass : Pointer) : Tgboolean;
function GST_LFO_CONTROL_SOURCE_GET_CLASS(obj : Pointer) : PGstLFOControlSourceClass;

implementation

function GST_TYPE_LFO_CONTROL_SOURCE : TGType;
  begin
    GST_TYPE_LFO_CONTROL_SOURCE:=gst_lfo_control_source_get_type;
  end;

function GST_LFO_CONTROL_SOURCE(obj : Pointer) : PGstLFOControlSource;
begin
  Result := PGstLFOControlSource(g_type_check_instance_cast(obj, GST_TYPE_LFO_CONTROL_SOURCE));
end;

function GST_LFO_CONTROL_SOURCE_CLASS(klass : Pointer) : PGstLFOControlSourceClass;
begin
  Result := PGstLFOControlSourceClass(g_type_check_class_cast(klass, GST_TYPE_LFO_CONTROL_SOURCE));
end;

function GST_IS_LFO_CONTROL_SOURCE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_LFO_CONTROL_SOURCE);
end;

function GST_IS_LFO_CONTROL_SOURCE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_LFO_CONTROL_SOURCE);
end;

function GST_LFO_CONTROL_SOURCE_GET_CLASS(obj : Pointer) : PGstLFOControlSourceClass;
begin
  Result := PGstLFOControlSourceClass(PGTypeInstance(obj)^.g_class);
end;



end.
