/* GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *                    2002 Thomas Vander Stichele <thomas@apestaart.org>
 *
 * gstutils.h: Header for various utility functions
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


#ifndef __GST_UTILS_H__
#define __GST_UTILS_H__

#include <glib.h>
#include <gst/gstconfig.h>
#include <gst/gstbin.h>
#include <gst/gstparse.h>



extern
void            gst_util_set_value_from_string  (GValue *value, const gchar *value_str);

extern
void            gst_util_set_object_arg         (GObject *object, const gchar *name, const gchar *value);

extern
gboolean        gst_util_set_object_array       (GObject * object, const gchar * name,
                                                 const GValueArray * array);
extern
gboolean        gst_util_get_object_array       (GObject * object, const gchar * name,
                                                 GValueArray ** array);
extern
void            gst_util_dump_mem               (const guchar *mem, guint size);

extern
void            gst_util_dump_buffer            (GstBuffer * buf);

extern
guint64         gst_util_gdouble_to_guint64     (gdouble value)  ;

extern
gdouble         gst_util_guint64_to_gdouble     (guint64 value)  ;

/**
 * gst_guint64_to_gdouble:
 * @value: the #guint64 value to convert
 *
 * Convert @value to a gdouble.
 *
 * Returns: @value converted to a #gdouble.
 */

/**
 * gst_gdouble_to_guint64:
 * @value: the #gdouble value to convert
 *
 * Convert @value to a guint64.
 *
 * Returns: @value converted to a #guint64.
 */
#ifdef WIN32
#define         gst_gdouble_to_guint64(value)   gst_util_gdouble_to_guint64(value)
#define         gst_guint64_to_gdouble(value)   gst_util_guint64_to_gdouble(value)
#else
#define         gst_gdouble_to_guint64(value)   ((guint64) (value))
#define         gst_guint64_to_gdouble(value)   ((gdouble) (value))
#endif

extern
guint64         gst_util_uint64_scale           (guint64 val, guint64 num, guint64 denom);

extern
guint64         gst_util_uint64_scale_round     (guint64 val, guint64 num, guint64 denom);

extern
guint64         gst_util_uint64_scale_ceil      (guint64 val, guint64 num, guint64 denom);

extern
guint64         gst_util_uint64_scale_int       (guint64 val, gint num, gint denom);

extern
guint64         gst_util_uint64_scale_int_round (guint64 val, gint num, gint denom);

extern
guint64         gst_util_uint64_scale_int_ceil  (guint64 val, gint num, gint denom);

/**
 * GST_SEQNUM_INVALID:
 *
 * A value which is guaranteed to never be returned by
 * gst_util_seqnum_next().
 *
 * Can be used as a default value in variables used to store seqnum.
 *
 * Since: 1.14
 */
#define GST_SEQNUM_INVALID (0)

extern
guint32         gst_util_seqnum_next            (void);

extern
gint32          gst_util_seqnum_compare         (guint32 s1, guint32 s2);

/**
 * GST_GROUP_ID_INVALID:
 *
 * A value which is guaranteed to never be returned by
 * gst_util_group_id_next().
 *
 * Can be used as a default value in variables used to store group_id.
 *
 * Since: 1.14
 */
#define GST_GROUP_ID_INVALID (0)

extern
guint           gst_util_group_id_next          (void);

/**
 * GST_CALL_PARENT:
 * @parent_class_cast: the name of the class cast macro for the parent type
 * @name: name of the function to call
 * @args: arguments enclosed in '( )'
 *
 * Just call the parent handler.  This assumes that there is a variable
 * named parent_class that points to the (duh!) parent class.  Note that
 * this macro is not to be used with things that return something, use
 * the _WITH_DEFAULT version for that
 */

/**
 * GST_READ_UINT32_BE:
 * @data: memory location
 *
 * Read a 32 bit unsigned integer value in big endian format from the memory buffer.
 */

/**
 * GST_READ_UINT32_LE:
 * @data: memory location
 *
 * Read a 32 bit unsigned integer value in little endian format from the memory buffer.
 */

/**
 * GST_READ_UINT24_BE:
 * @data: memory location
 *
 * Read a 24 bit unsigned integer value in big endian format from the memory buffer.
 */

/**
 * GST_READ_UINT24_LE:
 * @data: memory location
 *
 * Read a 24 bit unsigned integer value in little endian format from the memory buffer.
 */

/**
 * GST_READ_UINT16_BE:
 * @data: memory location
 *
 * Read a 16 bit unsigned integer value in big endian format from the memory buffer.
 */
/**
 * GST_READ_UINT16_LE:
 * @data: memory location
 *
 * Read a 16 bit unsigned integer value in little endian format from the memory buffer.
 */


/**
 * GST_READ_UINT8:
 * @data: memory location
 *
 * Read an 8 bit unsigned integer value from the memory buffer.
 */
#define GST_READ_UINT8(data)            (_GST_GET (data, 0,  8,  0))

/**
 * GST_WRITE_UINT64_BE:
 * @data: memory location
 * @val: value to store
 *
 * Store a 64 bit unsigned integer value in big endian format into the memory buffer.
 */
/**
 * GST_WRITE_UINT64_LE:
 * @data: memory location
 * @val: value to store
 *
 * Store a 64 bit unsigned integer value in little endian format into the memory buffer.
 */
#if GST_HAVE_UNALIGNED_ACCESS
# if (G_BYTE_ORDER == G_BIG_ENDIAN)
#  define GST_WRITE_UINT64_BE(data,val) _GST_FAST_WRITE(64,data,val)
#  define GST_WRITE_UINT64_LE(data,val) _GST_FAST_WRITE_SWAP(64,data,val)
# else
#  define GST_WRITE_UINT64_BE(data,val) _GST_FAST_WRITE_SWAP(64,data,val)
#  define GST_WRITE_UINT64_LE(data,val) _GST_FAST_WRITE(64,data,val)
# endif
#else
#endif /* !GST_HAVE_UNALIGNED_ACCESS */

/**
 * GST_WRITE_UINT32_BE:
 * @data: memory location
 * @val: value to store
 *
 * Store a 32 bit unsigned integer value in big endian format into the memory buffer.
 */
/**
 * GST_WRITE_UINT32_LE:
 * @data: memory location
 * @val: value to store
 *
 * Store a 32 bit unsigned integer value in little endian format into the memory buffer.
 */
#if GST_HAVE_UNALIGNED_ACCESS
# if (G_BYTE_ORDER == G_BIG_ENDIAN)
#  define GST_WRITE_UINT32_BE(data,val) _GST_FAST_WRITE(32,data,val)
#  define GST_WRITE_UINT32_LE(data,val) _GST_FAST_WRITE_SWAP(32,data,val)
# else
#  define GST_WRITE_UINT32_BE(data,val) _GST_FAST_WRITE_SWAP(32,data,val)
#  define GST_WRITE_UINT32_LE(data,val) _GST_FAST_WRITE(32,data,val)
# endif
#else
#endif /* !GST_HAVE_UNALIGNED_ACCESS */

/**
 * GST_WRITE_UINT24_BE:
 * @data: memory location
 * @num: value to store
 *
 * Store a 24 bit unsigned integer value in big endian format into the memory buffer.
 */

/**
 * GST_WRITE_UINT16_BE:
 * @data: memory location
 * @val: value to store
 *
 * Store a 16 bit unsigned integer value in big endian format into the memory buffer.
 */
/**
 * GST_WRITE_UINT16_LE:
 * @data: memory location
 * @val: value to store
 *
 * Store a 16 bit unsigned integer value in little endian format into the memory buffer.
 */

/**
 * GST_WRITE_UINT8:
 * @data: memory location
 * @num: value to store
 *
 * Store an 8 bit unsigned integer value into the memory buffer.
/**
 * GFLOAT_SWAP_LE_BE: (skip)
 * @in: input value
 *
 * Swap byte order of a 32-bit floating point value (float).
 *
 * Returns: @in byte-swapped.
 */

/**
 * GDOUBLE_TO_LE: (skip)
 * @val: value
 *
 * Convert 64-bit floating point value (double) from native byte order into
 * little endian byte order.
 */
/**
 * GDOUBLE_TO_BE: (skip)
 * @val: value
 *
 * Convert 64-bit floating point value (double) from native byte order into
 * big endian byte order.
 */
/**
 * GDOUBLE_FROM_LE: (skip)
 * @val: value
 *
 * Convert 64-bit floating point value (double) from little endian byte order
 * into native byte order.
 */
/**
 * GDOUBLE_FROM_BE: (skip)
 * @val: value
 *
 * Convert 64-bit floating point value (double) from big endian byte order
 * into native byte order.
 */

/**
 * GFLOAT_TO_LE: (skip)
 * @val: value
 *
 * Convert 32-bit floating point value (float) from native byte order into
 * little endian byte order.
 */
/**
 * GFLOAT_TO_BE: (skip)
 * @val: value
 *
 * Convert 32-bit floating point value (float) from native byte order into
 * big endian byte order.
 */
/**
 * GFLOAT_FROM_LE: (skip)
 * @val: value
 *
 * Convert 32-bit floating point value (float) from little endian byte order
 * into native byte order.
 */
/**
 * GFLOAT_FROM_BE: (skip)
 * @val: value
 *
 * Convert 32-bit floating point value (float) from big endian byte order
 * into native byte order.
 */

#if G_BYTE_ORDER == G_LITTLE_ENDIAN
#define GFLOAT_TO_LE(val)    ((gfloat) (val))
#define GFLOAT_TO_BE(val)    (GFLOAT_SWAP_LE_BE (val))
#define GDOUBLE_TO_LE(val)   ((gdouble) (val))
#define GDOUBLE_TO_BE(val)   (GDOUBLE_SWAP_LE_BE (val))

#elif G_BYTE_ORDER == G_BIG_ENDIAN
#define GFLOAT_TO_LE(val)    (GFLOAT_SWAP_LE_BE (val))
#define GFLOAT_TO_BE(val)    ((gfloat) (val))
#define GDOUBLE_TO_LE(val)   (GDOUBLE_SWAP_LE_BE (val))
#define GDOUBLE_TO_BE(val)   ((gdouble) (val))

#else /* !G_LITTLE_ENDIAN && !G_BIG_ENDIAN */
#error unknown ENDIAN type
#endif /* !G_LITTLE_ENDIAN && !G_BIG_ENDIAN */

#define GFLOAT_FROM_LE(val)  (GFLOAT_TO_LE (val))
#define GFLOAT_FROM_BE(val)  (GFLOAT_TO_BE (val))
#define GDOUBLE_FROM_LE(val) (GDOUBLE_TO_LE (val))
#define GDOUBLE_FROM_BE(val) (GDOUBLE_TO_BE (val))

#endif /* !defined(GFLOAT_FROM_LE) */

#endif /* !__GI_SCANNER__ */

/**
 * GST_READ_FLOAT_LE:
 * @data: memory location
 *
 * Read a 32 bit float value in little endian format from the memory buffer.
 *
 * Returns: The floating point value read from @data
 */


/* Miscellaneous utility macros */

/**
 * GST_ROUND_UP_2:
 * @num: integer value to round up
 *
 * Rounds an integer value up to the next multiple of 2.
 */
#define GST_ROUND_UP_2(num)  (((num)+1)&~1)
/**
 * GST_ROUND_UP_4:
 * @num: integer value to round up
 *
 * Rounds an integer value up to the next multiple of 4.
 */
#define GST_ROUND_UP_4(num)  (((num)+3)&~3)
/**
 * GST_ROUND_UP_8:
 * @num: integer value to round up
 *
 * Rounds an integer value up to the next multiple of 8.
 */
#define GST_ROUND_UP_8(num)  (((num)+7)&~7)
/**
 * GST_ROUND_UP_16:
 * @num: integer value to round up
 *
 * Rounds an integer value up to the next multiple of 16.
 */
#define GST_ROUND_UP_16(num) (((num)+15)&~15)
/**
 * GST_ROUND_UP_32:
 * @num: integer value to round up
 *
 * Rounds an integer value up to the next multiple of 32.
 */
#define GST_ROUND_UP_32(num) (((num)+31)&~31)
/**
 * GST_ROUND_UP_64:
 * @num: integer value to round up
 *
 * Rounds an integer value up to the next multiple of 64.
 */
#define GST_ROUND_UP_64(num) (((num)+63)&~63)
/**
 * GST_ROUND_UP_128:
 * @num: integer value to round up
 *
 * Rounds an integer value up to the next multiple of 128.
 * Since: 1.4
 */
#define GST_ROUND_UP_128(num) (((num)+127)&~127)
/**
 * GST_ROUND_UP_N:
 * @num: integrer value to round up
 * @align: a power of two to round up to
 *
 * Rounds an integer value up to the next multiple of @align. @align MUST be a
 * power of two.
 */
#define GST_ROUND_UP_N(num,align) ((((num) + ((align) - 1)) & ~((align) - 1)))


/**
 * GST_ROUND_DOWN_2:
 * @num: integer value to round down
 *
 * Rounds an integer value down to the next multiple of 2.
 */
#define GST_ROUND_DOWN_2(num)  ((num)&(~1))
/**
 * GST_ROUND_DOWN_4:
 * @num: integer value to round down
 *
 * Rounds an integer value down to the next multiple of 4.
 */
#define GST_ROUND_DOWN_4(num)  ((num)&(~3))
/**
 * GST_ROUND_DOWN_8:
 * @num: integer value to round down
 *
 * Rounds an integer value down to the next multiple of 8.
 */
#define GST_ROUND_DOWN_8(num)  ((num)&(~7))
/**
 * GST_ROUND_DOWN_16:
 * @num: integer value to round down
 *
 * Rounds an integer value down to the next multiple of 16.
 */
#define GST_ROUND_DOWN_16(num) ((num)&(~15))
/**
 * GST_ROUND_DOWN_32:
 * @num: integer value to round down
 *
 * Rounds an integer value down to the next multiple of 32.
 */
#define GST_ROUND_DOWN_32(num) ((num)&(~31))
/**
 * GST_ROUND_DOWN_64:
 * @num: integer value to round down
 *
 * Rounds an integer value down to the next multiple of 64.
 */
#define GST_ROUND_DOWN_64(num) ((num)&(~63))
/**
 * GST_ROUND_DOWN_128:
 * @num: integer value to round down
 *
 * Rounds an integer value down to the next multiple of 128.
 * Since: 1.4
 */
#define GST_ROUND_DOWN_128(num) ((num)&(~127))
/**
 * GST_ROUND_DOWN_N:
 * @num: integrer value to round down
 * @align: a power of two to round down to
 *
 * Rounds an integer value down to the next multiple of @align. @align MUST be a
 * power of two.
 */
#define GST_ROUND_DOWN_N(num,align) (((num) & ~((align) - 1)))


extern
void                    gst_object_default_error        (GstObject    * source,
                                                         const GError * error,
                                                         const gchar  * debug);

/* element functions */

extern
void                    gst_element_create_all_pads     (GstElement *element);

extern
GstPad*                 gst_element_get_compatible_pad  (GstElement *element, GstPad *pad,
                                                         GstCaps *caps);
extern
GstPadTemplate*         gst_element_get_compatible_pad_template (GstElement *element, GstPadTemplate *compattempl);

extern
const gchar*            gst_element_state_get_name      (GstState state);

extern
const gchar *           gst_element_state_change_return_get_name (GstStateChangeReturn state_ret);

extern
const gchar *           gst_state_change_get_name       (GstStateChange transition);

extern
gboolean                gst_element_link                (GstElement *src, GstElement *dest);

extern
gboolean                gst_element_link_many           (GstElement *element_1,
                                                         GstElement *element_2, ...) ;
extern
gboolean                gst_element_link_filtered       (GstElement * src,
                                                         GstElement * dest,
                                                         GstCaps *filter);
extern
void                    gst_element_unlink              (GstElement *src, GstElement *dest);

extern
void                    gst_element_unlink_many         (GstElement *element_1,
                                                         GstElement *element_2, ...) ;
extern
gboolean                gst_element_link_pads           (GstElement *src, const gchar *srcpadname,
                                                         GstElement *dest, const gchar *destpadname);
extern
gboolean                gst_element_link_pads_full      (GstElement *src, const gchar *srcpadname,
                                                         GstElement *dest, const gchar *destpadname,
                                                         GstPadLinkCheck flags);
extern
void                    gst_element_unlink_pads         (GstElement *src, const gchar *srcpadname,
                                                         GstElement *dest, const gchar *destpadname);
extern
gboolean                gst_element_link_pads_filtered  (GstElement * src, const gchar * srcpadname,
                                                         GstElement * dest, const gchar * destpadname,
                                                         GstCaps *filter);
extern
gboolean                gst_element_seek_simple         (GstElement   *element,
                                                         GstFormat     format,
                                                         GstSeekFlags  seek_flags,
                                                         gint64        seek_pos);

extern
gchar *                 gst_element_decorate_stream_id  (GstElement   *element,
                                                         const gchar  *stream_id);
extern
gchar *   gst_element_decorate_stream_id_printf_valist  (GstElement * element,
                                                         const gchar * format,
                                                         va_list var_args) ;
extern
gchar *          gst_element_decorate_stream_id_printf  (GstElement * element,
                                                         const gchar * format,
                                                         ...)  ;
/* util elementfactory functions */

extern
gboolean gst_element_factory_can_sink_all_caps (GstElementFactory *factory, const GstCaps *caps);

extern
gboolean gst_element_factory_can_src_all_caps  (GstElementFactory *factory, const GstCaps *caps);

extern
gboolean gst_element_factory_can_sink_any_caps (GstElementFactory *factory, const GstCaps *caps);

extern
gboolean gst_element_factory_can_src_any_caps  (GstElementFactory *factory, const GstCaps *caps);

/* util query functions */

extern
gboolean                gst_element_query_position      (GstElement *element, GstFormat format, gint64 *cur);

extern
gboolean                gst_element_query_duration      (GstElement *element, GstFormat format, gint64 *duration);

extern
gboolean                gst_element_query_convert       (GstElement *element, GstFormat src_format, gint64 src_val,
                                                         GstFormat dest_format, gint64 *dest_val);

/* pad functions */

extern
void                    gst_pad_use_fixed_caps          (GstPad *pad);

extern
GstElement*             gst_pad_get_parent_element      (GstPad *pad);

/* util query functions */

extern
gboolean                gst_pad_proxy_query_accept_caps (GstPad *pad, GstQuery *query);

extern
gboolean                gst_pad_proxy_query_caps        (GstPad *pad, GstQuery *query);

extern
gboolean                gst_pad_query_position          (GstPad *pad, GstFormat format, gint64 *cur);

extern
gboolean                gst_pad_query_duration          (GstPad *pad, GstFormat format, gint64 *duration);

extern
gboolean                gst_pad_query_convert           (GstPad *pad, GstFormat src_format, gint64 src_val,
                                                         GstFormat dest_format, gint64 *dest_val);
extern
GstCaps *               gst_pad_query_caps              (GstPad *pad, GstCaps *filter);

extern
gboolean                gst_pad_query_accept_caps       (GstPad *pad, GstCaps *caps);

extern
gboolean                gst_pad_link_maybe_ghosting      (GstPad            *src,
                                                          GstPad            *sink);
extern
gboolean                gst_pad_link_maybe_ghosting_full (GstPad            *src,
                                                          GstPad            *sink,
                                                          GstPadLinkCheck   flags);
extern
gboolean                gst_pad_peer_query_position     (GstPad *pad, GstFormat format, gint64 *cur);

extern
gboolean                gst_pad_peer_query_duration     (GstPad *pad, GstFormat format, gint64 *duration);

extern
gboolean                gst_pad_peer_query_convert      (GstPad *pad, GstFormat src_format, gint64 src_val,
                                                         GstFormat dest_format, gint64 *dest_val);
extern
GstCaps *               gst_pad_peer_query_caps         (GstPad * pad, GstCaps *filter);

extern
gboolean                gst_pad_peer_query_accept_caps  (GstPad * pad, GstCaps *caps);

extern
gchar *                 gst_pad_create_stream_id               (GstPad * pad, GstElement * parent, const gchar *stream_id) ;

extern
gchar *                 gst_pad_create_stream_id_printf        (GstPad * pad, GstElement * parent, const gchar *stream_id, ...) ;

extern
gchar *                 gst_pad_create_stream_id_printf_valist (GstPad * pad, GstElement * parent, const gchar *stream_id, va_list var_args)  ;

extern
gchar *                 gst_pad_get_stream_id           (GstPad * pad);

extern
GstStream *             gst_pad_get_stream              (GstPad * pad);

/* bin functions */

extern
void                    gst_bin_add_many                (GstBin *bin, GstElement *element_1, ...) ;

extern
void                    gst_bin_remove_many             (GstBin *bin, GstElement *element_1, ...) ;

extern
GstPad *                gst_bin_find_unlinked_pad       (GstBin *bin, GstPadDirection direction);

extern
gboolean                gst_bin_sync_children_states    (GstBin *bin);

/* parse utility functions */

extern
GstElement *            gst_parse_bin_from_description      (const gchar     * bin_description,
                                                             gboolean          ghost_unlinked_pads,
                                                             GError         ** err);
extern
GstElement *            gst_parse_bin_from_description_full (const gchar     * bin_description,
                                                             gboolean          ghost_unlinked_pads,
                                                             GstParseContext * context,
                                                             GstParseFlags     flags,
                                                             GError         ** err);
extern
GstClockTime            gst_util_get_timestamp          (void);

/**
 * GstSearchMode:
 * @GST_SEARCH_MODE_EXACT : Only search for exact matches.
 * @GST_SEARCH_MODE_BEFORE: Search for an exact match or the element just before.
 * @GST_SEARCH_MODE_AFTER : Search for an exact match or the element just after.
 *
 * The different search modes.
 */
typedef enum {
  GST_SEARCH_MODE_EXACT = 0,
  GST_SEARCH_MODE_BEFORE,
  GST_SEARCH_MODE_AFTER
} GstSearchMode;

/**
 * GstPluginAPIFlags:
 * @GST_PLUGIN_API_FLAG_IGNORE_ENUM_MEMBERS: Ignore enum members when generating
 *   the plugins cache. This is useful if the members of the enum are generated
 *   dynamically, in order not to expose incorrect documentation to the end user.
 *
 * Since: 1.18
 */
typedef enum {
  GST_PLUGIN_API_FLAG_IGNORE_ENUM_MEMBERS = (1 << 0),
} GstPluginAPIFlags;

extern
gpointer      gst_util_array_binary_search      (gpointer array, guint num_elements,
                                                 gsize element_size, GCompareDataFunc search_func,
                                                 GstSearchMode mode, gconstpointer search_data,
                                                 gpointer user_data);

/* fraction operations */

extern
gint          gst_util_greatest_common_divisor  (gint a, gint b);

extern
gint64        gst_util_greatest_common_divisor_int64 (gint64 a, gint64 b);

extern
void          gst_util_simplify_fraction        (gint *numerator, gint *denominator,
                                                 guint n_terms, guint threshold);

extern
void          gst_util_fraction_to_double       (gint src_n, gint src_d, gdouble *dest);

extern
void          gst_util_double_to_fraction       (gdouble src, gint *dest_n, gint *dest_d);

extern
gboolean      gst_util_fraction_multiply        (gint a_n, gint a_d, gint b_n, gint b_d,
                                                 gint *res_n, gint *res_d);
extern
gboolean      gst_util_fraction_add             (gint a_n, gint a_d, gint b_n, gint b_d,
                                                 gint *res_n, gint *res_d);
extern
gint          gst_util_fraction_compare         (gint a_n, gint a_d, gint b_n, gint b_d);

extern
gboolean      gst_calculate_linear_regression   (const GstClockTime * xy,
                                                 GstClockTime * temp, guint n,
                                                 GstClockTime * m_num, GstClockTime * m_denom,
                                                 GstClockTime * b, GstClockTime * xbase,
                                                 gdouble * r_squared);

extern
void          gst_type_mark_as_plugin_api       (GType type, GstPluginAPIFlags flags);

extern
gboolean      gst_type_is_plugin_api            (GType type, GstPluginAPIFlags *flags);

extern
guint         gst_util_ceil_log2                (guint32 v);

extern
gint          gst_util_filename_compare        (const gchar *a, const gchar *b);



#endif /* __GST_UTILS_H__ */
