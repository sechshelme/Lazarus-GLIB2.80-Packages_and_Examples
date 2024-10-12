
unit riff_read;
interface

{
  Automatically converted by H2Pas 0.99.16 from riff_read.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    riff_read.h
}

Type
PGstBuffer = ^TGstBuffer;
PGstElement = ^TGstElement;
PGstPad = ^TGstPad;
Pgst_riff_strf_auds = ^Tgst_riff_strf_auds;
Pgst_riff_strf_iavs = ^Tgst_riff_strf_iavs;
Pgst_riff_strf_vids = ^Tgst_riff_strf_vids;
Pgst_riff_strh = ^Tgst_riff_strh;
PGstTagList = ^TGstTagList;
Pguint = ^Tguint;
Pguint32 = ^Tguint32;
Pguint64 = ^Tguint64;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer RIFF I/O
 * Copyright (C) 2003 Ronald Bultje <rbultje@ronald.bitfreak.net>
 *
 * riff-read.h: function declarations for parsing a RIFF file
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
{$ifndef __GST_RIFF_READ_H__}
{$define __GST_RIFF_READ_H__}
{$include <glib.h>}
{$include <gst/gst.h>}
{$include "riff-ids.h"}
{
 * Operate using pull_range().
  }

function gst_riff_read_chunk(element:PGstElement; pad:PGstPad; offset:Pguint64; tag:Pguint32; chunk_data:PPGstBuffer):TGstFlowReturn;cdecl;external;
{
 * These functions operate on provided data (the caller is
 * supposed to strip the chunk headers). The buffer is
 * provided by the caller, the strf/strh/data are filled in
 * by the function.
  }
function gst_riff_parse_chunk(element:PGstElement; buf:PGstBuffer; offset:Pguint; fourcc:Pguint32; chunk_data:PPGstBuffer):Tgboolean;cdecl;external;
function gst_riff_parse_file_header(element:PGstElement; buf:PGstBuffer; doctype:Pguint32):Tgboolean;cdecl;external;
function gst_riff_parse_strh(element:PGstElement; buf:PGstBuffer; strh:PPgst_riff_strh):Tgboolean;cdecl;external;
function gst_riff_parse_strf_vids(element:PGstElement; buf:PGstBuffer; strf:PPgst_riff_strf_vids; data:PPGstBuffer):Tgboolean;cdecl;external;
function gst_riff_parse_strf_auds(element:PGstElement; buf:PGstBuffer; strf:PPgst_riff_strf_auds; data:PPGstBuffer):Tgboolean;cdecl;external;
function gst_riff_parse_strf_iavs(element:PGstElement; buf:PGstBuffer; strf:PPgst_riff_strf_iavs; data:PPGstBuffer):Tgboolean;cdecl;external;
procedure gst_riff_parse_info(element:PGstElement; buf:PGstBuffer; taglist:PPGstTagList);cdecl;external;
{
 * Init.
  }
procedure gst_riff_init;cdecl;external;
{$endif}
{ __GST_RIFF_READ_H__  }

implementation


end.
