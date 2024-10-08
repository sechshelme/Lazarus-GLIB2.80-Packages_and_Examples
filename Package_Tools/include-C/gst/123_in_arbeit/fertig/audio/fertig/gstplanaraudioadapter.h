/* GStreamer
 * Copyright (C) 2018 Collabora Ltd.
 *   @author George Kiagiadakis <george.kiagiadakis@collabora.com>
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

#ifndef __GST_PLANAR_AUDIO_ADAPTER_H__
#define __GST_PLANAR_AUDIO_ADAPTER_H__

#ifndef GST_USE_UNSTABLE_API
//#warning "The Base library from gst-plugins-bad is unstable API and may change in future."
//#warning "You can define GST_USE_UNSTABLE_API to avoid this warning."
#endif

#include <gst/gst.h>
#include <gst/audio/audio-info.h>
#include <gst/audio/audio-bad-prelude.h>



#define GST_TYPE_PLANAR_AUDIO_ADAPTER \
  (gst_planar_audio_adapter_get_type())
#define GST_PLANAR_AUDIO_ADAPTER(obj) \
  (G_TYPE_CHECK_INSTANCE_CAST((obj), GST_TYPE_PLANAR_AUDIO_ADAPTER, GstPlanarAudioAdapter))
#define GST_PLANAR_AUDIO_ADAPTER_CLASS(klass) \
  (G_TYPE_CHECK_CLASS_CAST((klass), GST_TYPE_PLANAR_AUDIO_ADAPTER, GstPlanarAudioAdapterClass))
#define GST_IS_PLANAR_AUDIO_ADAPTER(obj) \
  (G_TYPE_CHECK_INSTANCE_TYPE((obj), GST_TYPE_PLANAR_AUDIO_ADAPTER))
#define GST_IS_PLANAR_AUDIO_ADAPTER_CLASS(klass) \
  (G_TYPE_CHECK_CLASS_TYPE((klass), GST_TYPE_PLANAR_AUDIO_ADAPTER))
#define GST_PLANAR_AUDIO_ADAPTER_GET_CLASS(obj) \
  (G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_PLANAR_AUDIO_ADAPTER, GstPlanarAudioAdapterClass))

/**
 * GstPlanarAudioAdapter:
 *
 * The opaque #GstPlanarAudioAdapter data structure.
 */
typedef struct _GstPlanarAudioAdapter GstPlanarAudioAdapter;
typedef struct _GstPlanarAudioAdapterClass GstPlanarAudioAdapterClass;

extern
GType gst_planar_audio_adapter_get_type (void);

extern
GstPlanarAudioAdapter * gst_planar_audio_adapter_new (void) ;

extern
void gst_planar_audio_adapter_configure (GstPlanarAudioAdapter * adapter,
    const GstAudioInfo * info);

extern
void gst_planar_audio_adapter_clear (GstPlanarAudioAdapter * adapter);

extern
void gst_planar_audio_adapter_push (GstPlanarAudioAdapter * adapter,
    GstBuffer * buf);

extern
void gst_planar_audio_adapter_flush (GstPlanarAudioAdapter * adapter,
    gsize to_flush);

extern
GstBuffer * gst_planar_audio_adapter_get_buffer (GstPlanarAudioAdapter * adapter,
    gsize nsamples, GstMapFlags flags);

extern
GstBuffer * gst_planar_audio_adapter_take_buffer (GstPlanarAudioAdapter * adapter,
    gsize nsamples, GstMapFlags flags);

extern
gsize gst_planar_audio_adapter_available (GstPlanarAudioAdapter * adapter);

extern
guint64 gst_planar_audio_adapter_distance_from_discont (GstPlanarAudioAdapter * adapter);

extern
guint64 gst_planar_audio_adapter_offset_at_discont (GstPlanarAudioAdapter * adapter);

extern
GstClockTime gst_planar_audio_adapter_pts_at_discont (GstPlanarAudioAdapter * adapter);

extern
GstClockTime gst_planar_audio_adapter_dts_at_discont (GstPlanarAudioAdapter * adapter);

extern
guint64 gst_planar_audio_adapter_prev_offset (GstPlanarAudioAdapter * adapter,
    guint64 * distance);

extern
GstClockTime gst_planar_audio_adapter_prev_pts (GstPlanarAudioAdapter * adapter,
    guint64 * distance);

extern
GstClockTime gst_planar_audio_adapter_prev_dts (GstPlanarAudioAdapter * adapter,
    guint64 * distance);





#endif /* __GST_PLANAR_AUDIO_ADAPTER_H__ */
