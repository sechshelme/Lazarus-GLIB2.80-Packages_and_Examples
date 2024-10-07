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
  LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('GLIB280_package', @Register);
end.
