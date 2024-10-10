
unit gstvkbarrier;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstvkbarrier.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkbarrier.h
}

Type
PGstVulkanBarrierMemoryInfo = ^TGstVulkanBarrierMemoryInfo;
PGstVulkanQueue = ^TGstVulkanQueue;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2019 Matthew Waters <matthew@centricular.com>
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
{$ifndef __GST_VULKAN_BARRIER_H__}
{$define __GST_VULKAN_BARRIER_H__}
{$include <gst/vulkan/vulkan_fwd.h>}
{$include <gst/vulkan/gstvkapi.h>}
{*
 * GstVulkanBarrierType:
 * @GST_VULKAN_BARRIER_NONE: no barrier type
 * @GST_VULKAN_BARRIER_MEMORY: memory barrier
 * @GST_VULKAN_BARRIER_BUFFER: buffer barrier
 * @GST_VULKAN_BARRIER_IMAGE: image barrier
 *
 * Since: 1.18
  }
type
  PGstVulkanBarrierType = ^TGstVulkanBarrierType;
  TGstVulkanBarrierType =  Longint;
  Const
    GST_VULKAN_BARRIER_NONE = &;
    GST_VULKAN_BARRIER_TYPE_MEMORY = 1;
    GST_VULKAN_BARRIER_TYPE_BUFFER = 2;
    GST_VULKAN_BARRIER_TYPE_IMAGE = 3;
;
{*
 * GstVulkanBarrierFlags:
 * @GST_VULKAN_BARRIER_FLAGS_NONE: no flags
 *
 * Since: 1.18
  }
type
  PGstVulkanBarrierFlags = ^TGstVulkanBarrierFlags;
  TGstVulkanBarrierFlags =  Longint;
  Const
    GST_VULKAN_BARRIER_FLAG_NONE = &;
;
{*
 * GstVulkanBarrierMemoryInfo:
 * @type: the #GstVulkanBarrierType of the barrier
 * @flags the #GstVulkanBarrierFlags of the barrier
 * @queue: the #GstVulkanQueue this barrier is to execute with
 * @pipeline_stages: the stages in the graphics pipeline to execute the barrier
 * @access_flags: access flags
 * @semaphore: timeline semaphore
 * @semaphore_value: current value of the timeline semaphore
 *
 * Since: 1.18
  }
{*
   * GstVulkanBarrierMemoryInfo.semaphore:
   *
   * Timeline semaphore
   *
   * Since: 1.24
    }
{*
   * GstVulkanBarrierMemoryInfo.semaphore_value:
   *
   * Current value of the timeline semaphore
   *
   * Since: 1.24
    }
{ <private>  }
type
  PGstVulkanBarrierMemoryInfo = ^TGstVulkanBarrierMemoryInfo;
  TGstVulkanBarrierMemoryInfo = record
      _type : TGstVulkanBarrierType;
      flags : TGstVulkanBarrierFlags;
      queue : PGstVulkanQueue;
      pipeline_stages : Tguint64;
      access_flags : Tguint64;
      semaphore : TVkSemaphore;
      semaphore_value : Tguint64;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{$endif}
{ __GST_VULKAN_BARRIER_H__  }

implementation


end.
