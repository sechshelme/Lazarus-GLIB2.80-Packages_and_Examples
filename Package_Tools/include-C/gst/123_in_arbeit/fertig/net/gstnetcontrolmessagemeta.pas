unit gstnetcontrolmessagemeta;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2014> William Manley <will@williammanley.net>
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
{$ifndef __GST_NET_CONTROL_MESSAGE_META_H__}
{$define __GST_NET_CONTROL_MESSAGE_META_H__}
{$include <gst/gst.h>}
{$include <gio/gio.h>}
{$include <gst/net/net-prelude.h>}
type
{*
 * GstNetControlMessageMeta:
 * @meta: the parent type
 * @message: a #GSocketControlMessage stored as metadata
 *
 * Buffer metadata for GSocket control messages, AKA ancillary data attached to
 * data sent across a socket.
  }
  PGstNetControlMessageMeta = ^TGstNetControlMessageMeta;
  TGstNetControlMessageMeta = record
      meta : TGstMeta;
      message : PGSocketControlMessage;
    end;


function gst_net_control_message_meta_api_get_type:TGType;cdecl;external libgstnet;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_net_control_message_meta(b : longint) : PGstNetControlMessageMeta;

{ implementation  }
function gst_net_control_message_meta_get_info:PGstMetaInfo;cdecl;external libgstnet;
{ was #define dname def_expr }
function GST_NET_CONTROL_MESSAGE_META_INFO : longint; { return type might be wrong }

function gst_buffer_add_net_control_message_meta(buffer:PGstBuffer; message:PGSocketControlMessage):PGstNetControlMessageMeta;cdecl;external libgstnet;
{$endif}
{ __GST_NET_CONTROL_MESSAGE_META_H__  }

// === Konventiert am: 11-10-24 14:28:13 ===

function GST_NET_CONTROL_MESSAGE_META_API_TYPE : TGType;

implementation

function GST_NET_CONTROL_MESSAGE_META_API_TYPE : TGType;
  begin
    GST_NET_CONTROL_MESSAGE_META_API_TYPE:=gst_net_control_message_meta_api_get_type;
  end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_buffer_get_net_control_message_meta(b : longint) : PGstNetControlMessageMeta;
begin
  gst_buffer_get_net_control_message_meta:=PGstNetControlMessageMeta(gst_buffer_get_meta(b,GST_NET_CONTROL_MESSAGE_META_API_TYPE));
end;

{ was #define dname def_expr }
function GST_NET_CONTROL_MESSAGE_META_INFO : longint; { return type might be wrong }
  begin
    GST_NET_CONTROL_MESSAGE_META_INFO:=gst_net_control_message_meta_get_info;
  end;


end.
