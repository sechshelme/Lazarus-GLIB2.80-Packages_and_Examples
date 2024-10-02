/* GStreamer
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
 */

#ifndef __GST_CHECK_H__
#define __GST_CHECK_H__

#include <signal.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

#include <gst/gst.h>
#include <gst/check/check-prelude.h>

#define CK_DLL_EXP 
#include <gst/check/internal-check.h>



 GstDebugCategory *check_debug;
#define GST_CAT_DEFAULT check_debug

/* logging function for tests
 * a test uses g_message() to log a debug line
 * a gst unit test can be run with GST_TEST_DEBUG env var set to see the
 * messages
 */
 gboolean _gst_check_threads_running;
 gboolean _gst_check_raised_critical;
 gboolean _gst_check_raised_warning;
 gboolean _gst_check_expecting_log;
 gboolean _gst_check_list_tests;

/* global variables used in test methods */
 GList * buffers;

 GMutex check_mutex;
 GCond check_cond;

/**
 * GstCheckABIStruct:
 * @name: The name of the structure
 * @size: The current size of a structure
 * @abi_size: The reference size of the structure
 */
typedef struct
{
  const char *name;
  int size;
  int abi_size;
}
GstCheckABIStruct;

/**
 * GstCheckLogFilter:
 *
 * Opaque structure containing data about a log filter
 * function.
 */
typedef struct _GstCheckLogFilter GstCheckLogFilter;

/**
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
 */
typedef gboolean (*GstCheckLogFilterFunc) (const gchar * log_domain,
    GLogLevelFlags log_level, const gchar * message, gpointer user_data);


void gst_check_init (int *argc, char **argv[]);


GstCheckLogFilter * gst_check_add_log_filter (const gchar * log_domain,
    GLogLevelFlags log_level, GRegex * regex, GstCheckLogFilterFunc func,
    gpointer user_data, GDestroyNotify destroy_data);


void gst_check_remove_log_filter (GstCheckLogFilter * filter);


void gst_check_clear_log_filter (void);


GstFlowReturn gst_check_chain_func (GstPad * pad, GstObject * parent, GstBuffer * buffer);


void gst_check_message_error (GstMessage * message, GstMessageType type,
    GQuark domain, gint code);


GstElement *gst_check_setup_element (const gchar * factory);


void gst_check_teardown_element (GstElement * element);


GstPad *gst_check_setup_src_pad (GstElement * element,
    GstStaticPadTemplate * tmpl);


GstPad *gst_check_setup_src_pad_from_template (GstElement * element,
    GstPadTemplate * tmpl);


GstPad * gst_check_setup_src_pad_by_name (GstElement * element,
          GstStaticPadTemplate * tmpl, const gchar *name);


GstPad * gst_check_setup_src_pad_by_name_from_template (GstElement * element,
          GstPadTemplate * tmpl, const gchar *name);


GstPad *gst_check_setup_sink_pad (GstElement * element,
    GstStaticPadTemplate * tmpl);


GstPad *gst_check_setup_sink_pad_from_template (GstElement * element,
    GstPadTemplate * tmpl);


GstPad * gst_check_setup_sink_pad_by_name (GstElement * element,
          GstStaticPadTemplate * tmpl, const gchar *name);


GstPad * gst_check_setup_sink_pad_by_name_from_template (GstElement * element,
          GstPadTemplate * tmpl, const gchar *name);


void gst_check_teardown_pad_by_name (GstElement * element, const gchar *name);


void gst_check_teardown_src_pad (GstElement * element);


void gst_check_drop_buffers (void);


void gst_check_caps_equal (GstCaps * caps1, GstCaps * caps2);


void gst_check_buffer_data (GstBuffer * buffer, gconstpointer data, gsize size);


void gst_check_element_push_buffer_list (const gchar * element_name,
    GList * buffer_in, GstCaps * caps_in, GList * buffer_out,
    GstCaps * caps_out, GstFlowReturn last_flow_return);


void gst_check_element_push_buffer (const gchar * element_name,
    GstBuffer * buffer_in, GstCaps * caps_in, GstBuffer * buffer_out,
    GstCaps *caps_out);


void gst_check_teardown_sink_pad (GstElement * element);


void gst_check_abi_list (GstCheckABIStruct list[], gboolean have_abi_sizes);


gint gst_check_run_suite (Suite * suite, const gchar * name,
    const gchar * fname);


void gst_check_setup_events (GstPad * srcpad, GstElement * element,
    GstCaps * caps, GstFormat format);


void gst_check_setup_events_with_stream_id (GstPad * srcpad,
    GstElement * element, GstCaps * caps, GstFormat format,
    const gchar * stream_id);


void gst_check_objects_destroyed_on_unref (gpointer object_to_unref, gpointer first_object, ...)
  ;


void gst_check_object_destroyed_on_unref (gpointer object_to_unref);


/**
 * GST_START_TEST:
 * @__testname: test function name
 *
 * wrapper for checks START_TEST
 */
/**
 * GST_END_TEST:
 *
 * wrapper for checks END_TEST
 */

/* additional fail macros */
/**
 * fail_unless_equals_int:
 * @a: a #gint value or expression
 * @b: a #gint value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to. This
 * macro is for use in unit tests.
 */
/**
 * assert_equals_int:
 * @a: a #gint value or expression
 * @b: a #gint value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to. This
 * macro is for use in unit tests.
 */

/**
 * fail_unless_equals_int_hex:
 * @a: a #gint value or expression
 * @b: a #gint value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to in
 * hexadecimal format. This macro is for use in unit tests.
 *
 * Since: 1.2
 */

/**
 * assert_equals_int_hex:
 * @a: a #gint value or expression
 * @b: a #gint value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to in
 * hexadecimal format. This macro is for use in unit tests.
 *
 * Since: 1.2
 */

/**
 * fail_unless_equals_int64:
 * @a: a #gint64 value or expression
 * @b: a #gint64 value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to. This
 * macro is for use in unit tests.
 */
/**
 * assert_equals_int64:
 * @a: a #gint64 value or expression
 * @b: a #gint64 value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to. This
 * macro is for use in unit tests.
 */

/**
 * fail_unless_equals_int64_hex:
 * @a: a #gint64 value or expression
 * @b: a #gint64 value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to in
 * hexadecimal format. This macro is for use in unit tests.
 *
 * Since: 1.2
 */
/**
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
 */
/**
 * assert_equals_uint64:
 * @a: a #guint64 value or expression
 * @b: a #guint64 value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to. This
 * macro is for use in unit tests.
 */

/**
 * fail_unless_equals_uint64_hex:
 * @a: a #gint64 value or expression
 * @b: a #gint64 value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to in
 * hexadecimal format. This macro is for use in unit tests.
 *
 * Since: 1.2
 */
/**
 * assert_equals_uint64_hex:
 * @a: a #guint64 value or expression
 * @b: a #guint64 value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to in
 * hexadecimal format. This macro is for use in unit tests.
 *
 * Since: 1.2
 */

/**
 * fail_unless_equals_string:
 * @a: a string literal or expression
 * @b: a string literal or expression
 *
 * This macro checks that @a and @b are equal (as per g_strcmp0()) and aborts if
 * this is not the case, printing both expressions and the values they
 * evaluated to. This macro is for use in unit tests.
 */
/**
 * assert_equals_string:
 * @a: a string literal or expression
 * @b: a string literal or expression
 *
 * This macro checks that @a and @b are equal (as per g_strcmp0()) and aborts if
 * this is not the case, printing both expressions and the values they
 * evaluated to. This macro is for use in unit tests.
 */

/**
 * fail_unless_equals_float:
 * @a: a #gdouble or #gfloat value or expression
 * @b: a #gdouble or #gfloat value or expression
 *
 * This macro checks that @a and @b are (almost) equal and aborts if this
 * is not the case, printing both expressions and the values they evaluated
 * to. This macro is for use in unit tests.
 */

/**
 * assert_equals_float:
 * @a: a #gdouble or #gfloat value or expression
 * @b: a #gdouble or #gfloat value or expression
 *
 * This macro checks that @a and @b are (almost) equal and aborts if this
 * is not the case, printing both expressions and the values they evaluated
 * to. This macro is for use in unit tests.
 */

/**
 * fail_unless_equals_pointer:
 * @a: a pointer value or expression
 * @b: a pointer value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this
 * is not the case, printing both expressions and the values they
 * evaluated to. This macro is for use in unit tests.
 *
 * Since: 1.2
 */

/**
 * assert_equals_pointer:
 * @a: a pointer value or expression
 * @b: a pointer value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this
 * is not the case, printing both expressions and the values they
 * evaluated to. This macro is for use in unit tests.
 *
 * Since: 1.2
 */

/**
 * fail_unless_equals_clocktime:
 * @a: a #GstClockTime value or expression
 * @b: a #GstClockTime value or expression
 *
 * This macro checks that @a and @b are equal and aborts if this is not the
 * case, printing both expressions and the values they evaluated to. This
 * macro is for use in unit tests.
 */

/***
 * thread test macros and variables
 */
 GList *thread_list;
 GMutex mutex;
 GCond start_cond;       /* used to notify main thread of thread startups */
 GCond sync_cond;        /* used to synchronize all threads and main thread */





#define THREAD_TEST_RUNNING()   (!!_gst_check_threads_running)

/* additional assertions */




/* Hack to allow run-time selection of unit tests to run via the
 * GST_CHECKS environment variable (test function names globs, comma
 * separated), or GST_CHECKS_IGNORE with the same semantics */


gboolean _gst_check_run_test_func (const gchar * func_name);


#define _tcase_add_test __gst_tcase_add_test

/* A special variant to add broken tests. These are normally skipped, but can be
 * forced to run via GST_CHECKS */


#endif /* !__GI_SCANNER__ */



#endif /* __GST_CHECK_H__ */
