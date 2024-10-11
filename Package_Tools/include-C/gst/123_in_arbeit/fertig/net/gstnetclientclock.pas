unit gstnetclientclock;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2005 Wim Taymans <wim@fluendo.com>
 *                    2005 Andy Wingo <wingo@pobox.com>
 * Copyright (C) 2012 Collabora Ltd. <tim.muller@collabora.co.uk>
 *
 * gstnetclientclock.h: clock that synchronizes itself to a time provider over
 * the network
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
{$ifndef __GST_NET_CLIENT_CLOCK_H__}
{$define __GST_NET_CLIENT_CLOCK_H__}
{$include <gst/gst.h>}
{$include <gst/gstsystemclock.h>}
{$include <gst/net/net-prelude.h>}

type
{*
 * GstNetClientClock:
 *
 * Opaque #GstNetClientClock structure.
  }
{< private > }
  PGstNetClientClock = ^TGstNetClientClock;
  TGstNetClientClock = record
      clock : TGstSystemClock;
      priv : PGstNetClientClockPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstNetClientClockClass = ^TGstNetClientClockClass;
  TGstNetClientClockClass = record
      parent_class : TGstSystemClockClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_net_client_clock_get_type:TGType;cdecl;external libgstnet;
function gst_net_client_clock_new(name:Pgchar; remote_address:Pgchar; remote_port:Tgint; base_time:TGstClockTime):PGstClock;cdecl;external libgstnet;
{ was #define dname def_expr }
function GST_TYPE_NTP_CLOCK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NTP_CLOCK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NTP_CLOCK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_NTP_CLOCK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_NTP_CLOCK_CLASS(klass : longint) : longint;

type
  TGstNetClientClock = TGstNtpClock;
  TGstNetClientClockClass = TGstNtpClockClass;

function gst_ntp_clock_get_type:TGType;cdecl;external libgstnet;
function gst_ntp_clock_new(name:Pgchar; remote_address:Pgchar; remote_port:Tgint; base_time:TGstClockTime):PGstClock;cdecl;external libgstnet;
{$endif}
{ __GST_NET_CLIENT_CLOCK_H__  }

// === Konventiert am: 11-10-24 14:27:55 ===

function GST_TYPE_NET_CLIENT_CLOCK : TGType;
function GST_NET_CLIENT_CLOCK(obj : Pointer) : PGstNetClientClock;
function GST_NET_CLIENT_CLOCK_CLASS(klass : Pointer) : PGstNetClientClockClass;
function GST_IS_NET_CLIENT_CLOCK(obj : Pointer) : Tgboolean;
function GST_IS_NET_CLIENT_CLOCK_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_NET_CLIENT_CLOCK : TGType;
  begin
    GST_TYPE_NET_CLIENT_CLOCK:=gst_net_client_clock_get_type;
  end;

function GST_NET_CLIENT_CLOCK(obj : Pointer) : PGstNetClientClock;
begin
  Result := PGstNetClientClock(g_type_check_instance_cast(obj, GST_TYPE_NET_CLIENT_CLOCK));
end;

function GST_NET_CLIENT_CLOCK_CLASS(klass : Pointer) : PGstNetClientClockClass;
begin
  Result := PGstNetClientClockClass(g_type_check_class_cast(klass, GST_TYPE_NET_CLIENT_CLOCK));
end;

function GST_IS_NET_CLIENT_CLOCK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_NET_CLIENT_CLOCK);
end;

function GST_IS_NET_CLIENT_CLOCK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_NET_CLIENT_CLOCK);
end;


{ was #define dname def_expr }
function GST_TYPE_NTP_CLOCK : longint; { return type might be wrong }
  begin
    GST_TYPE_NTP_CLOCK:=gst_ntp_clock_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NTP_CLOCK(obj : longint) : longint;
begin
  GST_NTP_CLOCK:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_NTP_CLOCK,GstNtpClock);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NTP_CLOCK_CLASS(klass : longint) : longint;
begin
  GST_NTP_CLOCK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_NTP_CLOCK,GstNtpClockClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_NTP_CLOCK(obj : longint) : longint;
begin
  GST_IS_NTP_CLOCK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_NTP_CLOCK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_NTP_CLOCK_CLASS(klass : longint) : longint;
begin
  GST_IS_NTP_CLOCK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_NTP_CLOCK);
end;


end.
