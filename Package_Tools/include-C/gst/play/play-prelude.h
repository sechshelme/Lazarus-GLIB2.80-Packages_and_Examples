/* GStreamer Play Library
 * Copyright (C) 2018 GStreamer developers
 *
 * play-prelude.h: prelude include header for gst-play library
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

#ifndef __GST_PLAY_PRELUDE_H__
#define __GST_PLAY_PRELUDE_H__

#include <gst/gst.h>

#ifndef GST_PLAY_API
# ifdef BUILDING_GST_PLAY
#  define GST_PLAY_API extern_EXPORT         /* from config.h */
# else
#  define GST_PLAY_API extern_IMPORT
# endif
#endif

#ifndef GST_DISABLE_DEPRECATED
#define GST_PLAY_DEPRECATED GST_PLAY_API
#define GST_PLAY_DEPRECATED_FOR(f) GST_PLAY_API
#else
#define GST_PLAY_DEPRECATED G_DEPRECATED GST_PLAY_API
#define GST_PLAY_DEPRECATED_FOR(f) G_DEPRECATED_FOR(f) GST_PLAY_API
#endif

#endif /* __GST_PLAY_PRELUDE_H__ */
