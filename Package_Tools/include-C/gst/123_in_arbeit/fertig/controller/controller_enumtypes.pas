unit controller_enumtypes;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is generated by glib-mkenums, do not modify it. This code is licensed under the same license as the containing project. Note that it links to GLib, so must comply with the LGPL linking clauses.  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include <gst/controller/controller-prelude.h>}
{ enumerations from "gstinterpolationcontrolsource.h"  }

function gst_interpolation_mode_get_type:TGType;cdecl;external libgstcontroller;
{ enumerations from "gstlfocontrolsource.h"  }
function gst_lfo_waveform_get_type:TGType;cdecl;external libgstcontroller;
{ was #define dname def_expr }
function GST_TYPE_LFO_WAVEFORM : longint; { return type might be wrong }

{ Generated data ends here  }

// === Konventiert am: 7-10-24 14:51:46 ===

function GST_TYPE_INTERPOLATION_MODE : TGType;

implementation

function GST_TYPE_INTERPOLATION_MODE : TGType;
  begin
    GST_TYPE_INTERPOLATION_MODE:=gst_interpolation_mode_get_type;
  end;


{ was #define dname def_expr }
function GST_TYPE_LFO_WAVEFORM : longint; { return type might be wrong }
  begin
    GST_TYPE_LFO_WAVEFORM:=gst_lfo_waveform_get_type;
  end;


end.
