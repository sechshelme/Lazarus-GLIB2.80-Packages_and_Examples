unit gst124_pbutils;

interface

uses
  glib280,
  gst124,
  gst124_base,
  gst124_audio,
  gst124_video,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // === GST_video



  {$DEFINE read_interface}
  {$include gst124_pbutils_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include gst124_pbutils_includes.inc}
{$UNDEF read_implementation}

end.
