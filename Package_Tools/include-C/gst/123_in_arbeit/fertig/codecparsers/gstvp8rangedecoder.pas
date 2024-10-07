unit gstvp8rangedecoder;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * gstvp8rangedecoder.h - VP8 range decoder interface
 *
 * Copyright (C) 2014 Intel Corporation
 *   Author: Gwenole Beauchesne <gwenole.beauchesne@intel.com>
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
{$ifndef GST_VP8_RANGE_DECODER_H}
{$define GST_VP8_RANGE_DECODER_H}
{$include <glib.h>}
{$include <gst/gstconfig.h>}
{$include <gst/codecparsers/codecparsers-prelude.h>}
type
{*
* GstVp8RangeDecoder:
* @buf: the original bitstream buffer start
* @buf_size: the original bitstream buffer size
*
* Range decoder.
 }
{< private > }
  PGstVp8RangeDecoder = ^TGstVp8RangeDecoder;
  TGstVp8RangeDecoder = record
      buf : Pguchar;
      buf_size : Tguint;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{*
* GstVp8RangeDecoderState:
* @range: current "Range" value
* @value: current "Value" value
* @count: number of bits left in "Value" for decoding
*
* Range decoder state.
 }
  PGstVp8RangeDecoderState = ^TGstVp8RangeDecoderState;
  TGstVp8RangeDecoderState = record
      range : Tguint8;
      value : Tguint8;
      count : Tguint8;
    end;


function gst_vp8_range_decoder_init(rd:PGstVp8RangeDecoder; buf:Pguchar; buf_size:Tguint):Tgboolean;cdecl;external libgstcodecparsers;
function gst_vp8_range_decoder_read(rd:PGstVp8RangeDecoder; prob:Tguint8):Tgint;cdecl;external libgstcodecparsers;
function gst_vp8_range_decoder_read_literal(rd:PGstVp8RangeDecoder; bits:Tgint):Tgint;cdecl;external libgstcodecparsers;
function gst_vp8_range_decoder_get_pos(rd:PGstVp8RangeDecoder):Tguint;cdecl;external libgstcodecparsers;
procedure gst_vp8_range_decoder_get_state(rd:PGstVp8RangeDecoder; state:PGstVp8RangeDecoderState);cdecl;external libgstcodecparsers;
{$endif}
{ GST_VP8_RANGE_DECODER_H  }

// === Konventiert am: 7-10-24 11:30:29 ===


implementation



end.
