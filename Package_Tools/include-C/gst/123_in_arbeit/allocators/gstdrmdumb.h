/* GStreamer
 *
 * Copyright (C) 2016 Igalia
 * Copyright (C) 2023 Collabora
 *
 * Authors:
 *  Víctor Manuel Jáquez Leal <vjaquez@igalia.com>
 *  Javier Martin <javiermartin@by.com.es>
 *  Colin Kinloch <colin.kinloch@collabora.com>
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
 *
 */

#pragma once

#include <gst/gst.h>
#include <gst/allocators/allocators-prelude.h>



/**
 * GstDRMDumbAllocator:
 *
 * Private intance object for #GstDRMDumbAllocator.
 *
 * Since: 1.24
 */

/**
 * GstDRMDumbAllocatorClass.parent_class:
 *
 * Parent Class.
 *
 * Since: 1.24
 */

/**
 * GST_TYPE_DRM_DUMB_ALLOCATOR:
 *
 * Macro that returns the #GstDRMDumbAllocator type.
 *
 * Since: 1.24
 */
#define GST_TYPE_DRM_DUMB_ALLOCATOR gst_drm_dumb_allocator_get_type ()

//G_DECLARE_FINAL_TYPE (GstDRMDumbAllocator, gst_drm_dumb_allocator, GST, DRM_DUMB_ALLOCATOR, GstAllocator)


gboolean       gst_is_drm_dumb_memory (GstMemory * mem);


guint32        gst_drm_dumb_memory_get_handle (GstMemory * mem);


GstMemory*     gst_drm_dumb_memory_export_dmabuf (GstMemory * mem);


GstAllocator * gst_drm_dumb_allocator_new_with_fd (gint drm_fd);


GstAllocator * gst_drm_dumb_allocator_new_with_device_path (const gchar *drm_device_path);


GstMemory    * gst_drm_dumb_allocator_alloc (GstAllocator * allocator,
                                             guint32 drm_fourcc,
                                             guint32 width,
                                             guint32 height,
                                             guint32 *out_pitch);


gboolean      gst_drm_dumb_allocator_has_prime_export (GstAllocator * allocator);


