unit gstcheck;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Common code for GStreamer unittests
 *
 * Copyright (C) <2004> Thomas Vander Stichele <thomas at apestaart dot org>
 * Copyright (C) <2008> Thijs Vermeir <thijsvermeir@gmail.com>
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
{$ifndef __GST_CHECK_H__}
{$define __GST_CHECK_H__}
{$include <signal.h>}
{$include <string.h>}
{$include <stdlib.h>}
{$include <math.h>}
{$include <gst/gst.h>}
{$include <gst/check/check-prelude.h>}
{$define CK_DLL_EXP}
{$include <gst/check/internal-check.h>}
  var
    check_debug : PGstDebugCategory;cvar;public;

const
  GST_CAT_DEFAULT = check_debug;  
{ logging function for tests
 * a test uses g_message() to log a debug line
 * a gst unit test can be run with GST_TEST_DEBUG env var set to see the
 * messages
  }
  var
    _gst_check_threads_running : Tgboolean;cvar;public;
    _gst_check_raised_critical : Tgboolean;cvar;public;
    _gst_check_raised_warning : Tgboolean;cvar;public;
    _gst_check_expecting_log : Tgboolean;cvar;public;
    _gst_check_list_tests : Tgboolean;cvar;public;
{ global variables used in test methods  }
    buffers : PGList;cvar;public;
    check_mutex : TGMutex;cvar;public;
    check_cond : TGCond;cvar;public;
{*
 * GstCheckABIStruct:
 * @name: The name of the structure
 * @size: The current size of a structure
 * @abi_size: The reference size of the structure
  }
type
  PGstCheckABIStruct = ^TGstCheckABIStruct;
  TGstCheckABIStruct = record
      name : Pchar;
      size : longint;
      abi_size : longint;
    end;
{*
 * GstCheckLogFilter:
 *
 * Opaque structure containing data about a log filter
 * function.
  }
{*
 * GstCheckLogFilterFunc:
 * @log_domain: the log domain of the message
 * @log_level: the log level of the message
 * @message: the message that has occurred
 * @user_data: user data
 *
 * A function that is called for messages matching the filter added by
 * @gst_check_add_log_filter.
 *
 * Returns: %TRUE if message should be discarded by GstCheck.
 *
 * Since: 1.12
  }

// Makros ??????????????

  TGstCheckLogFilterFunc = function (log_domain:Pgchar; log_level:TGLogLevelFlags; message:Pgchar; user_data:Tgpointer):Tgboolean;cdecl;

procedure gst_check_init(argc:Plongint; argv:PPPchar);cdecl;external libgstcheck;
function gst_check_add_log_filter(log_domain:Pgchar; log_level:TGLogLevelFlags; regex:PGRegex; func:TGstCheckLogFilterFunc; user_data:Tgpointer; 
           destroy_data:TGDestroyNotify):PGstCheckLogFilter;cdecl;external libgstcheck;
procedure gst_check_remove_log_filter(filter:PGstCheckLogFilter);cdecl;external libgstcheck;
procedure gst_check_clear_log_filter;cdecl;external libgstcheck;
function gst_check_chain_func(pad:PGstPad; parent:PGstObject; buffer:PGstBuffer):TGstFlowReturn;cdecl;external libgstcheck;
procedure gst_check_message_error(message:PGstMessage; _type:TGstMessageType; domain:TGQuark; code:Tgint);cdecl;external libgstcheck;
function gst_check_setup_element(factory:Pgchar):PGstElement;cdecl;external libgstcheck;
procedure gst_check_teardown_element(element:PGstElement);cdecl;external libgstcheck;
function gst_check_setup_src_pad(element:PGstElement; tmpl:PGstStaticPadTemplate):PGstPad;cdecl;external libgstcheck;
function gst_check_setup_src_pad_from_template(element:PGstElement; tmpl:PGstPadTemplate):PGstPad;cdecl;external libgstcheck;
function gst_check_setup_src_pad_by_name(element:PGstElement; tmpl:PGstStaticPadTemplate; name:Pgchar):PGstPad;cdecl;external libgstcheck;
function gst_check_setup_src_pad_by_name_from_template(element:PGstElement; tmpl:PGstPadTemplate; name:Pgchar):PGstPad;cdecl;external libgstcheck;
function gst_check_setup_sink_pad(element:PGstElement; tmpl:PGstStaticPadTemplate):PGstPad;cdecl;external libgstcheck;
function gst_check_setup_sink_pad_from_template(element:PGstElement; tmpl:PGstPadTemplate):PGstPad;cdecl;external libgstcheck;
function gst_check_setup_sink_pad_by_name(element:PGstElement; tmpl:PGstStaticPadTemplate; name:Pgchar):PGstPad;cdecl;external libgstcheck;
function gst_check_setup_sink_pad_by_name_from_template(element:PGstElement; tmpl:PGstPadTemplate; name:Pgchar):PGstPad;cdecl;external libgstcheck;
procedure gst_check_teardown_pad_by_name(element:PGstElement; name:Pgchar);cdecl;external libgstcheck;
procedure gst_check_teardown_src_pad(element:PGstElement);cdecl;external libgstcheck;
procedure gst_check_drop_buffers;cdecl;external libgstcheck;
procedure gst_check_caps_equal(caps1:PGstCaps; caps2:PGstCaps);cdecl;external libgstcheck;
procedure gst_check_buffer_data(buffer:PGstBuffer; data:Tgconstpointer; size:Tgsize);cdecl;external libgstcheck;
procedure gst_check_element_push_buffer_list(element_name:Pgchar; buffer_in:PGList; caps_in:PGstCaps; buffer_out:PGList; caps_out:PGstCaps; 
            last_flow_return:TGstFlowReturn);cdecl;external libgstcheck;
procedure gst_check_element_push_buffer(element_name:Pgchar; buffer_in:PGstBuffer; caps_in:PGstCaps; buffer_out:PGstBuffer; caps_out:PGstCaps);cdecl;external libgstcheck;
procedure gst_check_teardown_sink_pad(element:PGstElement);cdecl;external libgstcheck;
procedure gst_check_abi_list(list:PGstCheckABIStruct; have_abi_sizes:Tgboolean);cdecl;external libgstcheck;
function gst_check_run_suite(suite:PSuite; name:Pgchar; fname:Pgchar):Tgint;cdecl;external libgstcheck;
procedure gst_check_setup_events(srcpad:PGstPad; element:PGstElement; caps:PGstCaps; format:TGstFormat);cdecl;external libgstcheck;
procedure gst_check_setup_events_with_stream_id(srcpad:PGstPad; element:PGstElement; caps:PGstCaps; format:TGstFormat; stream_id:Pgchar);cdecl;external libgstcheck;
procedure gst_check_objects_destroyed_on_unref(object_to_unref:Tgpointer; first_object:Tgpointer; args:array of const);cdecl;external libgstcheck;
procedure gst_check_objects_destroyed_on_unref(object_to_unref:Tgpointer; first_object:Tgpointer);cdecl;external libgstcheck;
procedure gst_check_object_destroyed_on_unref(object_to_unref:Tgpointer);cdecl;external libgstcheck;
{*
 * GST_START_TEST:
 * @__testname: test function name
 *
 * wrapper for checks START_TEST
  }
{*
 * GST_END_TEST:
 *
 * wrapper for checks END_TEST
  }
{ additional fail macros  }
{*
 * fail_unless_equals_int:
 * @a: a #gint value or expression
 * @b: a #gint value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to. This
 * macro is for use in unit tests.
  }
{*
 * assert_equals_int:
 * @a: a #gint value or expression
 * @b: a #gint value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to. This
 * macro is for use in unit tests.
  }
{*
 * fail_unless_equals_int_hex:
 * @a: a #gint value or expression
 * @b: a #gint value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to in
 * hexadecimal format. This macro is for use in unit tests.
 *
 * Since: 1.2
  }
{*
 * assert_equals_int_hex:
 * @a: a #gint value or expression
 * @b: a #gint value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to in
 * hexadecimal format. This macro is for use in unit tests.
 *
 * Since: 1.2
  }
{*
 * fail_unless_equals_int64:
 * @a: a #gint64 value or expression
 * @b: a #gint64 value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to. This
 * macro is for use in unit tests.
  }
{*
 * assert_equals_int64:
 * @a: a #gint64 value or expression
 * @b: a #gint64 value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to. This
 * macro is for use in unit tests.
  }
{*
 * fail_unless_equals_int64_hex:
 * @a: a #gint64 value or expression
 * @b: a #gint64 value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to in
 * hexadecimal format. This macro is for use in unit tests.
 *
 * Since: 1.2
  }
{*
 * assert_equals_int64_hex:
 * @a: a #gint64 value or expression
 * @b: a #gint64 value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to in
 * hexadecimal format. This macro is for use in unit tests.
 *
 * Since: 1.2

/**
 * fail_unless_equals_uint64:
 * @a: a #guint64 value or expression
 * @b: a #guint64 value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to. This
 * macro is for use in unit tests.
  }
{*
 * assert_equals_uint64:
 * @a: a #guint64 value or expression
 * @b: a #guint64 value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to. This
 * macro is for use in unit tests.
  }
{*
 * fail_unless_equals_uint64_hex:
 * @a: a #gint64 value or expression
 * @b: a #gint64 value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to in
 * hexadecimal format. This macro is for use in unit tests.
 *
 * Since: 1.2
  }
{*
 * assert_equals_uint64_hex:
 * @a: a #guint64 value or expression
 * @b: a #guint64 value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to in
 * hexadecimal format. This macro is for use in unit tests.
 *
 * Since: 1.2
  }
{*
 * fail_unless_equals_string:
 * @a: a string literal or expression
 * @b: a string literal or expression
 *
 * This macro checks that @a and @b are equal (as per g_strcmp0()) and aborts if
 * this is not the case, printing both expressions and the values they
 * evaluated to. This macro is for use in unit tests.
  }
{*
 * assert_equals_string:
 * @a: a string literal or expression
 * @b: a string literal or expression
 *
 * This macro checks that @a and @b are equal (as per g_strcmp0()) and aborts if
 * this is not the case, printing both expressions and the values they
 * evaluated to. This macro is for use in unit tests.
  }
{*
 * fail_unless_equals_float:
 * @a: a #gdouble or #gfloat value or expression
 * @b: a #gdouble or #gfloat value or expression
 *
 * This macro checks that @a and @b are (almost) equal and aborts if this
 * is not the case, printing both expressions and the values they evaluated
 * to. This macro is for use in unit tests.
  }
{*
 * assert_equals_float:
 * @a: a #gdouble or #gfloat value or expression
 * @b: a #gdouble or #gfloat value or expression
 *
 * This macro checks that @a and @b are (almost) equal and aborts if this
 * is not the case, printing both expressions and the values they evaluated
 * to. This macro is for use in unit tests.
  }
{*
 * fail_unless_equals_pointer:
 * @a: a pointer value or expression
 * @b: a pointer value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this
 * is not the case, printing both expressions and the values they
 * evaluated to. This macro is for use in unit tests.
 *
 * Since: 1.2
  }
{*
 * assert_equals_pointer:
 * @a: a pointer value or expression
 * @b: a pointer value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this
 * is not the case, printing both expressions and the values they
 * evaluated to. This macro is for use in unit tests.
 *
 * Since: 1.2
  }
{*
 * fail_unless_equals_clocktime:
 * @a: a #GstClockTime value or expression
 * @b: a #GstClockTime value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to. This
 * macro is for use in unit tests.
  }
{**
 * thread test macros and variables
  }
  var
    thread_list : PGList;cvar;public;
    mutex : TGMutex;cvar;public;
    start_cond : TGCond;cvar;public;
{ used to notify main thread of thread startups  }
    sync_cond : TGCond;cvar;public;
{ used to synchronize all threads and main thread  }
{ was #define dname(params) para_def_expr }
{ return type might be wrong }   

function THREAD_TEST_RUNNING : longint;

{ additional assertions  }
{ Hack to allow run-time selection of unit tests to run via the
 * GST_CHECKS environment variable (test function names globs, comma
 * separated), or GST_CHECKS_IGNORE with the same semantics  }
function _gst_check_run_test_func(func_name:Pgchar):Tgboolean;cdecl;external libgstcheck;
const
  _tcase_add_test = __gst_tcase_add_test;  
{ A special variant to add broken tests. These are normally skipped, but can be
 * forced to run via GST_CHECKS  }
{$endif}
{ !__GI_SCANNER__  }
{$endif}
{ __GST_CHECK_H__  }

// === Konventiert am: 2-10-24 16:59:37 ===


implementation


{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function THREAD_TEST_RUNNING : longint;
begin
  THREAD_TEST_RUNNING:= not ( not (_gst_check_threads_running));
end;


end.
