
unit gstvapool;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvapool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvapool.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PGstAllocationParams  = ^GstAllocationParams;
PGstAllocator  = ^GstAllocator;
PGstBufferPool  = ^GstBufferPool;
PGstCaps  = ^GstCaps;
PGstStructure  = ^GstStructure;
PGstVideoAlignment  = ^GstVideoAlignment;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2020 Igalia, S.L.
 *     Author: Víctor Jáquez <vjaquez@igalia.com>
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
(** unsupported pragma#pragma once*)
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{$include <gst/va/gstva.h>}

{ was #define dname def_expr }
function GST_TYPE_VA_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_POOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_POOL_GET_CLASS(obj : longint) : longint;

function gst_va_pool_get_type:TGType;cdecl;external;
function gst_va_pool_new:PGstBufferPool;cdecl;external;
function gst_va_pool_requires_video_meta(pool:PGstBufferPool):Tgboolean;cdecl;external;
procedure gst_buffer_pool_config_set_va_allocation_params(config:PGstStructure; usage_hint:Tguint; use_derived:TGstVaFeature);cdecl;external;
(* Const before type ignored *)
procedure gst_buffer_pool_config_set_va_alignment(config:PGstStructure; align:PGstVideoAlignment);cdecl;external;
function gst_va_pool_new_with_config(caps:PGstCaps; min_buffers:Tguint; max_buffers:Tguint; usage_hint:Tguint; use_derived:TGstVaFeature; 
           allocator:PGstAllocator; alloc_params:PGstAllocationParams):PGstBufferPool;cdecl;external;
function gst_va_pool_get_buffer_size(pool:PGstBufferPool; size:Pguint):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_VA_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_VA_POOL:=gst_va_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_POOL(obj : longint) : longint;
begin
  GST_VA_POOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VA_POOL,GstVaPool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_POOL_CLASS(klass : longint) : longint;
begin
  GST_VA_POOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VA_POOL,GstVaPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_POOL(obj : longint) : longint;
begin
  GST_IS_VA_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VA_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VA_POOL_CLASS(klass : longint) : longint;
begin
  GST_IS_VA_POOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VA_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VA_POOL_GET_CLASS(obj : longint) : longint;
begin
  GST_VA_POOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VA_POOL,GstVaPoolClass);
end;


end.
