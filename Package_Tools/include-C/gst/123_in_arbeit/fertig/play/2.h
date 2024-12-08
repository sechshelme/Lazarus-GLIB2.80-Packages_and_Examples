/* GStreamer
 *
 * Copyright (C) 2015 Brijesh Singh <brijesh.ksingh@gmail.com>
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

#ifndef __GST_PLAY_MEDIA_INFO_H__
#define __GST_PLAY_MEDIA_INFO_H__

#include <gst/gst.h>
#include <gst/play/play-prelude.h>



/**
 * GST_TYPE_PLAY_STREAM_INFO:
 * Since: 1.20
 */
#define GST_TYPE_PLAY_MEDIA_INFO \
  (gst_play_media_info_get_type())
#define GST_PLAY_MEDIA_INFO(obj) \
  (G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_PLAY_MEDIA_INFO,GstPlayMediaInfo))
#define GST_PLAY_MEDIA_INFO_CLASS(klass) \
  (G_TYPE_CHECK_CLASS_CAST((klass),GST_TYPE_PLAY_MEDIA_INFO,GstPlayMediaInfoClass))
#define GST_IS_PLAY_MEDIA_INFO(obj) \
  (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_PLAY_MEDIA_INFO))
#define GST_IS_PLAY_MEDIA_INFO_CLASS(klass) \
  (G_TYPE_CHECK_CLASS_TYPE((klass),GST_TYPE_PLAY_MEDIA_INFO))

/**
 * GstPlayMediaInfo:
 *
 * Structure containing the media information of a URI.
 * Since: 1.20
 */
typedef struct _GstPlayMediaInfo GstPlayMediaInfo;
typedef struct _GstPlayMediaInfoClass GstPlayMediaInfoClass;

#ifdef G_DEFINE_AUTOPTR_CLEANUP_FUNC

#endif


GType         gst_play_media_info_get_type (void);


const gchar * gst_play_media_info_get_uri (const GstPlayMediaInfo *info);


gboolean      gst_play_media_info_is_seekable (const GstPlayMediaInfo *info);


gboolean      gst_play_media_info_is_live (const GstPlayMediaInfo *info);


GstClockTime  gst_play_media_info_get_duration (const GstPlayMediaInfo *info);


GList*        gst_play_media_info_get_stream_list (const GstPlayMediaInfo *info);


guint         gst_play_media_info_get_number_of_streams (const GstPlayMediaInfo *info);


GList*        gst_play_media_info_get_video_streams (const GstPlayMediaInfo *info);


guint         gst_play_media_info_get_number_of_video_streams (const GstPlayMediaInfo *info);


GList*        gst_play_media_info_get_audio_streams (const GstPlayMediaInfo *info);


guint         gst_play_media_info_get_number_of_audio_streams (const GstPlayMediaInfo *info);


GList*        gst_play_media_info_get_subtitle_streams (const GstPlayMediaInfo *info);


guint         gst_play_media_info_get_number_of_subtitle_streams (const GstPlayMediaInfo *info);


GstTagList*   gst_play_media_info_get_tags (const GstPlayMediaInfo *info);


const gchar*  gst_play_media_info_get_title (const GstPlayMediaInfo *info);


const gchar*  gst_play_media_info_get_container_format (const GstPlayMediaInfo *info);


GstSample*    gst_play_media_info_get_image_sample (const GstPlayMediaInfo *info);

GList*        gst_play_get_video_streams    (const GstPlayMediaInfo *info);

GList*        gst_play_get_audio_streams    (const GstPlayMediaInfo *info);

GList*        gst_play_get_subtitle_streams (const GstPlayMediaInfo *info);



#endif /* __GST_PLAY_MEDIA_INFO_H */
