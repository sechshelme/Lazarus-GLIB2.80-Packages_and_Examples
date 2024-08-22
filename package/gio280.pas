unit gio280;

interface

uses
  ctypes,
  glib280,
  gobject280;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gio280_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include gio280_includes.inc}
{$UNDEF read_implementation}

end.

