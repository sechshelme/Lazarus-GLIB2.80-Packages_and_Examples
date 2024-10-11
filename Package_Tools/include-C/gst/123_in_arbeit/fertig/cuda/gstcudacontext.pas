unit gstcudacontext;

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
{$include <gst/gst.h>}
{$include <gst/cuda/cuda-prelude.h>}
{$include <gst/cuda/cuda-gst.h>}

{*
 * GST_CUDA_CONTEXT_CAST:
 *
 * Since: 1.22
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_CONTEXT_CAST(obj : longint) : PGstCudaContext;

{*
 * GST_CUDA_CONTEXT_TYPE:
 *
 * Since: 1.22
  }
const
  GST_CUDA_CONTEXT_TYPE = 'gst.cuda.context';  
type
{*
 * GstCudaContext:
 *
 * Since: 1.22
  }
{< private > }
  PGstCudaContext = ^TGstCudaContext;
  TGstCudaContext = record
      _object : TGstObject;
      priv : PGstCudaContextPrivate;
    end;

  PGstCudaContextClass = ^TGstCudaContextClass;
  TGstCudaContextClass = record
      parent_class : TGstObjectClass;
    end;


function gst_cuda_context_get_type:TGType;cdecl;external libgstcuda;
function gst_cuda_context_new(device_id:Tguint):PGstCudaContext;cdecl;external libgstcuda;
function gst_cuda_context_new_wrapped(handler:TCUcontext; device:TCUdevice):PGstCudaContext;cdecl;external libgstcuda;
function gst_cuda_context_push(ctx:PGstCudaContext):Tgboolean;cdecl;external libgstcuda;
function gst_cuda_context_pop(cuda_ctx:PCUcontext):Tgboolean;cdecl;external libgstcuda;
function gst_cuda_context_get_handle(ctx:PGstCudaContext):Tgpointer;cdecl;external libgstcuda;
function gst_cuda_context_get_texture_alignment(ctx:PGstCudaContext):Tgint;cdecl;external libgstcuda;
function gst_cuda_context_can_access_peer(ctx:PGstCudaContext; peer:PGstCudaContext):Tgboolean;cdecl;external libgstcuda;

// === Konventiert am: 11-10-24 15:02:03 ===

function GST_TYPE_CUDA_CONTEXT : TGType;
function GST_CUDA_CONTEXT(obj : Pointer) : PGstCudaContext;
function GST_CUDA_CONTEXT_CLASS(klass : Pointer) : PGstCudaContextClass;
function GST_IS_CUDA_CONTEXT(obj : Pointer) : Tgboolean;
function GST_IS_CUDA_CONTEXT_CLASS(klass : Pointer) : Tgboolean;
function GST_CUDA_CONTEXT_GET_CLASS(obj : Pointer) : PGstCudaContextClass;

implementation

function GST_TYPE_CUDA_CONTEXT : TGType;
  begin
    GST_TYPE_CUDA_CONTEXT:=gst_cuda_context_get_type;
  end;

function GST_CUDA_CONTEXT(obj : Pointer) : PGstCudaContext;
begin
  Result := PGstCudaContext(g_type_check_instance_cast(obj, GST_TYPE_CUDA_CONTEXT));
end;

function GST_CUDA_CONTEXT_CLASS(klass : Pointer) : PGstCudaContextClass;
begin
  Result := PGstCudaContextClass(g_type_check_class_cast(klass, GST_TYPE_CUDA_CONTEXT));
end;

function GST_IS_CUDA_CONTEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_CUDA_CONTEXT);
end;

function GST_IS_CUDA_CONTEXT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_CUDA_CONTEXT);
end;

function GST_CUDA_CONTEXT_GET_CLASS(obj : Pointer) : PGstCudaContextClass;
begin
  Result := PGstCudaContextClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CUDA_CONTEXT_CAST(obj : longint) : PGstCudaContext;
begin
  GST_CUDA_CONTEXT_CAST:=PGstCudaContext(obj);
end;


end.
