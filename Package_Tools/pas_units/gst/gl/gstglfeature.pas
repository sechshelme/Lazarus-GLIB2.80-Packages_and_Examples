unit gstglfeature;

interface

uses
  glib280, gst124;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gst_gl_check_extension(Name: pansichar; ext: Pgchar): Tgboolean; cdecl; external libgstgl;

function GST_GL_CHECK_GL_VERSION(driver_major, driver_minor, target_major, target_minor: longint): Tgboolean;

// === Konventiert am: 9-10-24 12:15:22 ===


implementation


function GST_GL_CHECK_GL_VERSION(driver_major, driver_minor, target_major, target_minor: longint): Tgboolean;
begin
  GST_GL_CHECK_GL_VERSION := (driver_major > target_major) or ((driver_major = target_major) and (driver_minor >= target_minor));
end;


end.
