
unit gstsample;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstsample.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstsample.h
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
PGstBuffer  = ^GstBuffer;
PGstBufferList  = ^GstBufferList;
PGstCaps  = ^GstCaps;
PGstSample  = ^GstSample;
PGstSegment  = ^GstSegment;
PGstStructure  = ^GstStructure;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *
 * gstsample.h: Header for GstSample object
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
{$ifndef __GST_SAMPLE_H__}
{$define __GST_SAMPLE_H__}
{$include <gst/gstbuffer.h>}
{$include <gst/gstbufferlist.h>}
{$include <gst/gstcaps.h>}
{$include <gst/gstsegment.h>}
  var
    _gst_sample_type : TGType;cvar;external;

const
  GST_TYPE_SAMPLE = _gst_sample_type;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_IS_SAMPLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_SAMPLE_CAST(obj : longint) : PGstSample;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SAMPLE(obj : longint) : longint;

{*
 * GstSample:
 *
 * The opaque structure of a #GstSample. A sample contains a typed memory
 * block and the associated timing information. It is mainly used to
 * exchange buffers with an application.
  }
type

function gst_sample_get_type:TGType;cdecl;external;
{ allocation  }
(* Const before type ignored *)
function gst_sample_new(buffer:PGstBuffer; caps:PGstCaps; segment:PGstSegment; info:PGstStructure):PGstSample;cdecl;external;
function gst_sample_get_buffer(sample:PGstSample):PGstBuffer;cdecl;external;
function gst_sample_get_caps(sample:PGstSample):PGstCaps;cdecl;external;
function gst_sample_get_segment(sample:PGstSample):PGstSegment;cdecl;external;
(* Const before type ignored *)
function gst_sample_get_info(sample:PGstSample):PGstStructure;cdecl;external;
function gst_sample_get_buffer_list(sample:PGstSample):PGstBufferList;cdecl;external;
procedure gst_sample_set_buffer_list(sample:PGstSample; buffer_list:PGstBufferList);cdecl;external;
procedure gst_sample_set_buffer(sample:PGstSample; buffer:PGstBuffer);cdecl;external;
procedure gst_sample_set_caps(sample:PGstSample; caps:PGstCaps);cdecl;external;
(* Const before type ignored *)
procedure gst_sample_set_segment(sample:PGstSample; segment:PGstSegment);cdecl;external;
function gst_sample_set_info(sample:PGstSample; info:PGstStructure):Tgboolean;cdecl;external;
function gst_sample_ref(sample:PGstSample):PGstSample;cdecl;external;
procedure gst_sample_unref(sample:PGstSample);cdecl;external;
{$endif}
{ GST_DISABLE_MINIOBJECT_INLINE_FUNCTIONS  }
{*
 * gst_sample_is_writable:
 * @sample: A #GstSample
 *
 * Tests if you can safely set the buffer and / or buffer list of @sample.
 *
 * Since: 1.16
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_sample_is_writable(sample : longint) : longint;

{*
 * gst_sample_make_writable:
 * @sample: (transfer full): A #GstSample
 *
 * Returns a writable copy of @sample. If the source sample is
 * already writable, this will simply return the same sample.
 *
 * Use this function to ensure that a sample can be safely modified before
 * making changes to it, for example before calling gst_sample_set_buffer()
 *
 * If the reference count of the source sample @sample is exactly one, the caller
 * is the sole owner and this function will return the sample object unchanged.
 *
 * If there is more than one reference on the object, a copy will be made using
 * gst_sample_copy(). The passed-in @sample will be unreffed in that case, and the
 * caller will now own a reference to the new returned sample object.
 *
 * In short, this function unrefs the sample in the argument and refs the sample
 * that it returns. Don't access the argument after calling this function unless
 * you have an additional reference to it.
 *
 * Returns: (transfer full): a writable sample which may or may not be the
 *     same as @sample
 *
 * Since: 1.16
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_sample_make_writable(sample : longint) : longint;

(* Const before type ignored *)
function gst_sample_copy(sample:PGstSample):PGstSample;cdecl;external;
procedure gst_clear_sample(sample_ptr:PPGstSample);cdecl;external;
{*
 * gst_value_set_sample:
 * @v: a #GValue to receive the data
 * @b: (transfer none): a #GstSample to assign to the GstValue
 *
 * Sets @b as the value of @v.  Caller retains reference to sample.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_set_sample(v,b : longint) : longint;

{*
 * gst_value_take_sample:
 * @v: a #GValue to receive the data
 * @b: (transfer full): a #GstSample to assign to the GstValue
 *
 * Sets @b as the value of @v.  Caller gives away reference to sample.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_take_sample(v,b : longint) : longint;

{*
 * gst_value_get_sample:
 * @v: a #GValue to query
 *
 * Receives a #GstSample as the value of @v. Does not return a reference to
 * the sample, so the pointer is only valid for as long as the caller owns
 * a reference to @v.
 *
 * Returns: (transfer none): sample
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_get_sample(v : longint) : longint;

{$endif}
{ __GST_SAMPLE_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_SAMPLE(obj : longint) : longint;
begin
  GST_IS_SAMPLE:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_SAMPLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_SAMPLE_CAST(obj : longint) : PGstSample;
begin
  GST_SAMPLE_CAST:=PGstSample(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SAMPLE(obj : longint) : longint;
begin
  GST_SAMPLE:=GST_SAMPLE_CAST(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_sample_is_writable(sample : longint) : longint;
begin
  gst_sample_is_writable:=gst_mini_object_is_writable(GST_MINI_OBJECT_CAST(sample));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_sample_make_writable(sample : longint) : longint;
begin
  gst_sample_make_writable:=GST_SAMPLE_CAST(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(sample)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_set_sample(v,b : longint) : longint;
begin
  gst_value_set_sample:=g_value_set_boxed(v,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_take_sample(v,b : longint) : longint;
begin
  gst_value_take_sample:=g_value_take_boxed(v,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_get_sample(v : longint) : longint;
begin
  gst_value_get_sample:=GST_SAMPLE_CAST(g_value_get_boxed(v));
end;


end.
