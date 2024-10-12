
unit gstfragment;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstfragment.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstfragment.h
}

Type
Pgchar = ^Tgchar;
PGstBuffer = ^TGstBuffer;
PGstCaps = ^TGstCaps;
PGstFragment = ^TGstFragment;
PGstFragmentClass = ^TGstFragmentClass;
PGstFragmentPrivate = ^TGstFragmentPrivate;
PGstStructure = ^TGstStructure;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2011 Andoni Morales Alastruey <ylatuya@gmail.com>
 *
 * gstfragment.h:
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
{$ifndef __GSTFRAGMENT_H__}
{$define __GSTFRAGMENT_H__}
{$include <glib-object.h>}
{$include <gst/gst.h>}
{$include <gst/uridownloader/uridownloader-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_FRAGMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_FRAGMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_FRAGMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_FRAGMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_FRAGMENT_CLASS(klass : longint) : longint;

type
{ URI of the fragment  }
{ Redirect target if any  }
{ If the redirect is permanent  }
{ Name of the fragment  }
{ Whether the fragment is complete or not  }
{ Epoch time when the download started  }
{ Epoch time when the download finished  }
{ Start time of the fragment  }
{ Stop time of the fragment  }
{ Index of the fragment  }
{ Whether this fragment is discontinuous or not  }
{ HTTP request/response headers  }
  PGstFragment = ^TGstFragment;
  TGstFragment = record
      parent : TGObject;
      uri : Pgchar;
      redirect_uri : Pgchar;
      redirect_permanent : Tgboolean;
      range_start : Tgint64;
      range_end : Tgint64;
      name : Pgchar;
      completed : Tgboolean;
      download_start_time : Tguint64;
      download_stop_time : Tguint64;
      start_time : Tguint64;
      stop_time : Tguint64;
      index : Tgboolean;
      discontinuous : Tgboolean;
      headers : PGstStructure;
      priv : PGstFragmentPrivate;
    end;

  PGstFragmentClass = ^TGstFragmentClass;
  TGstFragmentClass = record
      parent_class : TGObjectClass;
    end;


function gst_fragment_get_type:TGType;cdecl;external;
function gst_fragment_get_buffer(fragment:PGstFragment):PGstBuffer;cdecl;external;
procedure gst_fragment_set_caps(fragment:PGstFragment; caps:PGstCaps);cdecl;external;
function gst_fragment_get_caps(fragment:PGstFragment):PGstCaps;cdecl;external;
function gst_fragment_add_buffer(fragment:PGstFragment; buffer:PGstBuffer):Tgboolean;cdecl;external;
function gst_fragment_new:PGstFragment;cdecl;external;
{$endif}
{ __GSTFRAGMENT_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_FRAGMENT : longint; { return type might be wrong }
  begin
    GST_TYPE_FRAGMENT:=gst_fragment_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_FRAGMENT(obj : longint) : longint;
begin
  GST_FRAGMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_FRAGMENT,GstFragment);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_FRAGMENT_CLASS(klass : longint) : longint;
begin
  GST_FRAGMENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_FRAGMENT,GstFragmentClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_FRAGMENT(obj : longint) : longint;
begin
  GST_IS_FRAGMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_FRAGMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_FRAGMENT_CLASS(klass : longint) : longint;
begin
  GST_IS_FRAGMENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_FRAGMENT);
end;


end.
