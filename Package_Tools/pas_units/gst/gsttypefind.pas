unit gsttypefind;

interface

uses
  glib280, common_GST, gstobject, gstcaps, gstplugin;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGstTypeFindProbability = ^TGstTypeFindProbability;
  TGstTypeFindProbability = longint;

const
  GST_TYPE_FIND_NONE = 0;
  GST_TYPE_FIND_MINIMUM = 1;
  GST_TYPE_FIND_POSSIBLE = 50;
  GST_TYPE_FIND_LIKELY = 80;
  GST_TYPE_FIND_NEARLY_CERTAIN = 99;
  GST_TYPE_FIND_MAXIMUM = 100;

type
  TGstTypeFind = record
    peek: function(Data: Tgpointer; offset: Tgint64; size: Tguint): Pguint8; cdecl;
    suggest: procedure(Data: Tgpointer; probability: Tguint; caps: PGstCaps); cdecl;
    Data: Tgpointer;
    get_length: function(Data: Tgpointer): Tguint64; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstTypeFind = ^TGstTypeFind;

  TGstTypeFindFunction = procedure(find: PGstTypeFind; user_data: Tgpointer); cdecl;

function gst_type_find_get_type: TGType; cdecl; external gstreamerlib;
function gst_type_find_peek(find: PGstTypeFind; offset: Tgint64; size: Tguint): Pguint8; cdecl; external gstreamerlib;
procedure gst_type_find_suggest(find: PGstTypeFind; probability: Tguint; caps: PGstCaps); cdecl; external gstreamerlib;
procedure gst_type_find_suggest_empty_simple(find: PGstTypeFind; probability: Tguint; media_type: PChar); cdecl; external gstreamerlib;
procedure gst_type_find_suggest_simple(find: PGstTypeFind; probability: Tguint; media_type: PChar; fieldname: PChar); varargs cdecl; external gstreamerlib;
function gst_type_find_get_length(find: PGstTypeFind): Tguint64; cdecl; external gstreamerlib;
function gst_type_find_register(plugin: PGstPlugin; Name: Pgchar; rank: Tguint; func: TGstTypeFindFunction; extensions: Pgchar;
  possible_caps: PGstCaps; Data: Tgpointer; data_notify: TGDestroyNotify): Tgboolean; cdecl; external gstreamerlib;

function GST_TYPE_TYPE_FIND: TGType;

// === Konventiert am: 16-9-24 17:51:49 ===


implementation

function GST_TYPE_TYPE_FIND: TGType;
begin
  GST_TYPE_TYPE_FIND := gst_type_find_get_type;
end;


end.
