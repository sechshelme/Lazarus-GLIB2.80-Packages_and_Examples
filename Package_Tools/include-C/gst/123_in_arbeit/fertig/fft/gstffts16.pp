
unit gstffts16;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstffts16.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstffts16.h
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
Pgint16  = ^gint16;
PGstFFTS16  = ^GstFFTS16;
PGstFFTS16Complex  = ^GstFFTS16Complex;
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
{$ifndef __GST_FFT_S16_H__}
{$define __GST_FFT_S16_H__}
{$include <glib.h>}
{$include <gst/gst.h>}
{$include "gstfft.h"}
type
{ Copy of kiss_fft_s16_cpx for documentation reasons,
 * do NOT change!  }
{*
 * GstFFTS16Complex:
 * @r: Real part
 * @i: Imaginary part
 *
 * Data type for complex numbers composed of
 * signed 16 bit integers.
  }
  PGstFFTS16Complex = ^TGstFFTS16Complex;
  TGstFFTS16Complex = record
      r : Tgint16;
      i : Tgint16;
    end;

{ Functions  }

function gst_fft_s16_new(len:Tgint; inverse:Tgboolean):PGstFFTS16;cdecl;external;
procedure gst_fft_s16_free(self:PGstFFTS16);cdecl;external;
(* Const before type ignored *)
procedure gst_fft_s16_fft(self:PGstFFTS16; timedata:Pgint16; freqdata:PGstFFTS16Complex);cdecl;external;
(* Const before type ignored *)
procedure gst_fft_s16_inverse_fft(self:PGstFFTS16; freqdata:PGstFFTS16Complex; timedata:Pgint16);cdecl;external;
procedure gst_fft_s16_window(self:PGstFFTS16; timedata:Pgint16; window:TGstFFTWindow);cdecl;external;
{$endif}
{ __GST_FFT_S16_H__  }

implementation


end.
