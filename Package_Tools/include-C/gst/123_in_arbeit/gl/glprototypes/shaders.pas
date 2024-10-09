unit shaders;

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
{ This lists functions that are unique to GL 2.0 or GLES 2.0 and are
 * not in the old GLSL extensions  }

function CreateProgram:TGLuint;cdecl;external libgstgl;
function CreateShader(shaderType:TGLenum):TGLuint;cdecl;external libgstgl;
procedure DeleteShader(shader:TGLuint);cdecl;external libgstgl;
procedure AttachShader(program:TGLuint; shader:TGLuint);cdecl;external libgstgl;
procedure UseProgram(program:TGLuint);cdecl;external libgstgl;
procedure DeleteProgram(program:TGLuint);cdecl;external libgstgl;
procedure GetShaderInfoLog(shader:TGLuint; maxLength:TGLsizei; length:PGLsizei; infoLog:Pansichar);cdecl;external libgstgl;
procedure GetProgramInfoLog(program:TGLuint; bufSize:TGLsizei; length:PGLsizei; infoLog:Pansichar);cdecl;external libgstgl;
procedure GetShaderiv(shader:TGLuint; pname:TGLenum; params:PGLint);cdecl;external libgstgl;
procedure GetProgramiv(program:TGLuint; pname:TGLenum; params:PGLint);cdecl;external libgstgl;
procedure DetachShader(program:TGLuint; shader:TGLuint);cdecl;external libgstgl;
procedure GetAttachedShaders(program:TGLuint; maxcount:TGLsizei; count:PGLsizei; shaders:PGLuint);cdecl;external libgstgl;
function IsShader(shader:TGLuint):TGLboolean;cdecl;external libgstgl;
function IsProgram(program:TGLuint):TGLboolean;cdecl;external libgstgl;
procedure ShaderSource(shader:TGLuint; count:TGLsizei; _string:PPansichar; length:PGLint);cdecl;external libgstgl;
procedure CompileShader(shader:TGLuint);cdecl;external libgstgl;
procedure LinkProgram(program:TGLuint);cdecl;external libgstgl;
function GetUniformLocation(program:TGLuint; name:Pansichar):TGLint;cdecl;external libgstgl;
procedure Uniform1f(location:TGLint; v0:TGLfloat);cdecl;external libgstgl;
procedure Uniform2f(location:TGLint; v0:TGLfloat; v1:TGLfloat);cdecl;external libgstgl;
procedure Uniform3f(location:TGLint; v0:TGLfloat; v1:TGLfloat; v2:TGLfloat);cdecl;external libgstgl;
procedure Uniform4f(location:TGLint; v0:TGLfloat; v1:TGLfloat; v2:TGLfloat; v3:TGLfloat);cdecl;external libgstgl;
procedure Uniform1fv(location:TGLint; count:TGLsizei; value:PGLfloat);cdecl;external libgstgl;
procedure Uniform2fv(location:TGLint; count:TGLsizei; value:PGLfloat);cdecl;external libgstgl;
procedure Uniform3fv(location:TGLint; count:TGLsizei; value:PGLfloat);cdecl;external libgstgl;
procedure Uniform4fv(location:TGLint; count:TGLsizei; value:PGLfloat);cdecl;external libgstgl;
procedure Uniform1i(location:TGLint; v0:TGLint);cdecl;external libgstgl;
procedure Uniform2i(location:TGLint; v0:TGLint; v1:TGLint);cdecl;external libgstgl;
procedure Uniform3i(location:TGLint; v0:TGLint; v1:TGLint; v2:TGLint);cdecl;external libgstgl;
procedure Uniform4i(location:TGLint; v0:TGLint; v1:TGLint; v2:TGLint; v3:TGLint);cdecl;external libgstgl;
procedure Uniform1iv(location:TGLint; count:TGLsizei; value:PGLint);cdecl;external libgstgl;
procedure Uniform2iv(location:TGLint; count:TGLsizei; value:PGLint);cdecl;external libgstgl;
procedure Uniform3iv(location:TGLint; count:TGLsizei; value:PGLint);cdecl;external libgstgl;
procedure Uniform4iv(location:TGLint; count:TGLsizei; value:PGLint);cdecl;external libgstgl;
procedure UniformMatrix2fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external libgstgl;
procedure UniformMatrix3fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external libgstgl;
procedure UniformMatrix4fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external libgstgl;
procedure GetUniformfv(program:TGLuint; location:TGLint; params:PGLfloat);cdecl;external libgstgl;
procedure GetUniformiv(program:TGLuint; location:TGLint; params:PGLint);cdecl;external libgstgl;
procedure GetActiveUniform(program:TGLuint; index:TGLuint; bufsize:TGLsizei; length:PGLsizei; size:PGLint; 
            _type:PGLenum; name:PGLchar);cdecl;external libgstgl;
procedure GetShaderSource(shader:TGLuint; bufsize:TGLsizei; length:PGLsizei; source:PGLchar);cdecl;external libgstgl;
procedure ValidateProgram(program:TGLuint);cdecl;external libgstgl;
procedure VertexAttribPointer(index:TGLuint; size:TGLint; _type:TGLenum; normalized:TGLboolean; stride:TGLsizei; 
            pointer:PGLvoid);cdecl;external libgstgl;
procedure EnableVertexAttribArray(index:TGLuint);cdecl;external libgstgl;
procedure DisableVertexAttribArray(index:TGLuint);cdecl;external libgstgl;
procedure VertexAttrib1f(indx:TGLuint; x:TGLfloat);cdecl;external libgstgl;
procedure VertexAttrib1fv(indx:TGLuint; values:PGLfloat);cdecl;external libgstgl;
procedure VertexAttrib2f(indx:TGLuint; x:TGLfloat; y:TGLfloat);cdecl;external libgstgl;
procedure VertexAttrib2fv(indx:TGLuint; values:PGLfloat);cdecl;external libgstgl;
procedure VertexAttrib3f(indx:TGLuint; x:TGLfloat; y:TGLfloat; z:TGLfloat);cdecl;external libgstgl;
procedure VertexAttrib3fv(indx:TGLuint; values:PGLfloat);cdecl;external libgstgl;
procedure VertexAttrib4f(index:TGLuint; x:TGLfloat; y:TGLfloat; z:TGLfloat; w:TGLfloat);cdecl;external libgstgl;
procedure VertexAttrib4fv(indx:TGLuint; values:PGLfloat);cdecl;external libgstgl;
procedure GetVertexAttribfv(index:TGLuint; pname:TGLenum; params:PGLfloat);cdecl;external libgstgl;
procedure GetVertexAttribiv(index:TGLuint; pname:TGLenum; params:PGLint);cdecl;external libgstgl;
procedure GetVertexAttribPointerv(index:TGLuint; pname:TGLenum; pointer:PPGLvoid);cdecl;external libgstgl;
function GetAttribLocation(program:TGLuint; name:Pansichar):TGLint;cdecl;external libgstgl;
procedure BindAttribLocation(program:TGLuint; index:TGLuint; name:PGLchar);cdecl;external libgstgl;
procedure GetActiveAttrib(program:TGLuint; index:TGLuint; bufsize:TGLsizei; length:PGLsizei; size:PGLint; 
            _type:PGLenum; name:PGLchar);cdecl;external libgstgl;
function CreateProgramObject:TGLuint;cdecl;external libgstgl;
function CreateShaderObject(shaderType:TGLenum):TGLuint;cdecl;external libgstgl;
procedure DeleteObject(obj:TGLuint);cdecl;external libgstgl;
procedure AttachObject(container:TGLuint; obj:TGLuint);cdecl;external libgstgl;
procedure UseProgramObject(programObj:TGLuint);cdecl;external libgstgl;
procedure GetInfoLog(obj:TGLuint; maxLength:TGLsizei; length:PGLsizei; infoLog:Pansichar);cdecl;external libgstgl;
procedure GetObjectParameteriv(obj:TGLuint; pname:TGLenum; params:PGLint);cdecl;external libgstgl;
procedure DetachObject(container:TGLuint; obj:TGLuint);cdecl;external libgstgl;
procedure GetAttachedObjects(program:TGLuint; maxcount:TGLsizei; count:PGLsizei; shaders:PGLuint);cdecl;external libgstgl;
procedure GenPrograms(n:TGLsizei; programs:PGLuint);cdecl;external libgstgl;
procedure DeletePrograms(n:TGLsizei; programs:PGLuint);cdecl;external libgstgl;
procedure BindProgram(target:TGLenum; program:TGLuint);cdecl;external libgstgl;
procedure ProgramString(target:TGLenum; format:TGLenum; len:TGLsizei; program:pointer);cdecl;external libgstgl;
procedure ProgramLocalParameter4fv(target:TGLenum; index:TGLuint; params:PGLfloat);cdecl;external libgstgl;
procedure UniformMatrix2x3fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external libgstgl;
procedure UniformMatrix3x2fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external libgstgl;
procedure UniformMatrix2x4fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external libgstgl;
procedure UniformMatrix4x2fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external libgstgl;
procedure UniformMatrix3x4fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external libgstgl;
procedure UniformMatrix4x3fv(location:TGLint; count:TGLsizei; transpose:TGLboolean; value:PGLfloat);cdecl;external libgstgl;
procedure BindFragDataLocation(program:TGLuint; index:TGLuint; name:PGLchar);cdecl;external libgstgl;

// === Konventiert am: 9-10-24 17:18:15 ===


implementation



end.
