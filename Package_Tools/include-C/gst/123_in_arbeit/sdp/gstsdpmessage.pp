
unit gstsdpmessage;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstsdpmessage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstsdpmessage.h
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
PGArray  = ^GArray;
Pgchar  = ^gchar;
PGstCaps  = ^GstCaps;
PGstMIKEYMessage  = ^GstMIKEYMessage;
PGstSDPAttribute  = ^GstSDPAttribute;
PGstSDPBandwidth  = ^GstSDPBandwidth;
PGstSDPConnection  = ^GstSDPConnection;
PGstSDPKey  = ^GstSDPKey;
PGstSDPMedia  = ^GstSDPMedia;
PGstSDPMessage  = ^GstSDPMessage;
PGstSDPOrigin  = ^GstSDPOrigin;
PGstSDPTime  = ^GstSDPTime;
PGstSDPZone  = ^GstSDPZone;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2005,2006> Wim Taymans <wim@fluendo.com>
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
{
 * Unless otherwise indicated, Source Code is licensed under MIT license.
 * See further explanation attached in License Statement (distributed in the file
 * LICENSE).
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is furnished to do
 * so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
  }
{$ifndef __GST_SDP_MESSAGE_H__}
{$define __GST_SDP_MESSAGE_H__}
{$include "gstmikey.h"}
{$include <glib.h>}
{$include <gst/gst.h>}
{$include <gst/sdp/sdp.h>}
{*
 * GstSDPOrigin:
 * @username: the user's login on the originating host, or it is "-"
 *    if the originating host does not support the concept of user ids.
 * @sess_id: is a numeric string such that the tuple of @username, @sess_id,
 *    @nettype, @addrtype and @addr form a globally unique identifier for the
 *    session.
 * @sess_version: a version number for this announcement
 * @nettype: the type of network. "IN" is defined to have the meaning
 *    "Internet".
 * @addrtype: the type of @addr.
 * @addr: the globally unique address of the machine from which the session was
 *     created.
 *
 * The contents of the SDP "o=" field which gives the originator of the session
 * (their username and the address of the user's host) plus a session id and
 * session version number.
  }
type
  PGstSDPOrigin = ^TGstSDPOrigin;
  TGstSDPOrigin = record
      username : Pgchar;
      sess_id : Pgchar;
      sess_version : Pgchar;
      nettype : Pgchar;
      addrtype : Pgchar;
      addr : Pgchar;
    end;
{*
 * GstSDPConnection:
 * @nettype: the type of network. "IN" is defined to have the meaning
 *    "Internet".
 * @addrtype: the type of @address.
 * @address: the address
 * @ttl: the time to live of the address
 * @addr_number: the number of layers
 *
 * The contents of the SDP "c=" field which contains connection data.
  }

  PGstSDPConnection = ^TGstSDPConnection;
  TGstSDPConnection = record
      nettype : Pgchar;
      addrtype : Pgchar;
      address : Pgchar;
      ttl : Tguint;
      addr_number : Tguint;
    end;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gst_sdp_connection_set(conn:PGstSDPConnection; nettype:Pgchar; addrtype:Pgchar; address:Pgchar; ttl:Tguint; 
           addr_number:Tguint):TGstSDPResult;cdecl;external;
function gst_sdp_connection_clear(conn:PGstSDPConnection):TGstSDPResult;cdecl;external;
{*
 * GST_SDP_BWTYPE_CT:
 *
 * The Conference Total bandwidth modifier.
  }
const
  GST_SDP_BWTYPE_CT = 'CT';  
{*
 * GST_SDP_BWTYPE_AS:
 *
 * The Application-Specific Maximum bandwidth modifier.
  }
  GST_SDP_BWTYPE_AS = 'AS';  
{*
 * GST_SDP_BWTYPE_EXT_PREFIX:
 *
 * The extension prefix bandwidth modifier.
  }
  GST_SDP_BWTYPE_EXT_PREFIX = 'X-';  
{*
 * GST_SDP_BWTYPE_RS:
 *
 * RTCP bandwidth allocated to active data senders (RFC 3556).
  }
  GST_SDP_BWTYPE_RS = 'RS';  
{*
 * GST_SDP_BWTYPE_RR:
 *
 * RTCP bandwidth allocated to data receivers (RFC 3556).
  }
  GST_SDP_BWTYPE_RR = 'RR';  
{*
 * GST_SDP_BWTYPE_TIAS:
 *
 * Transport Independent Application Specific Maximum bandwidth (RFC 3890).
  }
  GST_SDP_BWTYPE_TIAS = 'TIAS';  
{*
 * GstSDPBandwidth:
 * @bwtype: the bandwidth modifier type
 * @bandwidth: the bandwidth in kilobits per second
 *
 * The contents of the SDP "b=" field which specifies the proposed bandwidth to
 * be used by the session or media.
  }
type
  PGstSDPBandwidth = ^TGstSDPBandwidth;
  TGstSDPBandwidth = record
      bwtype : Pgchar;
      bandwidth : Tguint;
    end;
(* Const before type ignored *)

function gst_sdp_bandwidth_set(bw:PGstSDPBandwidth; bwtype:Pgchar; bandwidth:Tguint):TGstSDPResult;cdecl;external;
function gst_sdp_bandwidth_clear(bw:PGstSDPBandwidth):TGstSDPResult;cdecl;external;
{*
 * GstSDPTime:
 * @start: start time for the conference. The value is the decimal
 *     representation of Network Time Protocol (NTP) time values in seconds
 * @stop: stop time for the conference. The value is the decimal
 *     representation of Network Time Protocol (NTP) time values in seconds
 * @repeat: repeat times for a session
 *
 * The contents of the SDP "t=" field which specify the start and stop times for
 * a conference session.
  }
type
  PGstSDPTime = ^TGstSDPTime;
  TGstSDPTime = record
      start : Pgchar;
      stop : Pgchar;
      _repeat : PGArray;
    end;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gst_sdp_time_set(t:PGstSDPTime; start:Pgchar; stop:Pgchar; _repeat:PPgchar):TGstSDPResult;cdecl;external;
function gst_sdp_time_clear(t:PGstSDPTime):TGstSDPResult;cdecl;external;
{*
 * GstSDPZone:
 * @time: the NTP time that a time zone adjustment happens
 * @typed_time: the offset from the time when the session was first scheduled
 *
 * The contents of the SDP "z=" field which allows the sender to
 * specify a list of time zone adjustments and offsets from the base
 * time.
  }
type
  PGstSDPZone = ^TGstSDPZone;
  TGstSDPZone = record
      time : Pgchar;
      typed_time : Pgchar;
    end;
(* Const before type ignored *)
(* Const before type ignored *)

function gst_sdp_zone_set(zone:PGstSDPZone; adj_time:Pgchar; typed_time:Pgchar):TGstSDPResult;cdecl;external;
function gst_sdp_zone_clear(zone:PGstSDPZone):TGstSDPResult;cdecl;external;
{*
 * GstSDPKey:
 * @type: the encryption type
 * @data: the encryption data
 *
 * The contents of the SDP "k=" field which is used to convey encryption
 * keys.
  }
type
  PGstSDPKey = ^TGstSDPKey;
  TGstSDPKey = record
      _type : Pgchar;
      data : Pgchar;
    end;
{*
 * GstSDPAttribute:
 * @key: the attribute key
 * @value: the attribute value or NULL when it was a property attribute
 *
 * The contents of the SDP "a=" field which contains a key/value pair.
  }

  PGstSDPAttribute = ^TGstSDPAttribute;
  TGstSDPAttribute = record
      key : Pgchar;
      value : Pgchar;
    end;
(* Const before type ignored *)
(* Const before type ignored *)

function gst_sdp_attribute_set(attr:PGstSDPAttribute; key:Pgchar; value:Pgchar):TGstSDPResult;cdecl;external;
function gst_sdp_attribute_clear(attr:PGstSDPAttribute):TGstSDPResult;cdecl;external;
{*
 * GstSDPMedia:
 * @media: the media type
 * @port: the transport port to which the media stream will be sent
 * @num_ports: the number of ports or -1 if only one port was specified
 * @proto: the transport protocol
 * @fmts: an array of #gchar formats
 * @information: the media title
 * @connections: array of #GstSDPConnection with media connection information
 * @bandwidths: array of #GstSDPBandwidth with media bandwidth information
 * @key: the encryption key
 * @attributes: array of #GstSDPAttribute with the additional media attributes
 *
 * The contents of the SDP "m=" field with all related fields.
  }
type
  PGstSDPMedia = ^TGstSDPMedia;
  TGstSDPMedia = record
      media : Pgchar;
      port : Tguint;
      num_ports : Tguint;
      proto : Pgchar;
      fmts : PGArray;
      information : Pgchar;
      connections : PGArray;
      bandwidths : PGArray;
      key : TGstSDPKey;
      attributes : PGArray;
    end;
{*
 * GstSDPMessage:
 * @version: the protocol version
 * @origin: owner/creator and session identifier
 * @session_name: session name
 * @information: session information
 * @uri: URI of description
 * @emails: array of #gchar with email addresses
 * @phones: array of #gchar with phone numbers
 * @connection: connection information for the session
 * @bandwidths: array of #GstSDPBandwidth with bandwidth information
 * @times: array of #GstSDPTime with time descriptions
 * @zones: array of #GstSDPZone with time zone adjustments
 * @key: encryption key
 * @attributes: array of #GstSDPAttribute with session attributes
 * @medias: array of #GstSDPMedia with media descriptions
 *
 * The contents of the SDP message.
  }

  PGstSDPMessage = ^TGstSDPMessage;
  TGstSDPMessage = record
      version : Pgchar;
      origin : TGstSDPOrigin;
      session_name : Pgchar;
      information : Pgchar;
      uri : Pgchar;
      emails : PGArray;
      phones : PGArray;
      connection : TGstSDPConnection;
      bandwidths : PGArray;
      times : PGArray;
      zones : PGArray;
      key : TGstSDPKey;
      attributes : PGArray;
      medias : PGArray;
    end;

function gst_sdp_message_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_SDP_MESSAGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_SDP_MESSAGE_CAST(object : longint) : PGstSDPMessage;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SDP_MESSAGE(object : longint) : longint;

{ Session descriptions  }
function gst_sdp_message_new(msg:PPGstSDPMessage):TGstSDPResult;cdecl;external;
function gst_sdp_message_init(msg:PGstSDPMessage):TGstSDPResult;cdecl;external;
function gst_sdp_message_uninit(msg:PGstSDPMessage):TGstSDPResult;cdecl;external;
function gst_sdp_message_free(msg:PGstSDPMessage):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_copy(msg:PGstSDPMessage; copy:PPGstSDPMessage):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_parse_buffer(data:Pguint8; size:Tguint; msg:PGstSDPMessage):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_as_text(msg:PGstSDPMessage):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_new_from_text(text:Pgchar; msg:PPGstSDPMessage):TGstSDPResult;cdecl;external;
{ convert from/to uri  }
(* Const before type ignored *)
function gst_sdp_message_parse_uri(uri:Pgchar; msg:PGstSDPMessage):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_as_uri(scheme:Pgchar; msg:PGstSDPMessage):Pgchar;cdecl;external;
{ utils  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_address_is_multicast(nettype:Pgchar; addrtype:Pgchar; addr:Pgchar):Tgboolean;cdecl;external;
{ v=..  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_version(msg:PGstSDPMessage):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_set_version(msg:PGstSDPMessage; version:Pgchar):TGstSDPResult;cdecl;external;
{ o=<username> <sess-id> <sess-version> <nettype> <addrtype> <unicast-address>  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_origin(msg:PGstSDPMessage):PGstSDPOrigin;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_set_origin(msg:PGstSDPMessage; username:Pgchar; sess_id:Pgchar; sess_version:Pgchar; nettype:Pgchar; 
           addrtype:Pgchar; addr:Pgchar):TGstSDPResult;cdecl;external;
{ s=<session name>  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_session_name(msg:PGstSDPMessage):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_set_session_name(msg:PGstSDPMessage; session_name:Pgchar):TGstSDPResult;cdecl;external;
{ i=<session description>  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_information(msg:PGstSDPMessage):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_set_information(msg:PGstSDPMessage; information:Pgchar):TGstSDPResult;cdecl;external;
{ u=<uri>  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_uri(msg:PGstSDPMessage):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_set_uri(msg:PGstSDPMessage; uri:Pgchar):TGstSDPResult;cdecl;external;
{ e=<email-address>  }
(* Const before type ignored *)
function gst_sdp_message_emails_len(msg:PGstSDPMessage):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_email(msg:PGstSDPMessage; idx:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_insert_email(msg:PGstSDPMessage; idx:Tgint; email:Pgchar):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_replace_email(msg:PGstSDPMessage; idx:Tguint; email:Pgchar):TGstSDPResult;cdecl;external;
function gst_sdp_message_remove_email(msg:PGstSDPMessage; idx:Tguint):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_add_email(msg:PGstSDPMessage; email:Pgchar):TGstSDPResult;cdecl;external;
{ p=<phone-number>  }
(* Const before type ignored *)
function gst_sdp_message_phones_len(msg:PGstSDPMessage):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_phone(msg:PGstSDPMessage; idx:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_insert_phone(msg:PGstSDPMessage; idx:Tgint; phone:Pgchar):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_replace_phone(msg:PGstSDPMessage; idx:Tguint; phone:Pgchar):TGstSDPResult;cdecl;external;
function gst_sdp_message_remove_phone(msg:PGstSDPMessage; idx:Tguint):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_add_phone(msg:PGstSDPMessage; phone:Pgchar):TGstSDPResult;cdecl;external;
{ c=<nettype> <addrtype> <connection-address>[/<ttl>][/<number of addresses>]  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_connection(msg:PGstSDPMessage):PGstSDPConnection;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_set_connection(msg:PGstSDPMessage; nettype:Pgchar; addrtype:Pgchar; address:Pgchar; ttl:Tguint; 
           addr_number:Tguint):TGstSDPResult;cdecl;external;
{ b=<bwtype>:<bandwidth>  }
(* Const before type ignored *)
function gst_sdp_message_bandwidths_len(msg:PGstSDPMessage):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_bandwidth(msg:PGstSDPMessage; idx:Tguint):PGstSDPBandwidth;cdecl;external;
function gst_sdp_message_insert_bandwidth(msg:PGstSDPMessage; idx:Tgint; bw:PGstSDPBandwidth):TGstSDPResult;cdecl;external;
function gst_sdp_message_replace_bandwidth(msg:PGstSDPMessage; idx:Tguint; bw:PGstSDPBandwidth):TGstSDPResult;cdecl;external;
function gst_sdp_message_remove_bandwidth(msg:PGstSDPMessage; idx:Tguint):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_add_bandwidth(msg:PGstSDPMessage; bwtype:Pgchar; bandwidth:Tguint):TGstSDPResult;cdecl;external;
{ t=<start-time> <stop-time> and
 * r=<repeat interval> <active duration> <offsets from start-time>  }
(* Const before type ignored *)
function gst_sdp_message_times_len(msg:PGstSDPMessage):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_time(msg:PGstSDPMessage; idx:Tguint):PGstSDPTime;cdecl;external;
function gst_sdp_message_insert_time(msg:PGstSDPMessage; idx:Tgint; t:PGstSDPTime):TGstSDPResult;cdecl;external;
function gst_sdp_message_replace_time(msg:PGstSDPMessage; idx:Tguint; t:PGstSDPTime):TGstSDPResult;cdecl;external;
function gst_sdp_message_remove_time(msg:PGstSDPMessage; idx:Tguint):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_add_time(msg:PGstSDPMessage; start:Pgchar; stop:Pgchar; _repeat:PPgchar):TGstSDPResult;cdecl;external;
{ z=<adjustment time> <offset> <adjustment time> <offset> ....  }
(* Const before type ignored *)
function gst_sdp_message_zones_len(msg:PGstSDPMessage):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_zone(msg:PGstSDPMessage; idx:Tguint):PGstSDPZone;cdecl;external;
function gst_sdp_message_insert_zone(msg:PGstSDPMessage; idx:Tgint; zone:PGstSDPZone):TGstSDPResult;cdecl;external;
function gst_sdp_message_replace_zone(msg:PGstSDPMessage; idx:Tguint; zone:PGstSDPZone):TGstSDPResult;cdecl;external;
function gst_sdp_message_remove_zone(msg:PGstSDPMessage; idx:Tguint):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_add_zone(msg:PGstSDPMessage; adj_time:Pgchar; typed_time:Pgchar):TGstSDPResult;cdecl;external;
{ k=<method>[:<encryption key>]  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_key(msg:PGstSDPMessage):PGstSDPKey;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_set_key(msg:PGstSDPMessage; _type:Pgchar; data:Pgchar):TGstSDPResult;cdecl;external;
{ a=...  }
(* Const before type ignored *)
function gst_sdp_message_attributes_len(msg:PGstSDPMessage):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_attribute(msg:PGstSDPMessage; idx:Tguint):PGstSDPAttribute;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_attribute_val(msg:PGstSDPMessage; key:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_attribute_val_n(msg:PGstSDPMessage; key:Pgchar; nth:Tguint):Pgchar;cdecl;external;
function gst_sdp_message_insert_attribute(msg:PGstSDPMessage; idx:Tgint; attr:PGstSDPAttribute):TGstSDPResult;cdecl;external;
function gst_sdp_message_replace_attribute(msg:PGstSDPMessage; idx:Tguint; attr:PGstSDPAttribute):TGstSDPResult;cdecl;external;
function gst_sdp_message_remove_attribute(msg:PGstSDPMessage; idx:Tguint):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_add_attribute(msg:PGstSDPMessage; key:Pgchar; value:Pgchar):TGstSDPResult;cdecl;external;
{ m=.. sections  }
(* Const before type ignored *)
function gst_sdp_message_medias_len(msg:PGstSDPMessage):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_message_get_media(msg:PGstSDPMessage; idx:Tguint):PGstSDPMedia;cdecl;external;
function gst_sdp_message_add_media(msg:PGstSDPMessage; media:PGstSDPMedia):TGstSDPResult;cdecl;external;
function gst_sdp_message_remove_media(msg:PGstSDPMessage; idx:Tguint):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_dump(msg:PGstSDPMessage):TGstSDPResult;cdecl;external;
{ Media descriptions  }
function gst_sdp_media_new(media:PPGstSDPMedia):TGstSDPResult;cdecl;external;
function gst_sdp_media_init(media:PGstSDPMedia):TGstSDPResult;cdecl;external;
function gst_sdp_media_uninit(media:PGstSDPMedia):TGstSDPResult;cdecl;external;
function gst_sdp_media_free(media:PGstSDPMedia):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_copy(media:PGstSDPMedia; copy:PPGstSDPMedia):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_as_text(media:PGstSDPMedia):Pgchar;cdecl;external;
{ m=<media> <port>/<number of ports> <proto> <fmt> ...  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_media_get_media(media:PGstSDPMedia):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_set_media(media:PGstSDPMedia; med:Pgchar):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_get_port(media:PGstSDPMedia):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_get_num_ports(media:PGstSDPMedia):Tguint;cdecl;external;
function gst_sdp_media_set_port_info(media:PGstSDPMedia; port:Tguint; num_ports:Tguint):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_media_get_proto(media:PGstSDPMedia):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_set_proto(media:PGstSDPMedia; proto:Pgchar):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_formats_len(media:PGstSDPMedia):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_media_get_format(media:PGstSDPMedia; idx:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_insert_format(media:PGstSDPMedia; idx:Tgint; format:Pgchar):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_replace_format(media:PGstSDPMedia; idx:Tguint; format:Pgchar):TGstSDPResult;cdecl;external;
function gst_sdp_media_remove_format(media:PGstSDPMedia; idx:Tguint):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_add_format(media:PGstSDPMedia; format:Pgchar):TGstSDPResult;cdecl;external;
{ i=<session description>  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_media_get_information(media:PGstSDPMedia):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_set_information(media:PGstSDPMedia; information:Pgchar):TGstSDPResult;cdecl;external;
{ c=<nettype> <addrtype> <connection-address>[/<ttl>][/<number of addresses>]  }
(* Const before type ignored *)
function gst_sdp_media_connections_len(media:PGstSDPMedia):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_media_get_connection(media:PGstSDPMedia; idx:Tguint):PGstSDPConnection;cdecl;external;
function gst_sdp_media_insert_connection(media:PGstSDPMedia; idx:Tgint; conn:PGstSDPConnection):TGstSDPResult;cdecl;external;
function gst_sdp_media_replace_connection(media:PGstSDPMedia; idx:Tguint; conn:PGstSDPConnection):TGstSDPResult;cdecl;external;
function gst_sdp_media_remove_connection(media:PGstSDPMedia; idx:Tguint):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_media_add_connection(media:PGstSDPMedia; nettype:Pgchar; addrtype:Pgchar; address:Pgchar; ttl:Tguint; 
           addr_number:Tguint):TGstSDPResult;cdecl;external;
{ b=<bwtype>:<bandwidth>  }
(* Const before type ignored *)
function gst_sdp_media_bandwidths_len(media:PGstSDPMedia):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_media_get_bandwidth(media:PGstSDPMedia; idx:Tguint):PGstSDPBandwidth;cdecl;external;
function gst_sdp_media_insert_bandwidth(media:PGstSDPMedia; idx:Tgint; bw:PGstSDPBandwidth):TGstSDPResult;cdecl;external;
function gst_sdp_media_replace_bandwidth(media:PGstSDPMedia; idx:Tguint; bw:PGstSDPBandwidth):TGstSDPResult;cdecl;external;
function gst_sdp_media_remove_bandwidth(media:PGstSDPMedia; idx:Tguint):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_add_bandwidth(media:PGstSDPMedia; bwtype:Pgchar; bandwidth:Tguint):TGstSDPResult;cdecl;external;
{ k=<method>:<encryption key>  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_media_get_key(media:PGstSDPMedia):PGstSDPKey;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_media_set_key(media:PGstSDPMedia; _type:Pgchar; data:Pgchar):TGstSDPResult;cdecl;external;
{ a=...  }
(* Const before type ignored *)
function gst_sdp_media_attributes_len(media:PGstSDPMedia):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_media_get_attribute(media:PGstSDPMedia; idx:Tguint):PGstSDPAttribute;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_media_get_attribute_val(media:PGstSDPMedia; key:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_media_get_attribute_val_n(media:PGstSDPMedia; key:Pgchar; nth:Tguint):Pgchar;cdecl;external;
function gst_sdp_media_insert_attribute(media:PGstSDPMedia; idx:Tgint; attr:PGstSDPAttribute):TGstSDPResult;cdecl;external;
function gst_sdp_media_replace_attribute(media:PGstSDPMedia; idx:Tguint; attr:PGstSDPAttribute):TGstSDPResult;cdecl;external;
function gst_sdp_media_remove_attribute(media:PGstSDPMedia; idx:Tguint):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_media_add_attribute(media:PGstSDPMedia; key:Pgchar; value:Pgchar):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_get_caps_from_media(media:PGstSDPMedia; pt:Tgint):PGstCaps;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_set_media_from_caps(caps:PGstCaps; media:PGstSDPMedia):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_sdp_make_keymgmt(uri:Pgchar; base64:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_parse_keymgmt(msg:PGstSDPMessage; mikey:PPGstMIKEYMessage):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_parse_keymgmt(media:PGstSDPMedia; mikey:PPGstMIKEYMessage):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_message_attributes_to_caps(msg:PGstSDPMessage; caps:PGstCaps):TGstSDPResult;cdecl;external;
(* Const before type ignored *)
function gst_sdp_media_attributes_to_caps(media:PGstSDPMedia; caps:PGstCaps):TGstSDPResult;cdecl;external;
{$endif}
{ __GST_SDP_MESSAGE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_SDP_MESSAGE : longint; { return type might be wrong }
  begin
    GST_TYPE_SDP_MESSAGE:=gst_sdp_message_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_SDP_MESSAGE_CAST(object : longint) : PGstSDPMessage;
begin
  GST_SDP_MESSAGE_CAST:=PGstSDPMessage(object);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SDP_MESSAGE(object : longint) : longint;
begin
  GST_SDP_MESSAGE:=GST_SDP_MESSAGE_CAST(object);
end;


end.
