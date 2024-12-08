/* GStreamer
 * Copyright (C) 2005 Andy Wingo <wingo@pobox.com>
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


#ifndef __GST_NET_TIME_PACKET_H__
#define __GST_NET_TIME_PACKET_H__

#include <gst/gst.h>
#include <gio/gio.h>
#include <gst/net/net-prelude.h>



/**
 * GST_NET_TIME_PACKET_SIZE:
 *
 * The size of the packets sent between network clocks.
 */
#define GST_NET_TIME_PACKET_SIZE 16

typedef struct _GstNetTimePacket GstNetTimePacket;

/**
 * GstNetTimePacket:
 * @local_time: the local time when this packet was sent
 * @remote_time: the remote time observation
 *
 * Content of a #GstNetTimePacket.
 */
struct _GstNetTimePacket {
  GstClockTime local_time;
  GstClockTime remote_time;
};


GType                   gst_net_time_packet_get_type    (void);


GstNetTimePacket*       gst_net_time_packet_new         (const guint8 *buffer);


GstNetTimePacket*       gst_net_time_packet_copy        (const GstNetTimePacket *packet);


void                    gst_net_time_packet_free        (GstNetTimePacket *packet);


guint8*                 gst_net_time_packet_serialize   (const GstNetTimePacket *packet);


GstNetTimePacket*	gst_net_time_packet_receive     (GSocket         * socket,
                                                         GSocketAddress ** src_address,
                                                         GError         ** error);

gboolean                gst_net_time_packet_send        (const GstNetTimePacket * packet,
                                                         GSocket                * socket,
                                                         GSocketAddress         * dest_address,
                                                         GError                ** error);






#endif /* __GST_NET_TIME_PACKET_H__ */
