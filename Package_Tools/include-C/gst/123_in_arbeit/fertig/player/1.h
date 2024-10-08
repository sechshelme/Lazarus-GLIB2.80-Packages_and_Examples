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

#ifndef __GST_PLAYER_MEDIA_INFO_H__
#define __GST_PLAYER_MEDIA_INFO_H__

#include <gst/gst.h>
#include <gst/player/player-prelude.h>



#define GST_TYPE_PLAYER_MEDIA_INFO \
  (gst_player_media_info_get_type())
#define GST_PLAYER_MEDIA_INFO(obj) \
  (G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_PLAYER_MEDIA_INFO,GstPlayerMediaInfo))
#define GST_PLAYER_MEDIA_INFO_CLASS(klass) \
  (G_TYPE_CHECK_CLASS_CAST((klass),GST_TYPE_PLAYER_MEDIA_INFO,GstPlayerMediaInfoClass))
#define GST_IS_PLAYER_MEDIA_INFO(obj) \
  (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_PLAYER_MEDIA_INFO))
#define GST_IS_PLAYER_MEDIA_INFO_CLASS(klass) \
  (G_TYPE_CHECK_CLASS_TYPE((klass),GST_TYPE_PLAYER_MEDIA_INFO))

/**
 * GstPlayerMediaInfo:
 *
 * Structure containing the media information of a URI.
 */
typedef struct _GstPlayerMediaInfo GstPlayerMediaInfo;
typedef struct _GstPlayerMediaInfoClass GstPlayerMediaInfoClass;


GType         gst_player_media_info_get_type (void);


const gchar * gst_player_media_info_get_uri (const GstPlayerMediaInfo *info);


gboolean      gst_player_media_info_is_seekable (const GstPlayerMediaInfo *info);


gboolean      gst_player_media_info_is_live (const GstPlayerMediaInfo *info);


GstClockTime  gst_player_media_info_get_duration (const GstPlayerMediaInfo *info);


GList*        gst_player_media_info_get_stream_list (const GstPlayerMediaInfo *info);


guint         gst_player_media_info_get_number_of_streams (const GstPlayerMediaInfo *info);


GList*        gst_player_media_info_get_video_streams (const GstPlayerMediaInfo *info);


guint         gst_player_media_info_get_number_of_video_streams (const GstPlayerMediaInfo *info);


GList*        gst_player_media_info_get_audio_streams (const GstPlayerMediaInfo *info);


guint         gst_player_media_info_get_number_of_audio_streams (const GstPlayerMediaInfo *info);


GList*        gst_player_media_info_get_subtitle_streams (const GstPlayerMediaInfo *info);


guint         gst_player_media_info_get_number_of_subtitle_streams (const GstPlayerMediaInfo *info);


GstTagList*   gst_player_media_info_get_tags (const GstPlayerMediaInfo *info);


const gchar*  gst_player_media_info_get_title (const GstPlayerMediaInfo *info);


const gchar*  gst_player_media_info_get_container_format (const GstPlayerMediaInfo *info);


GstSample*    gst_player_media_info_get_image_sample (const GstPlayerMediaInfo *info);

GList*        gst_player_get_video_streams    (const GstPlayerMediaInfo *info);

GList*        gst_player_get_audio_streams    (const GstPlayerMediaInfo *info);

GList*        gst_player_get_subtitle_streams (const GstPlayerMediaInfo *info);



#endif /* __GST_PLAYER_MEDIA_INFO_H */
