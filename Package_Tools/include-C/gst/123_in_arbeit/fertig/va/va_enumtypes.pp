
unit va_enumtypes;
interface

{
  Automatically converted by H2Pas 1.0.0 from va_enumtypes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    va_enumtypes.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is generated by glib-mkenums, do not modify it. This code is licensed under the same license as the containing project. Note that it links to GLib, so must comply with the LGPL linking clauses.  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include <gst/va/va-prelude.h>}
{ enumerations from "gstva.h"  }

function gst_va_feature_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_VA_FEATURE : longint; { return type might be wrong }

{ Generated data ends here  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VA_FEATURE : longint; { return type might be wrong }
  begin
    GST_TYPE_VA_FEATURE:=gst_va_feature_get_type;
  end;


end.
