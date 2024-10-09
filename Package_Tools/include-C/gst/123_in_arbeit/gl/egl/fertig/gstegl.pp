
unit gstegl;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstegl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstegl.h
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
PEGLAttrib  = ^EGLAttrib;
PEGLuint64KHR  = ^EGLuint64KHR;
Pgchar  = ^gchar;
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
{$ifndef _GST_EGL_H_}
{$define _GST_EGL_H_}
{$include <gst/gl/gstglconfig.h>}
{$include <gst/gl/gl-prelude.h>}
{$if GST_GL_HAVE_WINDOW_DISPMANX && defined(__GNUC__)}
{$ifndef __VCCOREVER__}

const
  __VCCOREVER__ = $04000000;  
{$endif}
(** unsupported pragma#pragma GCC diagnostic push*)
(** unsupported pragma#pragma GCC diagnostic ignored "-Wredundant-decls"*)
{$if !defined(__cplusplus)}
(** unsupported pragma#pragma GCC optimize ("gnu89-inline")*)
{$endif}
{$endif}
{$ifndef __GI_SCANNER__}
{$ifndef EGL_EGLEXT_PROTOTYPES}

const
  EGL_EGLEXT_PROTOTYPES = 1;  
{$endif}
{$endif}
{$include <EGL/egl.h>}
{$include <EGL/eglext.h>}
{$if GST_GL_HAVE_WINDOW_DISPMANX && defined(__GNUC__)}
(** unsupported pragma#pragma GCC reset_options*)
(** unsupported pragma#pragma GCC diagnostic pop*)
{$endif}
{ compatibility definitions...  }
{$if !GST_GL_HAVE_EGLATTRIB}
type
  PEGLAttrib = ^TEGLAttrib;
  TEGLAttrib = Tgintptr;
{$endif}
{$if !GST_GL_HAVE_EGLUINT64KHR}
type
  PEGLuint64KHR = ^TEGLuint64KHR;
  TEGLuint64KHR = Tguint64;
{$endif}
(* Const before type ignored *)

function gst_egl_get_error_string(err:TEGLint):Pgchar;cdecl;external;
{$endif}
{ _GST_EGL_H_  }

implementation


end.
