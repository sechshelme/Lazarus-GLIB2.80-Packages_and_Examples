unit gstrtspextension;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer RTSP Extension
 * Copyright (C) 2007 Wim Taymans <wim@fluendo.com>
 *
 * gstrtspextension.h: RTSP Extension interface.
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
{$ifndef __GST_RTSP_EXTENSION_H__}
{$define __GST_RTSP_EXTENSION_H__}
{$include <gst/gst.h>}
{$include <gst/sdp/gstsdpmessage.h>}
{$include <gst/rtsp/gstrtsptransport.h>}
{$include <gst/rtsp/gstrtspmessage.h>}
{$include <gst/rtsp/gstrtspurl.h>}

{*
 * GstRTSPExtensionInterface:
 *
 * An interface representing RTSP extensions.
  }
type
{ vfunctions  }
{ signals  }
{ ABI: more vfunctions added later  }
{< private > }
  PGstRTSPExtensionInterface = ^TGstRTSPExtensionInterface;
  TGstRTSPExtensionInterface = record
      parent : TGTypeInterface;
      detect_server : function (ext:PGstRTSPExtension; resp:PGstRTSPMessage):Tgboolean;cdecl;
      before_send : function (ext:PGstRTSPExtension; req:PGstRTSPMessage):TGstRTSPResult;cdecl;
      after_send : function (ext:PGstRTSPExtension; req:PGstRTSPMessage; resp:PGstRTSPMessage):TGstRTSPResult;cdecl;
      parse_sdp : function (ext:PGstRTSPExtension; sdp:PGstSDPMessage; s:PGstStructure):TGstRTSPResult;cdecl;
      setup_media : function (ext:PGstRTSPExtension; media:PGstSDPMedia):TGstRTSPResult;cdecl;
      configure_stream : function (ext:PGstRTSPExtension; caps:PGstCaps):Tgboolean;cdecl;
      get_transports : function (ext:PGstRTSPExtension; protocols:TGstRTSPLowerTrans; transport:PPgchar):TGstRTSPResult;cdecl;
      stream_select : function (ext:PGstRTSPExtension; url:PGstRTSPUrl):TGstRTSPResult;cdecl;
      send : function (ext:PGstRTSPExtension; req:PGstRTSPMessage; resp:PGstRTSPMessage):TGstRTSPResult;cdecl;
      receive_request : function (ext:PGstRTSPExtension; req:PGstRTSPMessage):TGstRTSPResult;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_rtsp_extension_get_type:TGType;cdecl;external libgstrtsp;
{ invoke vfunction on interface  }
function gst_rtsp_extension_detect_server(ext:PGstRTSPExtension; resp:PGstRTSPMessage):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_extension_before_send(ext:PGstRTSPExtension; req:PGstRTSPMessage):TGstRTSPResult;cdecl;external libgstrtsp;
function gst_rtsp_extension_after_send(ext:PGstRTSPExtension; req:PGstRTSPMessage; resp:PGstRTSPMessage):TGstRTSPResult;cdecl;external libgstrtsp;
function gst_rtsp_extension_parse_sdp(ext:PGstRTSPExtension; sdp:PGstSDPMessage; s:PGstStructure):TGstRTSPResult;cdecl;external libgstrtsp;
function gst_rtsp_extension_setup_media(ext:PGstRTSPExtension; media:PGstSDPMedia):TGstRTSPResult;cdecl;external libgstrtsp;
function gst_rtsp_extension_configure_stream(ext:PGstRTSPExtension; caps:PGstCaps):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_extension_get_transports(ext:PGstRTSPExtension; protocols:TGstRTSPLowerTrans; transport:PPgchar):TGstRTSPResult;cdecl;external libgstrtsp;
function gst_rtsp_extension_stream_select(ext:PGstRTSPExtension; url:PGstRTSPUrl):TGstRTSPResult;cdecl;external libgstrtsp;
function gst_rtsp_extension_receive_request(ext:PGstRTSPExtension; req:PGstRTSPMessage):TGstRTSPResult;cdecl;external libgstrtsp;
{ signal emission  }
function gst_rtsp_extension_send(ext:PGstRTSPExtension; req:PGstRTSPMessage; resp:PGstRTSPMessage):TGstRTSPResult;cdecl;external libgstrtsp;
{$endif}
{ __GST_RTSP_EXTENSION_H__  }

// === Konventiert am: 8-10-24 11:22:06 ===

function GST_TYPE_RTSP_EXTENSION : TGType;
function GST_RTSP_EXTENSION(obj : Pointer) : PGstRTSPExtension;
function GST_IS_RTSP_EXTENSION(obj : Pointer) : Tgboolean;
function GST_RTSP_EXTENSION_GET_INTERFACE(obj : Pointer) : PGstRTSPExtensionInterface;

implementation

function GST_TYPE_RTSP_EXTENSION : TGType;
  begin
    GST_TYPE_RTSP_EXTENSION:=gst_rtsp_extension_get_type;
  end;

function GST_RTSP_EXTENSION(obj : Pointer) : PGstRTSPExtension;
begin
  Result := PGstRTSPExtension(g_type_check_instance_cast(obj, GST_TYPE_RTSP_EXTENSION));
end;

function GST_IS_RTSP_EXTENSION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_RTSP_EXTENSION);
end;

function GST_RTSP_EXTENSION_GET_INTERFACE(obj : Pointer) : PGstRTSPExtensionInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_RTSP_EXTENSION);
end;



end.
