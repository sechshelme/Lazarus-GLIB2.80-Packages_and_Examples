
unit fbo;
interface

{
  Automatically converted by H2Pas 0.99.16 from fbo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fbo.h
}

Type
PGLenum = ^TGLenum;
PGLint = ^TGLint;
PGLuint = ^TGLuint;

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

procedure GenRenderbuffers(n:TGLsizei; renderbuffers:PGLuint);cdecl;external;
(* Const before declarator ignored *)
procedure DeleteRenderbuffers(n:TGLsizei; renderbuffers:PGLuint);cdecl;external;
procedure BindRenderbuffer(target:TGLenum; renderbuffer:TGLuint);cdecl;external;
procedure RenderbufferStorage(target:TGLenum; internalformat:TGLenum; width:TGLsizei; height:TGLsizei);cdecl;external;
procedure GenFramebuffers(n:TGLsizei; framebuffers:PGLuint);cdecl;external;
procedure BindFramebuffer(target:TGLenum; framebuffer:TGLuint);cdecl;external;
procedure FramebufferTexture2D(target:TGLenum; attachment:TGLenum; textarget:TGLenum; texture:TGLuint; level:TGLint);cdecl;external;
procedure FramebufferRenderbuffer(target:TGLenum; attachment:TGLenum; renderbuffertarget:TGLenum; renderbuffer:TGLuint);cdecl;external;
function IsRenderbuffer(renderbuffer:TGLuint):TGLboolean;cdecl;external;
function CheckFramebufferStatus(target:TGLenum):TGLenum;cdecl;external;
(* Const before declarator ignored *)
procedure DeleteFramebuffers(n:TGLsizei; framebuffers:PGLuint);cdecl;external;
procedure GenerateMipmap(target:TGLenum);cdecl;external;
procedure GetFramebufferAttachmentParameteriv(target:TGLenum; attachment:TGLenum; pname:TGLenum; params:PGLint);cdecl;external;
procedure GetRenderbufferParameteriv(target:TGLenum; pname:TGLenum; params:PGLint);cdecl;external;
function IsFramebuffer(framebuffer:TGLuint):TGLboolean;cdecl;external;
procedure BlitFramebuffer(srcX0:TGLint; srcY0:TGLint; srcX1:TGLint; srcY1:TGLint; dstX0:TGLint; 
            dstY0:TGLint; dstX1:TGLint; dstY1:TGLint; mask:TGLbitfield; filter:TGLenum);cdecl;external;
(* Const before declarator ignored *)
procedure DiscardFramebuffer(target:TGLenum; numAttachments:TGLsizei; attachments:PGLenum);cdecl;external;
procedure ReadBuffer(mode:TGLenum);cdecl;external;
(* Const before declarator ignored *)
procedure DrawBuffers(n:TGLsizei; bufs:PGLenum);cdecl;external;

implementation


end.
