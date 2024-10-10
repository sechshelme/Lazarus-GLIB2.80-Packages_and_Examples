
unit gstvkfence;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstvkfence.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkfence.h
}

Type
PGError = ^TGError;
PGstVulkanDevice = ^TGstVulkanDevice;
PGstVulkanFence = ^TGstVulkanFence;
PGstVulkanFenceCache = ^TGstVulkanFenceCache;
PGstVulkanFenceCacheClass = ^TGstVulkanFenceCacheClass;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
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
  }
{$ifndef __GST_VULKAN_FENCE_H__}
{$define __GST_VULKAN_FENCE_H__}
{$include <gst/vulkan/gstvkhandlepool.h>}

function gst_vulkan_fence_cache_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_VULKAN_FENCE_CACHE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_FENCE_CACHE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_FENCE_CACHE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_FENCE_CACHE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_FENCE_CACHE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_FENCE_CACHE_GET_CLASS(o : longint) : longint;

{*
 * GST_TYPE_VULKAN_FENCE:
 *
 * Since: 1.18
  }
{ was #define dname def_expr }
function GST_TYPE_VULKAN_FENCE : longint; { return type might be wrong }

function gst_vulkan_fence_get_type:TGType;cdecl;external;
{*
 * GST_VULKAN_FENCE_CAST:
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_FENCE_CAST(f : longint) : PGstVulkanFence;

{*
 * GST_VULKAN_FENCE_FENCE:
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_FENCE_FENCE(f : longint) : longint;

{*
 * GstVulkanFence:
 * @parent: the parent #GstMiniObject
 * @device: the #GstVulkanDevice this fence is allocated from
 * @cache: the parent #GstVulkanFenceCache for fence reuse
 * @fence: the vulkan fence handle
 *
 * Since: 1.18
  }
{ <private>  }
type
  PGstVulkanFence = ^TGstVulkanFence;
  TGstVulkanFence = record
      parent : TGstMiniObject;
      device : PGstVulkanDevice;
      cache : PGstVulkanFenceCache;
      fence : TVkFence;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_vulkan_fence_new(device:PGstVulkanDevice; error:PPGError):PGstVulkanFence;cdecl;external;
procedure gst_vulkan_fence_reset(fence:PGstVulkanFence);cdecl;external;
function gst_vulkan_fence_new_always_signalled(device:PGstVulkanDevice):PGstVulkanFence;cdecl;external;
function gst_vulkan_fence_is_signaled(fence:PGstVulkanFence):Tgboolean;cdecl;external;
{*
 * GstVulkanFenceCache:
 * @parent: the parent #GstVulkanHandlePool
 *
 * Since: 1.18
  }
{ <private>  }
type
  PGstVulkanFenceCache = ^TGstVulkanFenceCache;
  TGstVulkanFenceCache = record
      parent : TGstVulkanHandlePool;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanFenceCacheClass:
 * @parent_class: the parent #GstVulkanHandlePoolClass
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanFenceCacheClass = ^TGstVulkanFenceCacheClass;
  TGstVulkanFenceCacheClass = record
      parent_class : TGstVulkanHandlePoolClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_vulkan_fence_cache_new(device:PGstVulkanDevice):PGstVulkanFenceCache;cdecl;external;
{*
 * gst_vulkan_fence_cache_acquire:
 * @o: the #GstVulkanFenceCache
 * @e: a #GError
 *
 * A helper define for internally calling @gst_vulkan_handle_pool_acquire()
 *
 * Since: 1.18
  }
{#define gst_vulkan_fence_cache_acquire(o,e) (GstVulkanFence *) gst_vulkan_handle_pool_acquire (GST_VULKAN_HANDLE_POOL (o),e); }
{$endif}
{ __GST_VULKAN_FENCE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_FENCE_CACHE : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_FENCE_CACHE:=gst_vulkan_fence_cache_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_FENCE_CACHE(o : longint) : longint;
begin
  GST_VULKAN_FENCE_CACHE:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_VULKAN_FENCE_CACHE,GstVulkanFenceCache);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_FENCE_CACHE_CLASS(k : longint) : longint;
begin
  GST_VULKAN_FENCE_CACHE_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GST_TYPE_VULKAN_FENCE_CACHE,GstVulkanFenceCacheClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_FENCE_CACHE(o : longint) : longint;
begin
  GST_IS_VULKAN_FENCE_CACHE:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_VULKAN_FENCE_CACHE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_FENCE_CACHE_CLASS(k : longint) : longint;
begin
  GST_IS_VULKAN_FENCE_CACHE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_VULKAN_FENCE_CACHE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_FENCE_CACHE_GET_CLASS(o : longint) : longint;
begin
  GST_VULKAN_FENCE_CACHE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_VULKAN_FENCE_CACHE,GstVulkanFenceCacheClass);
end;

{ was #define dname def_expr }
function GST_TYPE_VULKAN_FENCE : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_FENCE:=gst_vulkan_fence_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_FENCE_CAST(f : longint) : PGstVulkanFence;
begin
  GST_VULKAN_FENCE_CAST:=PGstVulkanFence(f);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_FENCE_FENCE(f : longint) : longint;
begin
  GST_VULKAN_FENCE_FENCE:=(GST_VULKAN_FENCE_CAST(f))^.fence;
end;


end.
