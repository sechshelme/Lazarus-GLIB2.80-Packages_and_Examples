
unit gstnettimeprovider;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstnettimeprovider.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstnettimeprovider.h
}

Type
Pgchar = ^Tgchar;
PGstClock = ^TGstClock;
PGstNetTimeProvider = ^TGstNetTimeProvider;
PGstNetTimeProviderClass = ^TGstNetTimeProviderClass;
PGstNetTimeProviderPrivate = ^TGstNetTimeProviderPrivate;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2005 Andy Wingo <wingo@pobox.com>
 *               2006 Joni Valtanen <joni.valtanen@movial.fi>
 * Copyright (C) 2012 Collabora Ltd. <tim.muller@collabora.co.uk>
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
{$ifndef __GST_NET_TIME_PROVIDER_H__}
{$define __GST_NET_TIME_PROVIDER_H__}
{$include <gst/gst.h>}
{$include <gst/net/net-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_NET_TIME_PROVIDER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NET_TIME_PROVIDER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NET_TIME_PROVIDER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_NET_TIME_PROVIDER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_NET_TIME_PROVIDER_CLASS(klass : longint) : longint;

type
{*
 * GstNetTimeProvider:
 *
 * Opaque #GstNetTimeProvider structure.
  }
{< private > }
  PGstNetTimeProvider = ^TGstNetTimeProvider;
  TGstNetTimeProvider = record
      parent : TGstObject;
      priv : PGstNetTimeProviderPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

  PGstNetTimeProviderClass = ^TGstNetTimeProviderClass;
  TGstNetTimeProviderClass = record
      parent_class : TGstObjectClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_net_time_provider_get_type:TGType;cdecl;external;
(* Const before declarator ignored *)
function gst_net_time_provider_new(clock:PGstClock; address:Pgchar; port:Tgint):PGstNetTimeProvider;cdecl;external;
{$endif}
{ __GST_NET_TIME_PROVIDER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_NET_TIME_PROVIDER : longint; { return type might be wrong }
  begin
    GST_TYPE_NET_TIME_PROVIDER:=gst_net_time_provider_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NET_TIME_PROVIDER(obj : longint) : longint;
begin
  GST_NET_TIME_PROVIDER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_NET_TIME_PROVIDER,GstNetTimeProvider);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_NET_TIME_PROVIDER_CLASS(klass : longint) : longint;
begin
  GST_NET_TIME_PROVIDER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_NET_TIME_PROVIDER,GstNetTimeProviderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_NET_TIME_PROVIDER(obj : longint) : longint;
begin
  GST_IS_NET_TIME_PROVIDER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_NET_TIME_PROVIDER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_NET_TIME_PROVIDER_CLASS(klass : longint) : longint;
begin
  GST_IS_NET_TIME_PROVIDER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_NET_TIME_PROVIDER);
end;


end.
