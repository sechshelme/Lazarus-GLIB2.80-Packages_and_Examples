
unit gstappsink;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstappsink.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstappsink.h
}

Type
PGstAppSink = ^TGstAppSink;
PGstAppSinkClass = ^TGstAppSinkClass;
PGstAppSinkPrivate = ^TGstAppSinkPrivate;
PGstCaps = ^TGstCaps;
PGstMiniObject = ^TGstMiniObject;
PGstQuery = ^TGstQuery;
PGstSample = ^TGstSample;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2007 David Schleef <ds@schleef.org>
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
{$ifndef _GST_APP_SINK_H_}
{$define _GST_APP_SINK_H_}
{$include <gst/gst.h>}
{$include <gst/base/gstbasesink.h>}
{$include <gst/app/app-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_APP_SINK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_APP_SINK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_APP_SINK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_APP_SINK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_APP_SINK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_APP_SINK_CAST(obj : longint) : PGstAppSink;

type
{ FIXME 2.0: Make the instance/class struct private  }
{*
 * GstAppSinkCallbacks: (skip)
 * @eos: Called when the end-of-stream has been reached. This callback
 *       is called from the streaming thread.
 * @new_preroll: Called when a new preroll sample is available.
 *       This callback is called from the streaming thread.
 *       The new preroll sample can be retrieved with
 *       gst_app_sink_pull_preroll() either from this callback
 *       or from any other thread.
 * @new_sample: Called when a new sample is available.
 *       This callback is called from the streaming thread.
 *       The new sample can be retrieved with
 *       gst_app_sink_pull_sample() either from this callback
 *       or from any other thread.
 * @new_event: Called when a new event is available.
 *       This callback is called from the streaming thread.
 *       The new event can be retrieved with
 *       gst_app_sink_pull_event() either from this callback
 *       or from any other thread.
 *       The callback should return %TRUE if the event has been handled,
 *       %FALSE otherwise.
 *       Since: 1.20
  * @propose_allocation: Called when the propose_allocation query is available.
 *       This callback is called from the streaming thread.
 *       The allocation query can be retrieved with
 *       gst_app_sink_propose_allocation() either from this callback
 *       or from any other thread.
 *       Since: 1.24
 *
 * A set of callbacks that can be installed on the appsink with
 * gst_app_sink_set_callbacks().
  }
{< private > }

  PGstAppSinkCallbacks = ^TGstAppSinkCallbacks;
  TGstAppSinkCallbacks = record
      eos : procedure (appsink:PGstAppSink; user_data:Tgpointer);cdecl;
      new_preroll : function (appsink:PGstAppSink; user_data:Tgpointer):TGstFlowReturn;cdecl;
      new_sample : function (appsink:PGstAppSink; user_data:Tgpointer):TGstFlowReturn;cdecl;
      new_event : function (appsink:PGstAppSink; user_data:Tgpointer):Tgboolean;cdecl;
      propose_allocation : function (appsink:PGstAppSink; query:PGstQuery; user_data:Tgpointer):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING-2)-1] of Tgpointer;
    end;
{< private > }
{< private > }
  PGstAppSink = ^TGstAppSink;
  TGstAppSink = record
      basesink : TGstBaseSink;
      priv : PGstAppSinkPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{ signals  }
{ new_event is missing as we ran out padding  }
{ actions  }
{*
   * GstAppSinkClass::try_pull_object:
   *
   * See #GstAppSink::try-pull-object: signal.
   *
   * Since: 1.20
    }
{< private > }
  PGstAppSinkClass = ^TGstAppSinkClass;
  TGstAppSinkClass = record
      basesink_class : TGstBaseSinkClass;
      eos : procedure (appsink:PGstAppSink);cdecl;
      new_preroll : function (appsink:PGstAppSink):TGstFlowReturn;cdecl;
      new_sample : function (appsink:PGstAppSink):TGstFlowReturn;cdecl;
      pull_preroll : function (appsink:PGstAppSink):PGstSample;cdecl;
      pull_sample : function (appsink:PGstAppSink):PGstSample;cdecl;
      try_pull_preroll : function (appsink:PGstAppSink; timeout:TGstClockTime):PGstSample;cdecl;
      try_pull_sample : function (appsink:PGstAppSink; timeout:TGstClockTime):PGstSample;cdecl;
      try_pull_object : function (appsink:PGstAppSink; timeout:TGstClockTime):PGstMiniObject;cdecl;
      _gst_reserved : array[0..(GST_PADDING-3)-1] of Tgpointer;
    end;


function gst_app_sink_get_type:TGType;cdecl;external;
(* Const before declarator ignored *)
procedure gst_app_sink_set_caps(appsink:PGstAppSink; caps:PGstCaps);cdecl;external;
function gst_app_sink_get_caps(appsink:PGstAppSink):PGstCaps;cdecl;external;
function gst_app_sink_is_eos(appsink:PGstAppSink):Tgboolean;cdecl;external;
procedure gst_app_sink_set_emit_signals(appsink:PGstAppSink; emit:Tgboolean);cdecl;external;
function gst_app_sink_get_emit_signals(appsink:PGstAppSink):Tgboolean;cdecl;external;
procedure gst_app_sink_set_max_buffers(appsink:PGstAppSink; max:Tguint);cdecl;external;
function gst_app_sink_get_max_buffers(appsink:PGstAppSink):Tguint;cdecl;external;
procedure gst_app_sink_set_max_time(appsink:PGstAppSink; max:TGstClockTime);cdecl;external;
function gst_app_sink_get_max_time(appsink:PGstAppSink):TGstClockTime;cdecl;external;
procedure gst_app_sink_set_max_bytes(appsink:PGstAppSink; max:Tguint64);cdecl;external;
function gst_app_sink_get_max_bytes(appsink:PGstAppSink):Tguint64;cdecl;external;
procedure gst_app_sink_set_drop(appsink:PGstAppSink; drop:Tgboolean);cdecl;external;
function gst_app_sink_get_drop(appsink:PGstAppSink):Tgboolean;cdecl;external;
procedure gst_app_sink_set_buffer_list_support(appsink:PGstAppSink; enable_lists:Tgboolean);cdecl;external;
function gst_app_sink_get_buffer_list_support(appsink:PGstAppSink):Tgboolean;cdecl;external;
procedure gst_app_sink_set_wait_on_eos(appsink:PGstAppSink; wait:Tgboolean);cdecl;external;
function gst_app_sink_get_wait_on_eos(appsink:PGstAppSink):Tgboolean;cdecl;external;
function gst_app_sink_pull_preroll(appsink:PGstAppSink):PGstSample;cdecl;external;
function gst_app_sink_pull_sample(appsink:PGstAppSink):PGstSample;cdecl;external;
function gst_app_sink_pull_object(appsink:PGstAppSink):PGstMiniObject;cdecl;external;
function gst_app_sink_try_pull_preroll(appsink:PGstAppSink; timeout:TGstClockTime):PGstSample;cdecl;external;
function gst_app_sink_try_pull_sample(appsink:PGstAppSink; timeout:TGstClockTime):PGstSample;cdecl;external;
function gst_app_sink_try_pull_object(appsink:PGstAppSink; timeout:TGstClockTime):PGstMiniObject;cdecl;external;
procedure gst_app_sink_set_callbacks(appsink:PGstAppSink; callbacks:PGstAppSinkCallbacks; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function GST_TYPE_APP_SINK : longint; { return type might be wrong }
  begin
    GST_TYPE_APP_SINK:=gst_app_sink_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_APP_SINK(obj : longint) : longint;
begin
  GST_APP_SINK:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_APP_SINK,GstAppSink);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_APP_SINK_CLASS(klass : longint) : longint;
begin
  GST_APP_SINK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_APP_SINK,GstAppSinkClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_APP_SINK(obj : longint) : longint;
begin
  GST_IS_APP_SINK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_APP_SINK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_APP_SINK_CLASS(klass : longint) : longint;
begin
  GST_IS_APP_SINK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_APP_SINK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_APP_SINK_CAST(obj : longint) : PGstAppSink;
begin
  GST_APP_SINK_CAST:=PGstAppSink(obj);
end;


end.
