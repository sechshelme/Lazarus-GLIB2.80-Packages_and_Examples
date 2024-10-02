
unit gstbufferstraw;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstbufferstraw.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstbufferstraw.h
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
PGstBuffer  = ^GstBuffer;
PGstElement  = ^GstElement;
PGstPad  = ^GstPad;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2006 Andy Wingo <wingo at pobox.com>
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
{$ifndef __GST_BUFFER_STRAW_H__}
{$define __GST_BUFFER_STRAW_H__}
{$include <gst/check/gstcheck.h>}

procedure gst_buffer_straw_start_pipeline(bin:PGstElement; pad:PGstPad);cdecl;external;
function gst_buffer_straw_get_buffer(bin:PGstElement; pad:PGstPad):PGstBuffer;cdecl;external;
procedure gst_buffer_straw_stop_pipeline(bin:PGstElement; pad:PGstPad);cdecl;external;
{$endif}
{ __GST_BUFFER_STRAW_H__  }

implementation


end.
