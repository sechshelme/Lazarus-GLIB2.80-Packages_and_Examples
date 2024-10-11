unit 2;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2015 Brijesh Singh <brijesh.ksingh@gmail.com>
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
{$ifndef __GST_PLAY_MEDIA_INFO_H__}
{$define __GST_PLAY_MEDIA_INFO_H__}
{$include <gst/gst.h>}
{$include <gst/play/play-prelude.h>}
{*
 * GST_TYPE_PLAY_STREAM_INFO:
 * Since: 1.20
  }

{*
 * GstPlayMediaInfo:
 *
 * Structure containing the media information of a URI.
 * Since: 1.20
  }
type
{$ifdef G_DEFINE_AUTOPTR_CLEANUP_FUNC}
{$endif}

function gst_play_media_info_get_type:TGType;cdecl;external libgstplay;
function gst_play_media_info_get_uri(info:PGstPlayMediaInfo):Pgchar;cdecl;external libgstplay;
function gst_play_media_info_is_seekable(info:PGstPlayMediaInfo):Tgboolean;cdecl;external libgstplay;
function gst_play_media_info_is_live(info:PGstPlayMediaInfo):Tgboolean;cdecl;external libgstplay;
function gst_play_media_info_get_duration(info:PGstPlayMediaInfo):TGstClockTime;cdecl;external libgstplay;
function gst_play_media_info_get_stream_list(info:PGstPlayMediaInfo):PGList;cdecl;external libgstplay;
function gst_play_media_info_get_number_of_streams(info:PGstPlayMediaInfo):Tguint;cdecl;external libgstplay;
function gst_play_media_info_get_video_streams(info:PGstPlayMediaInfo):PGList;cdecl;external libgstplay;
function gst_play_media_info_get_number_of_video_streams(info:PGstPlayMediaInfo):Tguint;cdecl;external libgstplay;
function gst_play_media_info_get_audio_streams(info:PGstPlayMediaInfo):PGList;cdecl;external libgstplay;
function gst_play_media_info_get_number_of_audio_streams(info:PGstPlayMediaInfo):Tguint;cdecl;external libgstplay;
function gst_play_media_info_get_subtitle_streams(info:PGstPlayMediaInfo):PGList;cdecl;external libgstplay;
function gst_play_media_info_get_number_of_subtitle_streams(info:PGstPlayMediaInfo):Tguint;cdecl;external libgstplay;
function gst_play_media_info_get_tags(info:PGstPlayMediaInfo):PGstTagList;cdecl;external libgstplay;
function gst_play_media_info_get_title(info:PGstPlayMediaInfo):Pgchar;cdecl;external libgstplay;
function gst_play_media_info_get_container_format(info:PGstPlayMediaInfo):Pgchar;cdecl;external libgstplay;
function gst_play_media_info_get_image_sample(info:PGstPlayMediaInfo):PGstSample;cdecl;external libgstplay;
function gst_play_get_video_streams(info:PGstPlayMediaInfo):PGList;cdecl;external libgstplay;
function gst_play_get_audio_streams(info:PGstPlayMediaInfo):PGList;cdecl;external libgstplay;
function gst_play_get_subtitle_streams(info:PGstPlayMediaInfo):PGList;cdecl;external libgstplay;
{$endif}
{ __GST_PLAY_MEDIA_INFO_H  }

// === Konventiert am: 11-10-24 19:44:52 ===

function GST_TYPE_PLAY_MEDIA_INFO : TGType;
function GST_PLAY_MEDIA_INFO(obj : Pointer) : PGstPlayMediaInfo;
function GST_PLAY_MEDIA_INFO_CLASS(klass : Pointer) : PGstPlayMediaInfoClass;
function GST_IS_PLAY_MEDIA_INFO(obj : Pointer) : Tgboolean;
function GST_IS_PLAY_MEDIA_INFO_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_PLAY_MEDIA_INFO : TGType;
  begin
    GST_TYPE_PLAY_MEDIA_INFO:=gst_play_media_info_get_type;
  end;

function GST_PLAY_MEDIA_INFO(obj : Pointer) : PGstPlayMediaInfo;
begin
  Result := PGstPlayMediaInfo(g_type_check_instance_cast(obj, GST_TYPE_PLAY_MEDIA_INFO));
end;

function GST_PLAY_MEDIA_INFO_CLASS(klass : Pointer) : PGstPlayMediaInfoClass;
begin
  Result := PGstPlayMediaInfoClass(g_type_check_class_cast(klass, GST_TYPE_PLAY_MEDIA_INFO));
end;

function GST_IS_PLAY_MEDIA_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_PLAY_MEDIA_INFO);
end;

function GST_IS_PLAY_MEDIA_INFO_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_PLAY_MEDIA_INFO);
end;



end.
