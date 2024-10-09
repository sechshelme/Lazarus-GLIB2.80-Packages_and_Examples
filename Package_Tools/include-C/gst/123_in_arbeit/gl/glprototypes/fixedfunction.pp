
unit fixedfunction;
interface

{
  Automatically converted by H2Pas 0.99.16 from fixedfunction.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fixedfunction.h
}

Type
PGLfloat = ^TGLfloat;
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

procedure ClientActiveTexture(texture:TGLenum);cdecl;external;
procedure AlphaFunc(func:TGLenum; ref:TGLclampf);cdecl;external;
procedure Fogf(pname:TGLenum; param:TGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure Fogfv(pname:TGLenum; params:PGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure LoadMatrixf(m:PGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure Materialfv(face:TGLenum; pname:TGLenum; params:PGLfloat);cdecl;external;
procedure PointSize(size:TGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure TexEnvfv(target:TGLenum; pname:TGLenum; params:PGLfloat);cdecl;external;
procedure Color4ub(red:TGLubyte; green:TGLubyte; blue:TGLubyte; alpha:TGLubyte);cdecl;external;
(* Const before declarator ignored *)
procedure ColorPointer(size:TGLint; _type:TGLenum; stride:TGLsizei; pointer:PGLvoid);cdecl;external;
procedure DisableClientState(array:TGLenum);cdecl;external;
procedure EnableClientState(array:TGLenum);cdecl;external;
procedure LoadIdentity;cdecl;external;
procedure MatrixMode(mode:TGLenum);cdecl;external;
(* Const before declarator ignored *)
procedure NormalPointer(_type:TGLenum; stride:TGLsizei; pointer:PGLvoid);cdecl;external;
(* Const before declarator ignored *)
procedure TexCoordPointer(size:TGLint; _type:TGLenum; stride:TGLsizei; pointer:PGLvoid);cdecl;external;
procedure TexEnvi(target:TGLenum; pname:TGLenum; param:TGLint);cdecl;external;
(* Const before declarator ignored *)
procedure VertexPointer(size:TGLint; _type:TGLenum; stride:TGLsizei; pointer:PGLvoid);cdecl;external;
procedure PushMatrix;cdecl;external;
procedure PopMatrix;cdecl;external;
procedure PushAttrib(mask:TGLbitfield);cdecl;external;
procedure PopAttrib;cdecl;external;
(* Const before declarator ignored *)
procedure TexImage1D(target:TGLenum; level:TGLint; internalFormat:TGLint; width:TGLsizei; border:TGLint; 
            format:TGLenum; _type:TGLenum; data:PGLvoid);cdecl;external;
procedure Rotatef(angle:TGLfloat; x:TGLfloat; y:TGLfloat; z:TGLfloat);cdecl;external;
procedure Translatef(x:TGLfloat; y:TGLfloat; z:TGLfloat);cdecl;external;
procedure Scalef(x:TGLfloat; y:TGLfloat; z:TGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure Lightfv(light:TGLenum; pname:TGLenum; params:PGLfloat);cdecl;external;
procedure ColorMaterial(face:TGLenum; pname:TGLenum);cdecl;external;
procedure ShadeModel(value:TGLenum);cdecl;external;

implementation


end.
