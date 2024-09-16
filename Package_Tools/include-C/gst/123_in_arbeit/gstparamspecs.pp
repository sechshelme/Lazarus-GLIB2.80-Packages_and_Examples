
unit gstparamspecs;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstparamspecs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstparamspecs.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
PGParamSpec  = ^GParamSpec;
PGstParamSpecArray  = ^GstParamSpecArray;
PGstParamSpecFraction  = ^GstParamSpecFraction;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer - GParamSpecs for some of our types
 * Copyright (C) 2007 Tim-Philipp Müller  <tim centricular net>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_PARAMSPECS_H__}
{$define __GST_PARAMSPECS_H__}
{$include <gst/gstvalue.h>}
{ --- paramspec flags  }
{*
 * GST_PARAM_CONTROLLABLE: (value 512)
 *
 * Use this flag on GObject properties to signal they can make sense to be.
 * controlled over time. This hint is used by the GstController.
  }

const
  GST_PARAM_CONTROLLABLE = 1 shl (G_PARAM_USER_SHIFT+1);  
{*
 * GST_PARAM_MUTABLE_READY: (value 1024)
 *
 * Use this flag on GObject properties of GstElements to indicate that
 * they can be changed when the element is in the READY or lower state.
  }
  GST_PARAM_MUTABLE_READY = 1 shl (G_PARAM_USER_SHIFT+2);  
{*
 * GST_PARAM_MUTABLE_PAUSED: (value 2048)
 *
 * Use this flag on GObject properties of GstElements to indicate that
 * they can be changed when the element is in the PAUSED or lower state.
 * This flag implies GST_PARAM_MUTABLE_READY.
  }
  GST_PARAM_MUTABLE_PAUSED = 1 shl (G_PARAM_USER_SHIFT+3);  
{*
 * GST_PARAM_MUTABLE_PLAYING: (value 4096)
 *
 * Use this flag on GObject properties of GstElements to indicate that
 * they can be changed when the element is in the PLAYING or lower state.
 * This flag implies GST_PARAM_MUTABLE_PAUSED.
  }
  GST_PARAM_MUTABLE_PLAYING = 1 shl (G_PARAM_USER_SHIFT+4);  
{*
 * GST_PARAM_DOC_SHOW_DEFAULT: (value 8192)
 *
 * Use this flag on GObject properties of GstObject to indicate that
 * during `gst-inspect` and friends, the default value should be used
 * as default instead of the current value.
 *
 * Since: 1.18
  }
  GST_PARAM_DOC_SHOW_DEFAULT = 1 shl (G_PARAM_USER_SHIFT+5);  
{*
 * GST_PARAM_CONDITIONALLY_AVAILABLE: (value 16384)
 *
 * Use this flag on GObject properties of GstObject to indicate that
 * they might not be available depending on environment such as OS, device, etc,
 * so such properties will be installed conditionally only if the GstObject is
 * able to support it.
 *
 * Since: 1.18
  }
  GST_PARAM_CONDITIONALLY_AVAILABLE = 1 shl (G_PARAM_USER_SHIFT+6);  
{*
 * GST_PARAM_USER_SHIFT: (value 65536)
 *
 * Bits based on GST_PARAM_USER_SHIFT can be used by 3rd party applications.
  }
  GST_PARAM_USER_SHIFT = 1 shl (G_PARAM_USER_SHIFT+8);  
{ --- type macros ---  }
{*
 * GstParamFraction:
 *
 * A fundamental type that describes a #GParamSpec for fractional
 * properties
  }

{ was #define dname def_expr }
function GST_TYPE_PARAM_FRACTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PARAM_SPEC_FRACTION(pspec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PARAM_SPEC_FRACTION(pspec : longint) : longint;

{*
 * GstParamArray:
 *
 * A fundamental type that describes a #GParamSpec for arrays of
 * values
 *
 * Since: 1.12
  }
{ was #define dname def_expr }
function GST_TYPE_PARAM_ARRAY_LIST : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PARAM_SPEC_ARRAY_LIST(pspec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PARAM_SPEC_ARRAY_LIST(pspec : longint) : longint;

{ --- get_type functions ---  }
function gst_param_spec_fraction_get_type:TGType;cdecl;external;
function gst_param_spec_array_get_type:TGType;cdecl;external;
{ --- typedefs & structures ---  }
type
{*
 * GstParamSpecFraction:
 * @parent_instance: super class
 * @min_num: minimal numerator
 * @min_den: minimal denominator
 * @max_num: maximal numerator
 * @max_den: maximal denominator
 * @def_num: default numerator
 * @def_den: default denominator
 *
 * A GParamSpec derived structure that contains the meta data for fractional
 * properties.
  }
  PGstParamSpecFraction = ^TGstParamSpecFraction;
  TGstParamSpecFraction = record
      parent_instance : TGParamSpec;
      min_num : Tgint;
      min_den : Tgint;
      max_num : Tgint;
      max_den : Tgint;
      def_num : Tgint;
      def_den : Tgint;
    end;

{*
 * GstParamSpecArray:
 * @parent_instance: super class
 * @element_spec: the #GParamSpec of the type of values in the array
 *
 * A GParamSpec derived structure for arrays of values.
  }
  PGstParamSpecArray = ^TGstParamSpecArray;
  TGstParamSpecArray = record
      parent_instance : TGParamSpec;
      element_spec : PGParamSpec;
    end;

{ --- GParamSpec prototypes ---  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gst_param_spec_fraction(name:Pgchar; nick:Pgchar; blurb:Pgchar; min_num:Tgint; min_denom:Tgint; 
           max_num:Tgint; max_denom:Tgint; default_num:Tgint; default_denom:Tgint; flags:TGParamFlags):PGParamSpec;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_param_spec_array(name:Pgchar; nick:Pgchar; blurb:Pgchar; element_spec:PGParamSpec; flags:TGParamFlags):PGParamSpec;cdecl;external;
{$endif}
{ __GST_PARAMSPECS_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_PARAM_FRACTION : longint; { return type might be wrong }
  begin
    GST_TYPE_PARAM_FRACTION:=gst_param_spec_fraction_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PARAM_SPEC_FRACTION(pspec : longint) : longint;
begin
  GST_PARAM_SPEC_FRACTION:=G_TYPE_CHECK_INSTANCE_CAST(pspec,GST_TYPE_PARAM_FRACTION,GstParamSpecFraction);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PARAM_SPEC_FRACTION(pspec : longint) : longint;
begin
  GST_IS_PARAM_SPEC_FRACTION:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,GST_TYPE_PARAM_FRACTION);
end;

{ was #define dname def_expr }
function GST_TYPE_PARAM_ARRAY_LIST : longint; { return type might be wrong }
  begin
    GST_TYPE_PARAM_ARRAY_LIST:=gst_param_spec_array_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PARAM_SPEC_ARRAY_LIST(pspec : longint) : longint;
begin
  GST_IS_PARAM_SPEC_ARRAY_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,GST_TYPE_PARAM_ARRAY_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PARAM_SPEC_ARRAY_LIST(pspec : longint) : longint;
begin
  GST_PARAM_SPEC_ARRAY_LIST:=G_TYPE_CHECK_INSTANCE_CAST(pspec,GST_TYPE_PARAM_ARRAY_LIST,GstParamSpecArray);
end;


end.
