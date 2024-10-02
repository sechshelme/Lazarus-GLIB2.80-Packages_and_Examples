unit gstharness;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GstHarness - A test-harness for GStreamer testing
 *
 * Copyright (C) 2012-2015 Pexip <pexip.com>
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
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __GST_HARNESS_H__}
{$define __GST_HARNESS_H__}
{$include <gst/gst.h>}
{$include <gst/check/gsttestclock.h>}
{$include <gst/check/check-prelude.h>}
{*
 * GstHarnessThread:
 *
 * Opaque handle representing a GstHarness stress testing thread.
 *
 * Since: 1.6
  }
type
{*
 * GstHarness:
 * @element: the element inside the harness
 * @srcpad: the internal harness source pad
 * @sinkpad: the internal harness sink pad
 * @src_harness: the source (input) harness (if any)
 * @sink_harness: the sink (output) harness (if any)
 *
 * Since: 1.6
  }
{< private > }
  PGstHarness = ^TGstHarness;
  TGstHarness = record
      element : PGstElement;
      srcpad : PGstPad;
      sinkpad : PGstPad;
      src_harness : PGstHarness;
      sink_harness : PGstHarness;
      priv : PGstHarnessPrivate;
    end;

{ Harness creation  }

function gst_harness_new_empty:PGstHarness;cdecl;external libgstcheck;
procedure gst_harness_add_element_full(h:PGstHarness; element:PGstElement; hsrc:PGstStaticPadTemplate; element_sinkpad_name:Pgchar; hsink:PGstStaticPadTemplate; 
            element_srcpad_name:Pgchar);cdecl;external libgstcheck;
function gst_harness_new_full(element:PGstElement; hsrc:PGstStaticPadTemplate; element_sinkpad_name:Pgchar; hsink:PGstStaticPadTemplate; element_srcpad_name:Pgchar):PGstHarness;cdecl;external libgstcheck;
function gst_harness_new_with_element(element:PGstElement; element_sinkpad_name:Pgchar; element_srcpad_name:Pgchar):PGstHarness;cdecl;external libgstcheck;
function gst_harness_new_with_padnames(element_name:Pgchar; element_sinkpad_name:Pgchar; element_srcpad_name:Pgchar):PGstHarness;cdecl;external libgstcheck;
function gst_harness_new_with_templates(element_name:Pgchar; hsrc:PGstStaticPadTemplate; hsink:PGstStaticPadTemplate):PGstHarness;cdecl;external libgstcheck;
function gst_harness_new(element_name:Pgchar):PGstHarness;cdecl;external libgstcheck;
function gst_harness_new_parse(launchline:Pgchar):PGstHarness;cdecl;external libgstcheck;
procedure gst_harness_add_parse(h:PGstHarness; launchline:Pgchar);cdecl;external libgstcheck;
procedure gst_harness_teardown(h:PGstHarness);cdecl;external libgstcheck;
procedure gst_harness_add_element_src_pad(h:PGstHarness; srcpad:PGstPad);cdecl;external libgstcheck;
procedure gst_harness_add_element_sink_pad(h:PGstHarness; sinkpad:PGstPad);cdecl;external libgstcheck;
{ Caps Functions  }
procedure gst_harness_set_src_caps(h:PGstHarness; caps:PGstCaps);cdecl;external libgstcheck;
procedure gst_harness_set_sink_caps(h:PGstHarness; caps:PGstCaps);cdecl;external libgstcheck;
procedure gst_harness_set_caps(h:PGstHarness; in:PGstCaps; out:PGstCaps);cdecl;external libgstcheck;
procedure gst_harness_set_src_caps_str(h:PGstHarness; str:Pgchar);cdecl;external libgstcheck;
procedure gst_harness_set_sink_caps_str(h:PGstHarness; str:Pgchar);cdecl;external libgstcheck;
procedure gst_harness_set_caps_str(h:PGstHarness; in:Pgchar; out:Pgchar);cdecl;external libgstcheck;
{ Clock Functions  }
procedure gst_harness_use_systemclock(h:PGstHarness);cdecl;external libgstcheck;
procedure gst_harness_use_testclock(h:PGstHarness);cdecl;external libgstcheck;
function gst_harness_get_testclock(h:PGstHarness):PGstTestClock;cdecl;external libgstcheck;
function gst_harness_set_time(h:PGstHarness; time:TGstClockTime):Tgboolean;cdecl;external libgstcheck;
function gst_harness_wait_for_clock_id_waits(h:PGstHarness; waits:Tguint; timeout:Tguint):Tgboolean;cdecl;external libgstcheck;
function gst_harness_crank_single_clock_wait(h:PGstHarness):Tgboolean;cdecl;external libgstcheck;
function gst_harness_crank_multiple_clock_waits(h:PGstHarness; waits:Tguint):Tgboolean;cdecl;external libgstcheck;
{ misc  }
procedure gst_harness_play(h:PGstHarness);cdecl;external libgstcheck;
procedure gst_harness_set_blocking_push_mode(h:PGstHarness);cdecl;external libgstcheck;
procedure gst_harness_set_forwarding(h:PGstHarness; forwarding:Tgboolean);cdecl;external libgstcheck;
{ buffers  }
function gst_harness_create_buffer(h:PGstHarness; size:Tgsize):PGstBuffer;cdecl;external libgstcheck;
function gst_harness_push(h:PGstHarness; buffer:PGstBuffer):TGstFlowReturn;cdecl;external libgstcheck;
function gst_harness_pull(h:PGstHarness):PGstBuffer;cdecl;external libgstcheck;
function gst_harness_try_pull(h:PGstHarness):PGstBuffer;cdecl;external libgstcheck;
function gst_harness_pull_until_eos(h:PGstHarness; buf:PPGstBuffer):Tgboolean;cdecl;external libgstcheck;
function gst_harness_push_and_pull(h:PGstHarness; buffer:PGstBuffer):PGstBuffer;cdecl;external libgstcheck;
function gst_harness_buffers_received(h:PGstHarness):Tguint;cdecl;external libgstcheck;
function gst_harness_buffers_in_queue(h:PGstHarness):Tguint;cdecl;external libgstcheck;
procedure gst_harness_set_drop_buffers(h:PGstHarness; drop_buffers:Tgboolean);cdecl;external libgstcheck;
procedure gst_harness_dump_to_file(h:PGstHarness; filename:Pgchar);cdecl;external libgstcheck;
function gst_harness_take_all_data(h:PGstHarness; size:Pgsize):Pguint8;cdecl;external libgstcheck;
function gst_harness_take_all_data_as_buffer(h:PGstHarness):PGstBuffer;cdecl;external libgstcheck;
function gst_harness_take_all_data_as_bytes(h:PGstHarness):PGBytes;cdecl;external libgstcheck;
function gst_harness_get_last_pushed_timestamp(h:PGstHarness):TGstClockTime;cdecl;external libgstcheck;
{ downstream events  }
function gst_harness_push_event(h:PGstHarness; event:PGstEvent):Tgboolean;cdecl;external libgstcheck;
function gst_harness_pull_event(h:PGstHarness):PGstEvent;cdecl;external libgstcheck;
function gst_harness_try_pull_event(h:PGstHarness):PGstEvent;cdecl;external libgstcheck;
function gst_harness_events_received(h:PGstHarness):Tguint;cdecl;external libgstcheck;
function gst_harness_events_in_queue(h:PGstHarness):Tguint;cdecl;external libgstcheck;
{ upstream events  }
function gst_harness_push_upstream_event(h:PGstHarness; event:PGstEvent):Tgboolean;cdecl;external libgstcheck;
function gst_harness_pull_upstream_event(h:PGstHarness):PGstEvent;cdecl;external libgstcheck;
function gst_harness_try_pull_upstream_event(h:PGstHarness):PGstEvent;cdecl;external libgstcheck;
function gst_harness_upstream_events_received(h:PGstHarness):Tguint;cdecl;external libgstcheck;
function gst_harness_upstream_events_in_queue(h:PGstHarness):Tguint;cdecl;external libgstcheck;
{ latency  }
function gst_harness_query_latency(h:PGstHarness):TGstClockTime;cdecl;external libgstcheck;
procedure gst_harness_set_upstream_latency(h:PGstHarness; latency:TGstClockTime);cdecl;external libgstcheck;
procedure gst_harness_set_live(h:PGstHarness; is_live:Tgboolean);cdecl;external libgstcheck;
{ allocation query parameters  }
procedure gst_harness_set_propose_allocator(h:PGstHarness; allocator:PGstAllocator; params:PGstAllocationParams);cdecl;external libgstcheck;
procedure gst_harness_get_allocator(h:PGstHarness; allocator:PPGstAllocator; params:PGstAllocationParams);cdecl;external libgstcheck;
procedure gst_harness_add_propose_allocation_meta(h:PGstHarness; api:TGType; params:PGstStructure);cdecl;external libgstcheck;
{ src-harness  }
procedure gst_harness_add_src_harness(h:PGstHarness; src_harness:PGstHarness; has_clock_wait:Tgboolean);cdecl;external libgstcheck;
procedure gst_harness_add_src(h:PGstHarness; src_element_name:Pgchar; has_clock_wait:Tgboolean);cdecl;external libgstcheck;
procedure gst_harness_add_src_parse(h:PGstHarness; launchline:Pgchar; has_clock_wait:Tgboolean);cdecl;external libgstcheck;
function gst_harness_push_from_src(h:PGstHarness):TGstFlowReturn;cdecl;external libgstcheck;
function gst_harness_src_crank_and_push_many(h:PGstHarness; cranks:Tgint; pushes:Tgint):TGstFlowReturn;cdecl;external libgstcheck;
function gst_harness_src_push_event(h:PGstHarness):Tgboolean;cdecl;external libgstcheck;
{ sink-harness  }
procedure gst_harness_add_sink_harness(h:PGstHarness; sink_harness:PGstHarness);cdecl;external libgstcheck;
procedure gst_harness_add_sink(h:PGstHarness; sink_element_name:Pgchar);cdecl;external libgstcheck;
procedure gst_harness_add_sink_parse(h:PGstHarness; launchline:Pgchar);cdecl;external libgstcheck;
function gst_harness_push_to_sink(h:PGstHarness):TGstFlowReturn;cdecl;external libgstcheck;
function gst_harness_sink_push_many(h:PGstHarness; pushes:Tgint):TGstFlowReturn;cdecl;external libgstcheck;
{ convenience functions  }
function gst_harness_find_element(h:PGstHarness; element_name:Pgchar):PGstElement;cdecl;external libgstcheck;
procedure gst_harness_set(h:PGstHarness; element_name:Pgchar; first_property_name:Pgchar; args:array of const);cdecl;external libgstcheck;
procedure gst_harness_set(h:PGstHarness; element_name:Pgchar; first_property_name:Pgchar);cdecl;external libgstcheck;
procedure gst_harness_get(h:PGstHarness; element_name:Pgchar; first_property_name:Pgchar; args:array of const);cdecl;external libgstcheck;
procedure gst_harness_get(h:PGstHarness; element_name:Pgchar; first_property_name:Pgchar);cdecl;external libgstcheck;
procedure gst_harness_add_probe(h:PGstHarness; element_name:Pgchar; pad_name:Pgchar; mask:TGstPadProbeType; callback:TGstPadProbeCallback; 
            user_data:Tgpointer; destroy_data:TGDestroyNotify);cdecl;external libgstcheck;
{ Stress  }
function gst_harness_stress_thread_stop(t:PGstHarnessThread):Tguint;cdecl;external libgstcheck;
function gst_harness_stress_custom_start(h:PGstHarness; init:TGFunc; callback:TGFunc; data:Tgpointer; sleep:Tgulong):PGstHarnessThread;cdecl;external libgstcheck;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_statechange_start(h : longint) : longint;

function gst_harness_stress_statechange_start_full(h:PGstHarness; sleep:Tgulong):PGstHarnessThread;cdecl;external libgstcheck;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_push_buffer_start(h,c,s,b : longint) : longint;

function gst_harness_stress_push_buffer_start_full(h:PGstHarness; caps:PGstCaps; segment:PGstSegment; buf:PGstBuffer; sleep:Tgulong):PGstHarnessThread;cdecl;external libgstcheck;
{*
 * GstHarnessPrepareBufferFunc:
 * @h: a #GstHarness
 * @data: user data
 *
 * Since: 1.6
  }
type
  PGstHarnessPrepareBufferFunc = ^TGstHarnessPrepareBufferFunc;
  TGstHarnessPrepareBufferFunc = function (h:PGstHarness; data:Tgpointer):PGstBuffer;cdecl;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_harness_stress_push_buffer_with_cb_start(h,c,s,f,d,n : longint) : longint;

function gst_harness_stress_push_buffer_with_cb_start_full(h:PGstHarness; caps:PGstCaps; segment:PGstSegment; func:TGstHarnessPrepareBufferFunc; data:Tgpointer; 
           notify:TGDestroyNotify; sleep:Tgulong):PGstHarnessThread;cdecl;external libgstcheck;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_push_event_start(h,e : longint) : longint;

function gst_harness_stress_push_event_start_full(h:PGstHarness; event:PGstEvent; sleep:Tgulong):PGstHarnessThread;cdecl;external libgstcheck;
{*
 * GstHarnessPrepareEventFunc:
 * @h: a #GstHarness
 * @data: user data
 *
 * Since: 1.8
  }
type
  PGstHarnessPrepareEventFunc = ^TGstHarnessPrepareEventFunc;
  TGstHarnessPrepareEventFunc = function (h:PGstHarness; data:Tgpointer):PGstEvent;cdecl;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_harness_stress_push_event_with_cb_start(h,f,d,n : longint) : longint;

function gst_harness_stress_push_event_with_cb_start_full(h:PGstHarness; func:TGstHarnessPrepareEventFunc; data:Tgpointer; notify:TGDestroyNotify; sleep:Tgulong):PGstHarnessThread;cdecl;external libgstcheck;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_send_upstream_event_start(h,e : longint) : longint;

function gst_harness_stress_push_upstream_event_start_full(h:PGstHarness; event:PGstEvent; sleep:Tgulong):PGstHarnessThread;cdecl;external libgstcheck;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_send_upstream_event_with_cb_start(h,f,d,n : longint) : longint;

function gst_harness_stress_push_upstream_event_with_cb_start_full(h:PGstHarness; func:TGstHarnessPrepareEventFunc; data:Tgpointer; notify:TGDestroyNotify; sleep:Tgulong):PGstHarnessThread;cdecl;external libgstcheck;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_property_start(h,n,v : longint) : longint;

function gst_harness_stress_property_start_full(h:PGstHarness; name:Pgchar; value:PGValue; sleep:Tgulong):PGstHarnessThread;cdecl;external libgstcheck;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_requestpad_start(h,t,n,c,r : longint) : longint;

function gst_harness_stress_requestpad_start_full(h:PGstHarness; templ:PGstPadTemplate; name:Pgchar; caps:PGstCaps; release:Tgboolean; 
           sleep:Tgulong):PGstHarnessThread;cdecl;external libgstcheck;
{$endif}
{ __GST_HARNESS_H__  }

// === Konventiert am: 2-10-24 16:59:50 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_statechange_start(h : longint) : longint;
begin
  gst_harness_stress_statechange_start:=gst_harness_stress_statechange_start_full(h,G_USEC_PER_SEC/100);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_push_buffer_start(h,c,s,b : longint) : longint;
begin
  gst_harness_stress_push_buffer_start:=gst_harness_stress_push_buffer_start_full(h,c,s,b,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_push_buffer_with_cb_start(h,c,s,f,d,n : longint) : longint;
begin
  gst_harness_stress_push_buffer_with_cb_start:=gst_harness_stress_push_buffer_with_cb_start_full(h,c,s,f,d,n,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_push_event_start(h,e : longint) : longint;
begin
  gst_harness_stress_push_event_start:=gst_harness_stress_push_event_start_full(h,e,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_push_event_with_cb_start(h,f,d,n : longint) : longint;
begin
  gst_harness_stress_push_event_with_cb_start:=gst_harness_stress_push_event_with_cb_start_full(h,f,d,n,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_send_upstream_event_start(h,e : longint) : longint;
begin
  gst_harness_stress_send_upstream_event_start:=gst_harness_stress_push_upstream_event_start_full(h,e,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_send_upstream_event_with_cb_start(h,f,d,n : longint) : longint;
begin
  gst_harness_stress_send_upstream_event_with_cb_start:=gst_harness_stress_push_upstream_event_with_cb_start_full(h,f,d,n,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_property_start(h,n,v : longint) : longint;
begin
  gst_harness_stress_property_start:=gst_harness_stress_property_start_full(h,n,v,G_USEC_PER_SEC/1000);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_harness_stress_requestpad_start(h,t,n,c,r : longint) : longint;
begin
  gst_harness_stress_requestpad_start:=gst_harness_stress_requestpad_start_full(h,t,n,c,r,G_USEC_PER_SEC/100);
end;


end.