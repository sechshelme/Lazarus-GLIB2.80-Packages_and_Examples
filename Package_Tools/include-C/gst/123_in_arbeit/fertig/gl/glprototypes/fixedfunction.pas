unit fixedfunction;

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

procedure ClientActiveTexture(texture:TGLenum);cdecl;external libgstgl;
procedure AlphaFunc(func:TGLenum; ref:TGLclampf);cdecl;external libgstgl;
procedure Fogf(pname:TGLenum; param:TGLfloat);cdecl;external libgstgl;
procedure Fogfv(pname:TGLenum; params:PGLfloat);cdecl;external libgstgl;
procedure LoadMatrixf(m:PGLfloat);cdecl;external libgstgl;
procedure Materialfv(face:TGLenum; pname:TGLenum; params:PGLfloat);cdecl;external libgstgl;
procedure PointSize(size:TGLfloat);cdecl;external libgstgl;
procedure TexEnvfv(target:TGLenum; pname:TGLenum; params:PGLfloat);cdecl;external libgstgl;
procedure Color4ub(red:TGLubyte; green:TGLubyte; blue:TGLubyte; alpha:TGLubyte);cdecl;external libgstgl;
procedure ColorPointer(size:TGLint; _type:TGLenum; stride:TGLsizei; pointer:PGLvoid);cdecl;external libgstgl;
procedure DisableClientState(array:TGLenum);cdecl;external libgstgl;
procedure EnableClientState(array:TGLenum);cdecl;external libgstgl;
procedure LoadIdentity;cdecl;external libgstgl;
procedure MatrixMode(mode:TGLenum);cdecl;external libgstgl;
procedure NormalPointer(_type:TGLenum; stride:TGLsizei; pointer:PGLvoid);cdecl;external libgstgl;
procedure TexCoordPointer(size:TGLint; _type:TGLenum; stride:TGLsizei; pointer:PGLvoid);cdecl;external libgstgl;
procedure TexEnvi(target:TGLenum; pname:TGLenum; param:TGLint);cdecl;external libgstgl;
procedure VertexPointer(size:TGLint; _type:TGLenum; stride:TGLsizei; pointer:PGLvoid);cdecl;external libgstgl;
procedure PushMatrix;cdecl;external libgstgl;
procedure PopMatrix;cdecl;external libgstgl;
procedure PushAttrib(mask:TGLbitfield);cdecl;external libgstgl;
procedure PopAttrib;cdecl;external libgstgl;
procedure TexImage1D(target:TGLenum; level:TGLint; internalFormat:TGLint; width:TGLsizei; border:TGLint; 
            format:TGLenum; _type:TGLenum; data:PGLvoid);cdecl;external libgstgl;
procedure Rotatef(angle:TGLfloat; x:TGLfloat; y:TGLfloat; z:TGLfloat);cdecl;external libgstgl;
procedure Translatef(x:TGLfloat; y:TGLfloat; z:TGLfloat);cdecl;external libgstgl;
procedure Scalef(x:TGLfloat; y:TGLfloat; z:TGLfloat);cdecl;external libgstgl;
procedure Lightfv(light:TGLenum; pname:TGLenum; params:PGLfloat);cdecl;external libgstgl;
procedure ColorMaterial(face:TGLenum; pname:TGLenum);cdecl;external libgstgl;
procedure ShadeModel(value:TGLenum);cdecl;external libgstgl;

// === Konventiert am: 9-10-24 17:18:01 ===


implementation



end.