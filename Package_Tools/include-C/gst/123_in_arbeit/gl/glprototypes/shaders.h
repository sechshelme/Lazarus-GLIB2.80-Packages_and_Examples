/*
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
 */
/*
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
 */

/* This lists functions that are unique to GL 2.0 or GLES 2.0 and are
 * not in the old GLSL extensions */
GLuint CreateProgram
                     (void);
GLuint CreateShader
                     (GLenum                shaderType);
void DeleteShader
                     (GLuint                shader);
void AttachShader
                     (GLuint                program,
                      GLuint                shader);
void UseProgram
                     (GLuint                program);
void DeleteProgram
                     (GLuint                program);
void GetShaderInfoLog
                     (GLuint                shader,
                      GLsizei               maxLength,
                      GLsizei              *length,
                      char                 *infoLog);
void GetProgramInfoLog
                     (GLuint                program,
                      GLsizei               bufSize,
                      GLsizei              *length,
                      char                 *infoLog);
void GetShaderiv
                     (GLuint                shader,
                      GLenum                pname,
                      GLint                *params);
void GetProgramiv
                     (GLuint                program,
                      GLenum                pname,
                      GLint                *params);
void DetachShader
                     (GLuint program, GLuint shader);
void GetAttachedShaders
                     (GLuint program,
                      GLsizei maxcount,
                      GLsizei* count,
                      GLuint* shaders);
GLboolean IsShader
                     (GLuint shader);
GLboolean IsProgram
                     (GLuint program);
void ShaderSource
                     (GLuint                shader,
                      GLsizei               count,
                      const char          **string,
                      const GLint          *length);
void CompileShader
                     (GLuint                shader);
void LinkProgram
                     (GLuint                program);
GLint GetUniformLocation
                     (GLuint                program,
                      const char           *name);
void Uniform1f
                     (GLint                 location,
                      GLfloat               v0);
void Uniform2f
                     (GLint                 location,
                      GLfloat               v0,
                      GLfloat               v1);
void Uniform3f
                     (GLint                 location,
                      GLfloat               v0,
                      GLfloat               v1,
                      GLfloat               v2);
void Uniform4f
                     (GLint                 location,
                      GLfloat               v0,
                      GLfloat               v1,
                      GLfloat               v2,
                      GLfloat               v3);
void Uniform1fv
                     (GLint                 location,
                      GLsizei               count,
                      const GLfloat *       value);
void Uniform2fv
                     (GLint                 location,
                      GLsizei               count,
                      const GLfloat *       value);
void Uniform3fv
                     (GLint                 location,
                      GLsizei               count,
                      const GLfloat *       value);
void Uniform4fv
                     (GLint                 location,
                      GLsizei               count,
                      const GLfloat *       value);
void Uniform1i
                     (GLint                 location,
                      GLint                 v0);
void Uniform2i
                     (GLint                 location,
                      GLint                 v0,
                      GLint                 v1);
void Uniform3i
                     (GLint                 location,
                      GLint                 v0,
                      GLint                 v1,
                      GLint                 v2);
void Uniform4i
                     (GLint                 location,
                      GLint                 v0,
                      GLint                 v1,
                      GLint                 v2,
                      GLint                 v3);
void Uniform1iv
                     (GLint                 location,
                      GLsizei               count,
                      const GLint *         value);
void Uniform2iv
                     (GLint                 location,
                      GLsizei               count,
                      const GLint *         value);
void Uniform3iv
                     (GLint                 location,
                      GLsizei               count,
                      const GLint *         value);
void Uniform4iv
                     (GLint                 location,
                      GLsizei               count,
                      const GLint *         value);
void UniformMatrix2fv
                     (GLint                 location,
                      GLsizei               count,
                      GLboolean             transpose,
                      const GLfloat        *value);
void UniformMatrix3fv
                     (GLint                 location,
                      GLsizei               count,
                      GLboolean             transpose,
                      const GLfloat        *value);
void UniformMatrix4fv
                     (GLint                 location,
                      GLsizei               count,
                      GLboolean             transpose,
                      const GLfloat        *value);

void GetUniformfv
                     (GLuint                program,
                      GLint                 location,
                      GLfloat              *params);
void GetUniformiv
                     (GLuint                program,
                      GLint                 location,
                      GLint                *params);
void GetActiveUniform
                     (GLuint program,
                      GLuint index,
                      GLsizei bufsize,
                      GLsizei* length,
                      GLint* size,
                      GLenum* type,
                      GLchar* name);
void GetShaderSource
                     (GLuint shader,
                      GLsizei bufsize,
                      GLsizei* length,
                      GLchar* source);
void ValidateProgram (GLuint program);
void VertexAttribPointer
                     (GLuint		 index,
                      GLint		 size,
                      GLenum		 type,
                      GLboolean		 normalized,
                      GLsizei		 stride,
                      const GLvoid        *pointer);
void EnableVertexAttribArray
                     (GLuint		 index);
void DisableVertexAttribArray
                     (GLuint		 index);
void VertexAttrib1f (GLuint indx, GLfloat x);
void VertexAttrib1fv
                     (GLuint indx, const GLfloat* values);
void VertexAttrib2f (GLuint indx, GLfloat x, GLfloat y);
void VertexAttrib2fv
                     (GLuint indx, const GLfloat* values);
void VertexAttrib3f
                     (GLuint indx, GLfloat x, GLfloat y, GLfloat z);
void VertexAttrib3fv
                     (GLuint indx, const GLfloat* values);
void VertexAttrib4f
                     (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void VertexAttrib4fv
                     (GLuint indx, const GLfloat* values);
void GetVertexAttribfv
                     (GLuint index, GLenum pname, GLfloat* params);
void GetVertexAttribiv
                     (GLuint index, GLenum pname, GLint* params);
void GetVertexAttribPointerv
                     (GLuint index, GLenum pname, GLvoid** pointer);
GLint GetAttribLocation
                     (GLuint program, const char *name);
void BindAttribLocation
                     (GLuint program,
                      GLuint index,
                      const GLchar* name);
void GetActiveAttrib
                     (GLuint program,
                      GLuint index,
                      GLsizei bufsize,
                      GLsizei* length,
                      GLint* size,
                      GLenum* type,
                      GLchar* name);
GLuint CreateProgramObject
                     (void);
GLuint CreateShaderObject
                     (GLenum shaderType);
void DeleteObject
                     (GLuint obj);
void AttachObject
                     (GLuint container, GLuint obj);
void UseProgramObject
                     (GLuint programObj);
void GetInfoLog
                     (GLuint                obj,
                      GLsizei               maxLength,
                      GLsizei              *length,
                      char                 *infoLog);
void GetObjectParameteriv
                     (GLuint                obj,
                      GLenum                pname,
                      GLint                *params);
void DetachObject
                     (GLuint container, GLuint obj);
void GetAttachedObjects
                     (GLuint program,
                      GLsizei maxcount,
                      GLsizei* count,
                      GLuint* shaders);
void GenPrograms
                     (GLsizei               n,
                      GLuint               *programs);
void DeletePrograms
                     (GLsizei               n,
                      GLuint               *programs);
void BindProgram
                     (GLenum                target,
                      GLuint                program);
void ProgramString
                     (GLenum                target,
                      GLenum                format,
                      GLsizei               len,
                      const void           *program);
void ProgramLocalParameter4fv
                     (GLenum                target,
                      GLuint                index,
                      GLfloat              *params);
void UniformMatrix2x3fv
                     (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void UniformMatrix3x2fv
                     (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void UniformMatrix2x4fv
                     (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void UniformMatrix4x2fv
                     (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void UniformMatrix3x4fv
                     (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void UniformMatrix4x3fv
                     (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void BindFragDataLocation
                     (GLuint program, GLuint index, const GLchar * name);

