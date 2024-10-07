
unit gstfftf32;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstfftf32.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstfftf32.h
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
Pgfloat  = ^gfloat;
PGstFFTF32  = ^GstFFTF32;
PGstFFTF32Complex  = ^GstFFTF32Complex;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2007> Sebastian Dröge <slomo@circular-chaos.org>
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
{$ifndef __GST_FFT_F32_H__}
{$define __GST_FFT_F32_H__}
{$include <glib.h>}
{$include <gst/gst.h>}
{$include "gstfft.h"}
type
{ Copy of kiss_fft_f32_cpx for documentation reasons,
 * do NOT change!  }
{*
 * GstFFTF32Complex:
 * @r: Real part
 * @i: Imaginary part
 *
 * Data type for complex numbers composed of
 * 32 bit float.
  }
  PGstFFTF32Complex = ^TGstFFTF32Complex;
  TGstFFTF32Complex = record
      r : Tgfloat;
      i : Tgfloat;
    end;

{ Functions  }

function gst_fft_f32_new(len:Tgint; inverse:Tgboolean):PGstFFTF32;cdecl;external;
procedure gst_fft_f32_free(self:PGstFFTF32);cdecl;external;
(* Const before type ignored *)
procedure gst_fft_f32_fft(self:PGstFFTF32; timedata:Pgfloat; freqdata:PGstFFTF32Complex);cdecl;external;
(* Const before type ignored *)
procedure gst_fft_f32_inverse_fft(self:PGstFFTF32; freqdata:PGstFFTF32Complex; timedata:Pgfloat);cdecl;external;
procedure gst_fft_f32_window(self:PGstFFTF32; timedata:Pgfloat; window:TGstFFTWindow);cdecl;external;
{$endif}
{ __GST_FFT_F32_H__  }

implementation


end.
