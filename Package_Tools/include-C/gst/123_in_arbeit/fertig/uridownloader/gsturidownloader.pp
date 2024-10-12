
unit gsturidownloader;
interface

{
  Automatically converted by H2Pas 0.99.16 from gsturidownloader.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsturidownloader.h
}

Type
Pgchar = ^Tgchar;
PGError = ^TGError;
PGstElement = ^TGstElement;
PGstFragment = ^TGstFragment;
PGstUriDownloader = ^TGstUriDownloader;
PGstUriDownloaderClass = ^TGstUriDownloaderClass;
PGstUriDownloaderPrivate = ^TGstUriDownloaderPrivate;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2011 Andoni Morales Alastruey <ylatuya@gmail.com>
 *
 * gsturidownloader.h:
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
 * Youshould have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GSTURI_DOWNLOADER_H__}
{$define __GSTURI_DOWNLOADER_H__}
{$ifndef GST_USE_UNSTABLE_API}
{#warning "The UriDownloaded library from gst-plugins-bad is unstable API and may change in future." }
{#warning "You can define GST_USE_UNSTABLE_API to avoid this warning." }
{$endif}
{$include <glib-object.h>}
{$include <gst/gst.h>}
{$include "gstfragment.h"}

{ was #define dname def_expr }
function GST_TYPE_URI_DOWNLOADER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_URI_DOWNLOADER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_URI_DOWNLOADER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_URI_DOWNLOADER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_URI_DOWNLOADER_CLASS(klass : longint) : longint;

type
  PGstUriDownloader = ^TGstUriDownloader;
  TGstUriDownloader = record
      parent : TGstObject;
      priv : PGstUriDownloaderPrivate;
    end;

{< private > }
  PGstUriDownloaderClass = ^TGstUriDownloaderClass;
  TGstUriDownloaderClass = record
      parent_class : TGstObjectClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_uri_downloader_get_type:TGType;cdecl;external;
function gst_uri_downloader_new:PGstUriDownloader;cdecl;external;
procedure gst_uri_downloader_set_parent(downloader:PGstUriDownloader; parent:PGstElement);cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function gst_uri_downloader_fetch_uri(downloader:PGstUriDownloader; uri:Pgchar; referer:Pgchar; compress:Tgboolean; refresh:Tgboolean; 
           allow_cache:Tgboolean; err:PPGError):PGstFragment;cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function gst_uri_downloader_fetch_uri_with_range(downloader:PGstUriDownloader; uri:Pgchar; referer:Pgchar; compress:Tgboolean; refresh:Tgboolean; 
           allow_cache:Tgboolean; range_start:Tgint64; range_end:Tgint64; err:PPGError):PGstFragment;cdecl;external;
procedure gst_uri_downloader_reset(downloader:PGstUriDownloader);cdecl;external;
procedure gst_uri_downloader_cancel(downloader:PGstUriDownloader);cdecl;external;
{$endif}
{ __GSTURIDOWNLOADER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_URI_DOWNLOADER : longint; { return type might be wrong }
  begin
    GST_TYPE_URI_DOWNLOADER:=gst_uri_downloader_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_URI_DOWNLOADER(obj : longint) : longint;
begin
  GST_URI_DOWNLOADER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_URI_DOWNLOADER,GstUriDownloader);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_URI_DOWNLOADER_CLASS(klass : longint) : longint;
begin
  GST_URI_DOWNLOADER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_URI_DOWNLOADER,GstUriDownloaderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_URI_DOWNLOADER(obj : longint) : longint;
begin
  GST_IS_URI_DOWNLOADER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_URI_DOWNLOADER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_URI_DOWNLOADER_CLASS(klass : longint) : longint;
begin
  GST_IS_URI_DOWNLOADER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_URI_DOWNLOADER);
end;


end.
