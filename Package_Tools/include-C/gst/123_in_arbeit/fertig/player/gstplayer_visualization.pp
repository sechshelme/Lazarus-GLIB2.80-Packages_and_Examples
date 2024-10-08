
unit gstplayer_visualization;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstplayer_visualization.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstplayer_visualization.h
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
Pgchar  = ^gchar;
PGstPlayerVisualization  = ^GstPlayerVisualization;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2014-2015 Sebastian Dröge <sebastian@centricular.com>
 * Copyright (C) 2015 Brijesh Singh <brijesh.ksingh@gmail.com>
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
{$ifndef __GST_PLAYER_VISUALIZATION_H__}
{$define __GST_PLAYER_VISUALIZATION_H__}
{$include <gst/gst.h>}
{$include <gst/player/player-prelude.h>}
type
{*
 * GstPlayerVisualization:
 * @name: name of the visualization.
 * @description: description of the visualization.
 *
 * A #GstPlayerVisualization descriptor.
  }
  PGstPlayerVisualization = ^TGstPlayerVisualization;
  TGstPlayerVisualization = record
      name : Pgchar;
      description : Pgchar;
    end;


function gst_player_visualization_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_player_visualization_copy(vis:PGstPlayerVisualization):PGstPlayerVisualization;cdecl;external;
procedure gst_player_visualization_free(vis:PGstPlayerVisualization);cdecl;external;
function gst_player_visualizations_get:^PGstPlayerVisualization;cdecl;external;
procedure gst_player_visualizations_free(viss:PPGstPlayerVisualization);cdecl;external;
{$endif}
{ __GST_PLAYER_VISUALIZATION_H__  }

implementation


end.
