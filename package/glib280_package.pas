{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit GLIB280_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  glib280, gst124, GLIBTools, gstTools, gst124_base, gst124_audio, 
  gst124_video, gst124_pbutils, gst124_allocators, gst124_analytics, 
  gst124_check, gst124_interfaces, gst124_mse, gst124_insertbin, gst124_sdp, 
  gst124_webrtc, gst124_webrtc_nice, gst124_mpegts, gst124_tag, gst124_fft, 
  gst124_codecparsers, gst124_controller, gst124_rtp, gst124_rtsp, 
  gst124_wayland, gst124_va, gst124_player, gst124_gl, gst124_gl_egl, 
  gst124_gl_wayland, gst124_gl_x11, gst124_gl_glprototypes, gst124_vulkan, 
  gst124_vulkan_wayland, gst124_vulkan_xcb, gst124_net, gst124_cuda, 
  gst124_play, gst124_app, gst124_riff, gst124_basecamerabinsrc, 
  gst124_transcoder, gst124_uridownloader, gst124_sctp, gst124_opencv, 
  gst124_isoff, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('GLIB280_package', @Register);
end.
