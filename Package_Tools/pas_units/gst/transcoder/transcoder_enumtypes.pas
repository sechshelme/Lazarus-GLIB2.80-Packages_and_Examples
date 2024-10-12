unit transcoder_enumtypes;

interface

uses
  glib280, gst124;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function gst_transcoder_error_get_type: TGType; cdecl; external libgsttranscoder;
function GST_TYPE_TRANSCODER_ERROR: TGType;

function gst_transcoder_state_get_type: TGType; cdecl; external libgsttranscoder;
function GST_TYPE_TRANSCODER_STATE: TGType;

function gst_transcoder_message_get_type: TGType; cdecl; external libgsttranscoder;
function GST_TYPE_TRANSCODER_MESSAGE: TGType;

// === Konventiert am: 12-10-24 17:57:41 ===


implementation

function GST_TYPE_TRANSCODER_ERROR: TGType;
begin
  GST_TYPE_TRANSCODER_ERROR := gst_transcoder_error_get_type;
end;

function GST_TYPE_TRANSCODER_STATE: TGType;
begin
  GST_TYPE_TRANSCODER_STATE := gst_transcoder_state_get_type;
end;

function GST_TYPE_TRANSCODER_MESSAGE: TGType;
begin
  GST_TYPE_TRANSCODER_MESSAGE := gst_transcoder_message_get_type;
end;


end.
