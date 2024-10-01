unit video_blend;

interface

uses
  glib280, gst124, video_info, video_frame;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure gst_video_blend_scale_linear_RGBA(src: PGstVideoInfo; src_buffer: PGstBuffer; dest_height: Tgint; dest_width: Tgint; dest: PGstVideoInfo;
  dest_buffer: PPGstBuffer); cdecl; external libgstvideo;
function gst_video_blend(dest: PGstVideoFrame; src: PGstVideoFrame; x: Tgint; y: Tgint; global_alpha: Tgfloat): Tgboolean; cdecl; external libgstvideo;

// === Konventiert am: 1-10-24 15:18:38 ===


implementation



end.
