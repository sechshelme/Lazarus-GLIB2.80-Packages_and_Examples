
unit shaders;
interface

{
  Automatically converted by H2Pas 0.99.16 from shaders.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shaders.h
}

Type
PGLchar = ^TGLchar;
PGLenum = ^TGLenum;
PGLfloat = ^TGLfloat;
PGLint = ^TGLint;
PGLsizei = ^TGLsizei;
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
{ This lists functions that are unique to GL 2.0 or GLES 2.0 and are
 * not in the old GLSL extensions  }

function CreateProgram:TGLuint;cdecl;external;
function CreateShader(shaderType:TGLenum):TGLuint;cdecl;external;
procedure DeleteShader(shader:TGLuint);cdecl;external;
procedure AttachShader(program:TGLuint; shader:TGLuint);cdecl;external;
procedure UseProgram(program:TGLuint);cdecl;external;
procedure DeleteProgram(program:TGLuint);cdecl;external;
procedure GetShaderInfoLog(shader:TGLuint; maxLength:TGLsizei; length:PGLsizei; infoLog:Pansichar);cdecl;external;
procedure GetProgramInfoLog(program:TGLuint; bufSize:TGLsizei; length:PGLsizei; infoLog:Pansichar);cdecl;external;
procedure GetShaderiv(shader:TGLuint; pname:TGLenum; params:PGLint);cdecl;external;
procedure GetProgramiv(program:TGLuint; pname:TGLenum; params:PGLint);cdecl;external;
procedure DetachShader(program:TGLuint; shader:TGLuint);cdecl;external;
procedure GetAttachedShaders(program:TGLuint; maxcount:TGLsizei; count:PGLsizei; shaders:PGLuint);cdecl;external;
function IsShader(shader:TGLuint):TGLboolean;cdecl;external;
function IsProgram(program:TGLuint):TGLboolean;cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
procedure ShaderSource(shader:TGLuint; count:TGLsizei; _string:PPansichar; length:PGLint);cdecl;external;
procedure CompileShader(shader:TGLuint);cdecl;external;
procedure LinkProgram(program:TGLuint);cdecl;external;
(* Const before declarator ignored *)
function GetUniformLocation(program:TGLuint; name:Pansichar):TGLint;cdecl;external;
procedure Uniform1f(location:TGLint; v0:TGLfloat);cdecl;external;
procedure Uniform2f(location:TGLint; v0:TGLfloat; v1:TGLfloat);cdecl;external;
procedure Uniform3f(location:TGLint; v0:TGLfloat; v1:TGLfloat; v2:TGLfloat);cdecl;external;
procedure Uniform4f(location:TGLint; v0:TGLfloat; v1:TGLfloat; v2:TGLfloat; v3:TGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure Uniform1fv(location:TGLint; count:TGLsizei; value:PGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure Uniform2fv(location:TGLint; count:TGLsizei; value:PGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure Uniform3fv(location:TGLint; count:TGLsizei; value:PGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure Uniform4fv(location:TGLint; count:TGLsizei; value:PGLfloat);cdecl;external;
procedure Uniform1i(location:TGLint; v0:TGLint);cdecl;external;
procedure Uniform2i(location:TGLint; v0:TGLint; v1:TGLint);cdecl;external;
procedure Uniform3i(location:TGLint; v0:TGLint; v1:TGLint; v2:TGLint);cdecl;external;
procedure Uniform4i(location:TGLint; v0:TGLint; v1:TGLint; v2:TGLint; v3:TGLint);cdecl;external;
(* Const before declarator ignored *)
procedure Uniform1iv(location:TGLint; count:TGLsizei; value:PGLint);cdecl;external;
(* Const before declarator ignored *)
procedure Uniform2iv(location:TGLint; count:TGLsizei; value:PGLint);cdecl;external;
(* Const before declarator ignored *)
procedure Uniform3iv(location:TGLint; count:TGLsizei; value:PGLint);cdecl;external;
(* Const before declarator ignored *)
procedure Uniform4iv(location:TGLint; count:TGLsizei; value:PGLint);cdecl;external;
(* Const before declarator ignored *)
procedure UniformMatrix2fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure UniformMatrix3fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure UniformMatrix4fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external;
procedure GetUniformfv(program:TGLuint; location:TGLint; params:PGLfloat);cdecl;external;
procedure GetUniformiv(program:TGLuint; location:TGLint; params:PGLint);cdecl;external;
procedure GetActiveUniform(program:TGLuint; index:TGLuint; bufsize:TGLsizei; length:PGLsizei; size:PGLint; 
            _type:PGLenum; name:PGLchar);cdecl;external;
procedure GetShaderSource(shader:TGLuint; bufsize:TGLsizei; length:PGLsizei; source:PGLchar);cdecl;external;
procedure ValidateProgram(program:TGLuint);cdecl;external;
(* Const before declarator ignored *)
procedure VertexAttribPointer(index:TGLuint; size:TGLint; _type:TGLenum; normalized:TGLboolean; stride:TGLsizei; 
            pointer:PGLvoid);cdecl;external;
procedure EnableVertexAttribArray(index:TGLuint);cdecl;external;
procedure DisableVertexAttribArray(index:TGLuint);cdecl;external;
procedure VertexAttrib1f(indx:TGLuint; x:TGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure VertexAttrib1fv(indx:TGLuint; values:PGLfloat);cdecl;external;
procedure VertexAttrib2f(indx:TGLuint; x:TGLfloat; y:TGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure VertexAttrib2fv(indx:TGLuint; values:PGLfloat);cdecl;external;
procedure VertexAttrib3f(indx:TGLuint; x:TGLfloat; y:TGLfloat; z:TGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure VertexAttrib3fv(indx:TGLuint; values:PGLfloat);cdecl;external;
procedure VertexAttrib4f(index:TGLuint; x:TGLfloat; y:TGLfloat; z:TGLfloat; w:TGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure VertexAttrib4fv(indx:TGLuint; values:PGLfloat);cdecl;external;
procedure GetVertexAttribfv(index:TGLuint; pname:TGLenum; params:PGLfloat);cdecl;external;
procedure GetVertexAttribiv(index:TGLuint; pname:TGLenum; params:PGLint);cdecl;external;
procedure GetVertexAttribPointerv(index:TGLuint; pname:TGLenum; pointer:PPGLvoid);cdecl;external;
(* Const before declarator ignored *)
function GetAttribLocation(program:TGLuint; name:Pansichar):TGLint;cdecl;external;
(* Const before declarator ignored *)
procedure BindAttribLocation(program:TGLuint; index:TGLuint; name:PGLchar);cdecl;external;
procedure GetActiveAttrib(program:TGLuint; index:TGLuint; bufsize:TGLsizei; length:PGLsizei; size:PGLint; 
            _type:PGLenum; name:PGLchar);cdecl;external;
function CreateProgramObject:TGLuint;cdecl;external;
function CreateShaderObject(shaderType:TGLenum):TGLuint;cdecl;external;
procedure DeleteObject(obj:TGLuint);cdecl;external;
procedure AttachObject(container:TGLuint; obj:TGLuint);cdecl;external;
procedure UseProgramObject(programObj:TGLuint);cdecl;external;
procedure GetInfoLog(obj:TGLuint; maxLength:TGLsizei; length:PGLsizei; infoLog:Pansichar);cdecl;external;
procedure GetObjectParameteriv(obj:TGLuint; pname:TGLenum; params:PGLint);cdecl;external;
procedure DetachObject(container:TGLuint; obj:TGLuint);cdecl;external;
procedure GetAttachedObjects(program:TGLuint; maxcount:TGLsizei; count:PGLsizei; shaders:PGLuint);cdecl;external;
procedure GenPrograms(n:TGLsizei; programs:PGLuint);cdecl;external;
procedure DeletePrograms(n:TGLsizei; programs:PGLuint);cdecl;external;
procedure BindProgram(target:TGLenum; program:TGLuint);cdecl;external;
(* Const before declarator ignored *)
procedure ProgramString(target:TGLenum; format:TGLenum; len:TGLsizei; program:pointer);cdecl;external;
procedure ProgramLocalParameter4fv(target:TGLenum; index:TGLuint; params:PGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure UniformMatrix2x3fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure UniformMatrix3x2fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure UniformMatrix2x4fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure UniformMatrix4x2fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure UniformMatrix3x4fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure UniformMatrix4x3fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external;
(* Const before declarator ignored *)
procedure BindFragDataLocation(program:TGLuint; index:TGLuint; name:PGLchar);cdecl;external;

implementation


end.
