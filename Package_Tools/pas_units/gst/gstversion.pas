unit gstversion;

interface

uses
  glib280, common_GST, gstobject;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GST_VERSION_MAJOR = 1;
  GST_VERSION_MINOR = 24;
  GST_VERSION_MICRO = 2;
  GST_VERSION_NANO = 0;

function GST_CHECK_VERSION(major, minor, micro: longint): Tgboolean;


implementation

function GST_CHECK_VERSION(major, minor, micro: longint): Tgboolean;
begin
  Result := (GST_VERSION_MAJOR > major) or
    ((GST_VERSION_MAJOR = major) and (GST_VERSION_MINOR > minor)) or
    ((GST_VERSION_MAJOR = major) and (GST_VERSION_MINOR = minor) and (GST_VERSION_MICRO >= micro));
end;


end.
