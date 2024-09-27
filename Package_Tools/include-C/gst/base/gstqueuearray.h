/* GStreamer
 * Copyright (C) 2009-2010 Edward Hervey <bilboed@bilboed.com>
 *
 * gstqueuearray.h:
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

#include <glib.h>

#ifndef __GST_QUEUE_ARRAY_H__
#define __GST_QUEUE_ARRAY_H__

#include <gst/base/base-prelude.h>



/**
 * GstQueueArray: (skip)
 */
typedef struct _GstQueueArray GstQueueArray;

extern
GstQueueArray * gst_queue_array_new       (guint initial_size);

extern
void            gst_queue_array_free      (GstQueueArray * array);

extern
void            gst_queue_array_set_clear_func (GstQueueArray *array,
                                                GDestroyNotify clear_func);

extern
void            gst_queue_array_clear     (GstQueueArray * array);

extern
gpointer        gst_queue_array_pop_head  (GstQueueArray * array);

extern
gpointer        gst_queue_array_peek_head (GstQueueArray * array);

extern
gpointer        gst_queue_array_peek_nth  (GstQueueArray * array, guint idx);

extern
gpointer        gst_queue_array_pop_tail  (GstQueueArray * array);

extern
gpointer        gst_queue_array_peek_tail (GstQueueArray * array);

extern
void            gst_queue_array_push_tail (GstQueueArray * array,
                                           gpointer        data);
extern
gboolean        gst_queue_array_is_empty  (GstQueueArray * array);

extern
gpointer        gst_queue_array_drop_element (GstQueueArray * array,
                                              guint           idx);
extern
guint           gst_queue_array_find (GstQueueArray * array,
                                      GCompareFunc    func,
                                      gpointer        data);
extern
guint           gst_queue_array_get_length (GstQueueArray * array);

/* Functions for use with structures */

extern
GstQueueArray * gst_queue_array_new_for_struct (gsize struct_size,
                                                guint initial_size);
extern
void            gst_queue_array_push_tail_struct (GstQueueArray * array,
                                                  gpointer        p_struct);
extern
gpointer        gst_queue_array_pop_head_struct  (GstQueueArray * array);

extern
gpointer        gst_queue_array_peek_head_struct (GstQueueArray * array);

extern
gpointer        gst_queue_array_peek_nth_struct  (GstQueueArray * array, guint idx);

extern
gboolean        gst_queue_array_drop_struct      (GstQueueArray * array,
                                                  guint           idx,
                                                  gpointer        p_struct);
extern
gpointer        gst_queue_array_pop_tail_struct  (GstQueueArray * array);

extern
gpointer        gst_queue_array_peek_tail_struct (GstQueueArray * array);

extern
void            gst_queue_array_push_sorted (GstQueueArray * array, 
                                             gpointer data,
                                             GCompareDataFunc func, 
                                             gpointer user_data);

extern
void            gst_queue_array_push_sorted_struct (GstQueueArray * array, 
                                                    gpointer p_struct,
                                                    GCompareDataFunc func, 
                                                    gpointer user_data);

extern
void            gst_queue_array_sort (GstQueueArray *array,
                                      GCompareDataFunc compare_func,
                                      gpointer user_data);



#endif
