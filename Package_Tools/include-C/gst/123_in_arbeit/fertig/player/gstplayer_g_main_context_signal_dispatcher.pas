unit gstplayer_g_main_context_signal_dispatcher;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2014-2015 Sebastian Dröge <sebastian@centricular.com>
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
{$ifndef __GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_H__}
{$define __GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_H__}
{$include <gst/player/gstplayer-types.h>}
{$include <gst/player/gstplayer-signal-dispatcher.h>}
type

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CAST(obj : longint) : PGstPlayerGMainContextSignalDispatcher;

function gst_player_g_main_context_signal_dispatcher_get_type:TGType;cdecl;external libgstplayer;
function gst_player_g_main_context_signal_dispatcher_new(application_context:PGMainContext):PGstPlayerSignalDispatcher;cdecl;external libgstplayer;
{$endif}
{ __GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_H__  }

// === Konventiert am: 8-10-24 18:48:18 ===

function GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER : TGType;
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER(obj : Pointer) : PGstPlayerGMainContextSignalDispatcher;
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CLASS(klass : Pointer) : PGstPlayerGMainContextSignalDispatcherClass;
function GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER(obj : Pointer) : Tgboolean;
function GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CLASS(klass : Pointer) : Tgboolean;
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_GET_CLASS(obj : Pointer) : PGstPlayerGMainContextSignalDispatcherClass;

implementation

function GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER : TGType;
  begin
    GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER:=gst_player_g_main_context_signal_dispatcher_get_type;
  end;

function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER(obj : Pointer) : PGstPlayerGMainContextSignalDispatcher;
begin
  Result := PGstPlayerGMainContextSignalDispatcher(g_type_check_instance_cast(obj, GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER));
end;

function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CLASS(klass : Pointer) : PGstPlayerGMainContextSignalDispatcherClass;
begin
  Result := PGstPlayerGMainContextSignalDispatcherClass(g_type_check_class_cast(klass, GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER));
end;

function GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER);
end;

function GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER);
end;

function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_GET_CLASS(obj : Pointer) : PGstPlayerGMainContextSignalDispatcherClass;
begin
  Result := PGstPlayerGMainContextSignalDispatcherClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CAST(obj : longint) : PGstPlayerGMainContextSignalDispatcher;
begin
  GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CAST:=PGstPlayerGMainContextSignalDispatcher(obj);
end;


end.
