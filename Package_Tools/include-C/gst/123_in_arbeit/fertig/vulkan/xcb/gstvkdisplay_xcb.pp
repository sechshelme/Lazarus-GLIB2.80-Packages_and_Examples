
unit gstvkdisplay_xcb;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstvkdisplay_xcb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkdisplay_xcb.h
}

Type
Pgchar = ^Tgchar;
PGSource = ^TGSource;
PGstVulkanDisplayXCB = ^TGstVulkanDisplayXCB;
PGstVulkanDisplayXCBClass = ^TGstVulkanDisplayXCBClass;
Pxcb_connection_t = ^Txcb_connection_t;
Pxcb_screen_t = ^Txcb_screen_t;

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

function gst_vulkan_display_xcb_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_VULKAN_DISPLAY_XCB : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_XCB(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_XCB_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DISPLAY_XCB(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DISPLAY_XCB_CLASS(klass : longint) : longint;

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

(* Const before declarator ignored *)

function gst_vulkan_display_xcb_new(name:Pgchar):PGstVulkanDisplayXCB;cdecl;external;
function gst_vulkan_display_xcb_new_with_connection(connection:Pxcb_connection_t; screen_no:longint):PGstVulkanDisplayXCB;cdecl;external;
{$endif}
{ __GST_VULKAN_DISPLAY_XCB_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_DISPLAY_XCB : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_DISPLAY_XCB:=gst_vulkan_display_xcb_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_XCB(obj : longint) : longint;
begin
  GST_VULKAN_DISPLAY_XCB:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VULKAN_DISPLAY_XCB,GstVulkanDisplayXCB);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DISPLAY_XCB_CLASS(klass : longint) : longint;
begin
  GST_VULKAN_DISPLAY_XCB_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VULKAN_DISPLAY_XCB,GstVulkanDisplayXCBClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DISPLAY_XCB(obj : longint) : longint;
begin
  GST_IS_VULKAN_DISPLAY_XCB:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VULKAN_DISPLAY_XCB);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DISPLAY_XCB_CLASS(klass : longint) : longint;
begin
  GST_IS_VULKAN_DISPLAY_XCB_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VULKAN_DISPLAY_XCB);
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
