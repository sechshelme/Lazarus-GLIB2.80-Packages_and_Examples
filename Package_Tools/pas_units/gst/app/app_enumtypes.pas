unit app_enumtypes;

interface

uses
  glib280, gst124;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function gst_app_stream_type_get_type: TGType; cdecl; external libgstapp;
function GST_TYPE_APP_STREAM_TYPE: TGType;

function gst_app_leaky_type_get_type: TGType; cdecl; external libgstapp;
function GST_TYPE_APP_LEAKY_TYPE: TGType;


// === Konventiert am: 12-10-24 15:02:44 ===


implementation

function GST_TYPE_APP_STREAM_TYPE: TGType;
begin
  GST_TYPE_APP_STREAM_TYPE := gst_app_stream_type_get_type;
end;

function GST_TYPE_APP_LEAKY_TYPE: TGType;
begin
  GST_TYPE_APP_LEAKY_TYPE := gst_app_leaky_type_get_type;
end;


end.
