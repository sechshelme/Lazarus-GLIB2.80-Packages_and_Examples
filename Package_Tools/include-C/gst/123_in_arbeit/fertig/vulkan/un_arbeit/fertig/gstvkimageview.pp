
unit gstvkimageview;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstvkimageview.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkimageview.h
}

Type
PGstVulkanDevice = ^TGstVulkanDevice;
PGstVulkanImageMemory = ^TGstVulkanImageMemory;
PGstVulkanImageView = ^TGstVulkanImageView;
PVkImageViewCreateInfo = ^TVkImageViewCreateInfo;

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
{$ifndef __GST_VULKAN_IMAGE_VIEW_H__}
{$define __GST_VULKAN_IMAGE_VIEW_H__}
{$include <gst/vulkan/gstvkbarrier.h>}
{*
 * GST_TYPE_VULKAN_IMAGE_VIEW:
 *
 * Since: 1.18
  }

{ was #define dname def_expr }
function GST_TYPE_VULKAN_IMAGE_VIEW : longint; { return type might be wrong }

{*
 * gst_vulkan_image_view_get_type:
 *
 * Since: 1.18
  }
function gst_vulkan_image_view_get_type:TGType;cdecl;external;
{*
 * GstVulkanImageView:
 * @parent: the parent #GstMiniObject
 * @device: the #GstVulkanDevice
 * @image: the associated #GstVulkanImageMemory for this view
 * @view: the vulkan image view handle
 * @create_info: the creation information for this view
 *
 * Since: 1.18
  }
{ <private>  }
type
  PGstVulkanImageView = ^TGstVulkanImageView;
  TGstVulkanImageView = record
      parent : TGstMiniObject;
      device : PGstVulkanDevice;
      image : PGstVulkanImageMemory;
      view : TVkImageView;
      create_info : TVkImageViewCreateInfo;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * gst_vulkan_image_view_ref: (skip)
 * @trash: a #GstVulkanImageView.
 *
 * Increases the refcount of the given trash object by one.
 *
 * Returns: (transfer full): @trash
 *
 * Since: 1.18
  }
{*
 * gst_clear_vulkan_image_view: (skip)
 * @view_ptr: a pointer to a #GstVulkanImageView reference
 *
 * Clears a reference to a #GstVulkanImageView.
 *
 * @view_ptr must not be %NULL.
 *
 * If the reference is %NULL then this function does nothing. Otherwise, the
 * reference count of the descriptor set is decreased and the pointer is set
 * to %NULL.
 *
 * Since: 1.18
  }
(* Const before declarator ignored *)

function gst_vulkan_image_view_new(image:PGstVulkanImageMemory; create_info:PVkImageViewCreateInfo):PGstVulkanImageView;cdecl;external;
{$endif}
{ __GST_VULKAN_IMAGE_MEMORY_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_IMAGE_VIEW : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_IMAGE_VIEW:=gst_vulkan_image_view_get_type;
  end;


end.
