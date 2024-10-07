
unit gstffts32;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstffts32.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstffts32.h
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
Pgint32  = ^gint32;
PGstFFTS32  = ^GstFFTS32;
PGstFFTS32Complex  = ^GstFFTS32Complex;
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
{$ifndef __GST_FFT_S32_H__}
{$define __GST_FFT_S32_H__}
{$include <glib.h>}
{$include <gst/gst.h>}
{$include "gstfft.h"}
type
{ Copy of kiss_fft_s32_cpx for documentation reasons,
 * do NOT change!  }
{*
 * GstFFTS32Complex:
 * @r: Real part
 * @i: Imaginary part
 *
 * Data type for complex numbers composed of
 * signed 32 bit integers.
  }
  PGstFFTS32Complex = ^TGstFFTS32Complex;
  TGstFFTS32Complex = record
      r : Tgint32;
      i : Tgint32;
    end;

{ Functions  }

function gst_fft_s32_new(len:Tgint; inverse:Tgboolean):PGstFFTS32;cdecl;external;
procedure gst_fft_s32_free(self:PGstFFTS32);cdecl;external;
(* Const before type ignored *)
procedure gst_fft_s32_fft(self:PGstFFTS32; timedata:Pgint32; freqdata:PGstFFTS32Complex);cdecl;external;
(* Const before type ignored *)
procedure gst_fft_s32_inverse_fft(self:PGstFFTS32; freqdata:PGstFFTS32Complex; timedata:Pgint32);cdecl;external;
procedure gst_fft_s32_window(self:PGstFFTS32; timedata:Pgint32; window:TGstFFTWindow);cdecl;external;
{$endif}
{ __GST_FFT_S32_H__  }

implementation


end.
