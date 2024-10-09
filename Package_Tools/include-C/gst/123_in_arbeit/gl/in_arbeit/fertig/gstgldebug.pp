
unit gstgldebug;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstgldebug.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstgldebug.h
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
PGObject  = ^GObject;
PGstDebugCategory  = ^GstDebugCategory;
PGstGLAsyncDebug  = ^GstGLAsyncDebug;
PGstGLAsyncDebugLogGetMessage  = ^GstGLAsyncDebugLogGetMessage;
PGstGLContext  = ^GstGLContext;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2015 Matthew Waters <matthew@centricular.com>
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
{$ifndef __GST_GL_DEBUG_H__}
{$define __GST_GL_DEBUG_H__}
{$include <gst/gl/gstgl_fwd.h>}
type
  PGstGLAsyncDebugLogGetMessage = ^TGstGLAsyncDebugLogGetMessage;
  TGstGLAsyncDebugLogGetMessage = function (user_data:Tgpointer):Pgchar;cdecl;
{*
 * GstGLAsyncDebug:
 *
 * #GstGLAsyncDebug an opaque structure and should only be accessed through the
 * provided API.
  }
{< private > }
(* Const before type ignored *)
(* Const before type ignored *)
{< protected > }
  PGstGLAsyncDebug = ^TGstGLAsyncDebug;
  TGstGLAsyncDebug = record
      state_flags : Tguint;cdecl;
      cat : PGstDebugCategory;
      level : TGstDebugLevel;
      file : Pgchar;
      _function : Pgchar;
      line : Tgint;
      object : PGObject;
      debug_msg : Pgchar;
      callback : TGstGLAsyncDebugLogGetMessage;
      user_data : Tgpointer;
      notify : TGDestroyNotify;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_async_debug_new:PGstGLAsyncDebug;cdecl;external;
procedure gst_gl_async_debug_free(ad:PGstGLAsyncDebug);cdecl;external;
procedure gst_gl_async_debug_init(ad:PGstGLAsyncDebug);cdecl;external;
procedure gst_gl_async_debug_unset(ad:PGstGLAsyncDebug);cdecl;external;
procedure gst_gl_async_debug_freeze(ad:PGstGLAsyncDebug);cdecl;external;
procedure gst_gl_async_debug_thaw(ad:PGstGLAsyncDebug);cdecl;external;
{*
 * GST_GL_ASYNC_CAT_LEVEL_LOG_valist:
 * @ad: the #GstGLAsyncDebug to store the message in
 * @cat: the #GstDebugCategory to output the message in
 * @level: the #GstDebugLevel
 * @object: (allow-none): a #GObject to associate with the debug message
 * @format: a printf style format string
 * @varargs: the list of arguments for @format
 *
 * Stores a debug message in @ad for later output
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_ASYNC_CAT_LEVEL_LOG_valist(ad,cat,level,object,format,varargs : longint) : longint;

{*
 * GST_GL_ASYNC_CAT_LEVEL_LOG:
 * @ad: the #GstGLAsyncDebug to store the message in
 * @cat: the #GstDebugCategory to output the message in
 * @level: the #GstDebugLevel
 * @object: (allow-none): a #GObject to associate with the debug message
 * @format: a printf style format string
 * @...: the list of arguments for @format
 *
 * Stores a debug message in @ad for later output
  }
{$endif}
{ G_HAVE_GNUC_VARARGS  }
{$endif}
{ G_HAVE_ISO_VARARGS  }
{$if !defined(GST_DISABLE_GST_DEBUG)}
(* Const before type ignored *)

procedure gst_gl_insert_debug_marker(context:PGstGLContext; format:Pgchar; args:array of const);cdecl;external;
procedure gst_gl_insert_debug_marker(context:PGstGLContext; format:Pgchar);cdecl;external;
procedure gst_gl_async_debug_output_log_msg(ad:PGstGLAsyncDebug);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_async_debug_store_log_msg(ad:PGstGLAsyncDebug; cat:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; 
            line:Tgint; object:PGObject; format:Pgchar; args:array of const);cdecl;external;
procedure gst_gl_async_debug_store_log_msg(ad:PGstGLAsyncDebug; cat:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; 
            line:Tgint; object:PGObject; format:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_gl_async_debug_store_log_msg_valist(ad:PGstGLAsyncDebug; cat:PGstDebugCategory; level:TGstDebugLevel; file:Pgchar; _function:Pgchar; 
            line:Tgint; object:PGObject; format:Pgchar; varargs:Tva_list);cdecl;external;
{$else}
{ GST_DISABLE_GST_DEBUG  }
{$else}
{ G_HAVE_GNUC_VARARGS  }
{$endif}
{ G_HAVE_GNUC_VARARGS  }
{$endif}
{ G_HAVE_ISO_VARARGS  }
{$endif}
{ GST_DISABLE_GST_DEBUG  }
{$endif}
{ __GST_GL_DEBUG_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_ASYNC_CAT_LEVEL_LOG_valist(ad,cat,level,object,format,varargs : longint) : longint;
begin
  GST_GL_ASYNC_CAT_LEVEL_LOG_valist:=gst_gl_async_debug_store_log_msg_valist(ad,cat,level,__FILE__,GST_FUNCTION,__LINE__,object,format,varargs);
end;


end.
