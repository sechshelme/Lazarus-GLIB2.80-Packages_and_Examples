/* GStreamer Wayland Library
 *
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
#include <gst/video/video-info.h>



#define GST_TYPE_WL_DISPLAY (gst_wl_display_get_type ())


//G_DECLARE_FINAL_TYPE ( GstWlDisplay, gst_wl_display, GST, WL_DISPLAY, GObject);

struct _GstWlDisplay
{
  GObject parent_instance;
};


GstWlDisplay *gst_wl_display_new (const gchar * name, GError ** error);


GstWlDisplay *gst_wl_display_new_existing (struct wl_display * display,
    gboolean take_ownership, GError ** error);

/* see wlbuffer.c for explanation */

void gst_wl_display_register_buffer (GstWlDisplay * self, gpointer gstmem,
    gpointer wlbuffer);


void gst_wl_display_unregister_buffer (GstWlDisplay * self, gpointer gstmem);


 wl_callback * gst_wl_display_sync(GstWlDisplay * self, const struct wl_callback_listener *listener,
	gpointer data);


void gst_wl_display_callback_destroy(GstWlDisplay * self, struct wl_callback ** callback);


gpointer gst_wl_display_lookup_buffer (GstWlDisplay * self, gpointer gstmem);


gboolean gst_wl_display_check_format_for_shm (GstWlDisplay * self,
    const GstVideoInfo *video_info);


gboolean gst_wl_display_check_format_for_dmabuf (GstWlDisplay * self,
    const GstVideoInfoDmaDrm *drm_info);


wl_display *gst_wl_display_get_display (GstWlDisplay * self);


 wl_event_queue *gst_wl_display_get_event_queue (GstWlDisplay * self);


 wl_compositor *gst_wl_display_get_compositor (GstWlDisplay * self);


 wl_subcompositor *gst_wl_display_get_subcompositor (GstWlDisplay * self);


 xdg_wm_base *gst_wl_display_get_xdg_wm_base (GstWlDisplay * self);


 zwp_fullscreen_shell_v1 *gst_wl_display_get_fullscreen_shell_v1 (GstWlDisplay * self);


 wp_viewporter *gst_wl_display_get_viewporter (GstWlDisplay * self);


 wl_shm *gst_wl_display_get_shm (GstWlDisplay * self);


GArray *gst_wl_display_get_shm_formats (GstWlDisplay * self);


GArray *gst_wl_display_get_dmabuf_formats (GstWlDisplay * self);


GArray *gst_wl_display_get_dmabuf_modifiers (GstWlDisplay * self);


 zwp_linux_dmabuf_v1 *gst_wl_display_get_dmabuf_v1 (GstWlDisplay * self);


 wp_single_pixel_buffer_manager_v1 * gst_wl_display_get_single_pixel_buffer_manager_v1 (GstWlDisplay * self);


gboolean gst_wl_display_has_own_display (GstWlDisplay * self);


