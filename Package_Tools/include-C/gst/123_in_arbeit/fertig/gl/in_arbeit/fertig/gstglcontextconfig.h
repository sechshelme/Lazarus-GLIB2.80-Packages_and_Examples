/*
 * GStreamer
 * Copyright (C) 2020 Matthew Waters <matthew@centricular.com>
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

#ifndef __GST_GL_CONTEXT_CONFIG_H__
#define __GST_GL_CONTEXT_CONFIG_H__

#include <gst/gst.h>

#include <gst/gl/gstgl_fwd.h>



/**
 * GST_GL_CONFIG_STRUCTURE_NAME:
 *
 * The canonical name of a #GstStructure that contains a configuration for a
 * #GstGLContext.
 *
 * Since: 1.20
 */
#define GST_GL_CONFIG_STRUCTURE_NAME "gst-gl-context-config"

/**
 * GST_GL_CONFIG_ATTRIB_NAME:
 *
 * Get a reference to the variable name of a particular configuration field.
 *
 * e.g. for `CONFIG_ID`: `GST_GL_CONFIG_ATTRIB_NAME (CONFIG_ID)`
 *
 * Since: 1.20
 */
#define GST_GL_CONFIG_ATTRIB_NAME(UPPER_NAME) \
  G_PASTE(G_PASTE(GST_GL_CONFIG_ATTRIB_,UPPER_NAME),_NAME)
/**
 * GST_GL_CONFIG_ATTRIB_GTYPE:
 *
 * Get a reference to the #GType of a particular configuration field.
 *
 * e.g. for `CONFIG_ID`: `GST_GL_CONFIG_ATTRIB_GTYPE (CONFIG_ID)`
 *
 * Since: 1.20
 */
#define GST_GL_CONFIG_ATTRIB_GTYPE(UPPER_NAME) \
  G_PASTE(G_PASTE(GST_GL_CONFIG_ATTRIB_,UPPER_NAME),_GTYPE)

extern const char * GST_GL_CONFIG_ATTRIB_CONFIG_ID_NAME;
#define GST_GL_CONFIG_ATTRIB_CONFIG_ID_GTYPE G_TYPE_UINT
extern const char * GST_GL_CONFIG_ATTRIB_PLATFORM_NAME;
#define GST_GL_CONFIG_ATTRIB_PLATFORM_GTYPE GST_TYPE_GL_PLATFORM
extern const char * GST_GL_CONFIG_ATTRIB_CAVEAT_NAME;
#define GST_GL_CONFIG_ATTRIB_CAVEAT_GTYPE GST_TYPE_GL_CONFIG_CAVEAT
extern const char * GST_GL_CONFIG_ATTRIB_SURFACE_TYPE_NAME;
#define GST_GL_CONFIG_ATTRIB_SURFACE_TYPE_GTYPE GST_TYPE_GL_CONFIG_SURFACE_TYPE
extern const char * GST_GL_CONFIG_ATTRIB_CONFORMANT_API_NAME;
#define GST_GL_CONFIG_ATTRIB_CONFORMANT_API_GTYPE GST_TYPE_GL_API
extern const char * GST_GL_CONFIG_ATTRIB_RENDERABLE_API_NAME;
#define GST_GL_CONFIG_ATTRIB_RENDERABLE_API_GTYPE GST_TYPE_GL_API
extern const char * GST_GL_CONFIG_ATTRIB_RED_SIZE_NAME;
#define GST_GL_CONFIG_ATTRIB_RED_SIZE_GTYPE G_TYPE_INT
extern const char * GST_GL_CONFIG_ATTRIB_GREEN_SIZE_NAME;
#define GST_GL_CONFIG_ATTRIB_GREEN_SIZE_GTYPE G_TYPE_INT
extern const char * GST_GL_CONFIG_ATTRIB_BLUE_SIZE_NAME;
#define GST_GL_CONFIG_ATTRIB_BLUE_SIZE_GTYPE G_TYPE_INT
extern const char * GST_GL_CONFIG_ATTRIB_ALPHA_SIZE_NAME;
#define GST_GL_CONFIG_ATTRIB_ALPHA_SIZE_GTYPE G_TYPE_INT
extern const char * GST_GL_CONFIG_ATTRIB_LUMINANCE_SIZE_NAME;
#define GST_GL_CONFIG_ATTRIB_LUMINANCE_SIZE_GTYPE G_TYPE_INT
extern const char * GST_GL_CONFIG_ATTRIB_DEPTH_SIZE_NAME;
#define GST_GL_CONFIG_ATTRIB_DEPTH_SIZE_GTYPE G_TYPE_INT
extern const char * GST_GL_CONFIG_ATTRIB_STENCIL_SIZE_NAME;
#define GST_GL_CONFIG_ATTRIB_STENCIL_SIZE_GTYPE G_TYPE_INT
extern const char * GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_WIDTH_NAME;
#define GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_WIDTH_GTYPE G_TYPE_INT
extern const char * GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_HEIGHT_NAME;
#define GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_HEIGHT_GTYPE G_TYPE_INT
extern const char * GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_PIXELS_NAME;
#define GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_PIXELS_GTYPE G_TYPE_INT
extern const char * GST_GL_CONFIG_ATTRIB_SAMPLE_BUFFERS_NAME;
#define GST_GL_CONFIG_ATTRIB_SAMPLE_BUFFERS_GTYPE G_TYPE_INT
extern const char * GST_GL_CONFIG_ATTRIB_SAMPLES_NAME;
#define GST_GL_CONFIG_ATTRIB_SAMPLES_GTYPE G_TYPE_INT
extern const char * GST_GL_CONFIG_ATTRIB_NATIVE_RENDERABLE_NAME;
#define GST_GL_CONFIG_ATTRIB_NATIVE_RENDERABLE_GTYPE G_TYPE_BOOLEAN
extern const char * GST_GL_CONFIG_ATTRIB_NATIVE_VISUAL_ID_NAME;
#define GST_GL_CONFIG_ATTRIB_NATIVE_VISUAL_ID_GTYPE G_TYPE_UINT
extern const char * GST_GL_CONFIG_ATTRIB_LEVEL_NAME;
#define GST_GL_CONFIG_ATTRIB_LEVEL_GTYPE G_TYPE_INT
extern const char * GST_GL_CONFIG_ATTRIB_MIN_SWAP_INTERVAL_NAME;
#define GST_GL_CONFIG_ATTRIB_MIN_SWAP_INTERVAL_GTYPE G_TYPE_INT
extern const char * GST_GL_CONFIG_ATTRIB_MAX_SWAP_INTERVAL_NAME;
#define GST_GL_CONFIG_ATTRIB_MAX_SWAP_INTERVAL_GTYPE G_TYPE_INT

/**
 * GST_GL_CONFIG_STRUCTURE_SET_ARGS:
 *
 * Since: 1.20
 */

/**
 * GstGLConfigCaveat:
 * @GST_GL_CONFIG_CAVEAT_NONE: none
 * @GST_GL_CONFIG_CAVEAT_SLOW: slow
 * @GST_GL_CONFIG_CAVEAT_NON_CONFORMANT: non-conformant
 *
 * Since: 1.20
 */
typedef enum
{
  GST_GL_CONFIG_CAVEAT_NONE,
  GST_GL_CONFIG_CAVEAT_SLOW,
  GST_GL_CONFIG_CAVEAT_NON_CONFORMANT,
} GstGLConfigCaveat;

extern
const gchar * gst_gl_config_caveat_to_string (GstGLConfigCaveat caveat);

/**
 * GstGLConfigSurfaceType:
 * @GST_GL_CONFIG_SURFACE_TYPE_NONE: none
 * @GST_GL_CONFIG_SURFACE_TYPE_WINDOW: window
 * @GST_GL_CONFIG_SURFACE_TYPE_PBUFFER: pbuffer
 * @GST_GL_CONFIG_SURFACE_TYPE_PIXMAP: pixmap
 *
 * Since: 1.20
 */
typedef enum
{
  GST_GL_CONFIG_SURFACE_TYPE_NONE = 0,
  GST_GL_CONFIG_SURFACE_TYPE_WINDOW = (1 << 0),
  GST_GL_CONFIG_SURFACE_TYPE_PBUFFER = (1 << 1),
  GST_GL_CONFIG_SURFACE_TYPE_PIXMAP = (1 << 2),
} GstGLConfigSurfaceType;

extern
const gchar * gst_gl_config_surface_type_to_string (GstGLConfigSurfaceType surface_type);



#endif /* __GST_GL_CONTEXT_CONFIG_H__ */
