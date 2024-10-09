#define G_MININT8	((gint8) (-G_MAXINT8 - 1))
#define G_MAXINT8	((gint8)  0x7f)
#define G_MAXUINT8	((guint8) 0xff)

/**
 * G_MININT16: (value -32768)
 *
 * The minimum value which can be held in a #gint16.
 *
 * Since: 2.4
 */
#define G_MININT16	((gint16) (-G_MAXINT16 - 1))
#define G_MAXINT16	((gint16)  0x7fff)
#define G_MAXUINT16	((guint16) 0xffff)

/**
 * G_MININT32: (value -2147483648)
 *
 * The minimum value which can be held in a #gint32.
 *
 * Since: 2.4
 */
#define G_MININT32	((gint32) (-G_MAXINT32 - 1))
#define G_MAXINT32	((gint32)  0x7fffffff)
#define G_MAXUINT32	((guint32) 0xffffffff)

/**
 * G_MININT64: (value -9223372036854775808)
 *
 * The minimum value which can be held in a #gint64.
 */
#define G_MININT64	((gint64) (-G_MAXINT64 - G_GINT64_CONSTANT(1)))
#define G_MAXINT64	G_GINT64_CONSTANT(0x7fffffffffffffff)
#define G_MAXUINT64	G_GUINT64_CONSTANT(0xffffffffffffffff)

