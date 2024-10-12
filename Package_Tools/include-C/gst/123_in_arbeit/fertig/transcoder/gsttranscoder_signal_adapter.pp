
unit gsttranscoder_signal_adapter;
interface

{
  Automatically converted by H2Pas 0.99.16 from gsttranscoder_signal_adapter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttranscoder_signal_adapter.h
}

Type
PGstTranscoder = ^TGstTranscoder;
PGstTranscoderSignalAdapter = ^TGstTranscoderSignalAdapter;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2019-2020 Stephan Hesse <stephan@emliri.com>
 * Copyright (C) 2020 Thibault Saunier <tsaunier@igalia.com>
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
{$include <gst/transcoder/gsttranscoder.h>}
{*
 * GstTranscoderSignalAdapter:
 *
 * Transforms #GstTranscoder bus messages to signals from the adapter object.
 *
 * Since: 1.20
  }
{*
 * GST_TYPE_TRANSCODER_SIGNAL_ADAPTER:
 *
 * Since: 1.20
  }

{ was #define dname def_expr }
function GST_TYPE_TRANSCODER_SIGNAL_ADAPTER : longint; { return type might be wrong }

{*
 * GstTranscoderSignalAdapterClass:
 *
 * Since: 1.20
  }
{G_DECLARE_FINAL_TYPE (GstTranscoderSignalAdapter, gst_transcoder_signal_adapter, GST, TRANSCODER_SIGNAL_ADAPTER, GObject) }
function gst_transcoder_signal_adapter_get_transcoder(self:PGstTranscoderSignalAdapter):PGstTranscoder;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_TRANSCODER_SIGNAL_ADAPTER : longint; { return type might be wrong }
  begin
    GST_TYPE_TRANSCODER_SIGNAL_ADAPTER:=gst_transcoder_signal_adapter_get_type;
  end;


end.
