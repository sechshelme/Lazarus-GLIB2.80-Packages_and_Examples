unit gstvideocodecalphameta;

interface

uses
  glib280, gst124;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGstVideoCodecAlphaMeta = record
    meta: TGstMeta;
    buffer: PGstBuffer;
  end;
  PGstVideoCodecAlphaMeta = ^TGstVideoCodecAlphaMeta;

function gst_video_codec_alpha_meta_api_get_type: TGType; cdecl; external libgstvideo;
function gst_video_codec_alpha_meta_get_info: PGstMetaInfo; cdecl; external libgstvideo;
function gst_buffer_add_video_codec_alpha_meta(buffer: PGstBuffer; alpha_buffer: PGstBuffer): PGstVideoCodecAlphaMeta; cdecl; external libgstvideo;


function gst_buffer_get_video_codec_alpha_meta(b: PGstBuffer): PGstVideoCodecAlphaMeta;

// === Konventiert am: 1-10-24 15:18:11 ===

function GST_VIDEO_CODEC_ALPHA_META_API_TYPE: TGType;
function GST_VIDEO_CODEC_ALPHA_META_INFO: PGstMetaInfo;

implementation

function GST_VIDEO_CODEC_ALPHA_META_API_TYPE: TGType;
begin
  GST_VIDEO_CODEC_ALPHA_META_API_TYPE := gst_video_codec_alpha_meta_api_get_type;
end;

function GST_VIDEO_CODEC_ALPHA_META_INFO: PGstMetaInfo;
begin
  GST_VIDEO_CODEC_ALPHA_META_INFO := gst_video_codec_alpha_meta_get_info;
end;

function gst_buffer_get_video_codec_alpha_meta(b: PGstBuffer): PGstVideoCodecAlphaMeta;
begin
  gst_buffer_get_video_codec_alpha_meta := PGstVideoCodecAlphaMeta(gst_buffer_get_meta(b, GST_VIDEO_CODEC_ALPHA_META_API_TYPE));
end;


end.
