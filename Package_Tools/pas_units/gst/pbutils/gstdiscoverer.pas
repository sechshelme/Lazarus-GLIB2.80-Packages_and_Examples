unit gstdiscoverer;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  TGstDiscovererStreamInfo=record
        end;
  PGstDiscovererStreamInfo=^TGstDiscovererStreamInfo;

  PGstDiscovererStreamInfoClass = ^TGstDiscovererStreamInfoClass;
  TGstDiscovererStreamInfoClass = TGObjectClass;

function gst_discoverer_stream_info_get_type:TGType;cdecl;external gstreamerlib;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_discoverer_stream_info_ref(info : longint) : PGstDiscovererStreamInfo;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_discoverer_stream_info_unref(info : longint) : longint;

function gst_discoverer_stream_info_get_previous(info:PGstDiscovererStreamInfo):PGstDiscovererStreamInfo;cdecl;external gstreamerlib;
function gst_discoverer_stream_info_get_next(info:PGstDiscovererStreamInfo):PGstDiscovererStreamInfo;cdecl;external gstreamerlib;
function gst_discoverer_stream_info_get_caps(info:PGstDiscovererStreamInfo):PGstCaps;cdecl;external gstreamerlib;
function gst_discoverer_stream_info_get_tags(info:PGstDiscovererStreamInfo):PGstTagList;cdecl;external gstreamerlib;
function gst_discoverer_stream_info_get_toc(info:PGstDiscovererStreamInfo):PGstToc;cdecl;external gstreamerlib;
function gst_discoverer_stream_info_get_stream_id(info:PGstDiscovererStreamInfo):Pgchar;cdecl;external gstreamerlib;
{GST_PBUTILS_DEPRECATED_FOR(gst_discoverer_info_get_missing_elements_installer_details) }
function gst_discoverer_stream_info_get_misc(info:PGstDiscovererStreamInfo):PGstStructure;cdecl;external gstreamerlib;
function gst_discoverer_stream_info_get_stream_type_nick(info:PGstDiscovererStreamInfo):Pgchar;cdecl;external gstreamerlib;
function gst_discoverer_stream_info_get_stream_number(info:PGstDiscovererStreamInfo):Tgint;cdecl;external gstreamerlib;

type
  TGstDiscovererContainerInfo=record
        end;
  PGstDiscovererContainerInfo=^TGstDiscovererContainerInfo;

  PGstDiscovererContainerInfoClass = ^TGstDiscovererContainerInfoClass;
  TGstDiscovererContainerInfoClass = TGObjectClass;

function gst_discoverer_container_info_get_type:TGType;cdecl;external gstreamerlib;
function gst_discoverer_container_info_get_streams(info:PGstDiscovererContainerInfo):PGList;cdecl;external gstreamerlib;
function gst_discoverer_container_info_get_tags(info:PGstDiscovererContainerInfo):PGstTagList;cdecl;external gstreamerlib;

type
  TGstDiscovererAudioInfo=record
        end;
  PGstDiscovererAudioInfo=^TGstDiscovererAudioInfo;

  PGstDiscovererAudioInfoClass = ^TGstDiscovererAudioInfoClass;
  TGstDiscovererAudioInfoClass = TGObjectClass;

function gst_discoverer_audio_info_get_type:TGType;cdecl;external gstreamerlib;
function gst_discoverer_audio_info_get_channels(info:PGstDiscovererAudioInfo):Tguint;cdecl;external gstreamerlib;
function gst_discoverer_audio_info_get_channel_mask(info:PGstDiscovererAudioInfo):Tguint64;cdecl;external gstreamerlib;
function gst_discoverer_audio_info_get_sample_rate(info:PGstDiscovererAudioInfo):Tguint;cdecl;external gstreamerlib;
function gst_discoverer_audio_info_get_depth(info:PGstDiscovererAudioInfo):Tguint;cdecl;external gstreamerlib;
function gst_discoverer_audio_info_get_bitrate(info:PGstDiscovererAudioInfo):Tguint;cdecl;external gstreamerlib;
function gst_discoverer_audio_info_get_max_bitrate(info:PGstDiscovererAudioInfo):Tguint;cdecl;external gstreamerlib;
function gst_discoverer_audio_info_get_language(info:PGstDiscovererAudioInfo):Pgchar;cdecl;external gstreamerlib;

type
  TGstDiscovererVideoInfo=record
        end;
  PGstDiscovererVideoInfo=^TGstDiscovererVideoInfo;

  PGstDiscovererVideoInfoClass = ^TGstDiscovererVideoInfoClass;
  TGstDiscovererVideoInfoClass = TGObjectClass;

function gst_discoverer_video_info_get_type:TGType;cdecl;external gstreamerlib;
function gst_discoverer_video_info_get_width(info:PGstDiscovererVideoInfo):Tguint;cdecl;external gstreamerlib;
function gst_discoverer_video_info_get_height(info:PGstDiscovererVideoInfo):Tguint;cdecl;external gstreamerlib;
function gst_discoverer_video_info_get_depth(info:PGstDiscovererVideoInfo):Tguint;cdecl;external gstreamerlib;
function gst_discoverer_video_info_get_framerate_num(info:PGstDiscovererVideoInfo):Tguint;cdecl;external gstreamerlib;
function gst_discoverer_video_info_get_framerate_denom(info:PGstDiscovererVideoInfo):Tguint;cdecl;external gstreamerlib;
function gst_discoverer_video_info_get_par_num(info:PGstDiscovererVideoInfo):Tguint;cdecl;external gstreamerlib;
function gst_discoverer_video_info_get_par_denom(info:PGstDiscovererVideoInfo):Tguint;cdecl;external gstreamerlib;
function gst_discoverer_video_info_is_interlaced(info:PGstDiscovererVideoInfo):Tgboolean;cdecl;external gstreamerlib;
function gst_discoverer_video_info_get_bitrate(info:PGstDiscovererVideoInfo):Tguint;cdecl;external gstreamerlib;
function gst_discoverer_video_info_get_max_bitrate(info:PGstDiscovererVideoInfo):Tguint;cdecl;external gstreamerlib;
function gst_discoverer_video_info_is_image(info:PGstDiscovererVideoInfo):Tgboolean;cdecl;external gstreamerlib;

type
  TGstDiscovererSubtitleInfo=record
        end;
  PGstDiscovererSubtitleInfo=^TGstDiscovererSubtitleInfo;

  PGstDiscovererSubtitleInfoClass = ^TGstDiscovererSubtitleInfoClass;
  TGstDiscovererSubtitleInfoClass = TGObjectClass;

function gst_discoverer_subtitle_info_get_type:TGType;cdecl;external gstreamerlib;
function gst_discoverer_subtitle_info_get_language(info:PGstDiscovererSubtitleInfo):Pgchar;cdecl;external gstreamerlib;
{*
 * GstDiscovererResult:
 * @GST_DISCOVERER_OK: The discovery was successful
 * @GST_DISCOVERER_URI_INVALID: the URI is invalid
 * @GST_DISCOVERER_ERROR: an error happened and the GError is set
 * @GST_DISCOVERER_TIMEOUT: the discovery timed-out
 * @GST_DISCOVERER_BUSY: the discoverer was already discovering a file
 * @GST_DISCOVERER_MISSING_PLUGINS: Some plugins are missing for full discovery
 *
 * Result values for the discovery process.
  }
type
  PGstDiscovererResult = ^TGstDiscovererResult;
  TGstDiscovererResult =  Longint;
  Const
    GST_DISCOVERER_OK = 0;
    GST_DISCOVERER_URI_INVALID = 1;
    GST_DISCOVERER_ERROR = 2;
    GST_DISCOVERER_TIMEOUT = 3;
    GST_DISCOVERER_BUSY = 4;
    GST_DISCOVERER_MISSING_PLUGINS = 5;

{*
 * GstDiscovererSerializeFlags:
 * @GST_DISCOVERER_SERIALIZE_BASIC: Serialize only basic information, excluding
 * caps, tags and miscellaneous information
 * @GST_DISCOVERER_SERIALIZE_CAPS: Serialize the caps for each stream
 * @GST_DISCOVERER_SERIALIZE_TAGS: Serialize the tags for each stream
 * @GST_DISCOVERER_SERIALIZE_MISC: Serialize miscellaneous information for each stream
 * @GST_DISCOVERER_SERIALIZE_ALL: Serialize all the available info, including
 * caps, tags and miscellaneous information
 *
 * You can use these flags to control what is serialized by
 * gst_discoverer_info_to_variant()
 *
 * Since: 1.6
  }
type
  PGstDiscovererSerializeFlags = ^TGstDiscovererSerializeFlags;
  TGstDiscovererSerializeFlags =  Longint;
  Const
    GST_DISCOVERER_SERIALIZE_BASIC = 0;
    GST_DISCOVERER_SERIALIZE_CAPS = 1 shl 0;
    GST_DISCOVERER_SERIALIZE_TAGS = 1 shl 1;
    GST_DISCOVERER_SERIALIZE_MISC = 1 shl 2;
    GST_DISCOVERER_SERIALIZE_ALL = (GST_DISCOVERER_SERIALIZE_CAPS or GST_DISCOVERER_SERIALIZE_TAGS) or GST_DISCOVERER_SERIALIZE_MISC;

{*
 * GstDiscovererInfo:
 *
 * Structure containing the information of a URI analyzed by #GstDiscoverer.
  }
type
  TGstDiscovererInfo=record
        end;
  PGstDiscovererInfo=^TGstDiscovererInfo;

  PGstDiscovererInfoClass = ^TGstDiscovererInfoClass;
  TGstDiscovererInfoClass = TGObjectClass;

function gst_discoverer_info_get_type:TGType;cdecl;external gstreamerlib;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_discoverer_info_unref(info : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_discoverer_info_ref(info : longint) : longint;

function gst_discoverer_info_copy(ptr:PGstDiscovererInfo):PGstDiscovererInfo;cdecl;external gstreamerlib;
function gst_discoverer_info_get_uri(info:PGstDiscovererInfo):Pgchar;cdecl;external gstreamerlib;
function gst_discoverer_info_get_result(info:PGstDiscovererInfo):TGstDiscovererResult;cdecl;external gstreamerlib;
function gst_discoverer_info_get_stream_info(info:PGstDiscovererInfo):PGstDiscovererStreamInfo;cdecl;external gstreamerlib;
function gst_discoverer_info_get_stream_list(info:PGstDiscovererInfo):PGList;cdecl;external gstreamerlib;
function gst_discoverer_info_get_duration(info:PGstDiscovererInfo):TGstClockTime;cdecl;external gstreamerlib;
function gst_discoverer_info_get_seekable(info:PGstDiscovererInfo):Tgboolean;cdecl;external gstreamerlib;
function gst_discoverer_info_get_live(info:PGstDiscovererInfo):Tgboolean;cdecl;external gstreamerlib;
{GST_PBUTILS_DEPRECATED_FOR(gst_discoverer_info_get_missing_elements_installer_details) }
function gst_discoverer_info_get_misc(info:PGstDiscovererInfo):PGstStructure;cdecl;external gstreamerlib;
{GST_PBUTILS_DEPRECATED }
function gst_discoverer_info_get_tags(info:PGstDiscovererInfo):PGstTagList;cdecl;external gstreamerlib;
function gst_discoverer_info_get_toc(info:PGstDiscovererInfo):PGstToc;cdecl;external gstreamerlib;
function gst_discoverer_info_get_missing_elements_installer_details(info:PGstDiscovererInfo):PPgchar;cdecl;external gstreamerlib;
function gst_discoverer_info_get_streams(info:PGstDiscovererInfo; streamtype:TGType):PGList;cdecl;external gstreamerlib;
function gst_discoverer_info_get_audio_streams(info:PGstDiscovererInfo):PGList;cdecl;external gstreamerlib;
function gst_discoverer_info_get_video_streams(info:PGstDiscovererInfo):PGList;cdecl;external gstreamerlib;
function gst_discoverer_info_get_subtitle_streams(info:PGstDiscovererInfo):PGList;cdecl;external gstreamerlib;
function gst_discoverer_info_get_container_streams(info:PGstDiscovererInfo):PGList;cdecl;external gstreamerlib;
function gst_discoverer_info_to_variant(info:PGstDiscovererInfo; flags:TGstDiscovererSerializeFlags):PGVariant;cdecl;external gstreamerlib;
function gst_discoverer_info_from_variant(variant:PGVariant):PGstDiscovererInfo;cdecl;external gstreamerlib;
procedure gst_discoverer_stream_info_list_free(infos:PGList);cdecl;external gstreamerlib;

type
  TGstDiscovererPrivate=record
        end;
  PGstDiscovererPrivate=^TGstDiscovererPrivate;

{*
 * GstDiscoverer:
 *
 * The #GstDiscoverer structure.
 * }
{< private > }
  PGstDiscoverer = ^TGstDiscoverer;
  TGstDiscoverer = record
      parent : TGObject;
      priv : PGstDiscovererPrivate;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{ signals  }
{*
   * GstDiscovererClass::load_serialize_info:
   * @dc: the #GstDiscoverer
   * @uri: the uri to load the info from
   *
   * Loads the serialized info from the given uri.
   *
   * Returns: (transfer full): the #GstDiscovererInfo or %NULL if it could not be loaded
   *
   * Since: 1.24
    }
  PGstDiscovererClass = ^TGstDiscovererClass;
  TGstDiscovererClass = record
      parentclass : TGObjectClass;
      finished : procedure (discoverer:PGstDiscoverer);cdecl;
      starting : procedure (discoverer:PGstDiscoverer);cdecl;
      discovered : procedure (discoverer:PGstDiscoverer; info:PGstDiscovererInfo; err:PGError);cdecl;
      source_setup : procedure (discoverer:PGstDiscoverer; source:PGstElement);cdecl;
      load_serialize_info : function (dc:PGstDiscoverer; uri:Pgchar):PGstDiscovererInfo;cdecl;
      _reserved : array[0..(GST_PADDING-1)-1] of Tgpointer;
    end;


function gst_discoverer_get_type:TGType;cdecl;external gstreamerlib;
function gst_discoverer_new(timeout:TGstClockTime; err:PPGError):PGstDiscoverer;cdecl;external gstreamerlib;
{ Asynchronous API  }
procedure gst_discoverer_start(discoverer:PGstDiscoverer);cdecl;external gstreamerlib;
procedure gst_discoverer_stop(discoverer:PGstDiscoverer);cdecl;external gstreamerlib;
function gst_discoverer_discover_uri_async(discoverer:PGstDiscoverer; uri:Pgchar):Tgboolean;cdecl;external gstreamerlib;
{ Synchronous API  }
function gst_discoverer_discover_uri(discoverer:PGstDiscoverer; uri:Pgchar; err:PPGError):PGstDiscovererInfo;cdecl;external gstreamerlib;

// === Konventiert am: 26-9-24 19:48:48 ===

function GST_TYPE_DISCOVERER_STREAM_INFO : TGType;
function GST_DISCOVERER_STREAM_INFO(obj : Pointer) : PGstDiscovererStreamInfo;
function GST_IS_DISCOVERER_STREAM_INFO(obj : Pointer) : Tgboolean;

function GST_TYPE_DISCOVERER_CONTAINER_INFO : TGType;
function GST_DISCOVERER_CONTAINER_INFO(obj : Pointer) : PGstDiscovererContainerInfo;
function GST_IS_DISCOVERER_CONTAINER_INFO(obj : Pointer) : Tgboolean;

function GST_TYPE_DISCOVERER_AUDIO_INFO : TGType;
function GST_DISCOVERER_AUDIO_INFO(obj : Pointer) : PGstDiscovererAudioInfo;
function GST_IS_DISCOVERER_AUDIO_INFO(obj : Pointer) : Tgboolean;

function GST_TYPE_DISCOVERER_VIDEO_INFO : TGType;
function GST_DISCOVERER_VIDEO_INFO(obj : Pointer) : PGstDiscovererVideoInfo;
function GST_IS_DISCOVERER_VIDEO_INFO(obj : Pointer) : Tgboolean;

function GST_TYPE_DISCOVERER_SUBTITLE_INFO : TGType;
function GST_DISCOVERER_SUBTITLE_INFO(obj : Pointer) : PGstDiscovererSubtitleInfo;
function GST_IS_DISCOVERER_SUBTITLE_INFO(obj : Pointer) : Tgboolean;

function GST_TYPE_DISCOVERER_INFO : TGType;
function GST_DISCOVERER_INFO(obj : Pointer) : PGstDiscovererInfo;
function GST_IS_DISCOVERER_INFO(obj : Pointer) : Tgboolean;

function GST_TYPE_DISCOVERER : TGType;
function GST_DISCOVERER(obj : Pointer) : PGstDiscoverer;
function GST_DISCOVERER_CLASS(klass : Pointer) : PGstDiscovererClass;
function GST_IS_DISCOVERER(obj : Pointer) : Tgboolean;
function GST_IS_DISCOVERER_CLASS(klass : Pointer) : Tgboolean;


implementation

function GST_TYPE_DISCOVERER_STREAM_INFO : TGType;
  begin
    GST_TYPE_DISCOVERER_STREAM_INFO:=gst_discoverer_stream_info_get_type;
  end;

function GST_DISCOVERER_STREAM_INFO(obj : Pointer) : PGstDiscovererStreamInfo;
begin
  Result := PGstDiscovererStreamInfo(g_type_check_instance_cast(obj, GST_TYPE_DISCOVERER_STREAM_INFO));
end;

function GST_IS_DISCOVERER_STREAM_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_DISCOVERER_STREAM_INFO);
end;

// ====

function GST_TYPE_DISCOVERER_CONTAINER_INFO : TGType;
  begin
    GST_TYPE_DISCOVERER_CONTAINER_INFO:=gst_discoverer_container_info_get_type;
  end;

function GST_DISCOVERER_CONTAINER_INFO(obj : Pointer) : PGstDiscovererContainerInfo;
begin
  Result := PGstDiscovererContainerInfo(g_type_check_instance_cast(obj, GST_TYPE_DISCOVERER_CONTAINER_INFO));
end;

function GST_IS_DISCOVERER_CONTAINER_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_DISCOVERER_CONTAINER_INFO);
end;

// ====

function GST_TYPE_DISCOVERER_AUDIO_INFO : TGType;
  begin
    GST_TYPE_DISCOVERER_AUDIO_INFO:=gst_discoverer_audio_info_get_type;
  end;

function GST_DISCOVERER_AUDIO_INFO(obj : Pointer) : PGstDiscovererAudioInfo;
begin
  Result := PGstDiscovererAudioInfo(g_type_check_instance_cast(obj, GST_TYPE_DISCOVERER_AUDIO_INFO));
end;

function GST_IS_DISCOVERER_AUDIO_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_DISCOVERER_AUDIO_INFO);
end;

// ====

function GST_TYPE_DISCOVERER_VIDEO_INFO : TGType;
  begin
    GST_TYPE_DISCOVERER_VIDEO_INFO:=gst_discoverer_video_info_get_type;
  end;

function GST_DISCOVERER_VIDEO_INFO(obj : Pointer) : PGstDiscovererVideoInfo;
begin
  Result := PGstDiscovererVideoInfo(g_type_check_instance_cast(obj, GST_TYPE_DISCOVERER_VIDEO_INFO));
end;

function GST_IS_DISCOVERER_VIDEO_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_DISCOVERER_VIDEO_INFO);
end;

// ====

function GST_TYPE_DISCOVERER_SUBTITLE_INFO : TGType;
  begin
    GST_TYPE_DISCOVERER_SUBTITLE_INFO:=gst_discoverer_subtitle_info_get_type;
  end;

function GST_DISCOVERER_SUBTITLE_INFO(obj : Pointer) : PGstDiscovererSubtitleInfo;
begin
  Result := PGstDiscovererSubtitleInfo(g_type_check_instance_cast(obj, GST_TYPE_DISCOVERER_SUBTITLE_INFO));
end;

function GST_IS_DISCOVERER_SUBTITLE_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_DISCOVERER_SUBTITLE_INFO);
end;

// ====

function GST_TYPE_DISCOVERER_INFO : TGType;
  begin
    GST_TYPE_DISCOVERER_INFO:=gst_discoverer_info_get_type;
  end;

function GST_DISCOVERER_INFO(obj : Pointer) : PGstDiscovererInfo;
begin
  Result := PGstDiscovererInfo(g_type_check_instance_cast(obj, GST_TYPE_DISCOVERER_INFO));
end;

function GST_IS_DISCOVERER_INFO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_DISCOVERER_INFO);
end;

// ====

function GST_TYPE_DISCOVERER : TGType;
  begin
    GST_TYPE_DISCOVERER:=gst_discoverer_get_type;
  end;

function GST_DISCOVERER(obj : Pointer) : PGstDiscoverer;
begin
  Result := PGstDiscoverer(g_type_check_instance_cast(obj, GST_TYPE_DISCOVERER));
end;

function GST_DISCOVERER_CLASS(klass : Pointer) : PGstDiscovererClass;
begin
  Result := PGstDiscovererClass(g_type_check_class_cast(klass, GST_TYPE_DISCOVERER));
end;

function GST_IS_DISCOVERER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_DISCOVERER);
end;

function GST_IS_DISCOVERER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_DISCOVERER);
end;

// ====


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gst_discoverer_stream_info_ref(info : longint) : PGstDiscovererStreamInfo;
begin
  gst_discoverer_stream_info_ref:=PGstDiscovererStreamInfo(g_object_ref(PGObject(info)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_discoverer_stream_info_unref(info : longint) : longint;
begin
  gst_discoverer_stream_info_unref:=g_object_unref(PGObject(info));
end;




end.
