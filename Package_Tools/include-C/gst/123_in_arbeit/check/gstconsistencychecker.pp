
unit gstconsistencychecker;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstconsistencychecker.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstconsistencychecker.h
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
PGstPad  = ^GstPad;
PGstStreamConsistency  = ^GstStreamConsistency;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * unit testing helper lib
 *
 * Copyright (C) 2009 Edward Hervey <bilboed@bilboed.com>
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
{$ifndef __GST_CONSISTENCY_CHECKER_H__}
{$define __GST_CONSISTENCY_CHECKER_H__}
{$include <gst/check/gstcheck.h>}
{*
 * GstStreamConsistency:
 *
 * Opaque consistency checker handle.
  }
type

function gst_consistency_checker_new(pad:PGstPad):PGstStreamConsistency;cdecl;external;
function gst_consistency_checker_add_pad(consist:PGstStreamConsistency; pad:PGstPad):Tgboolean;cdecl;external;
procedure gst_consistency_checker_reset(consist:PGstStreamConsistency);cdecl;external;
procedure gst_consistency_checker_free(consist:PGstStreamConsistency);cdecl;external;
{$endif}
{ __GST_CONSISTENCY_CHECKER_H__  }

implementation


end.
