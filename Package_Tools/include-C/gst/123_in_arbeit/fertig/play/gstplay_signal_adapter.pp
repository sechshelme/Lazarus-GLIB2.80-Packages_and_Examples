
unit gstplay_signal_adapter;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstplay_signal_adapter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstplay_signal_adapter.h
}

Type
PGMainContext = ^TGMainContext;
PGstPlay = ^TGstPlay;
PGstPlaySignalAdapter = ^TGstPlaySignalAdapter;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2019-2020 Stephan Hesse <stephan@emliri.com>
 * Copyright (C) 2020 Philippe Normand <philn@igalia.com>
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
{$ifndef __GST_PLAY_SIGNAL_ADAPTER_H__}
{$define __GST_PLAY_SIGNAL_ADAPTER_H__}
{$include <gst/play/gstplay-types.h>}

{ was #define dname def_expr }
function GST_TYPE_PLAY_SIGNAL_ADAPTER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY_SIGNAL_ADAPTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY_SIGNAL_ADAPTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAY_SIGNAL_ADAPTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAY_SIGNAL_ADAPTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY_SIGNAL_ADAPTER_GET_CLASS(obj : longint) : longint;

{*
 * GST_PLAY_SIGNAL_ADAPTER_CAST:
 * Since: 1.20
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLAY_SIGNAL_ADAPTER_CAST(obj : longint) : PGstPlaySignalAdapter;

{$ifdef G_DEFINE_AUTOPTR_CLEANUP_FUNC}
{$endif}
function gst_play_signal_adapter_get_type:TGType;cdecl;external;
function gst_play_signal_adapter_new(play:PGstPlay):PGstPlaySignalAdapter;cdecl;external;
function gst_play_signal_adapter_new_with_main_context(play:PGstPlay; context:PGMainContext):PGstPlaySignalAdapter;cdecl;external;
function gst_play_signal_adapter_new_sync_emit(play:PGstPlay):PGstPlaySignalAdapter;cdecl;external;
function gst_play_signal_adapter_get_play(adapter:PGstPlaySignalAdapter):PGstPlay;cdecl;external;
{$endif}
{ __GST_PLAY_SIGNAL_ADAPTER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_PLAY_SIGNAL_ADAPTER : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAY_SIGNAL_ADAPTER:=gst_play_signal_adapter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY_SIGNAL_ADAPTER(obj : longint) : longint;
begin
  GST_PLAY_SIGNAL_ADAPTER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLAY_SIGNAL_ADAPTER,GstPlaySignalAdapter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY_SIGNAL_ADAPTER_CLASS(klass : longint) : longint;
begin
  GST_PLAY_SIGNAL_ADAPTER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PLAY_SIGNAL_ADAPTER,GstPlaySignalAdapterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAY_SIGNAL_ADAPTER(obj : longint) : longint;
begin
  GST_IS_PLAY_SIGNAL_ADAPTER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLAY_SIGNAL_ADAPTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAY_SIGNAL_ADAPTER_CLASS(klass : longint) : longint;
begin
  GST_IS_PLAY_SIGNAL_ADAPTER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PLAY_SIGNAL_ADAPTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAY_SIGNAL_ADAPTER_GET_CLASS(obj : longint) : longint;
begin
  GST_PLAY_SIGNAL_ADAPTER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_PLAY_SIGNAL_ADAPTER,GstPlaySignalAdapterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLAY_SIGNAL_ADAPTER_CAST(obj : longint) : PGstPlaySignalAdapter;
begin
  GST_PLAY_SIGNAL_ADAPTER_CAST:=PGstPlaySignalAdapter(obj);
end;


end.
