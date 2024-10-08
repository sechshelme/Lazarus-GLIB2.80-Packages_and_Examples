
unit gstplayer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstplayer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstplayer.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
PGstElement  = ^GstElement;
PGstPlayer  = ^GstPlayer;
PGstPlayerAudioInfo  = ^GstPlayerAudioInfo;
PGstPlayerColorBalanceType  = ^GstPlayerColorBalanceType;
PGstPlayerError  = ^GstPlayerError;
PGstPlayerMediaInfo  = ^GstPlayerMediaInfo;
PGstPlayerSignalDispatcher  = ^GstPlayerSignalDispatcher;
PGstPlayerSnapshotFormat  = ^GstPlayerSnapshotFormat;
PGstPlayerState  = ^GstPlayerState;
PGstPlayerSubtitleInfo  = ^GstPlayerSubtitleInfo;
PGstPlayerVideoInfo  = ^GstPlayerVideoInfo;
PGstPlayerVideoRenderer  = ^GstPlayerVideoRenderer;
PGstSample  = ^GstSample;
PGstStructure  = ^GstStructure;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2014-2015 Sebastian Dröge <sebastian@centricular.com>
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
{$ifndef __GST_PLAYER_H__}
{$define __GST_PLAYER_H__}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{$include <gst/player/player-prelude.h>}
{$include <gst/player/gstplayer-types.h>}
{$include <gst/player/gstplayer-signal-dispatcher.h>}
{$include <gst/player/gstplayer-video-renderer.h>}
{$include <gst/player/gstplayer-media-info.h>}

{ was #define dname def_expr }
function GST_TYPE_PLAYER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLAYER_CAST(obj : longint) : PGstPlayer;

function gst_player_state_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_PLAYER_STATE : longint; { return type might be wrong }

{*
 * GstPlayerState:
 * @GST_PLAYER_STATE_STOPPED: the player is stopped.
 * @GST_PLAYER_STATE_BUFFERING: the player is buffering.
 * @GST_PLAYER_STATE_PAUSED: the player is paused.
 * @GST_PLAYER_STATE_PLAYING: the player is currently playing a
 * stream.
  }
type
  PGstPlayerState = ^TGstPlayerState;
  TGstPlayerState =  Longint;
  Const
    GST_PLAYER_STATE_STOPPED = 0;
    GST_PLAYER_STATE_BUFFERING = 1;
    GST_PLAYER_STATE_PAUSED = 2;
    GST_PLAYER_STATE_PLAYING = 3;
;
(* Const before type ignored *)

function gst_player_state_get_name(state:TGstPlayerState):Pgchar;cdecl;external;
function gst_player_error_quark:TGQuark;cdecl;external;
function gst_player_error_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_PLAYER_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_TYPE_PLAYER_ERROR : longint; { return type might be wrong }

{*
 * GstPlayerError:
 * @GST_PLAYER_ERROR_FAILED: generic error.
  }
type
  PGstPlayerError = ^TGstPlayerError;
  TGstPlayerError =  Longint;
  Const
    GST_PLAYER_ERROR_FAILED = 0;
;
(* Const before type ignored *)

function gst_player_error_get_name(error:TGstPlayerError):Pgchar;cdecl;external;
function gst_player_color_balance_type_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_PLAYER_COLOR_BALANCE_TYPE : longint; { return type might be wrong }

{*
 * GstPlayerColorBalanceType:
 * @GST_PLAYER_COLOR_BALANCE_BRIGHTNESS: brightness or black level.
 * @GST_PLAYER_COLOR_BALANCE_CONTRAST: contrast or luma gain.
 * @GST_PLAYER_COLOR_BALANCE_SATURATION: color saturation or chroma
 * gain.
 * @GST_PLAYER_COLOR_BALANCE_HUE: hue or color balance.
  }
type
  PGstPlayerColorBalanceType = ^TGstPlayerColorBalanceType;
  TGstPlayerColorBalanceType =  Longint;
  Const
    GST_PLAYER_COLOR_BALANCE_BRIGHTNESS = 0;
    GST_PLAYER_COLOR_BALANCE_CONTRAST = 1;
    GST_PLAYER_COLOR_BALANCE_SATURATION = 2;
    GST_PLAYER_COLOR_BALANCE_HUE = 3;
;
(* Const before type ignored *)

function gst_player_color_balance_type_get_name(_type:TGstPlayerColorBalanceType):Pgchar;cdecl;external;
{$ifdef G_DEFINE_AUTOPTR_CLEANUP_FUNC}
{$endif}

function gst_player_get_type:TGType;cdecl;external;
function gst_player_new(video_renderer:PGstPlayerVideoRenderer; signal_dispatcher:PGstPlayerSignalDispatcher):PGstPlayer;cdecl;external;
procedure gst_player_play(player:PGstPlayer);cdecl;external;
procedure gst_player_pause(player:PGstPlayer);cdecl;external;
procedure gst_player_stop(player:PGstPlayer);cdecl;external;
procedure gst_player_seek(player:PGstPlayer; position:TGstClockTime);cdecl;external;
procedure gst_player_set_rate(player:PGstPlayer; rate:Tgdouble);cdecl;external;
function gst_player_get_rate(player:PGstPlayer):Tgdouble;cdecl;external;
function gst_player_get_uri(player:PGstPlayer):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gst_player_set_uri(player:PGstPlayer; uri:Pgchar);cdecl;external;
function gst_player_get_subtitle_uri(player:PGstPlayer):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gst_player_set_subtitle_uri(player:PGstPlayer; uri:Pgchar);cdecl;external;
function gst_player_get_position(player:PGstPlayer):TGstClockTime;cdecl;external;
function gst_player_get_duration(player:PGstPlayer):TGstClockTime;cdecl;external;
function gst_player_get_volume(player:PGstPlayer):Tgdouble;cdecl;external;
procedure gst_player_set_volume(player:PGstPlayer; val:Tgdouble);cdecl;external;
function gst_player_get_mute(player:PGstPlayer):Tgboolean;cdecl;external;
procedure gst_player_set_mute(player:PGstPlayer; val:Tgboolean);cdecl;external;
function gst_player_get_pipeline(player:PGstPlayer):PGstElement;cdecl;external;
procedure gst_player_set_video_track_enabled(player:PGstPlayer; enabled:Tgboolean);cdecl;external;
procedure gst_player_set_audio_track_enabled(player:PGstPlayer; enabled:Tgboolean);cdecl;external;
procedure gst_player_set_subtitle_track_enabled(player:PGstPlayer; enabled:Tgboolean);cdecl;external;
function gst_player_set_audio_track(player:PGstPlayer; stream_index:Tgint):Tgboolean;cdecl;external;
function gst_player_set_video_track(player:PGstPlayer; stream_index:Tgint):Tgboolean;cdecl;external;
function gst_player_set_subtitle_track(player:PGstPlayer; stream_index:Tgint):Tgboolean;cdecl;external;
function gst_player_get_media_info(player:PGstPlayer):PGstPlayerMediaInfo;cdecl;external;
function gst_player_get_current_audio_track(player:PGstPlayer):PGstPlayerAudioInfo;cdecl;external;
function gst_player_get_current_video_track(player:PGstPlayer):PGstPlayerVideoInfo;cdecl;external;
function gst_player_get_current_subtitle_track(player:PGstPlayer):PGstPlayerSubtitleInfo;cdecl;external;
(* Const before type ignored *)
function gst_player_set_visualization(player:PGstPlayer; name:Pgchar):Tgboolean;cdecl;external;
procedure gst_player_set_visualization_enabled(player:PGstPlayer; enabled:Tgboolean);cdecl;external;
function gst_player_get_current_visualization(player:PGstPlayer):Pgchar;cdecl;external;
function gst_player_has_color_balance(player:PGstPlayer):Tgboolean;cdecl;external;
procedure gst_player_set_color_balance(player:PGstPlayer; _type:TGstPlayerColorBalanceType; value:Tgdouble);cdecl;external;
function gst_player_get_color_balance(player:PGstPlayer; _type:TGstPlayerColorBalanceType):Tgdouble;cdecl;external;
function gst_player_get_multiview_mode(player:PGstPlayer):TGstVideoMultiviewFramePacking;cdecl;external;
procedure gst_player_set_multiview_mode(player:PGstPlayer; mode:TGstVideoMultiviewFramePacking);cdecl;external;
function gst_player_get_multiview_flags(player:PGstPlayer):TGstVideoMultiviewFlags;cdecl;external;
procedure gst_player_set_multiview_flags(player:PGstPlayer; flags:TGstVideoMultiviewFlags);cdecl;external;
function gst_player_get_audio_video_offset(player:PGstPlayer):Tgint64;cdecl;external;
procedure gst_player_set_audio_video_offset(player:PGstPlayer; offset:Tgint64);cdecl;external;
function gst_player_get_subtitle_video_offset(player:PGstPlayer):Tgint64;cdecl;external;
procedure gst_player_set_subtitle_video_offset(player:PGstPlayer; offset:Tgint64);cdecl;external;
function gst_player_set_config(player:PGstPlayer; config:PGstStructure):Tgboolean;cdecl;external;
function gst_player_get_config(player:PGstPlayer):PGstStructure;cdecl;external;
{ helpers for configuring the config structure  }
(* Const before type ignored *)
procedure gst_player_config_set_user_agent(config:PGstStructure; agent:Pgchar);cdecl;external;
(* Const before type ignored *)
function gst_player_config_get_user_agent(config:PGstStructure):Pgchar;cdecl;external;
procedure gst_player_config_set_position_update_interval(config:PGstStructure; interval:Tguint);cdecl;external;
(* Const before type ignored *)
function gst_player_config_get_position_update_interval(config:PGstStructure):Tguint;cdecl;external;
procedure gst_player_config_set_seek_accurate(config:PGstStructure; accurate:Tgboolean);cdecl;external;
(* Const before type ignored *)
function gst_player_config_get_seek_accurate(config:PGstStructure):Tgboolean;cdecl;external;
type
  PGstPlayerSnapshotFormat = ^TGstPlayerSnapshotFormat;
  TGstPlayerSnapshotFormat =  Longint;
  Const
    GST_PLAYER_THUMBNAIL_RAW_NATIVE = 0;
    GST_PLAYER_THUMBNAIL_RAW_xRGB = 1;
    GST_PLAYER_THUMBNAIL_RAW_BGRx = 2;
    GST_PLAYER_THUMBNAIL_JPG = 3;
    GST_PLAYER_THUMBNAIL_PNG = 4;
;
(* Const before type ignored *)

function gst_player_get_video_snapshot(player:PGstPlayer; format:TGstPlayerSnapshotFormat; config:PGstStructure):PGstSample;cdecl;external;
{$endif}
{ __GST_PLAYER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_PLAYER : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAYER:=gst_player_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER(obj : longint) : longint;
begin
  GST_PLAYER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLAYER,GstPlayer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_CLASS(klass : longint) : longint;
begin
  GST_PLAYER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PLAYER,GstPlayerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER(obj : longint) : longint;
begin
  GST_IS_PLAYER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLAYER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_CLASS(klass : longint) : longint;
begin
  GST_IS_PLAYER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PLAYER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_GET_CLASS(obj : longint) : longint;
begin
  GST_PLAYER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_PLAYER,GstPlayerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLAYER_CAST(obj : longint) : PGstPlayer;
begin
  GST_PLAYER_CAST:=PGstPlayer(obj);
end;

{ was #define dname def_expr }
function GST_TYPE_PLAYER_STATE : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAYER_STATE:=gst_player_state_get_type;
  end;

{ was #define dname def_expr }
function GST_PLAYER_ERROR : longint; { return type might be wrong }
  begin
    GST_PLAYER_ERROR:=gst_player_error_quark;
  end;

{ was #define dname def_expr }
function GST_TYPE_PLAYER_ERROR : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAYER_ERROR:=gst_player_error_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_PLAYER_COLOR_BALANCE_TYPE : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAYER_COLOR_BALANCE_TYPE:=gst_player_color_balance_type_get_type;
  end;


end.
