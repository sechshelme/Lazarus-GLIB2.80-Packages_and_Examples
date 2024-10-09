
unit buffers;
interface

{
  Automatically converted by H2Pas 0.99.16 from buffers.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    buffers.h
}


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

procedure CopyBufferSubData(readTarget:TGLenum; writeTarget:TGLenum; readOffset:TGLintptr; writeOffset:TGLintptr; size:TGLsizeiptr);cdecl;external;
procedure GetBufferSubData(target:TGLenum; offset:TGLintptr; size:TGLsizeiptr; data:pointer);cdecl;external;

implementation


end.
