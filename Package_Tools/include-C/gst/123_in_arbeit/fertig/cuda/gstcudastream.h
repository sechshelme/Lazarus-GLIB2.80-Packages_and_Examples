/* GStreamer
 * Copyright (C) 2022 Seungha Yang <seungha@centricular.com>
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
 */

#pragma once

#include <gst/gst.h>
#include <gst/cuda/cuda-prelude.h>
#include <gst/cuda/gstcudacontext.h>
#include <cuda.h>



#define GST_TYPE_CUDA_STREAM              (gst_cuda_stream_get_type())
#define GST_IS_CUDA_STREAM(obj)           (GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_CUDA_STREAM))
#define GST_CUDA_STREAM(obj)              ((GstCudaStream *)obj)

typedef struct _GstCudaStream GstCudaStream;
typedef struct _GstCudaStreamPrivate GstCudaStreamPrivate;

/**
 * GstCudaStream:
 *
 * Since: 1.24
 */
struct _GstCudaStream
{
  GstMiniObject parent;

  GstCudaContext *context;

  /*< private >*/
  GstCudaStreamPrivate *priv;
};


GType           gst_cuda_stream_get_type (void);


GstCudaStream * gst_cuda_stream_new (GstCudaContext * context);


CUstream        gst_cuda_stream_get_handle (GstCudaStream * stream);


GstCudaStream * gst_cuda_stream_ref (GstCudaStream * stream);


void            gst_cuda_stream_unref (GstCudaStream * stream);


void            gst_clear_cuda_stream (GstCudaStream ** stream);


