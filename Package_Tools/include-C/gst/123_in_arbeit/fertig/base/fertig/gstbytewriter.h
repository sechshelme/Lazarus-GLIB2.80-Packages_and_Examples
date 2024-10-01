/* GStreamer byte writer
 *
 * Copyright (C) 2009 Sebastian Dröge <sebastian.droege@collabora.co.uk>.
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

#ifndef __GST_BYTE_WRITER_H__
#define __GST_BYTE_WRITER_H__

#include <gst/gst.h>
#include <gst/base/gstbytereader.h>

#include <string.h>



#define GST_BYTE_WRITER(writer) ((GstByteWriter *) (writer))

/**
 * GstByteWriter:
 * @parent: #GstByteReader parent
 * @alloc_size: Allocation size of the data
 * @fixed: If %TRUE no reallocations are allowed
 * @owned: If %FALSE no reallocations are allowed and copies of data are returned
 *
 * A byte writer instance.
 */
typedef struct {
  GstByteReader parent;

  guint alloc_size;

  gboolean fixed;
  gboolean owned;

  /* < private > */
  gpointer _gst_reserved[GST_PADDING];
} GstByteWriter;

extern
GstByteWriter * gst_byte_writer_new             (void) ;

extern
GstByteWriter * gst_byte_writer_new_with_size   (guint size, gboolean fixed) ;

extern
GstByteWriter * gst_byte_writer_new_with_data   (guint8 *data, guint size, gboolean initialized) ;

extern
void            gst_byte_writer_init            (GstByteWriter *writer);

extern
void            gst_byte_writer_init_with_size  (GstByteWriter *writer, guint size, gboolean fixed);

extern
void            gst_byte_writer_init_with_data  (GstByteWriter *writer, guint8 *data,
                                                 guint size, gboolean initialized);
extern
void            gst_byte_writer_free                    (GstByteWriter *writer);

extern
guint8 *        gst_byte_writer_free_and_get_data       (GstByteWriter *writer);

extern
GstBuffer *     gst_byte_writer_free_and_get_buffer     (GstByteWriter *writer) ;

extern
void            gst_byte_writer_reset                   (GstByteWriter *writer);

extern
guint8 *        gst_byte_writer_reset_and_get_data      (GstByteWriter *writer);

extern
GstBuffer *     gst_byte_writer_reset_and_get_buffer    (GstByteWriter *writer) ;

/**
 * gst_byte_writer_get_pos:
 * @writer: #GstByteWriter instance
 *
 * Returns: The current position of the read/write cursor
 */
/**
 * gst_byte_writer_set_pos:
 * @writer: #GstByteWriter instance
 * @pos: new position
 *
 * Sets the current read/write cursor of @writer. The new position
 * can only be between 0 and the current size.
 *
 * Returns: %TRUE if the new position could be set
 */
/**
 * gst_byte_writer_get_size:
 * @writer: #GstByteWriter instance
 *
 * Returns: The current, initialized size of the data
 */

extern
guint           gst_byte_writer_get_remaining     (const GstByteWriter *writer);

extern
gboolean        gst_byte_writer_ensure_free_space (GstByteWriter *writer, guint size);

extern
gboolean        gst_byte_writer_put_uint8         (GstByteWriter *writer, guint8 val);

extern
gboolean        gst_byte_writer_put_int8          (GstByteWriter *writer, gint8 val);

extern
gboolean        gst_byte_writer_put_uint16_be     (GstByteWriter *writer, guint16 val);

extern
gboolean        gst_byte_writer_put_uint16_le     (GstByteWriter *writer, guint16 val);

extern
gboolean        gst_byte_writer_put_int16_be      (GstByteWriter *writer, gint16 val);

extern
gboolean        gst_byte_writer_put_int16_le      (GstByteWriter *writer, gint16 val);

extern
gboolean        gst_byte_writer_put_uint24_be     (GstByteWriter *writer, guint32 val);

extern
gboolean        gst_byte_writer_put_uint24_le     (GstByteWriter *writer, guint32 val);

extern
gboolean        gst_byte_writer_put_int24_be      (GstByteWriter *writer, gint32 val);

extern
gboolean        gst_byte_writer_put_int24_le      (GstByteWriter *writer, gint32 val);

extern
gboolean        gst_byte_writer_put_uint32_be     (GstByteWriter *writer, guint32 val);

extern
gboolean        gst_byte_writer_put_uint32_le     (GstByteWriter *writer, guint32 val);

extern
gboolean        gst_byte_writer_put_int32_be      (GstByteWriter *writer, gint32 val);

extern
gboolean        gst_byte_writer_put_int32_le      (GstByteWriter *writer, gint32 val);

extern
gboolean        gst_byte_writer_put_uint64_be     (GstByteWriter *writer, guint64 val);

extern
gboolean        gst_byte_writer_put_uint64_le     (GstByteWriter *writer, guint64 val);

extern
gboolean        gst_byte_writer_put_int64_be      (GstByteWriter *writer, gint64 val);

extern
gboolean        gst_byte_writer_put_int64_le      (GstByteWriter *writer, gint64 val);

extern
gboolean        gst_byte_writer_put_float32_be    (GstByteWriter *writer, gfloat val);

extern
gboolean        gst_byte_writer_put_float32_le    (GstByteWriter *writer, gfloat val);

extern
gboolean        gst_byte_writer_put_float64_be    (GstByteWriter *writer, gdouble val);

extern
gboolean        gst_byte_writer_put_float64_le    (GstByteWriter *writer, gdouble val);

extern
gboolean        gst_byte_writer_put_data          (GstByteWriter *writer, const guint8 *data, guint size);

extern
gboolean        gst_byte_writer_fill              (GstByteWriter *writer, guint8 value, guint size);

extern
gboolean        gst_byte_writer_put_string_utf8   (GstByteWriter *writer, const gchar *data);

extern
gboolean        gst_byte_writer_put_string_utf16  (GstByteWriter *writer, const guint16 *data);

extern
gboolean        gst_byte_writer_put_string_utf32  (GstByteWriter *writer, const guint32 *data);
gboolean        gst_byte_writer_put_buffer        (GstByteWriter *writer, GstBuffer * buffer, gsize offset, gssize size);

/**
 * gst_byte_writer_put_string:
 * @writer: #GstByteWriter instance
 * @data: (in) (array zero-terminated=1): Null terminated string
 *
 * Write a NUL-terminated string to @writer (including the terminator). The
 * string is assumed to be in an 8-bit encoding (e.g. ASCII,UTF-8 or
 * ISO-8859-1).
 *
 * Returns: %TRUE if the string could be written
 */
#define gst_byte_writer_put_string(writer, data) \
  gst_byte_writer_put_string_utf8(writer, data)






#ifndef GST_BYTE_WRITER_DISABLE_INLINES

/* we use defines here so we can add the G_LIKELY() */

#define gst_byte_writer_ensure_free_space(writer, size) \
    G_LIKELY (_gst_byte_writer_ensure_free_space_inline (writer, size))
#define gst_byte_writer_put_uint8(writer, val) \
    G_LIKELY (_gst_byte_writer_put_uint8_inline (writer, val))
#define gst_byte_writer_put_int8(writer, val) \
    G_LIKELY (_gst_byte_writer_put_int8_inline (writer, val))
#define gst_byte_writer_put_uint16_be(writer, val) \
    G_LIKELY (_gst_byte_writer_put_uint16_be_inline (writer, val))
#define gst_byte_writer_put_uint16_le(writer, val) \
    G_LIKELY (_gst_byte_writer_put_uint16_le_inline (writer, val))
#define gst_byte_writer_put_int16_be(writer, val) \
    G_LIKELY (_gst_byte_writer_put_int16_be_inline (writer, val))
#define gst_byte_writer_put_int16_le(writer, val) \
    G_LIKELY (_gst_byte_writer_put_int16_le_inline (writer, val))
#define gst_byte_writer_put_uint24_be(writer, val) \
    G_LIKELY (_gst_byte_writer_put_uint24_be_inline (writer, val))
#define gst_byte_writer_put_uint24_le(writer, val) \
    G_LIKELY (_gst_byte_writer_put_uint24_le_inline (writer, val))
#define gst_byte_writer_put_int24_be(writer, val) \
    G_LIKELY (_gst_byte_writer_put_int24_be_inline (writer, val))
#define gst_byte_writer_put_int24_le(writer, val) \
    G_LIKELY (_gst_byte_writer_put_int24_le_inline (writer, val))
#define gst_byte_writer_put_uint32_be(writer, val) \
    G_LIKELY (_gst_byte_writer_put_uint32_be_inline (writer, val))
#define gst_byte_writer_put_uint32_le(writer, val) \
    G_LIKELY (_gst_byte_writer_put_uint32_le_inline (writer, val))
#define gst_byte_writer_put_int32_be(writer, val) \
    G_LIKELY (_gst_byte_writer_put_int32_be_inline (writer, val))
#define gst_byte_writer_put_int32_le(writer, val) \
    G_LIKELY (_gst_byte_writer_put_int32_le_inline (writer, val))
#define gst_byte_writer_put_uint64_be(writer, val) \
    G_LIKELY (_gst_byte_writer_put_uint64_be_inline (writer, val))
#define gst_byte_writer_put_uint64_le(writer, val) \
    G_LIKELY (_gst_byte_writer_put_uint64_le_inline (writer, val))
#define gst_byte_writer_put_int64_be(writer, val) \
    G_LIKELY (_gst_byte_writer_put_int64_be_inline (writer, val))
#define gst_byte_writer_put_int64_le(writer, val) \
    G_LIKELY (_gst_byte_writer_put_int64_le_inline (writer, val))

#define gst_byte_writer_put_float32_be(writer, val) \
    G_LIKELY (_gst_byte_writer_put_float32_be_inline (writer, val))
#define gst_byte_writer_put_float32_le(writer, val) \
    G_LIKELY (_gst_byte_writer_put_float32_le_inline (writer, val))
#define gst_byte_writer_put_float64_be(writer, val) \
    G_LIKELY (_gst_byte_writer_put_float64_be_inline (writer, val))
#define gst_byte_writer_put_float64_le(writer, val) \
    G_LIKELY (_gst_byte_writer_put_float64_le_inline (writer, val))

#define gst_byte_writer_put_data(writer, data, size) \
    G_LIKELY (_gst_byte_writer_put_data_inline (writer, data, size))
#define gst_byte_writer_fill(writer, val, size) \
    G_LIKELY (_gst_byte_writer_fill_inline (writer, val, size))
#define gst_byte_writer_put_buffer(writer, buffer, offset, size) \
    G_LIKELY (_gst_byte_writer_put_buffer_inline (writer, buffer, offset, size))

#endif



#endif /* __GST_BYTE_WRITER_H__ */
