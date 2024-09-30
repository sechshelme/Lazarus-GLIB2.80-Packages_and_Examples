unit gst124_base;

interface

uses
  glib280,
  gst124,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // === GST_base
  const
    GST_VIDEO_MAX_PLANES = 4;
    GST_VIDEO_MAX_COMPONENTS = 4;

  type
    Tguintarr4=   array[0..3] of Tguint;

    Tplanes_Pointer_arr = array[0..(GST_VIDEO_MAX_PLANES) - 1] of Tgpointer;
    Tplanes_int_arr = array[0..(GST_VIDEO_MAX_PLANES) - 1] of Tgint;
    Tplanes_uint_arr = array[0..(GST_VIDEO_MAX_PLANES) - 1] of Tguint;
    Tcomp_int_arr = array[0..(GST_VIDEO_MAX_COMPONENTS) - 1] of Tgint;
    Tplanes_size_arr=array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgsize;


  {$DEFINE read_interface}
  {$include gst124_base_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include gst124_base_includes.inc}
{$UNDEF read_implementation}

end.
