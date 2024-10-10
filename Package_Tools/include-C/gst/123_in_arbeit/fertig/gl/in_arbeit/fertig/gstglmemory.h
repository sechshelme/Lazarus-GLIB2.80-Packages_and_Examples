/*
 * GStreamer
 * Copyright (C) 2015 Matthew Waters <matthew@centricular.com>
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

#ifndef _GST_GL_MEMORY_H_
#define _GST_GL_MEMORY_H_

#include <gst/gl/gstglbasememory.h>
#include <gst/gl/gstglformat.h>



extern
GType gst_gl_memory_allocator_get_type(void);

#define GST_TYPE_GL_MEMORY_ALLOCATOR (gst_gl_memory_allocator_get_type())
#define GST_GL_MEMORY_ALLOCATOR(obj)                 (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_GL_MEMORY_ALLOCATOR, GstGLMemoryAllocator))
#define GST_GL_MEMORY_ALLOCATOR_CLASS(klass)         (G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_GL_MEMORY_ALLOCATOR, GstGLMemoryAllocatorClass))
#define GST_IS_GL_MEMORY_ALLOCATOR(obj)              (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_GL_MEMORY_ALLOCATOR))
#define GST_IS_GL_MEMORY_ALLOCATOR_CLASS(klass)      (G_TYPE_CHECK_CLASS_TYPE ((klass), GST_TYPE_GL_MEMORY_ALLOCATOR))
#define GST_GL_MEMORY_ALLOCATOR_GET_CLASS(obj)       (G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_GL_MEMORY_ALLOCATOR, GstGLMemoryAllocatorClass))
#define GST_GL_MEMORY_ALLOCATOR_CAST(obj)            ((GstGLMemoryAllocator *)(obj))

#define GST_GL_MEMORY_CAST(obj) ((GstGLMemory *) obj)

/**
 * GST_CAPS_FEATURE_MEMORY_GL_MEMORY:
 *
 * Name of the caps feature for indicating the use of #GstGLMemory
 */
#define GST_CAPS_FEATURE_MEMORY_GL_MEMORY "memory:GLMemory"
/**
 * GST_GL_MEMORY_VIDEO_EXT_FORMATS: (skip)
 */
/**
 * GST_GL_MEMORY_VIDEO_FORMATS_STR:
 *
 * List of video formats that are supported by #GstGLMemory
 */

/**
 * GstGLMemory:
 * @mem: the parent #GstGLBaseMemory object
 * @tex_id: the GL texture id for this memory
 * @tex_target: the GL texture target for this memory
 * @tex_format: the texture type
 * @info: the texture's #GstVideoInfo
 * @valign: data alignment for system memory mapping
 * @plane: data plane in @info
 * @tex_scaling: GL shader scaling parameters for @valign and/or width/height
 *
 * Represents information about a GL texture
 */
struct _GstGLMemory
{
  GstGLBaseMemory           mem;

  guint                     tex_id;
  GstGLTextureTarget        tex_target;
  GstGLFormat               tex_format;
  GstVideoInfo              info;
  GstVideoAlignment         valign;
  guint                     plane;
  gfloat                    tex_scaling[2];

  /*< protected >*/
  gboolean                  texture_wrapped;
  guint                     unpack_length;
  guint                     tex_width;

  /*< private >*/
  gpointer                  _padding[GST_PADDING];
};


#define GST_TYPE_GL_VIDEO_ALLOCATION_PARAMS (gst_gl_video_allocation_params_get_type())
extern
GType gst_gl_video_allocation_params_get_type (void);

typedef struct _GstGLVideoAllocationParams GstGLVideoAllocationParams;

/**
 * GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_VIDEO:
 *
 * GL allocation flag indicating the allocation of 2D video frames
 */
#define GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_VIDEO (1 << 3)

/**
 * GstGLVideoAllocationParams:
 * @parent: the parent #GstGLAllocationParams structure
 * @v_info: the #GstVideoInfo to allocate
 * @plane: the video plane index to allocate
 * @valign: the #GstVideoAlignment to align the system representation to (may be %NULL for the default)
 * @target: the #GstGLTextureTarget to allocate
 * @tex_format: the #GstGLFormat to allocate
 */
struct _GstGLVideoAllocationParams
{
  GstGLAllocationParams  parent;

  GstVideoInfo          *v_info;
  guint                  plane;
  GstVideoAlignment     *valign;
  GstGLTextureTarget     target;
  GstGLFormat            tex_format;

  /*< private >*/
  gpointer               _padding[GST_PADDING];
};

extern
gboolean        gst_gl_video_allocation_params_init_full        (GstGLVideoAllocationParams * params,
                                                                 gsize struct_size,
                                                                 guint alloc_flags,
                                                                 GstGLAllocationParamsCopyFunc copy,
                                                                 GstGLAllocationParamsFreeFunc free,
                                                                 GstGLContext * context,
                                                                 const GstAllocationParams * alloc_params,
                                                                 const GstVideoInfo * v_info,
                                                                 guint plane,
                                                                 const GstVideoAlignment * valign,
                                                                 GstGLTextureTarget target,
                                                                 GstGLFormat tex_format,
                                                                 gpointer wrapped_data,
                                                                 gpointer gl_handle,
                                                                 gpointer user_data,
                                                                 GDestroyNotify notify);
extern
GstGLVideoAllocationParams * gst_gl_video_allocation_params_new (GstGLContext * context,
                                                                 const GstAllocationParams * alloc_params,
                                                                 const GstVideoInfo * v_info,
                                                                 guint plane,
                                                                 const GstVideoAlignment * valign,
                                                                 GstGLTextureTarget target,
                                                                 GstGLFormat tex_format);
extern
GstGLVideoAllocationParams * gst_gl_video_allocation_params_new_wrapped_data    (GstGLContext * context,
                                                                                 const GstAllocationParams * alloc_params,
                                                                                 const GstVideoInfo * v_info,
                                                                                 guint plane,
                                                                                 const GstVideoAlignment * valign,
                                                                                 GstGLTextureTarget target,
                                                                                 GstGLFormat tex_format,
                                                                                 gpointer wrapped_data,
                                                                                 gpointer user_data,
                                                                                 GDestroyNotify notify);

extern
GstGLVideoAllocationParams * gst_gl_video_allocation_params_new_wrapped_texture (GstGLContext * context,
                                                                                 const GstAllocationParams * alloc_params,
                                                                                 const GstVideoInfo * v_info,
                                                                                 guint plane,
                                                                                 const GstVideoAlignment * valign,
                                                                                 GstGLTextureTarget target,
                                                                                 GstGLFormat tex_format,
                                                                                 guint tex_id,
                                                                                 gpointer user_data,
                                                                                 GDestroyNotify notify);

extern
GstGLVideoAllocationParams * gst_gl_video_allocation_params_new_wrapped_gl_handle (GstGLContext * context,
                                                                                 const GstAllocationParams * alloc_params,
                                                                                 const GstVideoInfo * v_info,
                                                                                 guint plane,
                                                                                 const GstVideoAlignment * valign,
                                                                                 GstGLTextureTarget target,
                                                                                 GstGLFormat tex_format,
                                                                                 gpointer gl_handle,
                                                                                 gpointer user_data,
                                                                                 GDestroyNotify notify);

/* subclass usage */
extern
void            gst_gl_video_allocation_params_free_data    (GstGLVideoAllocationParams * params);
/* subclass usage */
extern
void            gst_gl_video_allocation_params_copy_data    (GstGLVideoAllocationParams * src_vid,
                                                             GstGLVideoAllocationParams * dest_vid);

/**
 * GstGLMemoryAllocator
 *
 * Opaque #GstGLMemoryAllocator struct
 */
struct _GstGLMemoryAllocator
{
  /*< private >*/
  GstGLBaseMemoryAllocator parent;

  gpointer _padding[GST_PADDING];
};

/**
 * GstGLMemoryAllocatorClass:
 * @map: provide a custom map implementation
 * @copy: provide a custom copy implementation
 * @unmap: provide a custom unmap implementation
 */
struct _GstGLMemoryAllocatorClass
{
  /*< private >*/
  GstGLBaseMemoryAllocatorClass             parent_class;

  /*< public >*/
  GstGLBaseMemoryAllocatorMapFunction       map;
  GstGLBaseMemoryAllocatorCopyFunction      copy;
  GstGLBaseMemoryAllocatorUnmapFunction     unmap;

  /*< private >*/
  gpointer                                  _padding[GST_PADDING];
};

#include <gst/gl/gstglbasememory.h>

/**
 * GST_GL_MEMORY_ALLOCATOR_NAME:
 *
 * The name of the GL memory allocator
 */
#define GST_GL_MEMORY_ALLOCATOR_NAME   "GLMemory"

/**
 * GST_TYPE_GL_MEMORY:
 *
 * Since: 1.20
 * Deprecated: 1.22: This type has no use.
 */
#define GST_TYPE_GL_MEMORY (gst_gl_memory_get_type())
GType gst_gl_memory_get_type(void);

extern
void            gst_gl_memory_init_once (void);
extern
gboolean        gst_is_gl_memory (GstMemory * mem);

extern
void            gst_gl_memory_init              (GstGLMemory * mem,
                                                 GstAllocator * allocator,
                                                 GstMemory * parent,
                                                 GstGLContext * context,
                                                 GstGLTextureTarget target,
                                                 GstGLFormat tex_format,
                                                 const GstAllocationParams *params,
                                                 const GstVideoInfo * info,
                                                 guint plane,
                                                 const GstVideoAlignment *valign,
                                                 gpointer user_data,
                                                 GDestroyNotify notify);

extern
gboolean        gst_gl_memory_copy_into         (GstGLMemory *gl_mem,
                                                 guint tex_id,
                                                 GstGLTextureTarget target,
                                                 GstGLFormat tex_format,
                                                 gint width,
                                                 gint height);
extern
gboolean        gst_gl_memory_copy_teximage     (GstGLMemory * src,
                                                 guint tex_id,
                                                 GstGLTextureTarget out_target,
                                                 GstGLFormat out_tex_format,
                                                 gint out_width,
                                                 gint out_height);

extern
gboolean        gst_gl_memory_read_pixels       (GstGLMemory * gl_mem,
                                                 gpointer write_pointer);
extern
void            gst_gl_memory_texsubimage       (GstGLMemory * gl_mem,
                                                 gpointer read_pointer);

/* accessors */
extern
gint                    gst_gl_memory_get_texture_width     (GstGLMemory * gl_mem);
extern
gint                    gst_gl_memory_get_texture_height    (GstGLMemory * gl_mem);
extern
GstGLFormat             gst_gl_memory_get_texture_format    (GstGLMemory * gl_mem);
extern
GstGLTextureTarget      gst_gl_memory_get_texture_target    (GstGLMemory * gl_mem);
extern
guint                   gst_gl_memory_get_texture_id        (GstGLMemory * gl_mem);

extern
gboolean                gst_gl_memory_setup_buffer          (GstGLMemoryAllocator * allocator,
                                                             GstBuffer * buffer,
                                                             GstGLVideoAllocationParams * params,
                                                             GstGLFormat *tex_formats,
                                                             gpointer *wrapped_data,
                                                             gsize n_wrapped_pointers);

extern
GstGLMemoryAllocator *  gst_gl_memory_allocator_get_default (GstGLContext *context);



#endif /* _GST_GL_MEMORY_H_ */
