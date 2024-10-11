
unit gstplay;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstplay.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstplay.h
}

Type
Pgboolean = ^Tgboolean;
Pgchar = ^Tgchar;
Pgdouble = ^Tgdouble;
PGError = ^TGError;
PGstBus = ^TGstBus;
PGstClockTime = ^TGstClockTime;
PGstElement = ^TGstElement;
PGstMessage = ^TGstMessage;
PGstPlay = ^TGstPlay;
PGstPlayAudioInfo = ^TGstPlayAudioInfo;
PGstPlayMediaInfo = ^TGstPlayMediaInfo;
PGstPlaySubtitleInfo = ^TGstPlaySubtitleInfo;
PGstPlayVideoInfo = ^TGstPlayVideoInfo;
PGstPlayVideoRenderer = ^TGstPlayVideoRenderer;
PGstSample = ^TGstSample;
PGstStructure = ^TGstStructure;
Pguint = ^Tguint;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2014-2015 Sebastian Dröge <sebastian@centricular.com>
 * Copyright (C) 2019-2020 Stephan Hesse <stephan@emliri.com>
 * Copyright (C) 2020 Philippe Normand <philn@igalia.com>
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
{$ifndef __GST_PLAY_H__}
{$define __GST_PLAY_H__}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{$include <gst/play/play-prelude.h>}
{$include <gst/play/gstplay-types.h>}
{$include <gst/play/gstplay-video-renderer.h>}
{$include <gst/play/gstplay-media-info.h>}

{ was #define dname def_expr }
function GST_TYPE_PLAY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY_GET_CLASS(obj : longint) : longint;

function gst_play_state_get_type:TGType;cdecl;external;
{*
 * GST_TYPE_PLAY_STATE:
 * Since: 1.20
  }
{ was #define dname def_expr }
function GST_TYPE_PLAY_STATE : longint; { return type might be wrong }

function gst_play_message_get_type:TGType;cdecl;external;
{*
 * GST_TYPE_PLAY_MESSAGE:
 * Since: 1.20
  }
{ was #define dname def_expr }
function GST_TYPE_PLAY_MESSAGE : longint; { return type might be wrong }

{*
 * GstPlayState:
 * @GST_PLAY_STATE_STOPPED: the play is stopped.
 * @GST_PLAY_STATE_BUFFERING: the play is buffering.
 * @GST_PLAY_STATE_PAUSED: the play is paused.
 * @GST_PLAY_STATE_PLAYING: the play is currently playing a
 * stream.
 *
 * Since: 1.20
  }
type
  PGstPlayState = ^TGstPlayState;
  TGstPlayState =  Longint;
  Const
    GST_PLAY_STATE_STOPPED = 0;
    GST_PLAY_STATE_BUFFERING = 1;
    GST_PLAY_STATE_PAUSED = 2;
    GST_PLAY_STATE_PLAYING = 3;
;
{*
 * GstPlayMessage:
 * @GST_PLAY_MESSAGE_URI_LOADED: Source element was initalized for set URI
 * @GST_PLAY_MESSAGE_POSITION_UPDATED: Sink position changed
 * @GST_PLAY_MESSAGE_DURATION_CHANGED: Duration of stream changed
 * @GST_PLAY_MESSAGE_STATE_CHANGED: State changed, see #GstPlayState
 * @GST_PLAY_MESSAGE_BUFFERING: Pipeline is in buffering state, message contains the percentage value of the decoding buffer
 * @GST_PLAY_MESSAGE_END_OF_STREAM: Sink has received EOS
 * @GST_PLAY_MESSAGE_ERROR: Message contains an error
 * @GST_PLAY_MESSAGE_WARNING: Message contains an error
 * @GST_PLAY_MESSAGE_VIDEO_DIMENSIONS_CHANGED: Video sink received format in different dimensions than before
 * @GST_PLAY_MESSAGE_MEDIA_INFO_UPDATED: A media-info property has changed, message contains current #GstPlayMediaInfo
 * @GST_PLAY_MESSAGE_VOLUME_CHANGED: The volume of the audio ouput has changed
 * @GST_PLAY_MESSAGE_MUTE_CHANGED: Audio muting flag has been toggled
 * @GST_PLAY_MESSAGE_SEEK_DONE: Any pending seeking operation has been completed
 *
 * Since: 1.20
 *
 * Types of messages that will be posted on the play API bus.
 *
 * See also #gst_play_get_message_bus()
 *
  }
type
  PGstPlayMessage = ^TGstPlayMessage;
  TGstPlayMessage =  Longint;
  Const
    GST_PLAY_MESSAGE_URI_LOADED = 0;
    GST_PLAY_MESSAGE_POSITION_UPDATED = 1;
    GST_PLAY_MESSAGE_DURATION_CHANGED = 2;
    GST_PLAY_MESSAGE_STATE_CHANGED = 3;
    GST_PLAY_MESSAGE_BUFFERING = 4;
    GST_PLAY_MESSAGE_END_OF_STREAM = 5;
    GST_PLAY_MESSAGE_ERROR = 6;
    GST_PLAY_MESSAGE_WARNING = 7;
    GST_PLAY_MESSAGE_VIDEO_DIMENSIONS_CHANGED = 8;
    GST_PLAY_MESSAGE_MEDIA_INFO_UPDATED = 9;
    GST_PLAY_MESSAGE_VOLUME_CHANGED = 10;
    GST_PLAY_MESSAGE_MUTE_CHANGED = 11;
    GST_PLAY_MESSAGE_SEEK_DONE = 12;
;
(* Const before declarator ignored *)

function gst_play_state_get_name(state:TGstPlayState):Pgchar;cdecl;external;
(* Const before declarator ignored *)
function gst_play_message_get_name(message_type:TGstPlayMessage):Pgchar;cdecl;external;
function gst_play_error_quark:TGQuark;cdecl;external;
function gst_play_error_get_type:TGType;cdecl;external;
{*
 * GST_PLAY_ERROR:
 *
 * Since: 1.20
  }
{ was #define dname def_expr }
function GST_PLAY_ERROR : longint; { return type might be wrong }

{*
 * GST_TYPE_PLAY_ERROR:
 *
 * Since: 1.20
  }
{ was #define dname def_expr }
function GST_TYPE_PLAY_ERROR : longint; { return type might be wrong }

{*
 * GstPlayError:
 * @GST_PLAY_ERROR_FAILED: generic error.
 *
 * Since: 1.20
  }
type
  PGstPlayError = ^TGstPlayError;
  TGstPlayError =  Longint;
  Const
    GST_PLAY_ERROR_FAILED = &;
;
(* Const before declarator ignored *)

function gst_play_error_get_name(error:TGstPlayError):Pgchar;cdecl;external;
function gst_play_color_balance_type_get_type:TGType;cdecl;external;
{*
 * GST_TYPE_PLAY_COLOR_BALANCE_TYPE:
 *
 * Since: 1.20
  }
{ was #define dname def_expr }
function GST_TYPE_PLAY_COLOR_BALANCE_TYPE : longint; { return type might be wrong }

{*
 * GstPlayColorBalanceType:
 * @GST_PLAY_COLOR_BALANCE_BRIGHTNESS: brightness or black level.
 * @GST_PLAY_COLOR_BALANCE_CONTRAST: contrast or luma gain.
 * @GST_PLAY_COLOR_BALANCE_SATURATION: color saturation or chroma
 * gain.
 * @GST_PLAY_COLOR_BALANCE_HUE: hue or color balance.
 *
 * Since: 1.20
  }
type
  PGstPlayColorBalanceType = ^TGstPlayColorBalanceType;
  TGstPlayColorBalanceType =  Longint;
  Const
    GST_PLAY_COLOR_BALANCE_BRIGHTNESS = 0;
    GST_PLAY_COLOR_BALANCE_CONTRAST = 1;
    GST_PLAY_COLOR_BALANCE_SATURATION = 2;
    GST_PLAY_COLOR_BALANCE_HUE = 3;
;
(* Const before declarator ignored *)

function gst_play_color_balance_type_get_name(_type:TGstPlayColorBalanceType):Pgchar;cdecl;external;
{*
 * GST_PLAY_CAST:
 * Since: 1.20
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLAY_CAST(obj : longint) : PGstPlay;

{$ifdef G_DEFINE_AUTOPTR_CLEANUP_FUNC}
{$endif}
function gst_play_get_type:TGType;cdecl;external;
function gst_play_new(video_renderer:PGstPlayVideoRenderer):PGstPlay;cdecl;external;
function gst_play_get_message_bus(play:PGstPlay):PGstBus;cdecl;external;
procedure gst_play_play(play:PGstPlay);cdecl;external;
procedure gst_play_pause(play:PGstPlay);cdecl;external;
procedure gst_play_stop(play:PGstPlay);cdecl;external;
procedure gst_play_seek(play:PGstPlay; position:TGstClockTime);cdecl;external;
procedure gst_play_set_rate(play:PGstPlay; rate:Tgdouble);cdecl;external;
function gst_play_get_rate(play:PGstPlay):Tgdouble;cdecl;external;
function gst_play_get_uri(play:PGstPlay):Pgchar;cdecl;external;
(* Const before declarator ignored *)
procedure gst_play_set_uri(play:PGstPlay; uri:Pgchar);cdecl;external;
function gst_play_get_subtitle_uri(play:PGstPlay):Pgchar;cdecl;external;
(* Const before declarator ignored *)
procedure gst_play_set_subtitle_uri(play:PGstPlay; uri:Pgchar);cdecl;external;
function gst_play_get_position(play:PGstPlay):TGstClockTime;cdecl;external;
function gst_play_get_duration(play:PGstPlay):TGstClockTime;cdecl;external;
function gst_play_get_volume(play:PGstPlay):Tgdouble;cdecl;external;
procedure gst_play_set_volume(play:PGstPlay; val:Tgdouble);cdecl;external;
function gst_play_get_mute(play:PGstPlay):Tgboolean;cdecl;external;
procedure gst_play_set_mute(play:PGstPlay; val:Tgboolean);cdecl;external;
function gst_play_get_pipeline(play:PGstPlay):PGstElement;cdecl;external;
procedure gst_play_set_video_track_enabled(play:PGstPlay; enabled:Tgboolean);cdecl;external;
procedure gst_play_set_audio_track_enabled(play:PGstPlay; enabled:Tgboolean);cdecl;external;
procedure gst_play_set_subtitle_track_enabled(play:PGstPlay; enabled:Tgboolean);cdecl;external;
function gst_play_set_audio_track(play:PGstPlay; stream_index:Tgint):Tgboolean;cdecl;external;
function gst_play_set_video_track(play:PGstPlay; stream_index:Tgint):Tgboolean;cdecl;external;
function gst_play_set_subtitle_track(play:PGstPlay; stream_index:Tgint):Tgboolean;cdecl;external;
function gst_play_get_media_info(play:PGstPlay):PGstPlayMediaInfo;cdecl;external;
function gst_play_get_current_audio_track(play:PGstPlay):PGstPlayAudioInfo;cdecl;external;
function gst_play_get_current_video_track(play:PGstPlay):PGstPlayVideoInfo;cdecl;external;
function gst_play_get_current_subtitle_track(play:PGstPlay):PGstPlaySubtitleInfo;cdecl;external;
(* Const before declarator ignored *)
function gst_play_set_visualization(play:PGstPlay; name:Pgchar):Tgboolean;cdecl;external;
procedure gst_play_set_visualization_enabled(play:PGstPlay; enabled:Tgboolean);cdecl;external;
function gst_play_get_current_visualization(play:PGstPlay):Pgchar;cdecl;external;
function gst_play_has_color_balance(play:PGstPlay):Tgboolean;cdecl;external;
procedure gst_play_set_color_balance(play:PGstPlay; _type:TGstPlayColorBalanceType; value:Tgdouble);cdecl;external;
function gst_play_get_color_balance(play:PGstPlay; _type:TGstPlayColorBalanceType):Tgdouble;cdecl;external;
function gst_play_get_multiview_mode(play:PGstPlay):TGstVideoMultiviewFramePacking;cdecl;external;
procedure gst_play_set_multiview_mode(play:PGstPlay; mode:TGstVideoMultiviewFramePacking);cdecl;external;
function gst_play_get_multiview_flags(play:PGstPlay):TGstVideoMultiviewFlags;cdecl;external;
procedure gst_play_set_multiview_flags(play:PGstPlay; flags:TGstVideoMultiviewFlags);cdecl;external;
function gst_play_get_audio_video_offset(play:PGstPlay):Tgint64;cdecl;external;
procedure gst_play_set_audio_video_offset(play:PGstPlay; offset:Tgint64);cdecl;external;
function gst_play_get_subtitle_video_offset(play:PGstPlay):Tgint64;cdecl;external;
procedure gst_play_set_subtitle_video_offset(play:PGstPlay; offset:Tgint64);cdecl;external;
function gst_play_set_config(play:PGstPlay; config:PGstStructure):Tgboolean;cdecl;external;
function gst_play_get_config(play:PGstPlay):PGstStructure;cdecl;external;
{ helpers for configuring the config structure  }
(* Const before declarator ignored *)
procedure gst_play_config_set_user_agent(config:PGstStructure; agent:Pgchar);cdecl;external;
(* Const before declarator ignored *)
function gst_play_config_get_user_agent(config:PGstStructure):Pgchar;cdecl;external;
procedure gst_play_config_set_position_update_interval(config:PGstStructure; interval:Tguint);cdecl;external;
(* Const before declarator ignored *)
function gst_play_config_get_position_update_interval(config:PGstStructure):Tguint;cdecl;external;
procedure gst_play_config_set_seek_accurate(config:PGstStructure; accurate:Tgboolean);cdecl;external;
(* Const before declarator ignored *)
function gst_play_config_get_seek_accurate(config:PGstStructure):Tgboolean;cdecl;external;
procedure gst_play_config_set_pipeline_dump_in_error_details(config:PGstStructure; value:Tgboolean);cdecl;external;
(* Const before declarator ignored *)
function gst_play_config_get_pipeline_dump_in_error_details(config:PGstStructure):Tgboolean;cdecl;external;
{*
 * GstPlaySnapshotFormat:
 * @GST_PLAY_THUMBNAIL_RAW_NATIVE: raw native format.
 * @GST_PLAY_THUMBNAIL_RAW_xRGB: raw xRGB format.
 * @GST_PLAY_THUMBNAIL_RAW_BGRx: raw BGRx format.
 * @GST_PLAY_THUMBNAIL_JPG: jpeg format.
 * @GST_PLAY_THUMBNAIL_PNG: png format.
 *
 * Since: 1.20
  }
type
  PGstPlaySnapshotFormat = ^TGstPlaySnapshotFormat;
  TGstPlaySnapshotFormat =  Longint;
  Const
    GST_PLAY_THUMBNAIL_RAW_NATIVE = &;
    GST_PLAY_THUMBNAIL_RAW_xRGB = (&)+1;
    GST_PLAY_THUMBNAIL_RAW_BGRx = (&)+2;
    GST_PLAY_THUMBNAIL_JPG = (&)+3;
    GST_PLAY_THUMBNAIL_PNG = (&)+4;
;
(* Const before declarator ignored *)

function gst_play_get_video_snapshot(play:PGstPlay; format:TGstPlaySnapshotFormat; config:PGstStructure):PGstSample;cdecl;external;
function gst_play_is_play_message(msg:PGstMessage):Tgboolean;cdecl;external;
procedure gst_play_message_parse_type(msg:PGstMessage; _type:PGstPlayMessage);cdecl;external;
procedure gst_play_message_parse_duration_updated(msg:PGstMessage; duration:PGstClockTime);cdecl;external;
procedure gst_play_message_parse_position_updated(msg:PGstMessage; position:PGstClockTime);cdecl;external;
procedure gst_play_message_parse_state_changed(msg:PGstMessage; state:PGstPlayState);cdecl;external;
procedure gst_play_message_parse_buffering_percent(msg:PGstMessage; percent:Pguint);cdecl;external;
procedure gst_play_message_parse_error(msg:PGstMessage; error:PPGError; details:PPGstStructure);cdecl;external;
procedure gst_play_message_parse_warning(msg:PGstMessage; error:PPGError; details:PPGstStructure);cdecl;external;
procedure gst_play_message_parse_video_dimensions_changed(msg:PGstMessage; width:Pguint; height:Pguint);cdecl;external;
procedure gst_play_message_parse_media_info_updated(msg:PGstMessage; info:PPGstPlayMediaInfo);cdecl;external;
procedure gst_play_message_parse_volume_changed(msg:PGstMessage; volume:Pgdouble);cdecl;external;
procedure gst_play_message_parse_muted_changed(msg:PGstMessage; muted:Pgboolean);cdecl;external;
{$endif}
{ __GST_PLAY_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_PLAY : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAY:=gst_play_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY(obj : longint) : longint;
begin
  GST_PLAY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLAY,GstPlay);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY_CLASS(klass : longint) : longint;
begin
  GST_PLAY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PLAY,GstPlayClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAY(obj : longint) : longint;
begin
  GST_IS_PLAY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLAY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAY_CLASS(klass : longint) : longint;
begin
  GST_IS_PLAY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PLAY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY_GET_CLASS(obj : longint) : longint;
begin
  GST_PLAY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_PLAY,GstPlayClass);
end;

{ was #define dname def_expr }
function GST_TYPE_PLAY_STATE : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAY_STATE:=gst_play_state_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_PLAY_MESSAGE : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAY_MESSAGE:=gst_play_message_get_type;
  end;

{ was #define dname def_expr }
function GST_PLAY_ERROR : longint; { return type might be wrong }
  begin
    GST_PLAY_ERROR:=gst_play_error_quark;
  end;

{ was #define dname def_expr }
function GST_TYPE_PLAY_ERROR : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAY_ERROR:=gst_play_error_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_PLAY_COLOR_BALANCE_TYPE : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAY_COLOR_BALANCE_TYPE:=gst_play_color_balance_type_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLAY_CAST(obj : longint) : PGstPlay;
begin
  GST_PLAY_CAST:=PGstPlay(obj);
end;


end.
