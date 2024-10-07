
unit gstlfocontrolsource;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstlfocontrolsource.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstlfocontrolsource.h
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
PGstLFOControlSource  = ^GstLFOControlSource;
PGstLFOControlSourceClass  = ^GstLFOControlSourceClass;
PGstLFOControlSourcePrivate  = ^GstLFOControlSourcePrivate;
PGstLFOWaveform  = ^GstLFOWaveform;
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

{ was #define dname def_expr }
function GST_TYPE_LFO_CONTROL_SOURCE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_LFO_CONTROL_SOURCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_LFO_CONTROL_SOURCE_CLASS(vtable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_LFO_CONTROL_SOURCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_LFO_CONTROL_SOURCE_CLASS(vtable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_LFO_CONTROL_SOURCE_GET_CLASS(inst : longint) : longint;

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


function gst_lfo_control_source_get_type:TGType;cdecl;external;
{ Functions  }
function gst_lfo_control_source_new:PGstControlSource;cdecl;external;
{$endif}
{ __GST_LFO_CONTROL_SOURCE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_LFO_CONTROL_SOURCE : longint; { return type might be wrong }
  begin
    GST_TYPE_LFO_CONTROL_SOURCE:=gst_lfo_control_source_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_LFO_CONTROL_SOURCE(obj : longint) : longint;
begin
  GST_LFO_CONTROL_SOURCE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_LFO_CONTROL_SOURCE,GstLFOControlSource);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_LFO_CONTROL_SOURCE_CLASS(vtable : longint) : longint;
begin
  GST_LFO_CONTROL_SOURCE_CLASS:=G_TYPE_CHECK_CLASS_CAST(vtable,GST_TYPE_LFO_CONTROL_SOURCE,GstLFOControlSourceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_LFO_CONTROL_SOURCE(obj : longint) : longint;
begin
  GST_IS_LFO_CONTROL_SOURCE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_LFO_CONTROL_SOURCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_LFO_CONTROL_SOURCE_CLASS(vtable : longint) : longint;
begin
  GST_IS_LFO_CONTROL_SOURCE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(vtable,GST_TYPE_LFO_CONTROL_SOURCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_LFO_CONTROL_SOURCE_GET_CLASS(inst : longint) : longint;
begin
  GST_LFO_CONTROL_SOURCE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,GST_TYPE_LFO_CONTROL_SOURCE,GstLFOControlSourceClass);
end;


end.
