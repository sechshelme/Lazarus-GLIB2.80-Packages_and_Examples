unit query;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2016 Matthew Waters <matthew@centricular.com>
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

procedure GenQueries(n:TGLsizei; ids:PGLuint);cdecl;external libgstgl;
procedure DeleteQueries(n:TGLsizei; ids:PGLuint);cdecl;external libgstgl;
function IsQuery(id:TGLuint):TGLboolean;cdecl;external libgstgl;
procedure BeginQuery(target:TGLenum; id:TGLuint);cdecl;external libgstgl;
procedure EndQuery(target:TGLenum);cdecl;external libgstgl;
procedure QueryCounter(id:TGLuint; target:TGLenum);cdecl;external libgstgl;
procedure GetQueryiv(target:TGLenum; pname:TGLenum; params:PGLint);cdecl;external libgstgl;
procedure GetQueryObjectiv(id:TGLuint; pname:TGLenum; params:PGLint);cdecl;external libgstgl;
procedure GetQueryObjectuiv(id:TGLuint; pname:TGLenum; params:PGLuint);cdecl;external libgstgl;
procedure GetQueryObjecti64v(id:TGLuint; pname:TGLenum; params:PGLint64);cdecl;external libgstgl;
procedure GetQueryObjectui64v(id:TGLuint; pname:TGLenum; params:PGLuint64);cdecl;external libgstgl;

// === Konventiert am: 9-10-24 17:18:12 ===


implementation



end.
