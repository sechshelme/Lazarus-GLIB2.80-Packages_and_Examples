/* GStreamer
 *
 * Copyright (C) 2006 Andy Wingo <wingo at pobox.com>
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

#ifndef __GST_BUFFER_STRAW_H__
#define __GST_BUFFER_STRAW_H__


#include <gst/check/gstcheck.h>




void        gst_buffer_straw_start_pipeline (GstElement * bin, GstPad * pad);


GstBuffer * gst_buffer_straw_get_buffer     (GstElement * bin, GstPad * pad);


void        gst_buffer_straw_stop_pipeline  (GstElement * bin, GstPad * pad);



#endif /* __GST_BUFFER_STRAW_H__ */
