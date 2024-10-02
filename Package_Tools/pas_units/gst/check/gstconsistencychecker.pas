unit gstconsistencychecker;

interface

uses
  glib280, gst124;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGstStreamConsistency = record
  end;
  PGstStreamConsistency = ^TGstStreamConsistency;

function gst_consistency_checker_new(pad: PGstPad): PGstStreamConsistency; cdecl; external libgstcheck;
function gst_consistency_checker_add_pad(consist: PGstStreamConsistency; pad: PGstPad): Tgboolean; cdecl; external libgstcheck;
procedure gst_consistency_checker_reset(consist: PGstStreamConsistency); cdecl; external libgstcheck;
procedure gst_consistency_checker_free(consist: PGstStreamConsistency); cdecl; external libgstcheck;

// === Konventiert am: 2-10-24 16:59:43 ===


implementation



end.