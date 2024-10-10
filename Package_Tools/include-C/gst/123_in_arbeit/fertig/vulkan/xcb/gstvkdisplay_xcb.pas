unit gstvkdisplay_xcb;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2013 Matthew Waters <ystreet00@gmail.com>
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
{$ifndef __GST_VULKAN_DISPLAY_XCB_H__}
{$define __GST_VULKAN_DISPLAY_XCB_H__}
{$include <gst/gst.h>}
{$include <xcb/xcb.h>}
{$include <vulkan/vulkan_xcb.h>}
{$include <gst/vulkan/vulkan.h>}

function gst_vulkan_display_xcb_get_type:TGType;cdecl;external libgstvulkan;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_DISPLAY_XCB_CAST(obj : longint) : PGstVulkanDisplayXCB;

type
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_VULKAN_DISPLAY_XCB_CONNECTION(d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_XCB_ROOT_WINDOW(d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_XCB_SCREEN(d : longint) : longint;

{*
 * GstVulkanDisplayXCB:
 *
 * the contents of a #GstVulkanDisplayXCB are private and should only be accessed
 * through the provided API
 *
 * Since: 1.18
  }
{ <private>  }
{ <private>  }
type
  PGstVulkanDisplayXCB = ^TGstVulkanDisplayXCB;
  TGstVulkanDisplayXCB = record
      parent : TGstVulkanDisplay;
      connection : Pxcb_connection_t;
      root_window : Txcb_window_t;
      screen : Pxcb_screen_t;
      foreign_display : Tgboolean;
      event_source : PGSource;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanDisplayXCBClass:
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanDisplayXCBClass = ^TGstVulkanDisplayXCBClass;
  TGstVulkanDisplayXCBClass = record
      object_class : TGstVulkanDisplayClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_vulkan_display_xcb_new(name:Pgchar):PGstVulkanDisplayXCB;cdecl;external libgstvulkan;
function gst_vulkan_display_xcb_new_with_connection(connection:Pxcb_connection_t; screen_no:longint):PGstVulkanDisplayXCB;cdecl;external libgstvulkan;
{$endif}
{ __GST_VULKAN_DISPLAY_XCB_H__  }

// === Konventiert am: 10-10-24 19:35:24 ===

function GST_TYPE_VULKAN_DISPLAY_XCB : TGType;
function GST_VULKAN_DISPLAY_XCB(obj : Pointer) : PGstVulkanDisplayXCB;
function GST_VULKAN_DISPLAY_XCB_CLASS(klass : Pointer) : PGstVulkanDisplayXCBClass;
function GST_IS_VULKAN_DISPLAY_XCB(obj : Pointer) : Tgboolean;
function GST_IS_VULKAN_DISPLAY_XCB_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_VULKAN_DISPLAY_XCB : TGType;
  begin
    GST_TYPE_VULKAN_DISPLAY_XCB:=gst_vulkan_display_xcb_get_type;
  end;

function GST_VULKAN_DISPLAY_XCB(obj : Pointer) : PGstVulkanDisplayXCB;
begin
  Result := PGstVulkanDisplayXCB(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_DISPLAY_XCB));
end;

function GST_VULKAN_DISPLAY_XCB_CLASS(klass : Pointer) : PGstVulkanDisplayXCBClass;
begin
  Result := PGstVulkanDisplayXCBClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_DISPLAY_XCB));
end;

function GST_IS_VULKAN_DISPLAY_XCB(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VULKAN_DISPLAY_XCB);
end;

function GST_IS_VULKAN_DISPLAY_XCB_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VULKAN_DISPLAY_XCB);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_DISPLAY_XCB_CAST(obj : longint) : PGstVulkanDisplayXCB;
begin
  GST_VULKAN_DISPLAY_XCB_CAST:=PGstVulkanDisplayXCB(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_XCB_CONNECTION(d : longint) : longint;
begin
  GST_VULKAN_DISPLAY_XCB_CONNECTION:=(GST_VULKAN_DISPLAY_XCB(d))^.connection;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_XCB_ROOT_WINDOW(d : longint) : longint;
begin
  GST_VULKAN_DISPLAY_XCB_ROOT_WINDOW:=(GST_VULKAN_DISPLAY_XCB(d))^.root_window;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_XCB_SCREEN(d : longint) : longint;
begin
  GST_VULKAN_DISPLAY_XCB_SCREEN:=(GST_VULKAN_DISPLAY_XCB(d))^.screen;
end;


end.
