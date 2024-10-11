unit gstnettimeprovider;

interface

uses
  glib280, gst124;

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


function gst_net_time_provider_get_type:TGType;cdecl;external libgstnet;
function gst_net_time_provider_new(clock:PGstClock; address:Pgchar; port:Tgint):PGstNetTimeProvider;cdecl;external libgstnet;
{$endif}
{ __GST_NET_TIME_PROVIDER_H__  }

// === Konventiert am: 11-10-24 14:28:33 ===

function GST_TYPE_NET_TIME_PROVIDER : TGType;
function GST_NET_TIME_PROVIDER(obj : Pointer) : PGstNetTimeProvider;
function GST_NET_TIME_PROVIDER_CLASS(klass : Pointer) : PGstNetTimeProviderClass;
function GST_IS_NET_TIME_PROVIDER(obj : Pointer) : Tgboolean;
function GST_IS_NET_TIME_PROVIDER_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_NET_TIME_PROVIDER : TGType;
  begin
    GST_TYPE_NET_TIME_PROVIDER:=gst_net_time_provider_get_type;
  end;

function GST_NET_TIME_PROVIDER(obj : Pointer) : PGstNetTimeProvider;
begin
  Result := PGstNetTimeProvider(g_type_check_instance_cast(obj, GST_TYPE_NET_TIME_PROVIDER));
end;

function GST_NET_TIME_PROVIDER_CLASS(klass : Pointer) : PGstNetTimeProviderClass;
begin
  Result := PGstNetTimeProviderClass(g_type_check_class_cast(klass, GST_TYPE_NET_TIME_PROVIDER));
end;

function GST_IS_NET_TIME_PROVIDER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_NET_TIME_PROVIDER);
end;

function GST_IS_NET_TIME_PROVIDER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_NET_TIME_PROVIDER);
end;



end.
