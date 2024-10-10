
unit gstvkcommandbuffer;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstvkcommandbuffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkcommandbuffer.h
}

Type
PGstVulkanCommandBuffer = ^TGstVulkanCommandBuffer;
PGstVulkanCommandPool = ^TGstVulkanCommandPool;

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
{$ifndef __GST_VULKAN_COMMAND_BUFFER_H__}
{$define __GST_VULKAN_COMMAND_BUFFER_H__}
{$include <gst/gst.h>}
{$include <gst/vulkan/vulkan_fwd.h>}
{$include <gst/vulkan/gstvkapi.h>}
{*
 * gst_vulkan_command_buffer_get_type:
 *
 * Since: 1.18
  }

function gst_vulkan_command_buffer_get_type:TGType;cdecl;external;
{*
 * GST_TYPE_VULKAN_COMMAND_BUFFER:
 *
 * Since: 1.18
  }
{ was #define dname def_expr }
function GST_TYPE_VULKAN_COMMAND_BUFFER : longint; { return type might be wrong }

type
{*
 * GstVulkanCommandBuffer:
 * @parent: the parent #GstMiniObject
 * @cmd: the vulkan command buffer handle
 * @pool: the parent #GstVulkanCommandPool for command buffer reuse and locking
 * @level: the level of the vulkan command buffer
 *
 * Since: 1.18
  }
{ <protected>  }
{ <private>  }
  PGstVulkanCommandBuffer = ^TGstVulkanCommandBuffer;
  TGstVulkanCommandBuffer = record
      parent : TGstMiniObject;
      cmd : TVkCommandBuffer;
      pool : PGstVulkanCommandPool;
      level : TVkCommandBufferLevel;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * gst_vulkan_command_buffer_ref: (skip)
 * @cmd: a #GstVulkanCommandBuffer.
 *
 * Increases the refcount of the given buffer by one.
 *
 * Returns: (transfer full): @cmd
 *
 * Since: 1.18
  }
{*
 * gst_clear_vulkan_command_buffer: (skip)
 * @cmd_ptr: a pointer to a #GstVulkanCommandBuffer reference
 *
 * Clears a reference to a #GstVulkanCommandBuffer.
 *
 * @cmd_ptr must not be %NULL.
 *
 * If the reference is %NULL then this function does nothing. Otherwise, the
 * reference count of the command buffer is decreased and the pointer is set
 * to %NULL.
 *
 * Since: 1.18
  }
{*
 * gst_vulkan_command_buffer_lock:
 * @cmd: the #GstVulkanCommandBuffer
 *
 * Lock @cmd for writing cmmands to @cmd.  Must be matched by a corresponding
 * gst_vulkan_command_buffer_unlock().
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_vulkan_command_buffer_lock(cmd : longint) : longint;

{*
 * gst_vulkan_command_buffer_unlock:
 * @cmd: the #GstVulkanCommandBuffer
 *
 * Unlock @cmd for writing cmmands to @cmd.  Must be matched by a corresponding
 * gst_vulkan_command_buffer_lock().
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_vulkan_command_buffer_unlock(cmd : longint) : longint;

function gst_vulkan_command_buffer_new_wrapped(cmd:TVkCommandBuffer; level:TVkCommandBufferLevel):PGstVulkanCommandBuffer;cdecl;external;
{$endif}
{ _GST_VULKAN_COMMAND_BUFFER_H_  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_COMMAND_BUFFER : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_COMMAND_BUFFER:=gst_vulkan_command_buffer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_vulkan_command_buffer_lock(cmd : longint) : longint;
begin
  gst_vulkan_command_buffer_lock:=gst_vulkan_command_pool_lock(cmd^.pool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_vulkan_command_buffer_unlock(cmd : longint) : longint;
begin
  gst_vulkan_command_buffer_unlock:=gst_vulkan_command_pool_unlock(cmd^.pool);
end;


end.
