unit gstcudautils;

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
{$include <gst/video/video.h>}
{$include <gst/cuda/cuda-prelude.h>}
{$include <gst/cuda/cuda-gst.h>}
{$include <gst/cuda/gstcudacontext.h>}

function _gst_cuda_debug(result:TCUresult; cat:PGstDebugCategory; file:Pgchar; _function:Pgchar; line:Tgint):Tgboolean;cdecl;external libgstcuda;
{$ifndef GST_DISABLE_GST_DEBUG}
{*
 * gst_cuda_result:
 * @result: CUDA device API return code `CUresult`
 *
 * Returns: %TRUE if CUDA device API call result is CUDA_SUCCESS
 *
 * Since: 1.22
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_cuda_result(result : longint) : longint;

{$else}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_cuda_result(result : longint) : longint;

{$endif}
{ GST_DISABLE_GST_DEBUG  }
{*
 * GstCudaQuarkId:
 *
 * Since: 1.22
  }
{ end of quark list  }
type
  PGstCudaQuarkId = ^TGstCudaQuarkId;
  TGstCudaQuarkId =  Longint;
  Const
    GST_CUDA_QUARK_GRAPHICS_RESOURCE = &;
    GST_CUDA_QUARK_MAX = 1;
;
{*
 * GstCudaGraphicsResourceType:
 * @GST_CUDA_GRAPHICS_RESSOURCE_NONE: Ressource represents a CUDA buffer.
 * @GST_CUDA_GRAPHICS_RESSOURCE_GL_BUFFER: Ressource represents a GL buffer.
 * @GST_CUDA_GRAPHICS_RESSOURCE_D3D11_RESOURCE: Ressource represents a D3D resource.
 *
 * Since: 1.22
  }
type
  PGstCudaGraphicsResourceType = ^TGstCudaGraphicsResourceType;
  TGstCudaGraphicsResourceType =  Longint;
  Const
    GST_CUDA_GRAPHICS_RESOURCE_NONE = &;
    GST_CUDA_GRAPHICS_RESOURCE_GL_BUFFER = 1;
    GST_CUDA_GRAPHICS_RESOURCE_D3D11_RESOURCE = 2;
;
{*
 * GstCudaGraphicsResource:
 *
 * Since: 1.22
  }
{ GL context or D3D11 device  }
type
  PGstCudaGraphicsResource = ^TGstCudaGraphicsResource;
  TGstCudaGraphicsResource = record
      cuda_context : PGstCudaContext;
      graphics_context : PGstObject;
      _type : TGstCudaGraphicsResourceType;
      resource : TCUgraphicsResource;
      flags : TCUgraphicsRegisterFlags;
      registered : Tgboolean;
      mapped : Tgboolean;
    end;

function gst_cuda_ensure_element_context(element:PGstElement; device_id:Tgint; cuda_ctx:PPGstCudaContext):Tgboolean;cdecl;external libgstcuda;
function gst_cuda_handle_set_context(element:PGstElement; context:PGstContext; device_id:Tgint; cuda_ctx:PPGstCudaContext):Tgboolean;cdecl;external libgstcuda;
function gst_cuda_handle_context_query(element:PGstElement; query:PGstQuery; cuda_ctx:PGstCudaContext):Tgboolean;cdecl;external libgstcuda;
function gst_context_new_cuda_context(cuda_ctx:PGstCudaContext):PGstContext;cdecl;external libgstcuda;
function gst_cuda_quark_from_id(id:TGstCudaQuarkId):TGQuark;cdecl;external libgstcuda;
function gst_cuda_graphics_resource_new(context:PGstCudaContext; graphics_context:PGstObject; _type:TGstCudaGraphicsResourceType):PGstCudaGraphicsResource;cdecl;external libgstcuda;
function gst_cuda_graphics_resource_register_gl_buffer(resource:PGstCudaGraphicsResource; buffer:Tguint; flags:TCUgraphicsRegisterFlags):Tgboolean;cdecl;external libgstcuda;
{$ifdef G_OS_WIN32}
function gst_cuda_graphics_resource_register_d3d11_resource(resource:PGstCudaGraphicsResource; d3d11_resource:PID3D11Resource; flags:TCUgraphicsRegisterFlags):Tgboolean;cdecl;external libgstcuda;
{$endif}
procedure gst_cuda_graphics_resource_unregister(resource:PGstCudaGraphicsResource);cdecl;external libgstcuda;
function gst_cuda_graphics_resource_map(resource:PGstCudaGraphicsResource; stream:TCUstream; flags:TCUgraphicsMapResourceFlags):TCUgraphicsResource;cdecl;external libgstcuda;
procedure gst_cuda_graphics_resource_unmap(resource:PGstCudaGraphicsResource; stream:TCUstream);cdecl;external libgstcuda;
procedure gst_cuda_graphics_resource_free(resource:PGstCudaGraphicsResource);cdecl;external libgstcuda;
function gst_cuda_create_user_token:Tgint64;cdecl;external libgstcuda;

// === Konventiert am: 11-10-24 15:03:18 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_cuda_result(result : longint) : longint;
begin
  gst_cuda_result:=_gst_cuda_debug(result,GST_CAT_DEFAULT,__FILE__,GST_FUNCTION,__LINE__);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_cuda_result(result : longint) : longint;
begin
  gst_cuda_result:=_gst_cuda_debug(result,NULL,__FILE__,GST_FUNCTION,__LINE__);
end;


end.
