unit gsturidownloader_debug;

interface

uses
  glib280, gst124;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

var
  uridownloader_debug: PGstDebugCategory; cvar;external libgsturidownloader;

  // === Konventiert am: 12-10-24 19:27:21 ===


implementation



end.
