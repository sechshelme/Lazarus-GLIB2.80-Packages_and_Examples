unit gobject280;

interface

uses
  ctypes,
  glib280;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gobject280_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include gobject280_includes.inc}
{$UNDEF read_implementation}

end.

