
unit gstbytereader;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstbytereader.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstbytereader.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
Pgdouble  = ^gdouble;
Pgfloat  = ^gfloat;
Pgint16  = ^gint16;
Pgint32  = ^gint32;
Pgint64  = ^gint64;
Pgint8  = ^gint8;
PGstByteReader  = ^GstByteReader;
Pguint16  = ^guint16;
Pguint32  = ^guint32;
Pguint64  = ^guint64;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer byte reader
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
  }
{$ifndef __GST_BYTE_READER_H__}
{$define __GST_BYTE_READER_H__}
{$include <gst/gst.h>}
{$include <gst/base/base-prelude.h>}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_BYTE_READER(reader : longint) : PGstByteReader;

{*
 * GstByteReader:
 * @data: (array length=size): Data from which the bit reader will
 *   read
 * @size: Size of @data in bytes
 * @byte: Current byte position
 *
 * A byte reader instance.
  }
(* Const before type ignored *)
{ Byte position  }
{ < private >  }
type
  PGstByteReader = ^TGstByteReader;
  TGstByteReader = record
      data : Pguint8;
      size : Tguint;
      byte : Tguint;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
(* Const before type ignored *)

function gst_byte_reader_new(data:Pguint8; size:Tguint):PGstByteReader;cdecl;external;
procedure gst_byte_reader_free(reader:PGstByteReader);cdecl;external;
(* Const before type ignored *)
procedure gst_byte_reader_init(reader:PGstByteReader; data:Pguint8; size:Tguint);cdecl;external;
function gst_byte_reader_peek_sub_reader(reader:PGstByteReader; sub_reader:PGstByteReader; size:Tguint):Tgboolean;cdecl;external;
function gst_byte_reader_get_sub_reader(reader:PGstByteReader; sub_reader:PGstByteReader; size:Tguint):Tgboolean;cdecl;external;
function gst_byte_reader_set_pos(reader:PGstByteReader; pos:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_get_pos(reader:PGstByteReader):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_get_remaining(reader:PGstByteReader):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_get_size(reader:PGstByteReader):Tguint;cdecl;external;
function gst_byte_reader_skip(reader:PGstByteReader; nbytes:Tguint):Tgboolean;cdecl;external;
function gst_byte_reader_get_uint8(reader:PGstByteReader; val:Pguint8):Tgboolean;cdecl;external;
function gst_byte_reader_get_int8(reader:PGstByteReader; val:Pgint8):Tgboolean;cdecl;external;
function gst_byte_reader_get_uint16_le(reader:PGstByteReader; val:Pguint16):Tgboolean;cdecl;external;
function gst_byte_reader_get_int16_le(reader:PGstByteReader; val:Pgint16):Tgboolean;cdecl;external;
function gst_byte_reader_get_uint16_be(reader:PGstByteReader; val:Pguint16):Tgboolean;cdecl;external;
function gst_byte_reader_get_int16_be(reader:PGstByteReader; val:Pgint16):Tgboolean;cdecl;external;
function gst_byte_reader_get_uint24_le(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external;
function gst_byte_reader_get_int24_le(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external;
function gst_byte_reader_get_uint24_be(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external;
function gst_byte_reader_get_int24_be(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external;
function gst_byte_reader_get_uint32_le(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external;
function gst_byte_reader_get_int32_le(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external;
function gst_byte_reader_get_uint32_be(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external;
function gst_byte_reader_get_int32_be(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external;
function gst_byte_reader_get_uint64_le(reader:PGstByteReader; val:Pguint64):Tgboolean;cdecl;external;
function gst_byte_reader_get_int64_le(reader:PGstByteReader; val:Pgint64):Tgboolean;cdecl;external;
function gst_byte_reader_get_uint64_be(reader:PGstByteReader; val:Pguint64):Tgboolean;cdecl;external;
function gst_byte_reader_get_int64_be(reader:PGstByteReader; val:Pgint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_uint8(reader:PGstByteReader; val:Pguint8):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_int8(reader:PGstByteReader; val:Pgint8):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_uint16_le(reader:PGstByteReader; val:Pguint16):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_int16_le(reader:PGstByteReader; val:Pgint16):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_uint16_be(reader:PGstByteReader; val:Pguint16):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_int16_be(reader:PGstByteReader; val:Pgint16):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_uint24_le(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_int24_le(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_uint24_be(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_int24_be(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_uint32_le(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_int32_le(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_uint32_be(reader:PGstByteReader; val:Pguint32):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_int32_be(reader:PGstByteReader; val:Pgint32):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_uint64_le(reader:PGstByteReader; val:Pguint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_int64_le(reader:PGstByteReader; val:Pgint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_uint64_be(reader:PGstByteReader; val:Pguint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_int64_be(reader:PGstByteReader; val:Pgint64):Tgboolean;cdecl;external;
function gst_byte_reader_get_float32_le(reader:PGstByteReader; val:Pgfloat):Tgboolean;cdecl;external;
function gst_byte_reader_get_float32_be(reader:PGstByteReader; val:Pgfloat):Tgboolean;cdecl;external;
function gst_byte_reader_get_float64_le(reader:PGstByteReader; val:Pgdouble):Tgboolean;cdecl;external;
function gst_byte_reader_get_float64_be(reader:PGstByteReader; val:Pgdouble):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_float32_le(reader:PGstByteReader; val:Pgfloat):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_float32_be(reader:PGstByteReader; val:Pgfloat):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_float64_le(reader:PGstByteReader; val:Pgdouble):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_peek_float64_be(reader:PGstByteReader; val:Pgdouble):Tgboolean;cdecl;external;
function gst_byte_reader_dup_data(reader:PGstByteReader; size:Tguint; val:PPguint8):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_get_data(reader:PGstByteReader; size:Tguint; val:PPguint8):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_byte_reader_peek_data(reader:PGstByteReader; size:Tguint; val:PPguint8):Tgboolean;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_dup_string(reader,str : longint) : longint;

function gst_byte_reader_dup_string_utf8(reader:PGstByteReader; str:PPgchar):Tgboolean;cdecl;external;
function gst_byte_reader_dup_string_utf16(reader:PGstByteReader; str:PPguint16):Tgboolean;cdecl;external;
function gst_byte_reader_dup_string_utf32(reader:PGstByteReader; str:PPguint32):Tgboolean;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_skip_string(reader : longint) : longint;

function gst_byte_reader_skip_string_utf8(reader:PGstByteReader):Tgboolean;cdecl;external;
function gst_byte_reader_skip_string_utf16(reader:PGstByteReader):Tgboolean;cdecl;external;
function gst_byte_reader_skip_string_utf32(reader:PGstByteReader):Tgboolean;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_string(reader,str : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_string(reader,str : longint) : longint;

(* Const before type ignored *)
function gst_byte_reader_get_string_utf8(reader:PGstByteReader; str:PPgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_byte_reader_peek_string_utf8(reader:PGstByteReader; str:PPgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_masked_scan_uint32(reader:PGstByteReader; mask:Tguint32; pattern:Tguint32; offset:Tguint; size:Tguint):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_byte_reader_masked_scan_uint32_peek(reader:PGstByteReader; mask:Tguint32; pattern:Tguint32; offset:Tguint; size:Tguint; 
           value:Pguint32):Tguint;cdecl;external;
{*
 * GST_BYTE_READER_INIT:
 * @data: Data from which the #GstByteReader should read
 * @size: Size of @data in bytes
 *
 * A #GstByteReader must be initialized with this macro, before it can be
 * used. This macro can used be to initialize a variable, but it cannot
 * be assigned to a variable. In that case you have to use
 * gst_byte_reader_init().
  }
{#define GST_BYTE_READER_INIT(data, size) data, size, 0 }
{ unchecked variants  }
{ xxxxxxxxxxxxxxxxxxxxxxxxx }
{static inline void }
{gst_byte_reader_skip_unchecked (GstByteReader * reader, guint nbytes) }
{ }
{  reader->byte += nbytes; }
{ }
{
#define __GST_BYTE_READER_GET_PEEK_BITS_UNCHECKED(bits,type,lower,upper,adj) \
\
static inline type \
gst_byte_reader_peek_##lower##_unchecked (const GstByteReader * reader) \
 \
  type val = (type) GST_READ_##upper (reader->data + reader->byte); \
  adj \
  return val; \
 \
\
static inline type \
gst_byte_reader_get_##lower##_unchecked (GstByteReader * reader) \
 \
  type val = gst_byte_reader_peek_##lower##_unchecked (reader); \
  reader->byte += bits / 8; \
  return val; \

 }
{$undef __GET_PEEK_BITS_UNCHECKED}
{
static inline const guint8 *
gst_byte_reader_peek_data_unchecked (const GstByteReader * reader)

  return (const guint8 *) (reader->data + reader->byte);


static inline const guint8 *
gst_byte_reader_get_data_unchecked (GstByteReader * reader, guint size)

  const guint8 *data;

  data = gst_byte_reader_peek_data_unchecked (reader);
  gst_byte_reader_skip_unchecked (reader, size);
  return data;


static inline guint8 *
gst_byte_reader_dup_data_unchecked (GstByteReader * reader, guint size)

  gconstpointer data = gst_byte_reader_get_data_unchecked (reader, size);
  guint8 *dup_data = (guint8 *) g_malloc (size);

  memcpy (dup_data, data, size);
  return dup_data;



static inline guint
_gst_byte_reader_get_pos_unchecked (const GstByteReader * reader)

  return reader->byte;


static inline guint
_gst_byte_reader_get_remaining_unchecked (const GstByteReader * reader)

  return reader->size - reader->byte;


static inline guint
_gst_byte_reader_get_size_unchecked (const GstByteReader * reader)

  return reader->size;


static inline guint
_gst_byte_reader_get_remaining_inline (const GstByteReader * reader)

  g_return_val_if_fail (reader != NULL, 0);

  return _gst_byte_reader_get_remaining_unchecked (reader);


static inline guint
_gst_byte_reader_get_size_inline (const GstByteReader * reader)

  g_return_val_if_fail (reader != NULL, 0);

  return _gst_byte_reader_get_size_unchecked (reader);


#define __GST_BYTE_READER_GET_PEEK_BITS_INLINE(bits,type,name) \
\
static inline gboolean \
_gst_byte_reader_peek_##name##_inline (const GstByteReader * reader, type * val) \
 \
  g_return_val_if_fail (reader != NULL, FALSE); \
  g_return_val_if_fail (val != NULL, FALSE); \
  \
  if (_gst_byte_reader_get_remaining_unchecked (reader) < (bits / 8)) \
    return FALSE; \
\
  *val = gst_byte_reader_peek_##name##_unchecked (reader); \
  return TRUE; \
 \
\
static inline gboolean \
_gst_byte_reader_get_##name##_inline (GstByteReader * reader, type * val) \
 \
  g_return_val_if_fail (reader != NULL, FALSE); \
  g_return_val_if_fail (val != NULL, FALSE); \
  \
  if (_gst_byte_reader_get_remaining_unchecked (reader) < (bits / 8)) \
    return FALSE; \
\
  *val = gst_byte_reader_get_##name##_unchecked (reader); \
  return TRUE; \

  }
{$undef __GST_BYTE_READER_GET_PEEK_BITS_INLINE}
{$ifndef GST_BYTE_READER_DISABLE_INLINES}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_byte_reader_init(reader,data,size : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_remaining(reader : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_size(reader : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_pos(reader : longint) : longint;

{ we use defines here so we can add the G_LIKELY()  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint8(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int8(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint16_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int16_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint16_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int16_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint24_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int24_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint24_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int24_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint32_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int32_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint32_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int32_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint64_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int64_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint64_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int64_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint8(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int8(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint16_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int16_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint16_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int16_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint24_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int24_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint24_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int24_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint32_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int32_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint32_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int32_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint64_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int64_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint64_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int64_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_float32_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_float32_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_float64_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_float64_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_float32_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_float32_be(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_float64_le(reader,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_float64_be(reader,val : longint) : longint;

{$endif}
{ GST_BYTE_READER_DISABLE_INLINES  }
{
static inline void
_gst_byte_reader_init_inline (GstByteReader * reader, const guint8 * data, guint size)

  g_return_if_fail (reader != NULL);

  reader->data = data;
  reader->size = size;
  reader->byte = 0;


static inline gboolean
_gst_byte_reader_peek_sub_reader_inline (GstByteReader * reader,
    GstByteReader * sub_reader, guint size)

  g_return_val_if_fail (reader != NULL, FALSE);
  g_return_val_if_fail (sub_reader != NULL, FALSE);

  if (_gst_byte_reader_get_remaining_unchecked (reader) < size)
    return FALSE;

  sub_reader->data = reader->data + reader->byte;
  sub_reader->byte = 0;
  sub_reader->size = size;
  return TRUE;


static inline gboolean
_gst_byte_reader_get_sub_reader_inline (GstByteReader * reader,
    GstByteReader * sub_reader, guint size)

  if (!_gst_byte_reader_peek_sub_reader_inline (reader, sub_reader, size))
    return FALSE;
  gst_byte_reader_skip_unchecked (reader, size);
  return TRUE;


static inline gboolean
_gst_byte_reader_dup_data_inline (GstByteReader * reader, guint size, guint8 ** val)

  g_return_val_if_fail (reader != NULL, FALSE);
  g_return_val_if_fail (val != NULL, FALSE);

  if (G_UNLIKELY (size > reader->size || _gst_byte_reader_get_remaining_unchecked (reader) < size))
    return FALSE;

  *val = gst_byte_reader_dup_data_unchecked (reader, size);
  return TRUE;


static inline gboolean
_gst_byte_reader_get_data_inline (GstByteReader * reader, guint size, const guint8 ** val)

  g_return_val_if_fail (reader != NULL, FALSE);
  g_return_val_if_fail (val != NULL, FALSE);

  if (G_UNLIKELY (size > reader->size || _gst_byte_reader_get_remaining_unchecked (reader) < size))
    return FALSE;

  *val = gst_byte_reader_get_data_unchecked (reader, size);
  return TRUE;


static inline gboolean
_gst_byte_reader_peek_data_inline (const GstByteReader * reader, guint size, const guint8 ** val)

  g_return_val_if_fail (reader != NULL, FALSE);
  g_return_val_if_fail (val != NULL, FALSE);

  if (G_UNLIKELY (size > reader->size || _gst_byte_reader_get_remaining_unchecked (reader) < size))
    return FALSE;

  *val = gst_byte_reader_peek_data_unchecked (reader);
  return TRUE;


static inline guint
_gst_byte_reader_get_pos_inline (const GstByteReader * reader)

  g_return_val_if_fail (reader != NULL, 0);

  return _gst_byte_reader_get_pos_unchecked (reader);


static inline gboolean
_gst_byte_reader_skip_inline (GstByteReader * reader, guint nbytes)

  g_return_val_if_fail (reader != NULL, FALSE);

  if (G_UNLIKELY (_gst_byte_reader_get_remaining_unchecked (reader) < nbytes))
    return FALSE;

  reader->byte += nbytes;
  return TRUE;

 }
{$ifndef GST_BYTE_READER_DISABLE_INLINES}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_byte_reader_dup_data(reader,size,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_data(reader,size,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_data(reader,size,val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_skip(reader,nbytes : longint) : longint;

{$endif}
{ GST_BYTE_READER_DISABLE_INLINES  }
{$endif}
{ __GST_BYTE_READER_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BYTE_READER(reader : longint) : PGstByteReader;
begin
  GST_BYTE_READER:=PGstByteReader(reader);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_dup_string(reader,str : longint) : longint;
begin
  gst_byte_reader_dup_string:=gst_byte_reader_dup_string_utf8(reader,str);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_skip_string(reader : longint) : longint;
begin
  gst_byte_reader_skip_string:=gst_byte_reader_skip_string_utf8(reader);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_string(reader,str : longint) : longint;
begin
  gst_byte_reader_get_string:=gst_byte_reader_get_string_utf8(reader,str);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_string(reader,str : longint) : longint;
begin
  gst_byte_reader_peek_string:=gst_byte_reader_peek_string_utf8(reader,str);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_init(reader,data,size : longint) : longint;
begin
  gst_byte_reader_init:=_gst_byte_reader_init_inline(reader,data,size);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_remaining(reader : longint) : longint;
begin
  gst_byte_reader_get_remaining:=_gst_byte_reader_get_remaining_inline(reader);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_size(reader : longint) : longint;
begin
  gst_byte_reader_get_size:=_gst_byte_reader_get_size_inline(reader);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_pos(reader : longint) : longint;
begin
  gst_byte_reader_get_pos:=_gst_byte_reader_get_pos_inline(reader);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint8(reader,val : longint) : longint;
begin
  gst_byte_reader_get_uint8:=G_LIKELY(_gst_byte_reader_get_uint8_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int8(reader,val : longint) : longint;
begin
  gst_byte_reader_get_int8:=G_LIKELY(_gst_byte_reader_get_int8_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint16_le(reader,val : longint) : longint;
begin
  gst_byte_reader_get_uint16_le:=G_LIKELY(_gst_byte_reader_get_uint16_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int16_le(reader,val : longint) : longint;
begin
  gst_byte_reader_get_int16_le:=G_LIKELY(_gst_byte_reader_get_int16_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint16_be(reader,val : longint) : longint;
begin
  gst_byte_reader_get_uint16_be:=G_LIKELY(_gst_byte_reader_get_uint16_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int16_be(reader,val : longint) : longint;
begin
  gst_byte_reader_get_int16_be:=G_LIKELY(_gst_byte_reader_get_int16_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint24_le(reader,val : longint) : longint;
begin
  gst_byte_reader_get_uint24_le:=G_LIKELY(_gst_byte_reader_get_uint24_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int24_le(reader,val : longint) : longint;
begin
  gst_byte_reader_get_int24_le:=G_LIKELY(_gst_byte_reader_get_int24_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint24_be(reader,val : longint) : longint;
begin
  gst_byte_reader_get_uint24_be:=G_LIKELY(_gst_byte_reader_get_uint24_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int24_be(reader,val : longint) : longint;
begin
  gst_byte_reader_get_int24_be:=G_LIKELY(_gst_byte_reader_get_int24_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint32_le(reader,val : longint) : longint;
begin
  gst_byte_reader_get_uint32_le:=G_LIKELY(_gst_byte_reader_get_uint32_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int32_le(reader,val : longint) : longint;
begin
  gst_byte_reader_get_int32_le:=G_LIKELY(_gst_byte_reader_get_int32_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint32_be(reader,val : longint) : longint;
begin
  gst_byte_reader_get_uint32_be:=G_LIKELY(_gst_byte_reader_get_uint32_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int32_be(reader,val : longint) : longint;
begin
  gst_byte_reader_get_int32_be:=G_LIKELY(_gst_byte_reader_get_int32_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint64_le(reader,val : longint) : longint;
begin
  gst_byte_reader_get_uint64_le:=G_LIKELY(_gst_byte_reader_get_uint64_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int64_le(reader,val : longint) : longint;
begin
  gst_byte_reader_get_int64_le:=G_LIKELY(_gst_byte_reader_get_int64_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_uint64_be(reader,val : longint) : longint;
begin
  gst_byte_reader_get_uint64_be:=G_LIKELY(_gst_byte_reader_get_uint64_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_int64_be(reader,val : longint) : longint;
begin
  gst_byte_reader_get_int64_be:=G_LIKELY(_gst_byte_reader_get_int64_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint8(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_uint8:=G_LIKELY(_gst_byte_reader_peek_uint8_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int8(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_int8:=G_LIKELY(_gst_byte_reader_peek_int8_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint16_le(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_uint16_le:=G_LIKELY(_gst_byte_reader_peek_uint16_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int16_le(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_int16_le:=G_LIKELY(_gst_byte_reader_peek_int16_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint16_be(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_uint16_be:=G_LIKELY(_gst_byte_reader_peek_uint16_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int16_be(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_int16_be:=G_LIKELY(_gst_byte_reader_peek_int16_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint24_le(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_uint24_le:=G_LIKELY(_gst_byte_reader_peek_uint24_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int24_le(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_int24_le:=G_LIKELY(_gst_byte_reader_peek_int24_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint24_be(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_uint24_be:=G_LIKELY(_gst_byte_reader_peek_uint24_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int24_be(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_int24_be:=G_LIKELY(_gst_byte_reader_peek_int24_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint32_le(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_uint32_le:=G_LIKELY(_gst_byte_reader_peek_uint32_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int32_le(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_int32_le:=G_LIKELY(_gst_byte_reader_peek_int32_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint32_be(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_uint32_be:=G_LIKELY(_gst_byte_reader_peek_uint32_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int32_be(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_int32_be:=G_LIKELY(_gst_byte_reader_peek_int32_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint64_le(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_uint64_le:=G_LIKELY(_gst_byte_reader_peek_uint64_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int64_le(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_int64_le:=G_LIKELY(_gst_byte_reader_peek_int64_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_uint64_be(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_uint64_be:=G_LIKELY(_gst_byte_reader_peek_uint64_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_int64_be(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_int64_be:=G_LIKELY(_gst_byte_reader_peek_int64_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_float32_le(reader,val : longint) : longint;
begin
  gst_byte_reader_get_float32_le:=G_LIKELY(_gst_byte_reader_get_float32_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_float32_be(reader,val : longint) : longint;
begin
  gst_byte_reader_get_float32_be:=G_LIKELY(_gst_byte_reader_get_float32_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_float64_le(reader,val : longint) : longint;
begin
  gst_byte_reader_get_float64_le:=G_LIKELY(_gst_byte_reader_get_float64_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_float64_be(reader,val : longint) : longint;
begin
  gst_byte_reader_get_float64_be:=G_LIKELY(_gst_byte_reader_get_float64_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_float32_le(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_float32_le:=G_LIKELY(_gst_byte_reader_peek_float32_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_float32_be(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_float32_be:=G_LIKELY(_gst_byte_reader_peek_float32_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_float64_le(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_float64_le:=G_LIKELY(_gst_byte_reader_peek_float64_le_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_float64_be(reader,val : longint) : longint;
begin
  gst_byte_reader_peek_float64_be:=G_LIKELY(_gst_byte_reader_peek_float64_be_inline(reader,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_dup_data(reader,size,val : longint) : longint;
begin
  gst_byte_reader_dup_data:=G_LIKELY(_gst_byte_reader_dup_data_inline(reader,size,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_get_data(reader,size,val : longint) : longint;
begin
  gst_byte_reader_get_data:=G_LIKELY(_gst_byte_reader_get_data_inline(reader,size,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_peek_data(reader,size,val : longint) : longint;
begin
  gst_byte_reader_peek_data:=G_LIKELY(_gst_byte_reader_peek_data_inline(reader,size,val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_byte_reader_skip(reader,nbytes : longint) : longint;
begin
  gst_byte_reader_skip:=G_LIKELY(_gst_byte_reader_skip_inline(reader,nbytes));
end;


end.
