
unit gsturidownloader_debug;
interface

{
  Automatically converted by H2Pas 0.99.16 from gsturidownloader_debug.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsturidownloader_debug.h
}

Type
PGstDebugCategory = ^TGstDebugCategory;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef __GST_URIDOWNLOADER_DEBUG_H__}
{$define __GST_URIDOWNLOADER_DEBUG_H__}
{$include <gst/gst.h>}
{GST_DEBUG_CATEGORY_EXTERN (uridownloader_debug); }
  var
    uridownloader_debug : PGstDebugCategory;cvar;external;
{$endif}
{ __GST_URIDOWNLOADER_DEBUG_H__  }

implementation


end.
