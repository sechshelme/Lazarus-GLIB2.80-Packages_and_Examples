unit gstcudabufferpool;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2018-2019> Seungha Yang <seungha.yang@navercorp.com>
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
{$include <gst/video/video.h>}
{$include <gst/cuda/cuda-prelude.h>}
{$include <gst/cuda/gstcudamemory.h>}
{$include <gst/cuda/gstcudastream.h>}

{*
 * GST_CUDA_BUFFER_POOL_CAST:
 *
 * Since: 1.22
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_BUFFER_POOL_CAST(obj : longint) : PGstCudaBufferPool;

type
{*
 * GstCudaBufferPool:
 *
 * Since: 1.22
  }
  PGstCudaBufferPool = ^TGstCudaBufferPool;
  TGstCudaBufferPool = record
      parent : TGstBufferPool;
      context : PGstCudaContext;
      priv : PGstCudaBufferPoolPrivate;
    end;

{
 * GstCudaBufferPoolClass:
  }
  PGstCudaBufferPoolClass = ^TGstCudaBufferPoolClass;
  TGstCudaBufferPoolClass = record
      parent_class : TGstBufferPoolClass;
    end;


function gst_cuda_buffer_pool_get_type:TGType;cdecl;external libgstcuda;
function gst_cuda_buffer_pool_new(context:PGstCudaContext):PGstBufferPool;cdecl;external libgstcuda;
function gst_buffer_pool_config_get_cuda_stream(config:PGstStructure):PGstCudaStream;cdecl;external libgstcuda;
procedure gst_buffer_pool_config_set_cuda_stream(config:PGstStructure; stream:PGstCudaStream);cdecl;external libgstcuda;
function gst_buffer_pool_config_get_cuda_alloc_method(config:PGstStructure):TGstCudaMemoryAllocMethod;cdecl;external libgstcuda;
procedure gst_buffer_pool_config_set_cuda_alloc_method(config:PGstStructure; method:TGstCudaMemoryAllocMethod);cdecl;external libgstcuda;

// === Konventiert am: 11-10-24 15:01:55 ===

function GST_TYPE_CUDA_BUFFER_POOL : TGType;
function GST_CUDA_BUFFER_POOL(obj : Pointer) : PGstCudaBufferPool;
function GST_CUDA_BUFFER_POOL_CLASS(klass : Pointer) : PGstCudaBufferPoolClass;
function GST_IS_CUDA_BUFFER_POOL(obj : Pointer) : Tgboolean;
function GST_IS_CUDA_BUFFER_POOL_CLASS(klass : Pointer) : Tgboolean;
function GST_CUDA_BUFFER_POOL_GET_CLASS(obj : Pointer) : PGstCudaBufferPoolClass;

implementation

function GST_TYPE_CUDA_BUFFER_POOL : TGType;
  begin
    GST_TYPE_CUDA_BUFFER_POOL:=gst_cuda_buffer_pool_get_type;
  end;

function GST_CUDA_BUFFER_POOL(obj : Pointer) : PGstCudaBufferPool;
begin
  Result := PGstCudaBufferPool(g_type_check_instance_cast(obj, GST_TYPE_CUDA_BUFFER_POOL));
end;

function GST_CUDA_BUFFER_POOL_CLASS(klass : Pointer) : PGstCudaBufferPoolClass;
begin
  Result := PGstCudaBufferPoolClass(g_type_check_class_cast(klass, GST_TYPE_CUDA_BUFFER_POOL));
end;

function GST_IS_CUDA_BUFFER_POOL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_CUDA_BUFFER_POOL);
end;

function GST_IS_CUDA_BUFFER_POOL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_CUDA_BUFFER_POOL);
end;

function GST_CUDA_BUFFER_POOL_GET_CLASS(obj : Pointer) : PGstCudaBufferPoolClass;
begin
  Result := PGstCudaBufferPoolClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_BUFFER_POOL_CAST(obj : longint) : PGstCudaBufferPool;
begin
  GST_CUDA_BUFFER_POOL_CAST:=PGstCudaBufferPool(obj);
end;


end.
