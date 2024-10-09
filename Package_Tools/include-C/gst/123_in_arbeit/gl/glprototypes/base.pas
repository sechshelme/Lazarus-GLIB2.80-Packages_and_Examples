unit base;

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
{ These are the core GL functions which we assume will always be
   available  }

procedure BindTexture(target:TGLenum; texture:TGLuint);cdecl;external libgstgl;
procedure BlendFunc(sfactor:TGLenum; dfactor:TGLenum);cdecl;external libgstgl;
procedure Clear(mask:TGLbitfield);cdecl;external libgstgl;
procedure ClearColor(red:TGLclampf; green:TGLclampf; blue:TGLclampf; alpha:TGLclampf);cdecl;external libgstgl;
procedure ClearStencil(s:TGLint);cdecl;external libgstgl;
procedure ColorMask(red:TGLboolean; green:TGLboolean; blue:TGLboolean; alpha:TGLboolean);cdecl;external libgstgl;
procedure CopyTexSubImage2D(target:TGLenum; level:TGLint; xoffset:TGLint; yoffset:TGLint; x:TGLint; 
            y:TGLint; width:TGLsizei; height:TGLsizei);cdecl;external libgstgl;
procedure DeleteTextures(n:TGLsizei; textures:PGLuint);cdecl;external libgstgl;
procedure DepthFunc(func:TGLenum);cdecl;external libgstgl;
procedure DepthMask(flag:TGLboolean);cdecl;external libgstgl;
procedure Disable(cap:TGLenum);cdecl;external libgstgl;
procedure DrawArrays(mode:TGLenum; first:TGLint; count:TGLsizei);cdecl;external libgstgl;
procedure DrawElements(mode:TGLenum; count:TGLsizei; _type:TGLenum; indices:PGLvoid);cdecl;external libgstgl;
procedure Enable(cap:TGLenum);cdecl;external libgstgl;
procedure Finish;cdecl;external libgstgl;
procedure Flush;cdecl;external libgstgl;
procedure FrontFace(mode:TGLenum);cdecl;external libgstgl;
procedure CullFace(mode:TGLenum);cdecl;external libgstgl;
procedure GenTextures(n:TGLsizei; textures:PGLuint);cdecl;external libgstgl;
function GetError:TGLenum;cdecl;external libgstgl;
procedure GetIntegerv(pname:TGLenum; params:PGLint);cdecl;external libgstgl;
procedure GetBooleanv(pname:TGLenum; params:PGLboolean);cdecl;external libgstgl;
procedure GetFloatv(pname:TGLenum; params:PGLfloat);cdecl;external libgstgl;
function GetString(name:TGLenum):PGLubyte;cdecl;external libgstgl;
procedure Hint(target:TGLenum; mode:TGLenum);cdecl;external libgstgl;
function IsTexture(texture:TGLuint):TGLboolean;cdecl;external libgstgl;
procedure PixelStorei(pname:TGLenum; param:TGLint);cdecl;external libgstgl;
procedure ReadPixels(x:TGLint; y:TGLint; width:TGLsizei; height:TGLsizei; format:TGLenum; 
            _type:TGLenum; pixels:PGLvoid);cdecl;external libgstgl;
procedure Scissor(x:TGLint; y:TGLint; width:TGLsizei; height:TGLsizei);cdecl;external libgstgl;
procedure StencilFunc(func:TGLenum; ref:TGLint; mask:TGLuint);cdecl;external libgstgl;
procedure StencilMask(mask:TGLuint);cdecl;external libgstgl;
procedure StencilOp(fail:TGLenum; zfail:TGLenum; zpass:TGLenum);cdecl;external libgstgl;
procedure TexImage2D(target:TGLenum; level:TGLint; internalformat:TGLint; width:TGLsizei; height:TGLsizei; 
            border:TGLint; format:TGLenum; _type:TGLenum; pixels:PGLvoid);cdecl;external libgstgl;
procedure TexParameterfv(target:TGLenum; pname:TGLenum; params:PGLfloat);cdecl;external libgstgl;
procedure TexParameteri(target:TGLenum; pname:TGLenum; param:TGLint);cdecl;external libgstgl;
procedure TexParameteriv(target:TGLenum; pname:TGLenum; params:PGLint);cdecl;external libgstgl;
procedure GetTexParameterfv(target:TGLenum; pname:TGLenum; params:PGLfloat);cdecl;external libgstgl;
procedure GetTexParameteriv(target:TGLenum; pname:TGLenum; params:PGLint);cdecl;external libgstgl;
procedure TexSubImage2D(target:TGLenum; level:TGLint; xoffset:TGLint; yoffset:TGLint; width:TGLsizei; 
            height:TGLsizei; format:TGLenum; _type:TGLenum; pixels:PGLvoid);cdecl;external libgstgl;
procedure CopyTexImage2D(target:TGLenum; level:TGLint; internalformat:TGLenum; x:TGLint; y:TGLint; 
            width:TGLsizei; height:TGLsizei; border:TGLint);cdecl;external libgstgl;
procedure Viewport(x:TGLint; y:TGLint; width:TGLsizei; height:TGLsizei);cdecl;external libgstgl;
function IsEnabled(cap:TGLenum):TGLboolean;cdecl;external libgstgl;
procedure LineWidth(width:TGLfloat);cdecl;external libgstgl;
procedure PolygonOffset(factor:TGLfloat; units:TGLfloat);cdecl;external libgstgl;
procedure TexParameterf(target:TGLenum; pname:TGLenum; param:TGLfloat);cdecl;external libgstgl;
procedure TexImage3D(target:TGLenum; level:TGLint; internalFormat:TGLint; width:TGLsizei; height:TGLsizei; 
            depth:TGLsizei; border:TGLint; format:TGLenum; _type:TGLenum; pixels:PGLvoid);cdecl;external libgstgl;
procedure TexSubImage3D(target:TGLenum; level:TGLint; xoffset:TGLint; yoffset:TGLint; zoffset:TGLint; 
            width:TGLsizei; height:TGLsizei; depth:TGLsizei; format:TGLenum; _type:TGLenum; 
            pixels:PGLvoid);cdecl;external libgstgl;
procedure CompressedTexImage2D(target:TGLenum; level:TGLint; internalformat:TGLenum; width:TGLsizei; height:TGLsizei; 
            border:TGLint; imageSize:TGLsizei; data:PGLvoid);cdecl;external libgstgl;
procedure CompressedTexSubImage2D(target:TGLenum; level:TGLint; xoffset:TGLint; yoffset:TGLint; width:TGLsizei; 
            height:TGLsizei; format:TGLenum; imageSize:TGLsizei; data:PGLvoid);cdecl;external libgstgl;
procedure SampleCoverage(value:TGLclampf; invert:TGLboolean);cdecl;external libgstgl;
procedure GetBufferParameteriv(target:TGLenum; pname:TGLenum; params:PGLint);cdecl;external libgstgl;
procedure GenBuffers(n:TGLsizei; buffers:PGLuint);cdecl;external libgstgl;
procedure BindBuffer(target:TGLenum; buffer:TGLuint);cdecl;external libgstgl;
procedure BufferData(target:TGLenum; size:TGLsizeiptr; data:PGLvoid; usage:TGLenum);cdecl;external libgstgl;
procedure BufferSubData(target:TGLenum; offset:TGLintptr; size:TGLsizeiptr; data:PGLvoid);cdecl;external libgstgl;
procedure DeleteBuffers(n:TGLsizei; buffers:PGLuint);cdecl;external libgstgl;
function IsBuffer(buffer:TGLuint):TGLboolean;cdecl;external libgstgl;
procedure ActiveTexture(texture:TGLenum);cdecl;external libgstgl;
function MapBuffer(target:TGLenum; access:TGLenum):pointer;cdecl;external libgstgl;
function UnmapBuffer(target:TGLenum):TGLboolean;cdecl;external libgstgl;
function GetStringi(name:TGLenum; index:TGLint):PGLubyte;cdecl;external libgstgl;
function MapBufferRange(target:TGLenum; offset:TGLintptr; length:TGLsizeiptr; access:TGLbitfield):pointer;cdecl;external libgstgl;

// === Konventiert am: 9-10-24 17:17:38 ===


implementation



end.
