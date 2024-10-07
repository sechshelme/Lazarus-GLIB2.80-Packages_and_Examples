
unit gstfftf64;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstfftf64.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstfftf64.h
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
Pgdouble  = ^gdouble;
PGstFFTF64  = ^GstFFTF64;
PGstFFTF64Complex  = ^GstFFTF64Complex;
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
{$ifndef __GST_FFT_F64_H__}
{$define __GST_FFT_F64_H__}
{$include <glib.h>}
{$include <gst/gst.h>}
{$include "gstfft.h"}
type
{ Copy of kiss_fft_f64_cpx for documentation reasons,
 * do NOT change!  }
{*
 * GstFFTF64Complex:
 * @r: Real part
 * @i: Imaginary part
 *
 * Data type for complex numbers composed of
 * 64 bit float.
  }
  PGstFFTF64Complex = ^TGstFFTF64Complex;
  TGstFFTF64Complex = record
      r : Tgdouble;
      i : Tgdouble;
    end;

{ Functions  }

function gst_fft_f64_new(len:Tgint; inverse:Tgboolean):PGstFFTF64;cdecl;external;
procedure gst_fft_f64_free(self:PGstFFTF64);cdecl;external;
(* Const before type ignored *)
procedure gst_fft_f64_fft(self:PGstFFTF64; timedata:Pgdouble; freqdata:PGstFFTF64Complex);cdecl;external;
(* Const before type ignored *)
procedure gst_fft_f64_inverse_fft(self:PGstFFTF64; freqdata:PGstFFTF64Complex; timedata:Pgdouble);cdecl;external;
procedure gst_fft_f64_window(self:PGstFFTF64; timedata:Pgdouble; window:TGstFFTWindow);cdecl;external;
{$endif}
{ __GST_FFT_F64_H__  }

implementation


end.
