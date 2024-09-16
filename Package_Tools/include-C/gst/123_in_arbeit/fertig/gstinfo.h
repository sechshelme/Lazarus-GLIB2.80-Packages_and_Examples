/* GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *                    2003 Benjamin Otte <in7y118@public.uni-hamburg.de>
 *
 * gstinfo.h: debugging functions
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

#ifndef __GSTINFO_H__
#define __GSTINFO_H__

#include <glib.h>
#include <glib-object.h>
#include <gst/gstconfig.h>



/**
 * GstDebugLevel:
 * @GST_LEVEL_NONE: No debugging level specified or desired. Used to deactivate
 *  debugging output.
 * @GST_LEVEL_ERROR: Error messages are to be used only when an error occurred
 *  that stops the application from keeping working correctly.
 *  An examples is gst_element_error, which outputs a message with this priority.
 *  It does not mean that the application is terminating as with g_error.
 * @GST_LEVEL_WARNING: Warning messages are to inform about abnormal behaviour
 *  that could lead to problems or weird behaviour later on. An example of this
 *  would be clocking issues ("your computer is pretty slow") or broken input
 *  data ("Can't synchronize to stream.")
 * @GST_LEVEL_FIXME: Fixme messages are messages that indicate that something
 *  in the executed code path is not fully implemented or handled yet. Note
 *  that this does not replace proper error handling in any way, the purpose
 *  of this message is to make it easier to spot incomplete/unfinished pieces
 *  of code when reading the debug log.
 * @GST_LEVEL_INFO: Informational messages should be used to keep the developer
 *  updated about what is happening.
 *  Examples where this should be used are when a typefind function has
 *  successfully determined the type of the stream or when an mp3 plugin detects
 *  the format to be used. ("This file has mono sound.")
 * @GST_LEVEL_DEBUG: Debugging messages should be used when something common
 *  happens that is not the expected default behavior, or something that's
 *  useful to know but doesn't happen all the time (ie. per loop iteration or
 *  buffer processed or event handled).
 *  An example would be notifications about state changes or receiving/sending
 *  of events.
 * @GST_LEVEL_LOG: Log messages are messages that are very common but might be
 *  useful to know. As a rule of thumb a pipeline that is running as expected
 *  should never output anything else but LOG messages whilst processing data.
 *  Use this log level to log recurring information in chain functions and
 *  loop functions, for example.
 * @GST_LEVEL_TRACE: Tracing-related messages.
 *  Examples for this are referencing/dereferencing of objects.
 * @GST_LEVEL_MEMDUMP: memory dump messages are used to log (small) chunks of
 *  data as memory dumps in the log. They will be displayed as hexdump with
 *  ASCII characters.
 * @GST_LEVEL_COUNT: The number of defined debugging levels.
 *
 * The level defines the importance of a debugging message. The more important a
 * message is, the greater the probability that the debugging system outputs it.
 */
typedef enum {
  GST_LEVEL_NONE = 0,
  GST_LEVEL_ERROR = 1,
  GST_LEVEL_WARNING = 2,
  GST_LEVEL_FIXME = 3,
  GST_LEVEL_INFO = 4,
  GST_LEVEL_DEBUG = 5,
  GST_LEVEL_LOG = 6,
  GST_LEVEL_TRACE = 7,
  /* add more */
  GST_LEVEL_MEMDUMP = 9,
  /* add more */
  GST_LEVEL_COUNT
} GstDebugLevel;

/**
 * GST_LEVEL_DEFAULT:
 *
 * Defines the default debugging level to be used with GStreamer. It is normally
 * set to #GST_LEVEL_NONE so nothing get printed.
 * As it can be configured at compile time, developer builds may chose to
 * override that though.
 * You can use this as an argument to gst_debug_set_default_threshold() to
 * reset the debugging output to default behaviour.
 */
#ifndef GST_LEVEL_DEFAULT
#define GST_LEVEL_DEFAULT GST_LEVEL_NONE
#endif

/**
 * GST_LEVEL_MAX:
 *
 * Defines the maximum debugging level to be enabled at compilation time. By default
 * it is set such that all debugging statements will be enabled.
 *
 * If you wish to compile GStreamer and plugins with only some debugging statements
 * (Such as just warnings and errors), you can define it at compile time to the
 * maximum debug level. Any debug statements above that level will be compiled out.
 *
 * Since: 1.6
 */
#ifndef GST_LEVEL_MAX
#define GST_LEVEL_MAX GST_LEVEL_COUNT
#endif

/* defines for format (colors etc)
 * don't change them around, it uses terminal layout
 * Terminal color strings:
 * 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
 * Text color codes:
 * 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
 * Background color codes:
 * 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
 */
/**
 * GstDebugColorFlags:
 * @GST_DEBUG_FG_BLACK: Use black as foreground color.
 * @GST_DEBUG_FG_RED: Use red as foreground color.
 * @GST_DEBUG_FG_GREEN: Use green as foreground color.
 * @GST_DEBUG_FG_YELLOW: Use yellow as foreground color.
 * @GST_DEBUG_FG_BLUE: Use blue as foreground color.
 * @GST_DEBUG_FG_MAGENTA: Use magenta as foreground color.
 * @GST_DEBUG_FG_CYAN: Use cyan as foreground color.
 * @GST_DEBUG_FG_WHITE: Use white as foreground color.
 * @GST_DEBUG_BG_BLACK: Use black as background color.
 * @GST_DEBUG_BG_RED: Use red as background color.
 * @GST_DEBUG_BG_GREEN: Use green as background color.
 * @GST_DEBUG_BG_YELLOW: Use yellow as background color.
 * @GST_DEBUG_BG_BLUE: Use blue as background color.
 * @GST_DEBUG_BG_MAGENTA: Use magenta as background color.
 * @GST_DEBUG_BG_CYAN: Use cyan as background color.
 * @GST_DEBUG_BG_WHITE: Use white as background color.
 * @GST_DEBUG_BOLD: Make the output bold.
 * @GST_DEBUG_UNDERLINE: Underline the output.
 *
 * These are some terminal style flags you can use when creating your
 * debugging categories to make them stand out in debugging output.
 */
typedef enum { /*< flags >*/
  /* colors */
  GST_DEBUG_FG_BLACK		= 0x0000,
  GST_DEBUG_FG_RED		= 0x0001,
  GST_DEBUG_FG_GREEN		= 0x0002,
  GST_DEBUG_FG_YELLOW		= 0x0003,
  GST_DEBUG_FG_BLUE		= 0x0004,
  GST_DEBUG_FG_MAGENTA		= 0x0005,
  GST_DEBUG_FG_CYAN		= 0x0006,
  GST_DEBUG_FG_WHITE		= 0x0007,
  /* background colors */
  GST_DEBUG_BG_BLACK		= 0x0000,
  GST_DEBUG_BG_RED		= 0x0010,
  GST_DEBUG_BG_GREEN		= 0x0020,
  GST_DEBUG_BG_YELLOW		= 0x0030,
  GST_DEBUG_BG_BLUE		= 0x0040,
  GST_DEBUG_BG_MAGENTA		= 0x0050,
  GST_DEBUG_BG_CYAN		= 0x0060,
  GST_DEBUG_BG_WHITE		= 0x0070,
  /* other formats */
  GST_DEBUG_BOLD		= 0x0100,
  GST_DEBUG_UNDERLINE		= 0x0200
} GstDebugColorFlags;

/**
 * GstStackTraceFlags:
 * @GST_STACK_TRACE_SHOW_NONE: Try to retrieve the minimum information
 *                             available, which may be none on some platforms
 *                             (Since: 1.18)
 * @GST_STACK_TRACE_SHOW_FULL: Try to retrieve as much information as possible,
 *                             including source information when getting the
 *                             stack trace
 *
 * Since: 1.12
 */
typedef enum {
    GST_STACK_TRACE_SHOW_NONE = 0,
    GST_STACK_TRACE_SHOW_FULL = 1 << 0
} GstStackTraceFlags;

/**
 * GstDebugColorMode:
 * @GST_DEBUG_COLOR_MODE_OFF: Do not use colors in logs.
 * @GST_DEBUG_COLOR_MODE_ON: Paint logs in a platform-specific way.
 * @GST_DEBUG_COLOR_MODE_UNIX: Paint logs with UNIX terminal color codes
 *                             no matter what platform GStreamer is running on.
 */
typedef enum {
  GST_DEBUG_COLOR_MODE_OFF  = 0,
  GST_DEBUG_COLOR_MODE_ON   = 1,
  GST_DEBUG_COLOR_MODE_UNIX = 2
} GstDebugColorMode;


#define GST_DEBUG_FG_MASK	(0x000F)
#define GST_DEBUG_BG_MASK	(0x00F0)
#define GST_DEBUG_FORMAT_MASK	(0xFF00)

typedef struct _GstDebugCategory GstDebugCategory;
/**
 * GstDebugCategory:
 *
 * This is the struct that describes the categories. Once initialized with
 * #GST_DEBUG_CATEGORY_INIT, its values can't be changed anymore.
 */
struct _GstDebugCategory {
  /*< private >*/
  gint                  threshold;
  guint			color;		/* see defines above */

  const gchar *		name;
  const gchar *		description;
};

/********** some convenience macros for debugging **********/

/**
 * GST_STR_NULL:
 * @str: (allow-none): The string to check.
 *
 * Macro to use when a string must not be %NULL, but may be %NULL. If the string
 * is %NULL, "(NULL)" is printed instead.
 * In GStreamer printf string arguments may not be %NULL, because on some
 * platforms (ie Solaris) the libc crashes in that case. This includes debugging
 * strings.
 */
#define GST_STR_NULL(str) ((str) ? (str) : "(NULL)")

/* FIXME, not MT safe */
/**
 * GST_DEBUG_PAD_NAME:
 * @pad: The pad to debug.
 *
 * Evaluates to 2 strings, that describe the pad. Often used in debugging
 * statements.
 */


/**
 * GST_FUNCTION:
 *
 * This macro should evaluate to the name of the current function and be should
 * be defined when configuring your project, as it is compiler dependent. If it
 * is not defined, some default value is used. It is used to provide debugging
 * output with the function name of the message.
 *
 * Note that this is different from G_STRFUNC as we do not want the full
 * function signature in C++ code.
 */
#ifndef GST_FUNCTION
#if defined (__STDC__) && defined (__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
#  define GST_FUNCTION     ((const char*) (__func__))
#elif defined (__GNUC__) || (defined (_MSC_VER) && _MSC_VER >= 1300)
#  define GST_FUNCTION     ((const char*) (__FUNCTION__))
#else
#  define GST_FUNCTION     ((const char*) ("???"))
#endif
#endif /* ifndef GST_FUNCTION */

/**
 * GST_PTR_FORMAT: (skip):
 *
 * printf format type used to debug GStreamer types. You can use this in
 * combination with GStreamer's debug logging system as well as the functions
 * gst_info_vasprintf(), gst_info_strdup_vprintf() and gst_info_strdup_printf()
 * to pretty-print the following types: #GstCaps, #GstStructure,
 * #GstCapsFeatures, #GstTagList, #GstDateTime, #GstBuffer, #GstBufferList,
 * #GstMessage, #GstEvent, #GstQuery, #GstContext, #GstPad, #GstObject. All
 * #GObject types will be printed as typename plus pointer, and everything
 * else will simply be printed as pointer address.
 *
 * This can only be used on types whose size is >= sizeof(gpointer).
 */
#define GST_PTR_FORMAT     "p\aA"

/**
 * GST_SEGMENT_FORMAT: (skip):
 *
 * printf format type used to debug GStreamer segments. You can use this in
 * combination with GStreamer's debug logging system as well as the functions
 * gst_info_vasprintf(), gst_info_strdup_vprintf() and gst_info_strdup_printf()
 * to pretty-print #GstSegment structures.
 * This can only be used on pointers to GstSegment structures.
 */
#define GST_SEGMENT_FORMAT "p\aB"

/**
 * GST_TIMEP_FORMAT: (skip):
 *
 * printf format type used to debug GStreamer ClockTime pointers. You can use
 * this in combination with GStreamer's debug logging system as well as the
 * functions gst_info_vasprintf(), gst_info_strdup_vprintf() and
 * gst_info_strdup_printf() to pretty-print #GstClockTime pointers. This can
 * only be used on pointers to GstClockTime values.
 *
 * Since: 1.18
 */
#define GST_TIMEP_FORMAT "p\aT"

/**
 * GST_STIMEP_FORMAT: (skip):
 *
 * printf format type used to debug GStreamer signed time value pointers. You
 * can use this in combination with GStreamer's debug logging system as well as
 * the functions gst_info_vasprintf(), gst_info_strdup_vprintf() and
 * gst_info_strdup_printf() to pretty-print signed time (pointers to
 * #GstClockTimeDiff or #gint64).
 *
 * Since: 1.18
 */
#define GST_STIMEP_FORMAT "p\aS"

typedef struct _GstDebugMessage GstDebugMessage;

/**
 * GstLogFunction:
 * @category: a #GstDebugCategory
 * @level: a #GstDebugLevel
 * @file: file name
 * @function: function name
 * @line: line number
 * @object: a #GObject
 * @message: the message
 * @user_data: user data for the log function
 *
 * Function prototype for a logging function that can be registered with
 * gst_debug_add_log_function().
 * Use  on that function.
 */
typedef void (*GstLogFunction)  (GstDebugCategory * category,
                                 GstDebugLevel      level,
                                 const gchar      * file,
                                 const gchar      * function,
                                 gint               line,
                                 GObject          * object,
                                 GstDebugMessage  * message,
                                 gpointer           user_data);

extern
void		    gst_debug_log            (GstDebugCategory * category,
                                          GstDebugLevel      level,
                                          const gchar      * file,
                                          const gchar      * function,
                                          gint               line,
                                          GObject          * object,
                                          const gchar      * format,
                                          ...);
extern
void            gst_debug_log_valist     (GstDebugCategory * category,
                                          GstDebugLevel      level,
                                          const gchar      * file,
                                          const gchar      * function,
                                          gint	             line,
                                          GObject          * object,
                                          const gchar      * format,
                                          va_list            args) ;

extern
void            gst_debug_log_literal    (GstDebugCategory * category,
                                          GstDebugLevel      level,
                                          const gchar      * file,
                                          const gchar      * function,
                                          gint	             line,
                                          GObject          * object,
                                          const gchar      * message_string) ;

extern
void		gst_debug_log_id          (GstDebugCategory * category,
                                          GstDebugLevel      level,
                                          const gchar      * file,
                                          const gchar      * function,
                                          gint               line,
					  const gchar      * id,
                                          const gchar      * format,
                                          ...) ;
extern
void            gst_debug_log_id_valist  (GstDebugCategory * category,
                                          GstDebugLevel      level,
                                          const gchar      * file,
                                          const gchar      * function,
                                          gint	             line,
                                          const gchar      * id,
                                          const gchar      * format,
                                          va_list            args) ;

extern
void            gst_debug_log_id_literal (GstDebugCategory * category,
                                          GstDebugLevel      level,
                                          const gchar      * file,
                                          const gchar      * function,
                                          gint	             line,
                                          const gchar      * id,
                                          const gchar      * message_string) ;

/* do not use this function, use the GST_DEBUG_CATEGORY_INIT macro */

extern
GstDebugCategory *_gst_debug_category_new (const gchar * name,
                                           guint         color,
                                           const gchar * description);

/* do not use this function, use the GST_DEBUG_CATEGORY_GET macro */

extern
GstDebugCategory *_gst_debug_get_category (const gchar *name);


/* do not use these functions, use the GST_CAT_MEMDUMP_* macros */

extern
void _gst_debug_dump_mem (GstDebugCategory * cat, const gchar * file,
    const gchar * func, gint line, GObject * obj, const gchar * msg,
    const guint8 * data, guint length);

extern
void _gst_debug_dump_mem_id (GstDebugCategory * cat, const gchar * file,
    const gchar * func, gint line, const gchar *object_id, const gchar * msg,
    const guint8 * data, guint length);

/**
 * GstDebugFuncPtr: (attributes doc.skip=true)
 * we define this to avoid a compiler warning regarding a cast from a function
 * pointer to a void pointer
 * (see https://bugzilla.gnome.org/show_bug.cgi?id=309253)
 */
typedef	void (* GstDebugFuncPtr)	(void);

/* do no use these functions, use the GST_DEBUG*_FUNCPTR macros */

extern
void	_gst_debug_register_funcptr	(GstDebugFuncPtr	func,
					 const gchar *		ptrname);
extern
const gchar *
	_gst_debug_nameof_funcptr	(GstDebugFuncPtr	func) ;


extern
const gchar   * gst_debug_message_get    (GstDebugMessage  * message);

extern
const gchar   * gst_debug_message_get_id (GstDebugMessage  * message);

extern
gchar         * gst_debug_log_get_line    (GstDebugCategory * category,
                                           GstDebugLevel      level,
                                           const gchar      * file,
                                           const gchar      * function,
                                           gint               line,
                                           GObject          * object,
                                           GstDebugMessage  * message) ;

extern
void            gst_debug_log_default    (GstDebugCategory * category,
                                          GstDebugLevel      level,
                                          const gchar      * file,
                                          const gchar      * function,
                                          gint               line,
                                          GObject          * object,
                                          GstDebugMessage  * message,
                                          gpointer           user_data) ;

extern
const gchar *   gst_debug_level_get_name (GstDebugLevel level);

extern
void            gst_debug_add_log_function            (GstLogFunction func,
                                                       gpointer       user_data,
                                                       GDestroyNotify notify);
extern
guint           gst_debug_remove_log_function         (GstLogFunction func);

extern
guint           gst_debug_remove_log_function_by_data (gpointer       data);

extern
void            gst_debug_set_active  (gboolean active);

extern
gboolean        gst_debug_is_active   (void);

extern
void            gst_debug_set_colored (gboolean colored);

extern
void            gst_debug_set_color_mode   (GstDebugColorMode mode);

extern
void            gst_debug_set_color_mode_from_string (const gchar * mode);

extern
gboolean        gst_debug_is_colored  (void);

extern
GstDebugColorMode gst_debug_get_color_mode (void);

extern
void            gst_debug_set_default_threshold      (GstDebugLevel level);

extern
GstDebugLevel   gst_debug_get_default_threshold      (void);

extern
void            gst_debug_set_threshold_for_name     (const gchar * name,
                                                      GstDebugLevel level);
extern
void            gst_debug_set_threshold_from_string  (const gchar * list, gboolean reset);

extern
void            gst_debug_unset_threshold_for_name   (const gchar * name);


void            gst_debug_category_free              (GstDebugCategory *	category);

extern
void            gst_debug_category_set_threshold     (GstDebugCategory *	category,
                                                      GstDebugLevel		level);

extern
void            gst_debug_category_reset_threshold   (GstDebugCategory *	category);

extern
GstDebugLevel   gst_debug_category_get_threshold     (GstDebugCategory *	category);

extern
const gchar *   gst_debug_category_get_name          (GstDebugCategory *	category);

extern
guint           gst_debug_category_get_color         (GstDebugCategory *	category);

extern
const gchar *   gst_debug_category_get_description   (GstDebugCategory *	category);

extern
GSList *        gst_debug_get_all_categories	(void);


extern
gchar * gst_debug_construct_term_color (guint colorinfo);

extern
gint    gst_debug_construct_win_color  (guint colorinfo);

extern
gint    gst_info_vasprintf              (gchar ** result,
                                         const gchar * format,
                                         va_list args);
extern
gchar * gst_info_strdup_vprintf         (const gchar *format, va_list args);

extern
gchar * gst_info_strdup_printf          (const gchar *format, ...) ;

extern
void    gst_print                       (const gchar * format, ...) ;

extern
void    gst_println                     (const gchar * format, ...) ;

extern
void    gst_printerr                    (const gchar * format, ...) ;

extern
void    gst_printerrln                  (const gchar * format, ...) ;

#ifndef GST_DISABLE_GST_DEBUG



/**
 * GST_DEBUG_CATEGORY:
 * @cat: the category
 *
 * Defines a GstDebugCategory variable.
 * This macro expands to nothing if debugging is disabled.
 */
//#define GST_DEBUG_CATEGORY(cat) GstDebugCategory *cat = NULL
/**
 * GST_DEBUG_CATEGORY_EXTERN:
 * @cat: the category
 *
 * Declares a GstDebugCategory variable as extern. Use in header files.
 * This macro expands to nothing if debugging is disabled.
 */
//#define GST_DEBUG_CATEGORY_EXTERN(cat) extern GstDebugCategory *cat

/**
 * GST_DEBUG_CATEGORY_STATIC:
 * @cat: the category
 *
 * Defines a static GstDebugCategory variable.
 * This macro expands to nothing if debugging is disabled.
 */
//#define GST_DEBUG_CATEGORY_STATIC(cat) static GstDebugCategory *cat = NULL

/**
 * GST_DEBUG_CATEGORY_INIT:
 * @cat: the category to initialize.
 * @name: the name of the category.
 * @color: the colors to use for a color representation or 0 for no color.
 * @description: optional description of the category.
 *
 * Initializes a new #GstDebugCategory with the given properties and set to
 * the default threshold.
 *
 * > This macro expands to nothing if debugging is disabled.
 * >
 * > When naming your category, please follow the following conventions to ensure
 * > that the pattern matching for categories works as expected. It is not
 * > earth-shattering if you don't follow these conventions, but it would be nice
 * > for everyone.
 * >
 * > If you define a category for a plugin or a feature of it, name the category
 * > like the feature. So if you wanted to write a "filesrc" element, you would
 * > name the category "filesrc". Use lowercase letters only.
 * > If you define more than one category for the same element, append an
 * > underscore and an identifier to your categories, like this: "filesrc_cache"
 * >
 * > If you create a library or an application using debugging categories, use a
 * > common prefix followed by an underscore for all your categories. GStreamer
 * > uses the GST prefix so GStreamer categories look like "GST_STATES". Be sure
 * > to include uppercase letters.
 *
 */


/**
 * GST_DEBUG_CATEGORY_GET:
 * @cat: the category to initialize.
 * @name: log category name
 *
 * Looks up an existing #GstDebugCategory by its @name and sets @cat. If the
 * category is not found, but GST_CAT_DEFAULT is defined, that is assigned to
 * @cat. Otherwise @cat will be %NULL.
 *
 * |[<!-- language="C" -->
 * GST_DEBUG_CATEGORY_STATIC (gst_myplugin_debug);
 * #define GST_CAT_DEFAULT gst_myplugin_debug
 * GST_DEBUG_CATEGORY_STATIC (GST_CAT_PERFORMANCE);
 * ...
 * GST_DEBUG_CATEGORY_INIT (gst_myplugin_debug, "myplugin", 0, "nice element");
 * GST_DEBUG_CATEGORY_GET (GST_CAT_PERFORMANCE, "GST_PERFORMANCE");
 * ]|
 */
/**
 * GST_CAT_DEFAULT:
 *
 * Default gstreamer core debug log category. Please define your own.
 */

extern GstDebugCategory *	GST_CAT_DEFAULT;
/* this symbol may not be used */

extern gboolean                 _gst_debug_enabled;

/* the min debug level, used for quickly discarding debug
 * messages that fall under the threshold. */

extern GstDebugLevel            _gst_debug_min;

/**
 * GST_CAT_LEVEL_LOG:
 * @cat: category to use
 * @level: the severity of the message
 * @object: (allow-none): the #GObject the message belongs to or %NULL if none
 * @...: A printf-style message to output
 *
 * Outputs a debugging message. This is the most general macro for outputting
 * debugging messages. You will probably want to use one of the ones described
 * below.
 *
 * There is no need to finish the end of the debug message with a newline
 * character, a newline character will be added automatically.
 */

/**
 * GST_CAT_LEVEL_LOG_ID:
 * @cat: category to use
 * @level: the severity of the message
 * @id: (transfer none) (allow-none): the identifier of the object this message
 *     relates to, or %NULL if none
 * @...: A printf-style message to output
 *
 * Outputs a debugging message. This is the most general macro for outputting
 * debugging messages. You will probably want to use one of the ones described
 * below.
 *
 * There is no need to finish the end of the debug message with a newline
 * character, a newline character will be added automatically.
 *
 * Since: 1.22
 */

/* This one doesn't have varargs in the macro, so it's different than all the
 * other macros and hence in a separate block right here. Docs chunks are
 * with the other doc chunks below though. */
/**
 * __GST_CAT_MEMDUMP_LOG_ID:
 *
 * Only for private usage
 *
 * This one doesn't have varargs in the macro, so it's different than all the
 * other macros and hence in a separate block right here. Docs chunks are
 * with the other doc chunks below though.
 *
 * Since: 1.22
 */

#define GST_CAT_MEMDUMP_OBJECT(cat,obj,msg,data,length)  \
    __GST_CAT_MEMDUMP_LOG(cat,obj,msg,data,length)
#define GST_CAT_MEMDUMP_ID(cat,id,msg,data,length)	\
    __GST_CAT_MEMDUMP_LOG_ID(cat,id,msg,data,length)
#define GST_CAT_MEMDUMP(cat,msg,data,length)             \
    __GST_CAT_MEMDUMP_LOG(cat,NULL,msg,data,length)
#define GST_MEMDUMP_OBJECT(obj,msg,data,length)          \
    __GST_CAT_MEMDUMP_LOG(GST_CAT_DEFAULT,obj,msg,data,length)
#define GST_MEMDUMP_ID(id,msg,data,length)          \
    __GST_CAT_MEMDUMP_LOG_ID(GST_CAT_DEFAULT,id,msg,data,length)
#define GST_MEMDUMP(msg,data,length)                     \
    __GST_CAT_MEMDUMP_LOG(GST_CAT_DEFAULT,NULL,msg,data,length)

/**
 * GST_CAT_ERROR_OBJECT:
 * @cat: category to use
 * @obj: the #GObject the message belongs to
 * @...: printf-style message to output
 *
 * Output an error message belonging to the given object in the given category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_CAT_WARNING_OBJECT:
 * @cat: category to use
 * @obj: the #GObject the message belongs to
 * @...: printf-style message to output
 *
 * Output a warning message belonging to the given object in the given category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_CAT_INFO_OBJECT:
 * @cat: category to use
 * @obj: the #GObject the message belongs to
 * @...: printf-style message to output
 *
 * Output an informational message belonging to the given object in the given
 * category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_CAT_DEBUG_OBJECT:
 * @cat: category to use
 * @obj: the #GObject the message belongs to
 * @...: printf-style message to output
 *
 * Output an debugging message belonging to the given object in the given category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_CAT_LOG_OBJECT:
 * @cat: category to use
 * @obj: the #GObject the message belongs to
 * @...: printf-style message to output
 *
 * Output an logging message belonging to the given object in the given category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_CAT_FIXME_OBJECT:
 * @cat: category to use
 * @obj: the #GObject the message belongs to
 * @...: printf-style message to output
 *
 * Output a fixme message belonging to the given object in the given category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_CAT_TRACE_OBJECT:
 * @cat: category to use
 * @obj: the #GObject the message belongs to
 * @...: printf-style message to output
 *
 * Output a tracing message belonging to the given object in the given
 * category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_CAT_MEMDUMP_OBJECT:
 * @cat: category to use
 * @obj: the #GObject the message belongs to
 * @msg: message string to log with the data
 * @data: pointer to the data to output
 * @length: length of the data to output
 *
 * Output a hexdump of @data relating to the given object in the given
 * category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */

/**
 * GST_CAT_MEMDUMP_ID:
 * @cat: category to use
 * @id: An identifier of the message provider
 * @msg: message string to log with the data
 * @data: pointer to the data to output
 * @length: length of the data to output
 *
 * Output a hexdump of @data relating to the given @id in the given category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 *
 * Since: 1.22
 */


/**
 * GST_CAT_ERROR:
 * @cat: category to use
 * @...: printf-style message to output
 *
 * Output an error message in the given category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_CAT_WARNING:
 * @cat: category to use
 * @...: printf-style message to output
 *
 * Output an warning message in the given category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_CAT_INFO:
 * @cat: category to use
 * @...: printf-style message to output
 *
 * Output an informational message in the given category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_CAT_DEBUG:
 * @cat: category to use
 * @...: printf-style message to output
 *
 * Output an debugging message in the given category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_CAT_LOG:
 * @cat: category to use
 * @...: printf-style message to output
 *
 * Output an logging message in the given category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_CAT_FIXME:
 * @cat: category to use
 * @...: printf-style message to output
 *
 * Output an fixme message in the given category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_CAT_TRACE:
 * @cat: category to use
 * @...: printf-style message to output
 *
 * Output a tracing message in the given category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_CAT_MEMDUMP:
 * @cat: category to use
 * @msg: message string to log with the data
 * @data: pointer to the data to output
 * @length: length of the data to output
 *
 * Output a hexdump of @data in the given category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */


/**
 * GST_ERROR_OBJECT:
 * @obj: the #GObject the message belongs to
 * @...: printf-style message to output
 *
 * Output an error message belonging to the given object in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_WARNING_OBJECT:
 * @obj: the #GObject the message belongs to
 * @...: printf-style message to output
 *
 * Output a warning message belonging to the given object in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_INFO_OBJECT:
 * @obj: the #GObject the message belongs to
 * @...: printf-style message to output
 *
 * Output an informational message belonging to the given object in the default
 * category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_DEBUG_OBJECT:
 * @obj: the #GObject the message belongs to
 * @...: printf-style message to output
 *
 * Output a debugging message belonging to the given object in the default
 * category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_LOG_OBJECT:
 * @obj: the #GObject the message belongs to
 * @...: printf-style message to output
 *
 * Output a logging message belonging to the given object in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_FIXME_OBJECT:
 * @obj: the #GObject the message belongs to
 * @...: printf-style message to output
 *
 * Output a fixme message belonging to the given object in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_TRACE_OBJECT:
 * @obj: the #GObject the message belongs to
 * @...: printf-style message to output
 *
 * Output a tracing message belonging to the given object in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_MEMDUMP_OBJECT:
 * @obj: the #GObject the message belongs to
 * @msg: message string to log with the data
 * @data: pointer to the data to output
 * @length: length of the data to output
 *
 * Output a logging message belonging to the given object in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */

/**
 * GST_ERROR_ID:
 * @id: An identifier of the message provider
 * @...: printf-style message to output
 *
 * Output an error message for the given identifier in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 *
 * Since: 1.22
 */
/**
 * GST_WARNING_ID:
 * @id: An identifier of the message provider
 * @...: printf-style message to output
 *
 * Output a warning message for the given identifier in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 *
 * Since: 1.22
 */
/**
 * GST_INFO_ID:
 * @id: An identifier of the message provider
 * @...: printf-style message to output
 *
 * Output an informational message for the given identifier the default
 * category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 *
 * Since: 1.22
 */
/**
 * GST_DEBUG_ID:
 * @id: An identifier of the message provider
 * @...: printf-style message to output
 *
 * Output a debugging message for the given identifier in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 *
 * Since: 1.22
 */
/**
 * GST_LOG_ID:
 * @id: An identifier of the message provider
 * @...: printf-style message to output
 *
 * Output a logging message for the given identifier in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 *
 * Since: 1.22
 */
/**
 * GST_FIXME_ID:
 * @id: An identifier of the message provider
 * @...: printf-style message to output
 *
 * Output a fixme message for the given identifier in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 *
 * Since: 1.22
 */
/**
 * GST_TRACE_ID:
 * @id: An identifier of the message provider
 * @...: printf-style message to output
 *
 * Output a tracing message for the given identifier  in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 *
 * Since: 1.22
 */
/**
 * GST_MEMDUMP_ID:
 * @id: An identifier of the message provider
 * @msg: message string to log with the data
 * @data: pointer to the data to output
 * @length: length of the data to output
 *
 * Output a logging message belonging to the given object in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 *
 * Since: 1.22
 */



/**
 * GST_ERROR:
 * @...: printf-style message to output
 *
 * Output an error message in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_WARNING:
 * @...: printf-style message to output
 *
 * Output a warning message in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_INFO:
 * @...: printf-style message to output
 *
 * Output an informational message in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_DEBUG:
 * @...: printf-style message to output
 *
 * Output a debugging message in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_LOG:
 * @...: printf-style message to output
 *
 * Output a logging message in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_FIXME:
 * @...: printf-style message to output
 *
 * Output a fixme message in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_TRACE:
 * @...: printf-style message to output
 *
 * Output a tracing message in the default category.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */
/**
 * GST_MEMDUMP:
 * @msg: message string to log with the data
 * @data: pointer to the data to output
 * @length: length of the data to output
 *
 * Output a hexdump of @data.
 *
 * There is no need to finish the end of the message string with a newline
 * character, a newline character will be added automatically.
 */




/********** function pointer stuff **********/




extern
void gst_debug_print_stack_trace (void);

extern
gchar * gst_debug_get_stack_trace (GstStackTraceFlags flags);

extern
void                  gst_debug_add_ring_buffer_logger      (guint max_size_per_thread, guint thread_timeout);
extern
void                  gst_debug_remove_ring_buffer_logger   (void);
extern
gchar **              gst_debug_ring_buffer_logger_get_logs (void);



#endif /* __GSTINFO_H__ */
