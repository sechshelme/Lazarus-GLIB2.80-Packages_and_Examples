
unit base;
interface

{
  Automatically converted by H2Pas 0.99.16 from base.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    base.h
}

Type
PGLboolean = ^TGLboolean;
PGLfloat = ^TGLfloat;
PGLint = ^TGLint;
PGLubyte = ^TGLubyte;
PGLuint = ^TGLuint;
PGLvoid = ^TGLvoid;

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

procedure BindTexture(target:TGLenum; texture:TGLuint);cdecl;external;
procedure BlendFunc(sfactor:TGLenum; dfactor:TGLenum);cdecl;external;
procedure Clear(mask:TGLbitfield);cdecl;external;
procedure ClearColor(red:TGLclampf; green:TGLclampf; blue:TGLclampf; alpha:TGLclampf);cdecl;external;
procedure ClearStencil(s:TGLint);cdecl;external;
procedure ColorMask(red:TGLboolean; green:TGLboolean; blue:TGLboolean; alpha:TGLboolean);cdecl;external;
procedure CopyTexSubImage2D(target:TGLenum; level:TGLint; xoffset:TGLint; yoffset:TGLint; x:TGLint; 
            y:TGLint; width:TGLsizei; height:TGLsizei);cdecl;external;
(* Const before declarator ignored *)
procedure DeleteTextures(n:TGLsizei; textures:PGLuint);cdecl;external;
procedure DepthFunc(func:TGLenum);cdecl;external;
procedure DepthMask(flag:TGLboolean);cdecl;external;
procedure Disable(cap:TGLenum);cdecl;external;
procedure DrawArrays(mode:TGLenum; first:TGLint; count:TGLsizei);cdecl;external;
(* Const before declarator ignored *)
procedure DrawElements(mode:TGLenum; count:TGLsizei; _type:TGLenum; indices:PGLvoid);cdecl;external;
procedure Enable(cap:TGLenum);cdecl;external;
procedure Finish;cdecl;external;
procedure Flush;cdecl;external;
procedure FrontFace(mode:TGLenum);cdecl;external;
procedure CullFace(mode:TGLenum);cdecl;external;
procedure GenTextures(n:TGLsizei; textures:PGLuint);cdecl;external;
function GetError:TGLenum;cdecl;external;
procedure GetIntegerv(pname:TGLenum; params:PGLint);cdecl;external;
procedure GetBooleanv(pname:TGLenum; params:PGLboolean);cdecl;external;
procedure GetFloatv(pname:TGLenum; params:PGLfloat);cdecl;external;
(* Const before declarator ignored *)
function GetString(name:TGLenum):PGLubyte;cdecl;external;
procedure Hint(target:TGLenum; mode:TGLenum);cdecl;external;
function IsTexture(texture:TGLuint):TGLboolean;cdecl;external;
procedure PixelStorei(pname:TGLenum; param:TGLint);cdecl;external;
procedure ReadPixels(x:TGLint; y:TGLint; width:TGLsizei; height:TGLsizei; format:TGLenum; 
            _type:TGLenum; pixels:PGLvoid);cdecl;external;
procedure Scissor(x:TGLint; y:TGLint; width:TGLsizei; height:TGLsizei);cdecl;external;
procedure StencilFunc(func:TGLenum; ref:TGLint; mask:TGLuint);cdecl;external;
procedure StencilMask(mask:TGLuint);cdecl;external;
procedure StencilOp(fail:TGLenum; zfail:TGLenum; zpass:TGLenum);cdecl;external;
(* Const before declarator ignored *)
procedure TexImage2D(target:TGLenum; level:TGLint; internalformat:TGLint; width:TGLsizei; height:TGLsizei; 
            border:TGLint; format:TGLenum; _type:TGLenum; pixels:PGLvoid);cdecl;external;
(* Const before declarator ignored *)
procedure TexParameterfv(target:TGLenum; pname:TGLenum; params:PGLfloat);cdecl;external;
procedure TexParameteri(target:TGLenum; pname:TGLenum; param:TGLint);cdecl;external;
(* Const before declarator ignored *)
procedure TexParameteriv(target:TGLenum; pname:TGLenum; params:PGLint);cdecl;external;
procedure GetTexParameterfv(target:TGLenum; pname:TGLenum; params:PGLfloat);cdecl;external;
procedure GetTexParameteriv(target:TGLenum; pname:TGLenum; params:PGLint);cdecl;external;
(* Const before declarator ignored *)
procedure TexSubImage2D(target:TGLenum; level:TGLint; xoffset:TGLint; yoffset:TGLint; width:TGLsizei; 
            height:TGLsizei; format:TGLenum; _type:TGLenum; pixels:PGLvoid);cdecl;external;
procedure CopyTexImage2D(target:TGLenum; level:TGLint; internalformat:TGLenum; x:TGLint; y:TGLint; 
            width:TGLsizei; height:TGLsizei; border:TGLint);cdecl;external;
procedure Viewport(x:TGLint; y:TGLint; width:TGLsizei; height:TGLsizei);cdecl;external;
function IsEnabled(cap:TGLenum):TGLboolean;cdecl;external;
procedure LineWidth(width:TGLfloat);cdecl;external;
procedure PolygonOffset(factor:TGLfloat; units:TGLfloat);cdecl;external;
procedure TexParameterf(target:TGLenum; pname:TGLenum; param:TGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure TexImage3D(target:TGLenum; level:TGLint; internalFormat:TGLint; width:TGLsizei; height:TGLsizei; 
            depth:TGLsizei; border:TGLint; format:TGLenum; _type:TGLenum; pixels:PGLvoid);cdecl;external;
(* Const before declarator ignored *)
procedure TexSubImage3D(target:TGLenum; level:TGLint; xoffset:TGLint; yoffset:TGLint; zoffset:TGLint; 
            width:TGLsizei; height:TGLsizei; depth:TGLsizei; format:TGLenum; _type:TGLenum; 
            pixels:PGLvoid);cdecl;external;
(* Const before declarator ignored *)
procedure CompressedTexImage2D(target:TGLenum; level:TGLint; internalformat:TGLenum; width:TGLsizei; height:TGLsizei; 
            border:TGLint; imageSize:TGLsizei; data:PGLvoid);cdecl;external;
(* Const before declarator ignored *)
procedure CompressedTexSubImage2D(target:TGLenum; level:TGLint; xoffset:TGLint; yoffset:TGLint; width:TGLsizei; 
            height:TGLsizei; format:TGLenum; imageSize:TGLsizei; data:PGLvoid);cdecl;external;
procedure SampleCoverage(value:TGLclampf; invert:TGLboolean);cdecl;external;
procedure GetBufferParameteriv(target:TGLenum; pname:TGLenum; params:PGLint);cdecl;external;
procedure GenBuffers(n:TGLsizei; buffers:PGLuint);cdecl;external;
procedure BindBuffer(target:TGLenum; buffer:TGLuint);cdecl;external;
(* Const before declarator ignored *)
procedure BufferData(target:TGLenum; size:TGLsizeiptr; data:PGLvoid; usage:TGLenum);cdecl;external;
(* Const before declarator ignored *)
procedure BufferSubData(target:TGLenum; offset:TGLintptr; size:TGLsizeiptr; data:PGLvoid);cdecl;external;
(* Const before declarator ignored *)
procedure DeleteBuffers(n:TGLsizei; buffers:PGLuint);cdecl;external;
function IsBuffer(buffer:TGLuint):TGLboolean;cdecl;external;
procedure ActiveTexture(texture:TGLenum);cdecl;external;
function MapBuffer(target:TGLenum; access:TGLenum):pointer;cdecl;external;
function UnmapBuffer(target:TGLenum):TGLboolean;cdecl;external;
(* Const before declarator ignored *)
function GetStringi(name:TGLenum; index:TGLint):PGLubyte;cdecl;external;
function MapBufferRange(target:TGLenum; offset:TGLintptr; length:TGLsizeiptr; access:TGLbitfield):pointer;cdecl;external;

implementation


end.
