/* 
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
 */

#ifndef __GST_GL_FRAMEBUFFER_H__
#define __GST_GL_FRAMEBUFFER_H__

#include <gst/gl/gstgl_fwd.h>



extern
GType gst_gl_framebuffer_get_type (void);

#define GST_TYPE_GL_FRAMEBUFFER             (gst_gl_framebuffer_get_type())
#define GST_GL_FRAMEBUFFER(obj)             (G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_GL_FRAMEBUFFER,GstGLFramebuffer))
#define GST_GL_FRAMEBUFFER_CLASS(klass)     (G_TYPE_CHECK_CLASS_CAST((klass), GST_TYPE_GL_FRAMEBUFFER,GstGLFramebufferClass))
#define GST_IS_GL_FRAMEBUFFER(obj)          (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_GL_FRAMEBUFFER))
#define GST_IS_GL_FRAMEBUFFER_CLASS(klass)  (G_TYPE_CHECK_CLASS_TYPE((klass), GST_TYPE_GL_FRAMEBUFFER))
#define GST_GL_FRAMEBUFFER_CAST(obj)        ((GstGLFramebuffer*)(obj))

typedef struct _GstGLFramebufferPrivate GstGLFramebufferPrivate;

/**
 * GstGLFramebufferFunc:
 * @stuff: user data
 *
 * callback definition for operating through a #GstGLFramebuffer object
 */
typedef gboolean (*GstGLFramebufferFunc) (gpointer stuff);

/**
 * GstGLFramebuffer:
 *
 * Opaque #GstGLFramebuffer struct
 */
struct _GstGLFramebuffer
{
  /*< private >*/
  GstObject             object;

  GstGLContext *context;

  guint fbo_id;
  GArray *attachments;

  gpointer          _padding[GST_PADDING];

  GstGLFramebufferPrivate  *priv;
};

/**
 * GstGLFramebufferClass:
 *
 * Opaque #GstGLFramebufferClass struct
 */
struct _GstGLFramebufferClass
{
  /*< private >*/
  GstObjectClass object_class;

  gpointer          _padding[GST_PADDING];
};

extern
GstGLFramebuffer *      gst_gl_framebuffer_new                      (GstGLContext *context);
extern
GstGLFramebuffer *      gst_gl_framebuffer_new_with_default_depth   (GstGLContext *context,
                                                                     guint width,
                                                                     guint height);

extern
guint                   gst_gl_framebuffer_get_id                   (GstGLFramebuffer * fb);

extern
void                    gst_gl_framebuffer_attach                   (GstGLFramebuffer * fb,
                                                                     guint attachment_point,
                                                                     GstGLBaseMemory * mem);
extern
void                    gst_gl_framebuffer_bind                     (GstGLFramebuffer * fb);
extern
void                    gst_gl_context_clear_framebuffer            (GstGLContext * context);

extern
void                    gst_gl_framebuffer_get_effective_dimensions (GstGLFramebuffer * fb,
                                                                     guint * width,
                                                                     guint * height);

extern
gboolean                gst_gl_context_check_framebuffer_status     (GstGLContext * context,
                                                                     guint fbo_target);

extern
gboolean                gst_gl_framebuffer_draw_to_texture          (GstGLFramebuffer * fb,
                                                                     GstGLMemory * mem,
                                                                     GstGLFramebufferFunc func,
                                                                     gpointer user_data);





#endif
