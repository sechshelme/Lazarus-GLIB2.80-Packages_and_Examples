unit gstfragment;

interface

uses
  glib280, gst124;

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


function gst_fragment_get_type:TGType;cdecl;external libgsturidownloader;
function gst_fragment_get_buffer(fragment:PGstFragment):PGstBuffer;cdecl;external libgsturidownloader;
procedure gst_fragment_set_caps(fragment:PGstFragment; caps:PGstCaps);cdecl;external libgsturidownloader;
function gst_fragment_get_caps(fragment:PGstFragment):PGstCaps;cdecl;external libgsturidownloader;
function gst_fragment_add_buffer(fragment:PGstFragment; buffer:PGstBuffer):Tgboolean;cdecl;external libgsturidownloader;
function gst_fragment_new:PGstFragment;cdecl;external libgsturidownloader;
{$endif}
{ __GSTFRAGMENT_H__  }

// === Konventiert am: 12-10-24 19:27:08 ===

function GST_TYPE_FRAGMENT : TGType;
function GST_FRAGMENT(obj : Pointer) : PGstFragment;
function GST_FRAGMENT_CLASS(klass : Pointer) : PGstFragmentClass;
function GST_IS_FRAGMENT(obj : Pointer) : Tgboolean;
function GST_IS_FRAGMENT_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_FRAGMENT : TGType;
  begin
    GST_TYPE_FRAGMENT:=gst_fragment_get_type;
  end;

function GST_FRAGMENT(obj : Pointer) : PGstFragment;
begin
  Result := PGstFragment(g_type_check_instance_cast(obj, GST_TYPE_FRAGMENT));
end;

function GST_FRAGMENT_CLASS(klass : Pointer) : PGstFragmentClass;
begin
  Result := PGstFragmentClass(g_type_check_class_cast(klass, GST_TYPE_FRAGMENT));
end;

function GST_IS_FRAGMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_FRAGMENT);
end;

function GST_IS_FRAGMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_FRAGMENT);
end;



end.
