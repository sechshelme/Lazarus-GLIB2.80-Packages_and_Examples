unit fbo;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2012 Matthew Waters <ystreet00@gmail.com>
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
{
 * Cogl
 *
 * An object oriented GL/GLES Abstraction/Utility Layer
 *
 * Copyright (C) 2009, 2011 Intel Corporation.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }

procedure GenRenderbuffers(n:TGLsizei; renderbuffers:PGLuint);cdecl;external libgstgl;
procedure DeleteRenderbuffers(n:TGLsizei; renderbuffers:PGLuint);cdecl;external libgstgl;
procedure BindRenderbuffer(target:TGLenum; renderbuffer:TGLuint);cdecl;external libgstgl;
procedure RenderbufferStorage(target:TGLenum; internalformat:TGLenum; width:TGLsizei; height:TGLsizei);cdecl;external libgstgl;
procedure GenFramebuffers(n:TGLsizei; framebuffers:PGLuint);cdecl;external libgstgl;
procedure BindFramebuffer(target:TGLenum; framebuffer:TGLuint);cdecl;external libgstgl;
procedure FramebufferTexture2D(target:TGLenum; attachment:TGLenum; textarget:TGLenum; texture:TGLuint; level:TGLint);cdecl;external libgstgl;
procedure FramebufferRenderbuffer(target:TGLenum; attachment:TGLenum; renderbuffertarget:TGLenum; renderbuffer:TGLuint);cdecl;external libgstgl;
function IsRenderbuffer(renderbuffer:TGLuint):TGLboolean;cdecl;external libgstgl;
function CheckFramebufferStatus(target:TGLenum):TGLenum;cdecl;external libgstgl;
procedure DeleteFramebuffers(n:TGLsizei; framebuffers:PGLuint);cdecl;external libgstgl;
procedure GenerateMipmap(target:TGLenum);cdecl;external libgstgl;
procedure GetFramebufferAttachmentParameteriv(target:TGLenum; attachment:TGLenum; pname:TGLenum; params:PGLint);cdecl;external libgstgl;
procedure GetRenderbufferParameteriv(target:TGLenum; pname:TGLenum; params:PGLint);cdecl;external libgstgl;
function IsFramebuffer(framebuffer:TGLuint):TGLboolean;cdecl;external libgstgl;
procedure BlitFramebuffer(srcX0:TGLint; srcY0:TGLint; srcX1:TGLint; srcY1:TGLint; dstX0:TGLint; 
            dstY0:TGLint; dstX1:TGLint; dstY1:TGLint; mask:TGLbitfield; filter:TGLenum);cdecl;external libgstgl;
procedure DiscardFramebuffer(target:TGLenum; numAttachments:TGLsizei; attachments:PGLenum);cdecl;external libgstgl;
procedure ReadBuffer(mode:TGLenum);cdecl;external libgstgl;
procedure DrawBuffers(n:TGLsizei; bufs:PGLenum);cdecl;external libgstgl;

// === Konventiert am: 9-10-24 17:17:59 ===


implementation



end.
