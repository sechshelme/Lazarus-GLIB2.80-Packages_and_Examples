unit gstplayer_media_info;

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
 * GstPlayerStreamInfo:
 *
 * Base structure for information concerning a media stream. Depending on
 * the stream type, one can find more media-specific information in
 * #GstPlayerVideoInfo, #GstPlayerAudioInfo, #GstPlayerSubtitleInfo.
  }
type

function gst_player_stream_info_get_type:TGType;cdecl;external libgstplayer;
function gst_player_stream_info_get_index(info:PGstPlayerStreamInfo):Tgint;cdecl;external libgstplayer;
function gst_player_stream_info_get_stream_type(info:PGstPlayerStreamInfo):Pgchar;cdecl;external libgstplayer;
function gst_player_stream_info_get_tags(info:PGstPlayerStreamInfo):PGstTagList;cdecl;external libgstplayer;
function gst_player_stream_info_get_caps(info:PGstPlayerStreamInfo):PGstCaps;cdecl;external libgstplayer;
function gst_player_stream_info_get_codec(info:PGstPlayerStreamInfo):Pgchar;cdecl;external libgstplayer;
{ was #define dname def_expr }
function GST_TYPE_PLAYER_VIDEO_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_VIDEO_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_VIDEO_INFO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_VIDEO_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_VIDEO_INFO_CLASS(klass : longint) : longint;

{*
 * GstPlayerVideoInfo:
 *
 * #GstPlayerStreamInfo specific to video streams.
  }
type

function gst_player_video_info_get_type:TGType;cdecl;external libgstplayer;
function gst_player_video_info_get_bitrate(info:PGstPlayerVideoInfo):Tgint;cdecl;external libgstplayer;
function gst_player_video_info_get_max_bitrate(info:PGstPlayerVideoInfo):Tgint;cdecl;external libgstplayer;
function gst_player_video_info_get_width(info:PGstPlayerVideoInfo):Tgint;cdecl;external libgstplayer;
function gst_player_video_info_get_height(info:PGstPlayerVideoInfo):Tgint;cdecl;external libgstplayer;
procedure gst_player_video_info_get_framerate(info:PGstPlayerVideoInfo; fps_n:Pgint; fps_d:Pgint);cdecl;external libgstplayer;
procedure gst_player_video_info_get_pixel_aspect_ratio(info:PGstPlayerVideoInfo; par_n:Pguint; par_d:Pguint);cdecl;external libgstplayer;
{ was #define dname def_expr }
function GST_TYPE_PLAYER_AUDIO_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_AUDIO_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_AUDIO_INFO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_AUDIO_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_AUDIO_INFO_CLASS(klass : longint) : longint;

{*
 * GstPlayerAudioInfo:
 *
 * #GstPlayerStreamInfo specific to audio streams.
  }
type

function gst_player_audio_info_get_type:TGType;cdecl;external libgstplayer;
function gst_player_audio_info_get_channels(info:PGstPlayerAudioInfo):Tgint;cdecl;external libgstplayer;
function gst_player_audio_info_get_sample_rate(info:PGstPlayerAudioInfo):Tgint;cdecl;external libgstplayer;
function gst_player_audio_info_get_bitrate(info:PGstPlayerAudioInfo):Tgint;cdecl;external libgstplayer;
function gst_player_audio_info_get_max_bitrate(info:PGstPlayerAudioInfo):Tgint;cdecl;external libgstplayer;
function gst_player_audio_info_get_language(info:PGstPlayerAudioInfo):Pgchar;cdecl;external libgstplayer;
{ was #define dname def_expr }
function GST_TYPE_PLAYER_SUBTITLE_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_SUBTITLE_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_SUBTITLE_INFO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_SUBTITLE_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_SUBTITLE_INFO_CLASS(klass : longint) : longint;

{*
 * GstPlayerSubtitleInfo:
 *
 * #GstPlayerStreamInfo specific to subtitle streams.
  }
type

function gst_player_subtitle_info_get_type:TGType;cdecl;external libgstplayer;
function gst_player_subtitle_info_get_language(info:PGstPlayerSubtitleInfo):Pgchar;cdecl;external libgstplayer;
{ was #define dname def_expr }
function GST_TYPE_PLAYER_MEDIA_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_MEDIA_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_MEDIA_INFO_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_MEDIA_INFO(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_MEDIA_INFO_CLASS(klass : longint) : longint;

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

// === Konventiert am: 8-10-24 18:49:41 ===

function GST_TYPE_PLAYER_STREAM_INFO : TGType;
function GST_PLAYER_STREAM_INFO(obj : Pointer) : PGstPlayerStreamInfo;
function GST_PLAYER_STREAM_INFO_CLASS(klass : Pointer) : PGstPlayerStreamInfo;
function GST_IS_PLAYER_STREAM_INFO(obj : Pointer) : Tgboolean;
function GST_IS_PLAYER_STREAM_INFO_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_PLAYER_STREAM_INFO : TGType;
  begin
    GST_TYPE_PLAYER_STREAM_INFO:=gst_player_stream_info_get_type;
  end;

function GST_PLAYER_STREAM_INFO(obj : Pointer) : PGstPlayerStreamInfo;
begin
  Result := PGstPlayerStreamInfo(g_type_check_instance_cast(obj, GST_TYPE_PLAYER_STREAM_INFO));
end;

function GST_PLAYER_STREAM_INFO_CLASS(klass : Pointer) : PGstPlayerStreamInfo;
begin
  Result := PGstPlayerStreamInfo(g_type_check_class_cast(klass, GST_TYPE_PLAYER_STREAM_INFO));
end;

function GST_IS_PLAYER_STREAM_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_PLAYER_STREAM_INFO);
end;

function GST_IS_PLAYER_STREAM_INFO_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_PLAYER_STREAM_INFO);
end;


{ was #define dname def_expr }
function GST_TYPE_PLAYER_VIDEO_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAYER_VIDEO_INFO:=gst_player_video_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_VIDEO_INFO(obj : longint) : longint;
begin
  GST_PLAYER_VIDEO_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLAYER_VIDEO_INFO,GstPlayerVideoInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_VIDEO_INFO_CLASS(klass : longint) : longint;
begin
  GST_PLAYER_VIDEO_INFO_CLASS:=G_TYPE_CHECK_CLASS_CAST(obj,GST_TYPE_PLAYER_VIDEO_INFO,GstPlayerVideoInfoClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_VIDEO_INFO(obj : longint) : longint;
begin
  GST_IS_PLAYER_VIDEO_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLAYER_VIDEO_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_VIDEO_INFO_CLASS(klass : longint) : longint;
begin
  GST_IS_PLAYER_VIDEO_INFO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(obj,GST_TYPE_PLAYER_VIDEO_INFO);
end;

{ was #define dname def_expr }
function GST_TYPE_PLAYER_AUDIO_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAYER_AUDIO_INFO:=gst_player_audio_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_AUDIO_INFO(obj : longint) : longint;
begin
  GST_PLAYER_AUDIO_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLAYER_AUDIO_INFO,GstPlayerAudioInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_AUDIO_INFO_CLASS(klass : longint) : longint;
begin
  GST_PLAYER_AUDIO_INFO_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PLAYER_AUDIO_INFO,GstPlayerAudioInfoClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_AUDIO_INFO(obj : longint) : longint;
begin
  GST_IS_PLAYER_AUDIO_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLAYER_AUDIO_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_AUDIO_INFO_CLASS(klass : longint) : longint;
begin
  GST_IS_PLAYER_AUDIO_INFO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PLAYER_AUDIO_INFO);
end;

{ was #define dname def_expr }
function GST_TYPE_PLAYER_SUBTITLE_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAYER_SUBTITLE_INFO:=gst_player_subtitle_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_SUBTITLE_INFO(obj : longint) : longint;
begin
  GST_PLAYER_SUBTITLE_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLAYER_SUBTITLE_INFO,GstPlayerSubtitleInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_SUBTITLE_INFO_CLASS(klass : longint) : longint;
begin
  GST_PLAYER_SUBTITLE_INFO_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PLAYER_SUBTITLE_INFO,GstPlayerSubtitleInfoClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_SUBTITLE_INFO(obj : longint) : longint;
begin
  GST_IS_PLAYER_SUBTITLE_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLAYER_SUBTITLE_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_SUBTITLE_INFO_CLASS(klass : longint) : longint;
begin
  GST_IS_PLAYER_SUBTITLE_INFO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PLAYER_SUBTITLE_INFO);
end;

{ was #define dname def_expr }
function GST_TYPE_PLAYER_MEDIA_INFO : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAYER_MEDIA_INFO:=gst_player_media_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_MEDIA_INFO(obj : longint) : longint;
begin
  GST_PLAYER_MEDIA_INFO:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLAYER_MEDIA_INFO,GstPlayerMediaInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_MEDIA_INFO_CLASS(klass : longint) : longint;
begin
  GST_PLAYER_MEDIA_INFO_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PLAYER_MEDIA_INFO,GstPlayerMediaInfoClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_MEDIA_INFO(obj : longint) : longint;
begin
  GST_IS_PLAYER_MEDIA_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLAYER_MEDIA_INFO);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_MEDIA_INFO_CLASS(klass : longint) : longint;
begin
  GST_IS_PLAYER_MEDIA_INFO_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PLAYER_MEDIA_INFO);
end;


end.
