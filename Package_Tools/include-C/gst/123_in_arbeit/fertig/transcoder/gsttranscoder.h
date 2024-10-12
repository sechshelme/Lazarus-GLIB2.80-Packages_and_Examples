#ifndef __GST_TRANSCODER_H
#define __GST_TRANSCODER_H

#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif

#include <gst/gst.h>
#include <gst/pbutils/pbutils.h>
#include <gst/transcoder/transcoder-prelude.h>
#include <gst/transcoder/transcoder-enumtypes.h>



/*********** Error definitions ************/
#define      GST_TRANSCODER_ERROR                         (gst_transcoder_error_quark ())

/**
 * GstTranscoderError:
 * @GST_TRANSCODER_ERROR_FAILED: generic error.
 */
typedef enum {
  GST_TRANSCODER_ERROR_FAILED = 0
} GstTranscoderError;


GQuark        gst_transcoder_error_quark    (void);

const gchar * gst_transcoder_error_get_name (GstTranscoderError error);

/*********** State definition ************/

/**
 * GstTranscoderState:
 * @GST_TRANSCODER_STATE_STOPPED: the transcoder is stopped.
 * @GST_TRANSCODER_STATE_PAUSED: the transcoder is paused.
 * @GST_TRANSCODER_STATE_PLAYING: the transcoder is currently transcoding a
 * stream.
 *
 * High level representation of the transcoder pipeline state.
 *
 * Since: 1.20
 */
typedef enum {
    GST_TRANSCODER_STATE_STOPPED,
    GST_TRANSCODER_STATE_PAUSED,
    GST_TRANSCODER_STATE_PLAYING
} GstTranscoderState;


const gchar * gst_transcoder_state_get_name                (GstTranscoderState state);

/*********** Messages types definitions ************/

/**
 * GstTranscoderMessage:
 * @GST_TRANSCODER_MESSAGE_POSITION_UPDATED: Sink position changed
 * @GST_TRANSCODER_MESSAGE_DURATION_CHANGED: Duration of stream changed
 * @GST_TRANSCODER_MESSAGE_STATE_CHANGED: Pipeline state changed
 * @GST_TRANSCODER_MESSAGE_DONE: Transcoding is done
 * @GST_TRANSCODER_MESSAGE_ERROR: Message contains an error
 * @GST_TRANSCODER_MESSAGE_WARNING: Message contains an error
 *
 * Types of messages that will be posted on the transcoder API bus.
 *
 * See also #gst_transcoder_get_message_bus()
 *
 * Since: 1.20
 */
typedef enum
{
  GST_TRANSCODER_MESSAGE_POSITION_UPDATED,
  GST_TRANSCODER_MESSAGE_DURATION_CHANGED,
  GST_TRANSCODER_MESSAGE_STATE_CHANGED,
  GST_TRANSCODER_MESSAGE_DONE,
  GST_TRANSCODER_MESSAGE_ERROR,
  GST_TRANSCODER_MESSAGE_WARNING,
} GstTranscoderMessage;


gboolean gst_transcoder_is_transcoder_message                 (GstMessage * msg);


const gchar * gst_transcoder_message_get_name                  (GstTranscoderMessage message);


void           gst_transcoder_message_parse_position           (GstMessage * msg, GstClockTime * position);


void           gst_transcoder_message_parse_duration           (GstMessage * msg, GstClockTime * duration);


void           gst_transcoder_message_parse_state              (GstMessage * msg, GstTranscoderState * state);


void           gst_transcoder_message_parse_error              (GstMessage * msg, GError * error, GstStructure ** details);


void           gst_transcoder_message_parse_warning            (GstMessage * msg, GError * error, GstStructure ** details);



/*********** GstTranscoder definition  ************/
#define GST_TYPE_TRANSCODER (gst_transcoder_get_type ())

/**
 * GstTranscoderClass.parent_class:
 *
 * Since: 1.20
 */

//G_DECLARE_FINAL_TYPE (GstTranscoder, gst_transcoder, GST, TRANSCODER, GstObject)


GstTranscoder * gst_transcoder_new                        (const gchar * source_uri,
                                                           const gchar * dest_uri,
                                                           const gchar * encoding_profile);


GstTranscoder * gst_transcoder_new_full                   (const gchar * source_uri,
                                                           const gchar * dest_uri,
                                                           GstEncodingProfile * profile);


gboolean gst_transcoder_run                               (GstTranscoder * self,
                                                           GError ** error);


GstBus * gst_transcoder_get_message_bus                   (GstTranscoder * transcoder);


void gst_transcoder_set_cpu_usage                         (GstTranscoder * self,
                                                           gint cpu_usage);


void gst_transcoder_run_async                             (GstTranscoder * self);


void gst_transcoder_set_position_update_interval          (GstTranscoder * self,
                                                           guint interval);


gchar * gst_transcoder_get_source_uri                     (GstTranscoder * self);


gchar * gst_transcoder_get_dest_uri                       (GstTranscoder * self);


guint gst_transcoder_get_position_update_interval         (GstTranscoder * self);


GstClockTime gst_transcoder_get_position                  (GstTranscoder * self);


GstClockTime gst_transcoder_get_duration                  (GstTranscoder * self);


GstElement * gst_transcoder_get_pipeline                  (GstTranscoder * self);


gboolean gst_transcoder_get_avoid_reencoding              (GstTranscoder * self);

void gst_transcoder_set_avoid_reencoding                  (GstTranscoder * self,
                                                           gboolean avoid_reencoding);

#include "gsttranscoder-signal-adapter.h"


GstTranscoderSignalAdapter*
gst_transcoder_get_signal_adapter                         (GstTranscoder * self,
                                                           GMainContext *context);

GstTranscoderSignalAdapter*
gst_transcoder_get_sync_signal_adapter                    (GstTranscoder * self);



#endif
