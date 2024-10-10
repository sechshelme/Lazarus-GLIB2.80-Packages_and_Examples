unit debug;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2014 Matthew Waters <ystreet00@gmail.com>
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

procedure DebugMessageControl(source:TGLenum; _type:TGLenum; severity:TGLenum; count:TGLsizei; ids:PGLuint; 
            enabled:Tgboolean);cdecl;external libgstgl;
procedure DebugMessageInsert(source:TGLenum; _type:TGLenum; id:TGLuint; severity:TGLenum; length:TGLsizei; 
            message:Pgchar);cdecl;external libgstgl;
procedure DebugMessageCallback(callback:TGST_GL_DEBUG_PROC; user_data:Tgpointer);cdecl;external libgstgl;
function GetDebugMessageLog(count:TGLuint; bufSize:TGLsizei; sources:PGLenum; types:PGLenum; ids:PGLuint; 
           severities:PGLenum; lengths:PGLsizei; messageLog:Pgchar):TGLuint;cdecl;external libgstgl;
procedure GetPointerv(pname:TGLenum; params:Pgpointer);cdecl;external libgstgl;
procedure PushDebugGroup(source:TGLenum; id:TGLuint; length:TGLsizei; message:Pgchar);cdecl;external libgstgl;
procedure PopDebugGroup;cdecl;external libgstgl;
procedure ObjectLabel(identifier:TGLenum; name:TGLuint; length:TGLsizei; _label:Pgchar);cdecl;external libgstgl;
procedure GetObjectLabel(identifier:TGLenum; name:TGLuint; bufSize:TGLsizei; length:PGLsizei; _label:Pgchar);cdecl;external libgstgl;
procedure ObjectPtrLabel(ptr:Tgpointer; length:TGLsizei; _label:Pgchar);cdecl;external libgstgl;
procedure GetObjectPtrLabel(ptr:Tgpointer; bufSize:TGLsizei; length:PGLsizei; _label:Pgchar);cdecl;external libgstgl;
procedure InsertEventMarker(length:TGLsizei; message:Pgchar);cdecl;external libgstgl;
procedure PushGroupMarker(length:TGLsizei; message:Pgchar);cdecl;external libgstgl;
procedure PopGroupMarker;cdecl;external libgstgl;
procedure StringMarker(length:TGLsizei; message:Pgchar);cdecl;external libgstgl;

// === Konventiert am: 9-10-24 17:17:53 ===


implementation



end.
