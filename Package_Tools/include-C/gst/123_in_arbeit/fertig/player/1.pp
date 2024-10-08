
unit 1;
interface

{
  Automatically converted by H2Pas 1.0.0 from 1.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    1.h
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
PGList  = ^GList;
PGstPlayerMediaInfo  = ^GstPlayerMediaInfo;
PGstSample  = ^GstSample;
PGstTagList  = ^GstTagList;
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

function gst_player_media_info_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_player_media_info_get_uri(info:PGstPlayerMediaInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_is_seekable(info:PGstPlayerMediaInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_is_live(info:PGstPlayerMediaInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_duration(info:PGstPlayerMediaInfo):TGstClockTime;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_stream_list(info:PGstPlayerMediaInfo):PGList;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_number_of_streams(info:PGstPlayerMediaInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_video_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_number_of_video_streams(info:PGstPlayerMediaInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_audio_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_number_of_audio_streams(info:PGstPlayerMediaInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_subtitle_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_number_of_subtitle_streams(info:PGstPlayerMediaInfo):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_tags(info:PGstPlayerMediaInfo):PGstTagList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_player_media_info_get_title(info:PGstPlayerMediaInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_player_media_info_get_container_format(info:PGstPlayerMediaInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_player_media_info_get_image_sample(info:PGstPlayerMediaInfo):PGstSample;cdecl;external;
(* Const before type ignored *)
function gst_player_get_video_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external;
(* Const before type ignored *)
function gst_player_get_audio_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external;
(* Const before type ignored *)
function gst_player_get_subtitle_streams(info:PGstPlayerMediaInfo):PGList;cdecl;external;
{$endif}
{ __GST_PLAYER_MEDIA_INFO_H  }

implementation

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
