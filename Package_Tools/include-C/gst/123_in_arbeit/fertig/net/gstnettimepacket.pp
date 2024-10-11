
unit gstnettimepacket;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstnettimepacket.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstnettimepacket.h
}

Type
PGError = ^TGError;
PGSocket = ^TGSocket;
PGSocketAddress = ^TGSocketAddress;
PGstNetTimePacket = ^TGstNetTimePacket;
Pguint8 = ^Tguint8;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2005 Andy Wingo <wingo@pobox.com>
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
{$ifndef __GST_NET_TIME_PACKET_H__}
{$define __GST_NET_TIME_PACKET_H__}
{$include <gst/gst.h>}
{$include <gio/gio.h>}
{$include <gst/net/net-prelude.h>}
{*
 * GST_NET_TIME_PACKET_SIZE:
 *
 * The size of the packets sent between network clocks.
  }

const
  GST_NET_TIME_PACKET_SIZE = 16;  
type
{*
 * GstNetTimePacket:
 * @local_time: the local time when this packet was sent
 * @remote_time: the remote time observation
 *
 * Content of a #GstNetTimePacket.
  }
  PGstNetTimePacket = ^TGstNetTimePacket;
  TGstNetTimePacket = record
      local_time : TGstClockTime;
      remote_time : TGstClockTime;
    end;


function gst_net_time_packet_get_type:TGType;cdecl;external;
(* Const before declarator ignored *)
function gst_net_time_packet_new(buffer:Pguint8):PGstNetTimePacket;cdecl;external;
(* Const before declarator ignored *)
function gst_net_time_packet_copy(packet:PGstNetTimePacket):PGstNetTimePacket;cdecl;external;
procedure gst_net_time_packet_free(packet:PGstNetTimePacket);cdecl;external;
(* Const before declarator ignored *)
function gst_net_time_packet_serialize(packet:PGstNetTimePacket):Pguint8;cdecl;external;
function gst_net_time_packet_receive(socket:PGSocket; src_address:PPGSocketAddress; error:PPGError):PGstNetTimePacket;cdecl;external;
(* Const before declarator ignored *)
function gst_net_time_packet_send(packet:PGstNetTimePacket; socket:PGSocket; dest_address:PGSocketAddress; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __GST_NET_TIME_PACKET_H__  }

implementation


end.
