/* GStreamer
 *
 * Copyright (C) 2019-2020 Stephan Hesse <stephan@emliri.com>
 * Copyright (C) 2020 Philippe Normand <philn@igalia.com>
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

#ifndef __GST_PLAY_SIGNAL_ADAPTER_H__
#define __GST_PLAY_SIGNAL_ADAPTER_H__

#include <gst/play/gstplay-types.h>



#define GST_TYPE_PLAY_SIGNAL_ADAPTER             (gst_play_signal_adapter_get_type ())
#define GST_PLAY_SIGNAL_ADAPTER(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_PLAY_SIGNAL_ADAPTER, GstPlaySignalAdapter))
#define GST_PLAY_SIGNAL_ADAPTER_CLASS(klass)     (G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_PLAY_SIGNAL_ADAPTER, GstPlaySignalAdapterClass))
#define GST_IS_PLAY_SIGNAL_ADAPTER(obj)          (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_PLAY_SIGNAL_ADAPTER))
#define GST_IS_PLAY_SIGNAL_ADAPTER_CLASS(klass)  (G_TYPE_CHECK_CLASS_TYPE ((klass), GST_TYPE_PLAY_SIGNAL_ADAPTER))
#define GST_PLAY_SIGNAL_ADAPTER_GET_CLASS(obj)   (G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_PLAY_SIGNAL_ADAPTER, GstPlaySignalAdapterClass))

/**
 * GST_PLAY_SIGNAL_ADAPTER_CAST:
 * Since: 1.20
 */
#define GST_PLAY_SIGNAL_ADAPTER_CAST(obj)        ((GstPlaySignalAdapter*)(obj))

#ifdef G_DEFINE_AUTOPTR_CLEANUP_FUNC

#endif


GType                  gst_play_signal_adapter_get_type               (void);


GstPlaySignalAdapter * gst_play_signal_adapter_new                    (GstPlay * play);


GstPlaySignalAdapter * gst_play_signal_adapter_new_with_main_context  (GstPlay * play, GMainContext * context);


GstPlaySignalAdapter * gst_play_signal_adapter_new_sync_emit          (GstPlay * play);


GstPlay              * gst_play_signal_adapter_get_play               (GstPlaySignalAdapter * adapter);



#endif /* __GST_PLAY_SIGNAL_ADAPTER_H__ */
