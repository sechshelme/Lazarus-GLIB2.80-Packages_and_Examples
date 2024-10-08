/*
 * GStreamer
 * Copyright (C) 2016 Matthew Waters <matthew@centricular.com>
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

#ifndef __GST_VULKAN_FENCE_H__
#define __GST_VULKAN_FENCE_H__

#include <gst/vulkan/gstvkhandlepool.h>



extern
GType gst_vulkan_fence_cache_get_type       (void);

#define GST_TYPE_VULKAN_FENCE_CACHE         (gst_vulkan_fence_cache_get_type())
#define GST_VULKAN_FENCE_CACHE(o)           (G_TYPE_CHECK_INSTANCE_CAST((o), GST_TYPE_VULKAN_FENCE_CACHE, GstVulkanFenceCache))
#define GST_VULKAN_FENCE_CACHE_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST((k), GST_TYPE_VULKAN_FENCE_CACHE, GstVulkanFenceCacheClass))
#define GST_IS_VULKAN_FENCE_CACHE(o)        (G_TYPE_CHECK_INSTANCE_TYPE((o), GST_TYPE_VULKAN_FENCE_CACHE))
#define GST_IS_VULKAN_FENCE_CACHE_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE((k), GST_TYPE_VULKAN_FENCE_CACHE))
#define GST_VULKAN_FENCE_CACHE_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS((o), GST_TYPE_VULKAN_FENCE_CACHE, GstVulkanFenceCacheClass))
/**
 * GST_TYPE_VULKAN_FENCE:
 *
 * Since: 1.18
 */
#define GST_TYPE_VULKAN_FENCE (gst_vulkan_fence_get_type ())
extern
GType gst_vulkan_fence_get_type (void);

/**
 * GST_VULKAN_FENCE_CAST:
 *
 * Since: 1.18
 */
#define GST_VULKAN_FENCE_CAST(f) ((GstVulkanFence *) f)
/**
 * GST_VULKAN_FENCE_FENCE:
 *
 * Since: 1.18
 */
#define GST_VULKAN_FENCE_FENCE(f) (GST_VULKAN_FENCE_CAST(f)->fence)

/**
 * GstVulkanFence:
 * @parent: the parent #GstMiniObject
 * @device: the #GstVulkanDevice this fence is allocated from
 * @cache: the parent #GstVulkanFenceCache for fence reuse
 * @fence: the vulkan fence handle
 *
 * Since: 1.18
 */
struct _GstVulkanFence
{
  GstMiniObject parent;

  GstVulkanDevice *device;
  GstVulkanFenceCache *cache;

  VkFence fence;

  /* <private> */
  gpointer _reserved        [GST_PADDING];
};

extern
GstVulkanFence *    gst_vulkan_fence_new            (GstVulkanDevice * device,
                                                     GError ** error);
extern
void                gst_vulkan_fence_reset          (GstVulkanFence * fence);

extern
GstVulkanFence *    gst_vulkan_fence_new_always_signalled (GstVulkanDevice *device);

extern
gboolean            gst_vulkan_fence_is_signaled    (GstVulkanFence * fence);





/**
 * GstVulkanFenceCache:
 * @parent: the parent #GstVulkanHandlePool
 *
 * Since: 1.18
 */
struct _GstVulkanFenceCache
{
  GstVulkanHandlePool       parent;

  /* <private> */
  gpointer _reserved        [GST_PADDING];
};

/**
 * GstVulkanFenceCacheClass:
 * @parent_class: the parent #GstVulkanHandlePoolClass
 *
 * Since: 1.18
 */
struct _GstVulkanFenceCacheClass
{
  GstVulkanHandlePoolClass  parent_class;

  /* <private> */
  gpointer _reserved        [GST_PADDING];
};



GstVulkanFenceCache *       gst_vulkan_fence_cache_new         (GstVulkanDevice * device);

/**
 * gst_vulkan_fence_cache_acquire:
 * @o: the #GstVulkanFenceCache
 * @e: a #GError
 *
 * A helper define for internally calling @gst_vulkan_handle_pool_acquire()
 *
 * Since: 1.18
 */
//#define gst_vulkan_fence_cache_acquire(o,e) (GstVulkanFence *) gst_vulkan_handle_pool_acquire (GST_VULKAN_HANDLE_POOL (o),e);



#endif /* __GST_VULKAN_FENCE_H__ */
