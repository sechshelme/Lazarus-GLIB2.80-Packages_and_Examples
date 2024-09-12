unit gstformat;

interface

uses
  glib280, common_GST, gstobject;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGstFormat = ^TGstFormat;
  TGstFormat = longint;

const
  GST_FORMAT_UNDEFINED = 0;
  GST_FORMAT_DEFAULT = 1;
  GST_FORMAT_BYTES = 2;
  GST_FORMAT_TIME = 3;
  GST_FORMAT_BUFFERS = 4;
  GST_FORMAT_PERCENT = 5;

type
  TGstFormatDefinition = record
    Value: TGstFormat;
    nick: Pgchar;
    description: Pgchar;
    quark: TGQuark;
  end;
  PGstFormatDefinition = ^TGstFormatDefinition;

function gst_format_get_name(format: TGstFormat): Pgchar; cdecl; external gstreamerlib;
function gst_format_to_quark(format: TGstFormat): TGQuark; cdecl; external gstreamerlib;
function gst_format_register(nick: Pgchar; description: Pgchar): TGstFormat; cdecl; external gstreamerlib;
function gst_format_get_by_nick(nick: Pgchar): TGstFormat; cdecl; external gstreamerlib;
function gst_formats_contains(formats: PGstFormat; format: TGstFormat): Tgboolean; cdecl; external gstreamerlib;
function gst_format_get_details(format: TGstFormat): PGstFormatDefinition; cdecl; external gstreamerlib;
function gst_format_iterate_definitions: PGstIterator; cdecl; external gstreamerlib;

const
  GST_FORMAT_PERCENT_MAX = 1000000;
  GST_FORMAT_PERCENT_SCALE = 10000;

  // === Konventiert am: 12-9-24 18:07:07 ===


implementation

end.
