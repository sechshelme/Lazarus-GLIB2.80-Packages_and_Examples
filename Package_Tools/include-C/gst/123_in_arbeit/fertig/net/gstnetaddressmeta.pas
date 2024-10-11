unit gstnetaddressmeta;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2011> Wim Taymans <wim.taymans@gmail.com>
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
{$ifndef __GST_NET_ADDRESS_META_H__}
{$define __GST_NET_ADDRESS_META_H__}
{$include <gst/gst.h>}
{$include <gio/gio.h>}
{$include <gst/net/net-prelude.h>}
type
{*
 * GstNetAddressMeta:
 * @meta: the parent type
 * @addr: a #GSocketAddress stored as metadata
 *
 * Buffer metadata for network addresses.
  }
  PGstNetAddressMeta = ^TGstNetAddressMeta;
  TGstNetAddressMeta = record
      meta : TGstMeta;
      addr : PGSocketAddress;
    end;


function gst_net_address_meta_api_get_type:TGType;cdecl;external libgstnet;
{ implementation  }
function gst_net_address_meta_get_info:PGstMetaInfo;cdecl;external libgstnet;
{ was #define dname def_expr }
function GST_NET_ADDRESS_META_INFO : longint; { return type might be wrong }

function gst_buffer_add_net_address_meta(buffer:PGstBuffer; addr:PGSocketAddress):PGstNetAddressMeta;cdecl;external libgstnet;
function gst_buffer_get_net_address_meta(buffer:PGstBuffer):PGstNetAddressMeta;cdecl;external libgstnet;
{$endif}
{ __GST_NET_ADDRESS_META_H__  }

// === Konventiert am: 11-10-24 14:27:45 ===

function GST_NET_ADDRESS_META_API_TYPE : TGType;

implementation

function GST_NET_ADDRESS_META_API_TYPE : TGType;
  begin
    GST_NET_ADDRESS_META_API_TYPE:=gst_net_address_meta_api_get_type;
  end;


{ was #define dname def_expr }
function GST_NET_ADDRESS_META_INFO : longint; { return type might be wrong }
  begin
    GST_NET_ADDRESS_META_INFO:=gst_net_address_meta_get_info;
  end;


end.
