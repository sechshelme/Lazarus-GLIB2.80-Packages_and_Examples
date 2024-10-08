/* GStreamer byte reader
 *
 * Copyright (C) 2008 Sebastian Dröge <sebastian.droege@collabora.co.uk>.
 * Copyright (C) 2009 Tim-Philipp Müller <tim centricular net>
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

#ifndef __GST_BYTE_READER_H__
#define __GST_BYTE_READER_H__

#include <gst/gst.h>
#include <gst/base/base-prelude.h>



#define GST_BYTE_READER(reader) ((GstByteReader *) (reader))

/**
 * GstByteReader:
 * @data: (array length=size): Data from which the bit reader will
 *   read
 * @size: Size of @data in bytes
 * @byte: Current byte position
 *
 * A byte reader instance.
 */
typedef struct {
  const guint8 *data;
  guint size;

  guint byte;  /* Byte position */

  /* < private > */
  gpointer _gst_reserved[GST_PADDING];
} GstByteReader;

extern
GstByteReader * gst_byte_reader_new             (const guint8 *data, guint size) ;

extern
void            gst_byte_reader_free            (GstByteReader *reader);

extern
void            gst_byte_reader_init            (GstByteReader *reader, const guint8 *data, guint size);

extern
gboolean        gst_byte_reader_peek_sub_reader (GstByteReader * reader,
                                                 GstByteReader * sub_reader,
                                                 guint           size);
extern
gboolean        gst_byte_reader_get_sub_reader  (GstByteReader * reader,
                                                 GstByteReader * sub_reader,
                                                 guint           size);
extern
gboolean        gst_byte_reader_set_pos         (GstByteReader *reader, guint pos);

extern
guint           gst_byte_reader_get_pos         (const GstByteReader *reader);

extern
guint           gst_byte_reader_get_remaining   (const GstByteReader *reader);

extern
guint           gst_byte_reader_get_size        (const GstByteReader *reader);

extern
gboolean        gst_byte_reader_skip            (GstByteReader *reader, guint nbytes);

extern
gboolean        gst_byte_reader_get_uint8       (GstByteReader *reader, guint8 *val);

extern
gboolean        gst_byte_reader_get_int8        (GstByteReader *reader, gint8 *val);

extern
gboolean        gst_byte_reader_get_uint16_le   (GstByteReader *reader, guint16 *val);

extern
gboolean        gst_byte_reader_get_int16_le    (GstByteReader *reader, gint16 *val);

extern
gboolean        gst_byte_reader_get_uint16_be   (GstByteReader *reader, guint16 *val);

extern
gboolean        gst_byte_reader_get_int16_be    (GstByteReader *reader, gint16 *val);

extern
gboolean        gst_byte_reader_get_uint24_le   (GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_get_int24_le    (GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_get_uint24_be   (GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_get_int24_be    (GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_get_uint32_le   (GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_get_int32_le    (GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_get_uint32_be   (GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_get_int32_be    (GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_get_uint64_le   (GstByteReader *reader, guint64 *val);

extern
gboolean        gst_byte_reader_get_int64_le    (GstByteReader *reader, gint64 *val);

extern
gboolean        gst_byte_reader_get_uint64_be   (GstByteReader *reader, guint64 *val);

extern
gboolean        gst_byte_reader_get_int64_be    (GstByteReader *reader, gint64 *val);

extern
gboolean        gst_byte_reader_peek_uint8      (const GstByteReader *reader, guint8 *val);

extern
gboolean        gst_byte_reader_peek_int8       (const GstByteReader *reader, gint8 *val);

extern
gboolean        gst_byte_reader_peek_uint16_le  (const GstByteReader *reader, guint16 *val);

extern
gboolean        gst_byte_reader_peek_int16_le   (const GstByteReader *reader, gint16 *val);

extern
gboolean        gst_byte_reader_peek_uint16_be  (const GstByteReader *reader, guint16 *val);

extern
gboolean        gst_byte_reader_peek_int16_be   (const GstByteReader *reader, gint16 *val);

extern
gboolean        gst_byte_reader_peek_uint24_le  (const GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_peek_int24_le   (const GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_peek_uint24_be  (const GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_peek_int24_be   (const GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_peek_uint32_le  (const GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_peek_int32_le   (const GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_peek_uint32_be  (const GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_peek_int32_be   (const GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_peek_uint64_le  (const GstByteReader *reader, guint64 *val);

extern
gboolean        gst_byte_reader_peek_int64_le   (const GstByteReader *reader, gint64 *val);

extern
gboolean        gst_byte_reader_peek_uint64_be  (const GstByteReader *reader, guint64 *val);

extern
gboolean        gst_byte_reader_peek_int64_be   (const GstByteReader *reader, gint64 *val);

extern
gboolean        gst_byte_reader_get_float32_le  (GstByteReader *reader, gfloat *val);

extern
gboolean        gst_byte_reader_get_float32_be  (GstByteReader *reader, gfloat *val);

extern
gboolean        gst_byte_reader_get_float64_le  (GstByteReader *reader, gdouble *val);

extern
gboolean        gst_byte_reader_get_float64_be  (GstByteReader *reader, gdouble *val);

extern
gboolean        gst_byte_reader_peek_float32_le (const GstByteReader *reader, gfloat *val);

extern
gboolean        gst_byte_reader_peek_float32_be (const GstByteReader *reader, gfloat *val);

extern
gboolean        gst_byte_reader_peek_float64_le (const GstByteReader *reader, gdouble *val);

extern
gboolean        gst_byte_reader_peek_float64_be (const GstByteReader *reader, gdouble *val);

extern
gboolean        gst_byte_reader_dup_data        (GstByteReader * reader, guint size, guint8       ** val);

extern
gboolean        gst_byte_reader_get_data        (GstByteReader * reader, guint size, const guint8 ** val);

extern
gboolean        gst_byte_reader_peek_data       (const GstByteReader * reader, guint size, const guint8 ** val);

#define gst_byte_reader_dup_string(reader,str) \
    gst_byte_reader_dup_string_utf8(reader,str)

extern
gboolean        gst_byte_reader_dup_string_utf8  (GstByteReader * reader, gchar   ** str);

extern
gboolean        gst_byte_reader_dup_string_utf16 (GstByteReader * reader, guint16 ** str);

extern
gboolean        gst_byte_reader_dup_string_utf32 (GstByteReader * reader, guint32 ** str);

#define gst_byte_reader_skip_string(reader) \
    gst_byte_reader_skip_string_utf8(reader)

extern
gboolean        gst_byte_reader_skip_string_utf8  (GstByteReader * reader);

extern
gboolean        gst_byte_reader_skip_string_utf16 (GstByteReader * reader);

extern
gboolean        gst_byte_reader_skip_string_utf32 (GstByteReader * reader);

#define gst_byte_reader_get_string(reader,str) \
    gst_byte_reader_get_string_utf8(reader,str)

#define gst_byte_reader_peek_string(reader,str) \
    gst_byte_reader_peek_string_utf8(reader,str)

extern
gboolean        gst_byte_reader_get_string_utf8    (GstByteReader * reader, const gchar ** str);

extern
gboolean        gst_byte_reader_peek_string_utf8   (const GstByteReader * reader, const gchar ** str);

extern
guint           gst_byte_reader_masked_scan_uint32 (const GstByteReader * reader,
                                                    guint32               mask,
                                                    guint32               pattern,
                                                    guint                 offset,
                                                    guint                 size);
extern
guint           gst_byte_reader_masked_scan_uint32_peek (const GstByteReader * reader,
                                                         guint32 mask,
                                                         guint32 pattern,
                                                         guint offset,
                                                         guint size,
                                                         guint32 * value);

/**
 * GST_BYTE_READER_INIT:
 * @data: Data from which the #GstByteReader should read
 * @size: Size of @data in bytes
 *
 * A #GstByteReader must be initialized with this macro, before it can be
 * used. This macro can used be to initialize a variable, but it cannot
 * be assigned to a variable. In that case you have to use
 * gst_byte_reader_init().
 */
//#define GST_BYTE_READER_INIT(data, size) {data, size, 0}

/* unchecked variants */
// xxxxxxxxxxxxxxxxxxxxxxxxx
//static inline void
//gst_byte_reader_skip_unchecked (GstByteReader * reader, guint nbytes)
//{
//  reader->byte += nbytes;
//}

/*
#define __GST_BYTE_READER_GET_PEEK_BITS_UNCHECKED(bits,type,lower,upper,adj) \
\
static inline type \
gst_byte_reader_peek_##lower##_unchecked (const GstByteReader * reader) \
{ \
  type val = (type) GST_READ_##upper (reader->data + reader->byte); \
  adj \
  return val; \
} \
\
static inline type \
gst_byte_reader_get_##lower##_unchecked (GstByteReader * reader) \
{ \
  type val = gst_byte_reader_peek_##lower##_unchecked (reader); \
  reader->byte += bits / 8; \
  return val; \
}
*/



#undef __GET_PEEK_BITS_UNCHECKED
/*
static inline const guint8 *
gst_byte_reader_peek_data_unchecked (const GstByteReader * reader)
{
  return (const guint8 *) (reader->data + reader->byte);
}

static inline const guint8 *
gst_byte_reader_get_data_unchecked (GstByteReader * reader, guint size)
{
  const guint8 *data;

  data = gst_byte_reader_peek_data_unchecked (reader);
  gst_byte_reader_skip_unchecked (reader, size);
  return data;
}

static inline guint8 *
gst_byte_reader_dup_data_unchecked (GstByteReader * reader, guint size)
{
  gconstpointer data = gst_byte_reader_get_data_unchecked (reader, size);
  guint8 *dup_data = (guint8 *) g_malloc (size);

  memcpy (dup_data, data, size);
  return dup_data;
}


static inline guint
_gst_byte_reader_get_pos_unchecked (const GstByteReader * reader)
{
  return reader->byte;
}

static inline guint
_gst_byte_reader_get_remaining_unchecked (const GstByteReader * reader)
{
  return reader->size - reader->byte;
}

static inline guint
_gst_byte_reader_get_size_unchecked (const GstByteReader * reader)
{
  return reader->size;
}

static inline guint
_gst_byte_reader_get_remaining_inline (const GstByteReader * reader)
{
  g_return_val_if_fail (reader != NULL, 0);

  return _gst_byte_reader_get_remaining_unchecked (reader);
}

static inline guint
_gst_byte_reader_get_size_inline (const GstByteReader * reader)
{
  g_return_val_if_fail (reader != NULL, 0);

  return _gst_byte_reader_get_size_unchecked (reader);
}

#define __GST_BYTE_READER_GET_PEEK_BITS_INLINE(bits,type,name) \
\
static inline gboolean \
_gst_byte_reader_peek_##name##_inline (const GstByteReader * reader, type * val) \
{ \
  g_return_val_if_fail (reader != NULL, FALSE); \
  g_return_val_if_fail (val != NULL, FALSE); \
  \
  if (_gst_byte_reader_get_remaining_unchecked (reader) < (bits / 8)) \
    return FALSE; \
\
  *val = gst_byte_reader_peek_##name##_unchecked (reader); \
  return TRUE; \
} \
\
static inline gboolean \
_gst_byte_reader_get_##name##_inline (GstByteReader * reader, type * val) \
{ \
  g_return_val_if_fail (reader != NULL, FALSE); \
  g_return_val_if_fail (val != NULL, FALSE); \
  \
  if (_gst_byte_reader_get_remaining_unchecked (reader) < (bits / 8)) \
    return FALSE; \
\
  *val = gst_byte_reader_get_##name##_unchecked (reader); \
  return TRUE; \
}
 */


#undef __GST_BYTE_READER_GET_PEEK_BITS_INLINE

#ifndef GST_BYTE_READER_DISABLE_INLINES

#define gst_byte_reader_init(reader,data,size) \
    _gst_byte_reader_init_inline(reader,data,size)

#define gst_byte_reader_get_remaining(reader) \
    _gst_byte_reader_get_remaining_inline(reader)

#define gst_byte_reader_get_size(reader) \
    _gst_byte_reader_get_size_inline(reader)

#define gst_byte_reader_get_pos(reader) \
    _gst_byte_reader_get_pos_inline(reader)

/* we use defines here so we can add the G_LIKELY() */
#define gst_byte_reader_get_uint8(reader,val) \
    G_LIKELY(_gst_byte_reader_get_uint8_inline(reader,val))
#define gst_byte_reader_get_int8(reader,val) \
    G_LIKELY(_gst_byte_reader_get_int8_inline(reader,val))
#define gst_byte_reader_get_uint16_le(reader,val) \
    G_LIKELY(_gst_byte_reader_get_uint16_le_inline(reader,val))
#define gst_byte_reader_get_int16_le(reader,val) \
    G_LIKELY(_gst_byte_reader_get_int16_le_inline(reader,val))
#define gst_byte_reader_get_uint16_be(reader,val) \
    G_LIKELY(_gst_byte_reader_get_uint16_be_inline(reader,val))
#define gst_byte_reader_get_int16_be(reader,val) \
    G_LIKELY(_gst_byte_reader_get_int16_be_inline(reader,val))
#define gst_byte_reader_get_uint24_le(reader,val) \
    G_LIKELY(_gst_byte_reader_get_uint24_le_inline(reader,val))
#define gst_byte_reader_get_int24_le(reader,val) \
    G_LIKELY(_gst_byte_reader_get_int24_le_inline(reader,val))
#define gst_byte_reader_get_uint24_be(reader,val) \
    G_LIKELY(_gst_byte_reader_get_uint24_be_inline(reader,val))
#define gst_byte_reader_get_int24_be(reader,val) \
    G_LIKELY(_gst_byte_reader_get_int24_be_inline(reader,val))
#define gst_byte_reader_get_uint32_le(reader,val) \
    G_LIKELY(_gst_byte_reader_get_uint32_le_inline(reader,val))
#define gst_byte_reader_get_int32_le(reader,val) \
    G_LIKELY(_gst_byte_reader_get_int32_le_inline(reader,val))
#define gst_byte_reader_get_uint32_be(reader,val) \
    G_LIKELY(_gst_byte_reader_get_uint32_be_inline(reader,val))
#define gst_byte_reader_get_int32_be(reader,val) \
    G_LIKELY(_gst_byte_reader_get_int32_be_inline(reader,val))
#define gst_byte_reader_get_uint64_le(reader,val) \
    G_LIKELY(_gst_byte_reader_get_uint64_le_inline(reader,val))
#define gst_byte_reader_get_int64_le(reader,val) \
    G_LIKELY(_gst_byte_reader_get_int64_le_inline(reader,val))
#define gst_byte_reader_get_uint64_be(reader,val) \
    G_LIKELY(_gst_byte_reader_get_uint64_be_inline(reader,val))
#define gst_byte_reader_get_int64_be(reader,val) \
    G_LIKELY(_gst_byte_reader_get_int64_be_inline(reader,val))

#define gst_byte_reader_peek_uint8(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_uint8_inline(reader,val))
#define gst_byte_reader_peek_int8(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_int8_inline(reader,val))
#define gst_byte_reader_peek_uint16_le(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_uint16_le_inline(reader,val))
#define gst_byte_reader_peek_int16_le(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_int16_le_inline(reader,val))
#define gst_byte_reader_peek_uint16_be(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_uint16_be_inline(reader,val))
#define gst_byte_reader_peek_int16_be(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_int16_be_inline(reader,val))
#define gst_byte_reader_peek_uint24_le(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_uint24_le_inline(reader,val))
#define gst_byte_reader_peek_int24_le(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_int24_le_inline(reader,val))
#define gst_byte_reader_peek_uint24_be(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_uint24_be_inline(reader,val))
#define gst_byte_reader_peek_int24_be(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_int24_be_inline(reader,val))
#define gst_byte_reader_peek_uint32_le(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_uint32_le_inline(reader,val))
#define gst_byte_reader_peek_int32_le(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_int32_le_inline(reader,val))
#define gst_byte_reader_peek_uint32_be(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_uint32_be_inline(reader,val))
#define gst_byte_reader_peek_int32_be(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_int32_be_inline(reader,val))
#define gst_byte_reader_peek_uint64_le(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_uint64_le_inline(reader,val))
#define gst_byte_reader_peek_int64_le(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_int64_le_inline(reader,val))
#define gst_byte_reader_peek_uint64_be(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_uint64_be_inline(reader,val))
#define gst_byte_reader_peek_int64_be(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_int64_be_inline(reader,val))

#define gst_byte_reader_get_float32_le(reader,val) \
    G_LIKELY(_gst_byte_reader_get_float32_le_inline(reader,val))
#define gst_byte_reader_get_float32_be(reader,val) \
    G_LIKELY(_gst_byte_reader_get_float32_be_inline(reader,val))
#define gst_byte_reader_get_float64_le(reader,val) \
    G_LIKELY(_gst_byte_reader_get_float64_le_inline(reader,val))
#define gst_byte_reader_get_float64_be(reader,val) \
    G_LIKELY(_gst_byte_reader_get_float64_be_inline(reader,val))
#define gst_byte_reader_peek_float32_le(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_float32_le_inline(reader,val))
#define gst_byte_reader_peek_float32_be(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_float32_be_inline(reader,val))
#define gst_byte_reader_peek_float64_le(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_float64_le_inline(reader,val))
#define gst_byte_reader_peek_float64_be(reader,val) \
    G_LIKELY(_gst_byte_reader_peek_float64_be_inline(reader,val))

#endif /* GST_BYTE_READER_DISABLE_INLINES */

/*
static inline void
_gst_byte_reader_init_inline (GstByteReader * reader, const guint8 * data, guint size)
{
  g_return_if_fail (reader != NULL);

  reader->data = data;
  reader->size = size;
  reader->byte = 0;
}

static inline gboolean
_gst_byte_reader_peek_sub_reader_inline (GstByteReader * reader,
    GstByteReader * sub_reader, guint size)
{
  g_return_val_if_fail (reader != NULL, FALSE);
  g_return_val_if_fail (sub_reader != NULL, FALSE);

  if (_gst_byte_reader_get_remaining_unchecked (reader) < size)
    return FALSE;

  sub_reader->data = reader->data + reader->byte;
  sub_reader->byte = 0;
  sub_reader->size = size;
  return TRUE;
}

static inline gboolean
_gst_byte_reader_get_sub_reader_inline (GstByteReader * reader,
    GstByteReader * sub_reader, guint size)
{
  if (!_gst_byte_reader_peek_sub_reader_inline (reader, sub_reader, size))
    return FALSE;
  gst_byte_reader_skip_unchecked (reader, size);
  return TRUE;
}

static inline gboolean
_gst_byte_reader_dup_data_inline (GstByteReader * reader, guint size, guint8 ** val)
{
  g_return_val_if_fail (reader != NULL, FALSE);
  g_return_val_if_fail (val != NULL, FALSE);

  if (G_UNLIKELY (size > reader->size || _gst_byte_reader_get_remaining_unchecked (reader) < size))
    return FALSE;

  *val = gst_byte_reader_dup_data_unchecked (reader, size);
  return TRUE;
}

static inline gboolean
_gst_byte_reader_get_data_inline (GstByteReader * reader, guint size, const guint8 ** val)
{
  g_return_val_if_fail (reader != NULL, FALSE);
  g_return_val_if_fail (val != NULL, FALSE);

  if (G_UNLIKELY (size > reader->size || _gst_byte_reader_get_remaining_unchecked (reader) < size))
    return FALSE;

  *val = gst_byte_reader_get_data_unchecked (reader, size);
  return TRUE;
}

static inline gboolean
_gst_byte_reader_peek_data_inline (const GstByteReader * reader, guint size, const guint8 ** val)
{
  g_return_val_if_fail (reader != NULL, FALSE);
  g_return_val_if_fail (val != NULL, FALSE);

  if (G_UNLIKELY (size > reader->size || _gst_byte_reader_get_remaining_unchecked (reader) < size))
    return FALSE;

  *val = gst_byte_reader_peek_data_unchecked (reader);
  return TRUE;
}

static inline guint
_gst_byte_reader_get_pos_inline (const GstByteReader * reader)
{
  g_return_val_if_fail (reader != NULL, 0);

  return _gst_byte_reader_get_pos_unchecked (reader);
}

static inline gboolean
_gst_byte_reader_skip_inline (GstByteReader * reader, guint nbytes)
{
  g_return_val_if_fail (reader != NULL, FALSE);

  if (G_UNLIKELY (_gst_byte_reader_get_remaining_unchecked (reader) < nbytes))
    return FALSE;

  reader->byte += nbytes;
  return TRUE;
}
*/

#ifndef GST_BYTE_READER_DISABLE_INLINES

#define gst_byte_reader_dup_data(reader,size,val) \
    G_LIKELY(_gst_byte_reader_dup_data_inline(reader,size,val))
#define gst_byte_reader_get_data(reader,size,val) \
    G_LIKELY(_gst_byte_reader_get_data_inline(reader,size,val))
#define gst_byte_reader_peek_data(reader,size,val) \
    G_LIKELY(_gst_byte_reader_peek_data_inline(reader,size,val))
#define gst_byte_reader_skip(reader,nbytes) \
    G_LIKELY(_gst_byte_reader_skip_inline(reader,nbytes))

#endif /* GST_BYTE_READER_DISABLE_INLINES */



#endif /* __GST_BYTE_READER_H__ */
