unit gsturidownloader;

interface

uses
  glib280, gst124;

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


function gst_uri_downloader_get_type:TGType;cdecl;external libgsturidownloader;
function gst_uri_downloader_new:PGstUriDownloader;cdecl;external libgsturidownloader;
procedure gst_uri_downloader_set_parent(downloader:PGstUriDownloader; parent:PGstElement);cdecl;external libgsturidownloader;
function gst_uri_downloader_fetch_uri(downloader:PGstUriDownloader; uri:Pgchar; referer:Pgchar; compress:Tgboolean; refresh:Tgboolean; 
           allow_cache:Tgboolean; err:PPGError):PGstFragment;cdecl;external libgsturidownloader;
function gst_uri_downloader_fetch_uri_with_range(downloader:PGstUriDownloader; uri:Pgchar; referer:Pgchar; compress:Tgboolean; refresh:Tgboolean; 
           allow_cache:Tgboolean; range_start:Tgint64; range_end:Tgint64; err:PPGError):PGstFragment;cdecl;external libgsturidownloader;
procedure gst_uri_downloader_reset(downloader:PGstUriDownloader);cdecl;external libgsturidownloader;
procedure gst_uri_downloader_cancel(downloader:PGstUriDownloader);cdecl;external libgsturidownloader;
{$endif}
{ __GSTURIDOWNLOADER_H__  }

// === Konventiert am: 12-10-24 19:27:15 ===

function GST_TYPE_URI_DOWNLOADER : TGType;
function GST_URI_DOWNLOADER(obj : Pointer) : PGstUriDownloader;
function GST_URI_DOWNLOADER_CLASS(klass : Pointer) : PGstUriDownloaderClass;
function GST_IS_URI_DOWNLOADER(obj : Pointer) : Tgboolean;
function GST_IS_URI_DOWNLOADER_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_URI_DOWNLOADER : TGType;
  begin
    GST_TYPE_URI_DOWNLOADER:=gst_uri_downloader_get_type;
  end;

function GST_URI_DOWNLOADER(obj : Pointer) : PGstUriDownloader;
begin
  Result := PGstUriDownloader(g_type_check_instance_cast(obj, GST_TYPE_URI_DOWNLOADER));
end;

function GST_URI_DOWNLOADER_CLASS(klass : Pointer) : PGstUriDownloaderClass;
begin
  Result := PGstUriDownloaderClass(g_type_check_class_cast(klass, GST_TYPE_URI_DOWNLOADER));
end;

function GST_IS_URI_DOWNLOADER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_URI_DOWNLOADER);
end;

function GST_IS_URI_DOWNLOADER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_URI_DOWNLOADER);
end;



end.
