unit gsturidownloader_debug;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef __GST_URIDOWNLOADER_DEBUG_H__}
{$define __GST_URIDOWNLOADER_DEBUG_H__}
{$include <gst/gst.h>}
{GST_DEBUG_CATEGORY_EXTERN (uridownloader_debug); }
  var
    uridownloader_debug : PGstDebugCategory;cvar;external libgsturidownloader;
{$endif}
{ __GST_URIDOWNLOADER_DEBUG_H__  }

// === Konventiert am: 12-10-24 19:27:21 ===


implementation



end.
