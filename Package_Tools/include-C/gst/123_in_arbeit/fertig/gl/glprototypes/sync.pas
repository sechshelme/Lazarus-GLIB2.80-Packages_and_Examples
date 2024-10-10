unit sync;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2014-2015 Matthew Waters <matthew@centricular.com>
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

function FenceSync(condition:TGLenum; flags:TGLbitfield):TGLsync;cdecl;external libgstgl;
function IsSync(sync:TGLsync):TGLboolean;cdecl;external libgstgl;
procedure DeleteSync(sync:TGLsync);cdecl;external libgstgl;
function ClientWaitSync(sync:TGLsync; flags:TGLbitfield; timeout:TGLuint64):TGLenum;cdecl;external libgstgl;
procedure WaitSync(sync:TGLsync; flags:TGLbitfield; timeout:TGLuint64);cdecl;external libgstgl;
procedure GetSynciv(sync:TGLsync; name:TGLenum; buf_size:TGLsizei; length:PGLsizei; values:PGLint);cdecl;external libgstgl;

// === Konventiert am: 9-10-24 17:18:22 ===


implementation



end.
