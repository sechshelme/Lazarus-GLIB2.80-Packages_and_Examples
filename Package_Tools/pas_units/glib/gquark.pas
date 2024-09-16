unit gquark;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGQuark = ^TGQuark;
  TGQuark = Tguint32;

function g_quark_try_string(_string: Pgchar): TGQuark; cdecl; external libglib2;
function g_quark_from_static_string(_string: Pgchar): TGQuark; cdecl; external libglib2;
function g_quark_from_string(_string: Pgchar): TGQuark; cdecl; external libglib2;
function g_quark_to_string(quark: TGQuark): Pgchar; cdecl; external libglib2;
function g_intern_string(_string: Pgchar): Pgchar; cdecl; external libglib2;
function g_intern_static_string(_string: Pgchar): Pgchar; cdecl; external libglib2;

// === Konventiert am: 6-8-24 17:16:44 ===


implementation



end.
