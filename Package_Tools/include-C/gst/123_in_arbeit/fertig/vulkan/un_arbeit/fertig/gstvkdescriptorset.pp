
unit gstvkdescriptorset;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstvkdescriptorset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkdescriptorset.h
}

Type
PGstVulkanDescriptorCache = ^TGstVulkanDescriptorCache;
PGstVulkanDescriptorPool = ^TGstVulkanDescriptorPool;
PGstVulkanDescriptorSet = ^TGstVulkanDescriptorSet;
PGstVulkanHandle = ^TGstVulkanHandle;

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
{$ifndef __GST_VULKAN_DESCRIPTOR_SET_H__}
{$define __GST_VULKAN_DESCRIPTOR_SET_H__}
{$include <gst/gst.h>}
{$include <gst/vulkan/vulkan_fwd.h>}
{$include <gst/vulkan/gstvkapi.h>}
{*
 * gst_vulkan_descriptor_set_get_type:
 *
 * Since: 1.18
  }

function gst_vulkan_descriptor_set_get_type:TGType;cdecl;external;
{*
 * GST_TYPE_VULKAN_DESCRIPTOR_SET:
 *
 * Since: 1.18
  }
{ was #define dname def_expr }
function GST_TYPE_VULKAN_DESCRIPTOR_SET : longint; { return type might be wrong }

type
{*
 * GstVulkanDescriptorSet:
 * @parent: the parent #GstMiniObject
 * @set: the vulkan descriptor set handle
 * @pool: the parent #GstVulkanDescriptorPool for pooling
 * @cache: the parent #GstVulkanDescriptorCache for reuse
 * @n_layouts: number of layouts applied to this descriptor set
 * @layouts: layouts applied to this descriptor set
 *
 * Since: 1.18
  }
{ <protected>  }
{ <private>  }
  PGstVulkanDescriptorSet = ^TGstVulkanDescriptorSet;
  TGstVulkanDescriptorSet = record
      parent : TGstMiniObject;
      set : TVkDescriptorSet;
      pool : PGstVulkanDescriptorPool;
      cache : PGstVulkanDescriptorCache;
      n_layouts : Tguint;
      layouts : ^PGstVulkanHandle;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * gst_vulkan_descriptor_set_ref: (skip)
 * @set: a #GstVulkanDescriptorSet.
 *
 * Increases the refcount of the given buffer by one.
 *
 * Returns: (transfer full): @set
 *
 * Since: 1.18
  }
{*
 * gst_vulkan_descriptor_set_unref: (skip)
 * @set: (transfer full): a #GstVulkanDescriptorSet.
 *
 * Decreases the refcount of the buffer. If the refcount reaches 0, the buffer
 * will be freed.
 *
 * Since: 1.18
  }

function gst_vulkan_descriptor_set_new_wrapped(pool:PGstVulkanDescriptorPool; set:TVkDescriptorSet; n_layouts:Tguint; layouts:PPGstVulkanHandle):PGstVulkanDescriptorSet;cdecl;external;
{$endif}
{ _GST_VULKAN_DESCRIPTOR_SET_H_  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_DESCRIPTOR_SET : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_DESCRIPTOR_SET:=gst_vulkan_descriptor_set_get_type;
  end;


end.
