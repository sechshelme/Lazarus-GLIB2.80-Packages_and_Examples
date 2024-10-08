/* GStreamer Wayland Library
 *
 * Copyright (C) 2011 Intel Corporation
 * Copyright (C) 2011 Sreerenj Balachandran <sreerenj.balachandran@intel.com>
 * Copyright (C) 2012 Wim Taymans <wim.taymans@gmail.com>
 * Copyright (C) 2014 Collabora Ltd.
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
 * License along with this library; if not, write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA.
 */

#pragma once

#include <gst/wayland/wayland.h>

#include <gst/video/video.h>



/**
 * GST_WL_VIDEO_FORMATS:
 *
 * A list of supported video formats for use in cap templates.
 *
 * Since: 1.24
 */
#define GST_WL_VIDEO_FORMATS "{ AYUV, RGBA, ARGB, BGRA, ABGR, P010_10LE, v308, RGBx, xRGB, BGRx, xBGR, RGB, BGR, Y42B, NV16, NV61, YUY2, YVYU, UYVY, I420, YV12, NV12, NV21, Y41B, YUV9, YVU9, BGR16, RGB16 }"


void gst_wl_videoformat_init_once (void);


 wl_shm_format gst_video_format_to_wl_shm_format (GstVideoFormat format);


guint32 gst_video_format_to_wl_dmabuf_format (GstVideoFormat format);


GstVideoFormat gst_wl_shm_format_to_video_format (enum wl_shm_format wl_format);


GstVideoFormat gst_wl_dmabuf_format_to_video_format (guint wl_format);


const gchar *gst_wl_shm_format_to_string (enum wl_shm_format wl_format);


gchar * gst_wl_dmabuf_format_to_string (guint wl_format, guint64 modifier);

