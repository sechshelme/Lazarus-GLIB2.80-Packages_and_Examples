
unit gstnetutils;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstnetutils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstnetutils.h
}

Type
PGSocket = ^TGSocket;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2017 Sebastian Dröge <sebastian@centricular.com>
 * Copyright (C) 2017 Robert Rosengren <robertr@axis.com>
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
{$ifndef __GST_NET_UTILS_H__}
{$define __GST_NET_UTILS_H__}
{$include <glib.h>}
{$include <gio/gio.h>}
{$include <gst/net/net-prelude.h>}

function gst_net_utils_set_socket_tos(socket:PGSocket; qos_dscp:Tgint):Tgboolean;cdecl;external;
{$endif}
{ __GST_NET_UTILS_H__  }

implementation


end.
