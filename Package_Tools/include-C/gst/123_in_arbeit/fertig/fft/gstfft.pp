
unit gstfft;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstfft.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstfft.h
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
PGstFFTWindow  = ^GstFFTWindow;
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
{$include <glib.h>}
{$include <math.h>}
{$include <gst/gst.h>}
{$ifndef __GST_FFT_H__}
{$define __GST_FFT_H__}
{$include <gst/fft/fft-prelude.h>}
{*
 * GstFFTWindow:
 * @GST_FFT_WINDOW_RECTANGULAR: Rectangular window
 * @GST_FFT_WINDOW_HAMMING: Hamming window
 * @GST_FFT_WINDOW_HANN: Hann (sometimes also called Hanning) window
 * @GST_FFT_WINDOW_BARTLETT: Bartlett window
 * @GST_FFT_WINDOW_BLACKMAN: Blackman window
 *
 * The various window functions available.
  }
type
  PGstFFTWindow = ^TGstFFTWindow;
  TGstFFTWindow =  Longint;
  Const
    GST_FFT_WINDOW_RECTANGULAR = 0;
    GST_FFT_WINDOW_HAMMING = 1;
    GST_FFT_WINDOW_HANN = 2;
    GST_FFT_WINDOW_BARTLETT = 3;
    GST_FFT_WINDOW_BLACKMAN = 4;
;
{ Functions  }

function gst_fft_next_fast_length(n:Tgint):Tgint;cdecl;external;
{$endif}
{ __GST_FFT_H__  }

implementation


end.
