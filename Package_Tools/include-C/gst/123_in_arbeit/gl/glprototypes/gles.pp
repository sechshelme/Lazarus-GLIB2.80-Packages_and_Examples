
unit gles;
interface

{
  Automatically converted by H2Pas 0.99.16 from gles.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gles.h
}

Type
PGLfloat = ^TGLfloat;
PGLint = ^TGLint;
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

procedure DepthRangef(near_val:TGLfloat; far_val:TGLfloat);cdecl;external;
procedure ClearDepthf(depth:TGLclampf);cdecl;external;
(* Const before declarator ignored *)
procedure ClipPlanef(plane:TGLenum; equation:PGLfloat);cdecl;external;
procedure ReleaseShaderCompiler;cdecl;external;
procedure GetShaderPrecisionFormat(shadertype:TGLenum; precisiontype:TGLenum; range:PGLint; precision:PGLint);cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
procedure ShaderBinary(n:TGLsizei; shaders:PGLuint; binaryformat:TGLenum; binary:PGLvoid; length:TGLsizei);cdecl;external;
procedure RenderbufferStorageMultisampleIMG(target:TGLenum; samples:TGLsizei; internal_format:TGLenum; width:TGLsizei; height:TGLsizei);cdecl;external;
procedure FramebufferTexture2DMultisampleIMG(target:TGLenum; attachment:TGLenum; textarget:TGLenum; texture:TGLuint; level:TGLint; 
            samples:TGLsizei);cdecl;external;

implementation


end.
