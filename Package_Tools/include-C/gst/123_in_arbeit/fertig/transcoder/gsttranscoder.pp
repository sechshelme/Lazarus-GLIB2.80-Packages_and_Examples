
unit gsttranscoder;
interface

{
  Automatically converted by H2Pas 0.99.16 from gsttranscoder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttranscoder.h
}

Type
Pgchar = ^Tgchar;
PGError = ^TGError;
PGMainContext = ^TGMainContext;
PGstBus = ^TGstBus;
PGstClockTime = ^TGstClockTime;
PGstElement = ^TGstElement;
PGstEncodingProfile = ^TGstEncodingProfile;
PGstMessage = ^TGstMessage;
PGstStructure = ^TGstStructure;
PGstTranscoder = ^TGstTranscoder;
PGstTranscoderSignalAdapter = ^TGstTranscoderSignalAdapter;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef __GST_TRANSCODER_H}
{$define __GST_TRANSCODER_H}
{$ifdef HAVE_CONFIG_H}
{$include "config.h"}
{$endif}
{$include <gst/gst.h>}
{$include <gst/pbutils/pbutils.h>}
{$include <gst/transcoder/transcoder-prelude.h>}
{$include <gst/transcoder/transcoder-enumtypes.h>}
{********** Error definitions *********** }

{ was #define dname def_expr }
function GST_TRANSCODER_ERROR : longint; { return type might be wrong }

{*
 * GstTranscoderError:
 * @GST_TRANSCODER_ERROR_FAILED: generic error.
  }
type
  PGstTranscoderError = ^TGstTranscoderError;
  TGstTranscoderError =  Longint;
  Const
    GST_TRANSCODER_ERROR_FAILED = &;
;

function gst_transcoder_error_quark:TGQuark;cdecl;external;
(* Const before declarator ignored *)
function gst_transcoder_error_get_name(error:TGstTranscoderError):Pgchar;cdecl;external;
{********** State definition *********** }
{*
 * GstTranscoderState:
 * @GST_TRANSCODER_STATE_STOPPED: the transcoder is stopped.
 * @GST_TRANSCODER_STATE_PAUSED: the transcoder is paused.
 * @GST_TRANSCODER_STATE_PLAYING: the transcoder is currently transcoding a
 * stream.
 *
 * High level representation of the transcoder pipeline state.
 *
 * Since: 1.20
  }
type
  PGstTranscoderState = ^TGstTranscoderState;
  TGstTranscoderState =  Longint;
  Const
    GST_TRANSCODER_STATE_STOPPED = 0;
    GST_TRANSCODER_STATE_PAUSED = 1;
    GST_TRANSCODER_STATE_PLAYING = 2;
;
(* Const before declarator ignored *)

function gst_transcoder_state_get_name(state:TGstTranscoderState):Pgchar;cdecl;external;
{********** Messages types definitions *********** }
{*
 * GstTranscoderMessage:
 * @GST_TRANSCODER_MESSAGE_POSITION_UPDATED: Sink position changed
 * @GST_TRANSCODER_MESSAGE_DURATION_CHANGED: Duration of stream changed
 * @GST_TRANSCODER_MESSAGE_STATE_CHANGED: Pipeline state changed
 * @GST_TRANSCODER_MESSAGE_DONE: Transcoding is done
 * @GST_TRANSCODER_MESSAGE_ERROR: Message contains an error
 * @GST_TRANSCODER_MESSAGE_WARNING: Message contains an error
 *
 * Types of messages that will be posted on the transcoder API bus.
 *
 * See also #gst_transcoder_get_message_bus()
 *
 * Since: 1.20
  }
type
  PGstTranscoderMessage = ^TGstTranscoderMessage;
  TGstTranscoderMessage =  Longint;
  Const
    GST_TRANSCODER_MESSAGE_POSITION_UPDATED = 0;
    GST_TRANSCODER_MESSAGE_DURATION_CHANGED = 1;
    GST_TRANSCODER_MESSAGE_STATE_CHANGED = 2;
    GST_TRANSCODER_MESSAGE_DONE = 3;
    GST_TRANSCODER_MESSAGE_ERROR = 4;
    GST_TRANSCODER_MESSAGE_WARNING = 5;
;

function gst_transcoder_is_transcoder_message(msg:PGstMessage):Tgboolean;cdecl;external;
(* Const before declarator ignored *)
function gst_transcoder_message_get_name(message:TGstTranscoderMessage):Pgchar;cdecl;external;
procedure gst_transcoder_message_parse_position(msg:PGstMessage; position:PGstClockTime);cdecl;external;
procedure gst_transcoder_message_parse_duration(msg:PGstMessage; duration:PGstClockTime);cdecl;external;
procedure gst_transcoder_message_parse_state(msg:PGstMessage; state:PGstTranscoderState);cdecl;external;
procedure gst_transcoder_message_parse_error(msg:PGstMessage; error:PGError; details:PPGstStructure);cdecl;external;
procedure gst_transcoder_message_parse_warning(msg:PGstMessage; error:PGError; details:PPGstStructure);cdecl;external;
{********** GstTranscoder definition  *********** }
{ was #define dname def_expr }
function GST_TYPE_TRANSCODER : longint; { return type might be wrong }

{*
 * GstTranscoderClass.parent_class:
 *
 * Since: 1.20
  }
{G_DECLARE_FINAL_TYPE (GstTranscoder, gst_transcoder, GST, TRANSCODER, GstObject) }
(* Const before declarator ignored *)
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function gst_transcoder_new(source_uri:Pgchar; dest_uri:Pgchar; encoding_profile:Pgchar):PGstTranscoder;cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function gst_transcoder_new_full(source_uri:Pgchar; dest_uri:Pgchar; profile:PGstEncodingProfile):PGstTranscoder;cdecl;external;
function gst_transcoder_run(self:PGstTranscoder; error:PPGError):Tgboolean;cdecl;external;
function gst_transcoder_get_message_bus(transcoder:PGstTranscoder):PGstBus;cdecl;external;
procedure gst_transcoder_set_cpu_usage(self:PGstTranscoder; cpu_usage:Tgint);cdecl;external;
procedure gst_transcoder_run_async(self:PGstTranscoder);cdecl;external;
procedure gst_transcoder_set_position_update_interval(self:PGstTranscoder; interval:Tguint);cdecl;external;
function gst_transcoder_get_source_uri(self:PGstTranscoder):Pgchar;cdecl;external;
function gst_transcoder_get_dest_uri(self:PGstTranscoder):Pgchar;cdecl;external;
function gst_transcoder_get_position_update_interval(self:PGstTranscoder):Tguint;cdecl;external;
function gst_transcoder_get_position(self:PGstTranscoder):TGstClockTime;cdecl;external;
function gst_transcoder_get_duration(self:PGstTranscoder):TGstClockTime;cdecl;external;
function gst_transcoder_get_pipeline(self:PGstTranscoder):PGstElement;cdecl;external;
function gst_transcoder_get_avoid_reencoding(self:PGstTranscoder):Tgboolean;cdecl;external;
procedure gst_transcoder_set_avoid_reencoding(self:PGstTranscoder; avoid_reencoding:Tgboolean);cdecl;external;
{$include "gsttranscoder-signal-adapter.h"}
function gst_transcoder_get_signal_adapter(self:PGstTranscoder; context:PGMainContext):PGstTranscoderSignalAdapter;cdecl;external;
function gst_transcoder_get_sync_signal_adapter(self:PGstTranscoder):PGstTranscoderSignalAdapter;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function GST_TRANSCODER_ERROR : longint; { return type might be wrong }
  begin
    GST_TRANSCODER_ERROR:=gst_transcoder_error_quark;
  end;

{ was #define dname def_expr }
function GST_TYPE_TRANSCODER : longint; { return type might be wrong }
  begin
    GST_TYPE_TRANSCODER:=gst_transcoder_get_type;
  end;


end.
