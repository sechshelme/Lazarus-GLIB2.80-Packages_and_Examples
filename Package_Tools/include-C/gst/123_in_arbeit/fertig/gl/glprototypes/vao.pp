
unit vao;
interface

{
  Automatically converted by H2Pas 0.99.16 from vao.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vao.h
}

Type
PGLuint = ^TGLuint;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2014 Matthew Waters <matthew@centricular.com>
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

procedure GenVertexArrays(n:TGLsizei; arrays:PGLuint);cdecl;external;
procedure DeleteVertexArrays(n:TGLsizei; arrays:PGLuint);cdecl;external;
procedure BindVertexArray(array:TGLuint);cdecl;external;
function IsVertexArray(array:TGLuint):TGLboolean;cdecl;external;

implementation


end.
