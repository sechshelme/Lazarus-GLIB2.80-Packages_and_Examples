
unit gstvkdisplay_wayland;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstvkdisplay_wayland.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkdisplay_wayland.h
}

Type
Pgchar = ^Tgchar;
PGstVulkanDisplayWayland = ^TGstVulkanDisplayWayland;
PGstVulkanDisplayWaylandClass = ^TGstVulkanDisplayWaylandClass;
Pwl_compositor = ^Twl_compositor;
Pwl_display = ^Twl_display;
Pwl_registry = ^Twl_registry;
Pwl_shell = ^Twl_shell;
Pwl_subcompositor = ^Twl_subcompositor;

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
{$ifndef __GST_VK_DISPLAY_WAYLAND_H__}
{$define __GST_VK_DISPLAY_WAYLAND_H__}
{$include <gst/gst.h>}
{$include <wayland-client.h>}
{$include <gst/vulkan/vulkan.h>}
{$include <vulkan/vulkan_wayland.h>}

function gst_vulkan_display_wayland_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_VULKAN_DISPLAY_WAYLAND : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_WAYLAND(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_WAYLAND_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DISPLAY_WAYLAND(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DISPLAY_WAYLAND_CLASS(klass : longint) : longint;

{*
 * GST_VULKAN_DISPLAY_WAYLAND_CAST:
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_DISPLAY_WAYLAND_CAST(obj : longint) : PGstVulkanDisplayWayland;

type
{*
 * GstVulkanDisplayWayland:
 *
 * the contents of a #GstVulkanDisplayWayland are private and should only be accessed
 * through the provided API
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanDisplayWayland = ^TGstVulkanDisplayWayland;
  TGstVulkanDisplayWayland = record
      parent : TGstVulkanDisplay;
      display : Pwl_display;
      registry : Pwl_registry;
      compositor : Pwl_compositor;
      subcompositor : Pwl_subcompositor;
      shell : Pwl_shell;
      foreign_display : Tgboolean;
    end;

{*
 * GstVulkanDisplayWaylandClass:s
 *
 * Since: 1.18
  }
  PGstVulkanDisplayWaylandClass = ^TGstVulkanDisplayWaylandClass;
  TGstVulkanDisplayWaylandClass = record
      object_class : TGstVulkanDisplayClass;
    end;

{*
 * GST_VULKAN_DISPLAY_WAYLAND_DISPLAY
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_VULKAN_DISPLAY_WAYLAND_DISPLAY(display_ : longint) : longint;

(* Const before declarator ignored *)
function gst_vulkan_display_wayland_new(name:Pgchar):PGstVulkanDisplayWayland;cdecl;external;
function gst_vulkan_display_wayland_new_with_display(display:Pwl_display):PGstVulkanDisplayWayland;cdecl;external;
{$endif}
{ __GST_VULKAN_DISPLAY_WAYLAND_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_DISPLAY_WAYLAND : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_DISPLAY_WAYLAND:=gst_vulkan_display_wayland_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_WAYLAND(obj : longint) : longint;
begin
  GST_VULKAN_DISPLAY_WAYLAND:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VULKAN_DISPLAY_WAYLAND,GstVulkanDisplayWayland);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_WAYLAND_CLASS(klass : longint) : longint;
begin
  GST_VULKAN_DISPLAY_WAYLAND_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VULKAN_DISPLAY_WAYLAND,GstVulkanDisplayWaylandClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DISPLAY_WAYLAND(obj : longint) : longint;
begin
  GST_IS_VULKAN_DISPLAY_WAYLAND:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VULKAN_DISPLAY_WAYLAND);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DISPLAY_WAYLAND_CLASS(klass : longint) : longint;
begin
  GST_IS_VULKAN_DISPLAY_WAYLAND_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VULKAN_DISPLAY_WAYLAND);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_DISPLAY_WAYLAND_CAST(obj : longint) : PGstVulkanDisplayWayland;
begin
  GST_VULKAN_DISPLAY_WAYLAND_CAST:=PGstVulkanDisplayWayland(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_WAYLAND_DISPLAY(display_ : longint) : longint;
begin
  GST_VULKAN_DISPLAY_WAYLAND_DISPLAY:=(GST_VULKAN_DISPLAY_WAYLAND(display_))^.display;
end;


end.
