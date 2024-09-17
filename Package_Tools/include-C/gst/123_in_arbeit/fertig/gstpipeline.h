/* GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *
 * gstpipeline.h: Header for GstPipeline element
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


#ifndef __GST_PIPELINE_H__
#define __GST_PIPELINE_H__

#include <gst/gstbin.h>



#define GST_TYPE_PIPELINE               (gst_pipeline_get_type ())
#define GST_PIPELINE(obj)               (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_PIPELINE, GstPipeline))
#define GST_PIPELINE_CLASS(klass)       (G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_PIPELINE, GstPipelineClass))
#define GST_IS_PIPELINE(obj)            (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_PIPELINE))
#define GST_IS_PIPELINE_CLASS(klass)    (G_TYPE_CHECK_CLASS_TYPE ((klass), GST_TYPE_PIPELINE))
#define GST_PIPELINE_GET_CLASS(obj)     (G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_PIPELINE, GstPipelineClass))
#define GST_PIPELINE_CAST(obj)          ((GstPipeline*)(obj))

typedef struct _GstPipeline GstPipeline;
typedef struct _GstPipelineClass GstPipelineClass;
typedef struct _GstPipelinePrivate GstPipelinePrivate;

/**
 * GstPipelineFlags:
 * @GST_PIPELINE_FLAG_FIXED_CLOCK: this pipeline works with a fixed clock
 * @GST_PIPELINE_FLAG_LAST: offset to define more flags
 *
 * Pipeline flags
 */
typedef enum {
  GST_PIPELINE_FLAG_FIXED_CLOCK        = (GST_BIN_FLAG_LAST << 0),
  /* padding */
  GST_PIPELINE_FLAG_LAST               = (GST_BIN_FLAG_LAST << 4)
} GstPipelineFlags;

/**
 * GstPipeline:
 * @fixed_clock: The fixed clock of the pipeline, used when
 *               GST_PIPELINE_FLAG_FIXED_CLOCK is set.
 * @stream_time: The stream time of the pipeline. A better name for this
 *         property would be the running_time, the total time spent in the
 *         PLAYING state without being flushed. (deprecated, use the start_time
 *         on GstElement).
 * @delay: Extra delay added to base_time to compensate for computing delays
 *         when setting elements to PLAYING.
 *
 * The #GstPipeline structure.
 */
struct _GstPipeline {
  GstBin         bin;

  /*< public >*/ /* with LOCK */
  GstClock      *fixed_clock;

  GstClockTime   stream_time;
  GstClockTime   delay;

  /*< private >*/
  GstPipelinePrivate *priv;

  gpointer _gst_reserved[GST_PADDING];
};

struct _GstPipelineClass {
  GstBinClass parent_class;

  /*< private >*/
  gpointer _gst_reserved[GST_PADDING];
};

extern
GType           gst_pipeline_get_type           (void);

extern
GstElement*     gst_pipeline_new                (const gchar *name) ;

extern
GstBus*         gst_pipeline_get_bus            (GstPipeline *pipeline);

extern
void            gst_pipeline_use_clock          (GstPipeline *pipeline, GstClock *clock);

extern
gboolean        gst_pipeline_set_clock          (GstPipeline *pipeline, GstClock *clock);

extern
GstClock*       gst_pipeline_get_clock          (GstPipeline *pipeline);

extern
GstClock*       gst_pipeline_get_pipeline_clock (GstPipeline *pipeline);

extern
void            gst_pipeline_auto_clock         (GstPipeline *pipeline);

extern
void            gst_pipeline_set_delay          (GstPipeline *pipeline, GstClockTime delay);

extern
GstClockTime    gst_pipeline_get_delay          (GstPipeline *pipeline);

extern
void            gst_pipeline_set_latency        (GstPipeline *pipeline, GstClockTime latency);

extern
GstClockTime    gst_pipeline_get_latency        (GstPipeline *pipeline);

extern
void            gst_pipeline_set_auto_flush_bus (GstPipeline *pipeline, gboolean auto_flush);

extern
gboolean        gst_pipeline_get_auto_flush_bus (GstPipeline *pipeline);

extern
gboolean        gst_pipeline_is_live            (GstPipeline *pipeline);

extern
GstClockTime    gst_pipeline_get_configured_latency    (GstPipeline * pipeline);





#endif /* __GST_PIPELINE_H__ */

