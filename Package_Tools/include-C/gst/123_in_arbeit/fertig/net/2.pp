
unit 2;
interface

{
  Automatically converted by H2Pas 0.99.16 from 2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    2.h
}

Type
Pgchar = ^Tgchar;
PGstClock = ^TGstClock;

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

function gst_ntp_clock_get_type:TGType;cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function gst_ntp_clock_new(name:Pgchar; remote_address:Pgchar; remote_port:Tgint; base_time:TGstClockTime):PGstClock;cdecl;external;
{$endif}
{ __GST_NET_CLIENT_CLOCK_H__  }

implementation

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
