unit 1;

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
{$ifndef __GST_PLAYER_MEDIA_INFO_H__}
{$define __GST_PLAYER_MEDIA_INFO_H__}
{$include <gst/gst.h>}
{$include <gst/player/player-prelude.h>}

{*
 * GstPlayerMediaInfo:
 *
 * Structure containing the media information of a URI.
  }
type

function gst_player_media_info_get_type:TGType;cdecl;external libgstplayer;
function gst_player_media_info_get_uri(info:PGstPlayerMediaInfo):Pgchar;cdecl;external libgstplayer;
function gst_player_media_info_is_seekable(info:PGstPlayerMediaInfo):Tgboolean;cdecl;external libgstplayer;
function gst_player_media_info_is_live(info:PGstPlayerMediaInfo):Tgboolean;cdecl;external libgstplayer;
function gst_player_media_info_get_duration(info:PGstPlayerMediaInfo):TGstClockTime;cdecl;external libgstplayer;
function gst_player_media_info_get_stream_list(info:PGstPlayerMediaInfo):PGList;cdecl;external libgstplayer;
function gst_player_media_info_get_number_of_streams(info:PGstPlayerMediaInfo):Tguint;cdecl;external libgstplayer;
function gst_player_media_info_get_video_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external libgstplayer;
function gst_player_media_info_get_number_of_video_streams(info:PGstPlayerMediaInfo):Tguint;cdecl;external libgstplayer;
function gst_player_media_info_get_audio_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external libgstplayer;
function gst_player_media_info_get_number_of_audio_streams(info:PGstPlayerMediaInfo):Tguint;cdecl;external libgstplayer;
function gst_player_media_info_get_subtitle_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external libgstplayer;
function gst_player_media_info_get_number_of_subtitle_streams(info:PGstPlayerMediaInfo):Tguint;cdecl;external libgstplayer;
function gst_player_media_info_get_tags(info:PGstPlayerMediaInfo):PGstTagList;cdecl;external libgstplayer;
function gst_player_media_info_get_title(info:PGstPlayerMediaInfo):Pgchar;cdecl;external libgstplayer;
function gst_player_media_info_get_container_format(info:PGstPlayerMediaInfo):Pgchar;cdecl;external libgstplayer;
function gst_player_media_info_get_image_sample(info:PGstPlayerMediaInfo):PGstSample;cdecl;external libgstplayer;
function gst_player_get_video_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external libgstplayer;
function gst_player_get_audio_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external libgstplayer;
function gst_player_get_subtitle_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external libgstplayer;
{$endif}
{ __GST_PLAYER_MEDIA_INFO_H  }

// === Konventiert am: 8-10-24 19:10:55 ===

function GST_TYPE_PLAYER_MEDIA_INFO : TGType;
function GST_PLAYER_MEDIA_INFO(obj : Pointer) : PGstPlayerMediaInfo;
function GST_PLAYER_MEDIA_INFO_CLASS(klass : Pointer) : PGstPlayerMediaInfoClass;
function GST_IS_PLAYER_MEDIA_INFO(obj : Pointer) : Tgboolean;
function GST_IS_PLAYER_MEDIA_INFO_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_PLAYER_MEDIA_INFO : TGType;
  begin
    GST_TYPE_PLAYER_MEDIA_INFO:=gst_player_media_info_get_type;
  end;

function GST_PLAYER_MEDIA_INFO(obj : Pointer) : PGstPlayerMediaInfo;
begin
  Result := PGstPlayerMediaInfo(g_type_check_instance_cast(obj, GST_TYPE_PLAYER_MEDIA_INFO));
end;

function GST_PLAYER_MEDIA_INFO_CLASS(klass : Pointer) : PGstPlayerMediaInfoClass;
begin
  Result := PGstPlayerMediaInfoClass(g_type_check_class_cast(klass, GST_TYPE_PLAYER_MEDIA_INFO));
end;

function GST_IS_PLAYER_MEDIA_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_PLAYER_MEDIA_INFO);
end;

function GST_IS_PLAYER_MEDIA_INFO_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_PLAYER_MEDIA_INFO);
end;



end.
