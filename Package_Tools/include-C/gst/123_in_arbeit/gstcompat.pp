
unit gstcompat;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstcompat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstcompat.h
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


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2004 Wim Taymans <wim@fluendo.com>
 *
 * gstcompat.h: backwards compatibility stuff
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
{ API compatibility stuff  }
{$ifndef __GSTCOMPAT_H__}
{$define __GSTCOMPAT_H__}
{*
 * SECTION:gstcompat
 * @title: GstCompat
 * @short_description: Deprecated API entries
 *
 * Please do not use these in new code.
 * These symbols are only available by defining GST_DISABLE_DEPRECATED.
 * This can be done in CFLAGS for compiling old code.
  }
{$include <glib.h>}
{$include <gst/gstpad.h>}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_buffer_new_and_alloc(s : longint) : longint;

const
  GST_BUFFER_TIMESTAMP = GST_BUFFER_PTS;  
  GST_BUFFER_TIMESTAMP_IS_VALID = GST_BUFFER_PTS_IS_VALID;  
{ ************* }
{
static inline gboolean
gst_pad_set_caps (GstPad * pad, GstCaps * caps)

  GstEvent *event;
  gboolean res = TRUE;

  g_return_val_if_fail (GST_IS_PAD (pad), FALSE);
  g_return_val_if_fail (caps != NULL && gst_caps_is_fixed (caps), FALSE);

  event = gst_event_new_caps (caps);

  if (GST_PAD_IS_SRC (pad))
    res = gst_pad_push_event (pad, event);
  else
    res = gst_pad_send_event (pad, event);

  return res;

 }
{$ifndef GST_DISABLE_DEPRECATED}
{ added to ease the transition to 0.11  }

const
  gst_element_class_set_details_simple = gst_element_class_set_metadata;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_element_factory_get_longname(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_klass(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_description(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_author(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_documentation_uri(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_icon_name(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_get_caps_reffed(p : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_peer_get_caps_reffed(p : longint) : longint;

const
  gst_adapter_prev_timestamp = gst_adapter_prev_pts;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_tag_list_free(taglist : longint) : longint;

const
  GST_MESSAGE_DURATION = GST_MESSAGE_DURATION_CHANGED;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_message_new_duration(src,fmt,dur : longint) : longint;

{$endif}
{ not GST_DISABLE_DEPRECATED  }
{$endif}
{ __GSTCOMPAT_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_buffer_new_and_alloc(s : longint) : longint;
begin
  gst_buffer_new_and_alloc:=gst_buffer_new_allocate(NULL,s,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_longname(f : longint) : longint;
begin
  gst_element_factory_get_longname:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_LONGNAME);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_klass(f : longint) : longint;
begin
  gst_element_factory_get_klass:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_KLASS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_description(f : longint) : longint;
begin
  gst_element_factory_get_description:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_DESCRIPTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_author(f : longint) : longint;
begin
  gst_element_factory_get_author:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_AUTHOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_documentation_uri(f : longint) : longint;
begin
  gst_element_factory_get_documentation_uri:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_DOC_URI);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_icon_name(f : longint) : longint;
begin
  gst_element_factory_get_icon_name:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_ICON_NAME);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_get_caps_reffed(p : longint) : longint;
begin
  gst_pad_get_caps_reffed:=gst_pad_get_caps(p);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_peer_get_caps_reffed(p : longint) : longint;
begin
  gst_pad_peer_get_caps_reffed:=gst_pad_peer_get_caps(p);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_tag_list_free(taglist : longint) : longint;
begin
  gst_tag_list_free:=gst_tag_list_unref(taglist);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_message_new_duration(src,fmt,dur : longint) : longint;
begin
  gst_message_new_duration:=gst_message_new_duration_changed(src);
end;


end.
