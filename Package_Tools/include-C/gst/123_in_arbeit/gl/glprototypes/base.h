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


/* These are the core GL functions which we assume will always be
   available */
void BindTexture
                     (GLenum target, GLuint texture);
 void BlendFunc
                     (GLenum sfactor, GLenum dfactor);
 void Clear
                     (GLbitfield mask);
void ClearColor
                     (GLclampf red,
                      GLclampf green,
                      GLclampf blue,
                      GLclampf alpha);
void ClearStencil
                     (GLint s);
 void ColorMask
                     (GLboolean red,
                      GLboolean green,
                      GLboolean blue,
                      GLboolean alpha);
 void CopyTexSubImage2D
                     (GLenum target,
                      GLint level,
                      GLint xoffset,
                      GLint yoffset,
                      GLint x,
                      GLint y,
                      GLsizei width,
                      GLsizei height);
 void DeleteTextures
                     (GLsizei n, const GLuint* textures);
 void DepthFunc
                     (GLenum func);
 void DepthMask
                     (GLboolean flag);
 void Disable
                     (GLenum cap);
 void DrawArrays
                     (GLenum mode, GLint first, GLsizei count);
 void DrawElements
                     (GLenum mode,
                      GLsizei count,
                      GLenum type,
                      const GLvoid* indices);
void Enable
                     (GLenum cap);
 void Finish
                     (void);
 void Flush
                     (void);
 void FrontFace
                     (GLenum mode);
 void CullFace
                     (GLenum mode);
 void GenTextures
                     (GLsizei n, GLuint* textures);
 GLenum GetError
                     (void);
 void GetIntegerv
                     (GLenum pname, GLint* params);
 void GetBooleanv
                     (GLenum pname, GLboolean* params);
 void GetFloatv
                     (GLenum pname, GLfloat* params);
 const GLubyte* GetString
                     (GLenum name);
 void Hint
                     (GLenum target, GLenum mode);
 GLboolean IsTexture
                     (GLuint texture);
 void PixelStorei
                     (GLenum pname, GLint param);
 void ReadPixels
                     (GLint x,
                      GLint y,
                      GLsizei width,
                      GLsizei height,
                      GLenum format,
                      GLenum type,
                      GLvoid* pixels);
 void Scissor
                     (GLint x, GLint y, GLsizei width, GLsizei height);
 void StencilFunc
                     (GLenum func, GLint ref, GLuint mask);
 void StencilMask
                     (GLuint mask);
 void StencilOp
                     (GLenum fail, GLenum zfail, GLenum zpass);
 void TexImage2D
                     (GLenum target,
                      GLint level,
                      GLint internalformat,
                      GLsizei width,
                      GLsizei height,
                      GLint border,
                      GLenum format,
                      GLenum type,
                      const GLvoid* pixels);
 void TexParameterfv
                     (GLenum target, GLenum pname, const GLfloat* params);
 void TexParameteri
                     (GLenum target, GLenum pname, GLint param);
 void TexParameteriv
                     (GLenum target, GLenum pname, const GLint* params);
 void GetTexParameterfv
                     (GLenum target, GLenum pname, GLfloat* params);
 void GetTexParameteriv
                     (GLenum target, GLenum pname, GLint* params);
 void TexSubImage2D
                     (GLenum target,
                      GLint level,
                      GLint xoffset,
                      GLint yoffset,
                      GLsizei width,
                      GLsizei height,
                      GLenum format,
                      GLenum type,
                      const GLvoid* pixels);
void CopyTexImage2D
                     (GLenum target,
                      GLint level,
                      GLenum internalformat,
                      GLint x,
                      GLint y,
                      GLsizei width,
                      GLsizei height,
                      GLint border);
void Viewport
                     (GLint x, GLint y, GLsizei width, GLsizei height);
 GLboolean IsEnabled (GLenum cap);
 void LineWidth (GLfloat width);
 void PolygonOffset (GLfloat factor, GLfloat units);
 void TexParameterf
                     (GLenum target,
                      GLenum pname,
                      GLfloat param);
 void TexImage3D
                     (GLenum target, GLint level,
                      GLint internalFormat,
                      GLsizei width, GLsizei height,
                      GLsizei depth, GLint border,
                      GLenum format, GLenum type,
                      const GLvoid *pixels);
 void TexSubImage3D
                     (GLenum target, GLint level,
                      GLint xoffset, GLint yoffset,
                      GLint zoffset, GLsizei width,
                      GLsizei height, GLsizei depth,
                      GLenum format,
                      GLenum type, const GLvoid *pixels);
 void CompressedTexImage2D
                     (GLenum target,
                      GLint level,
                      GLenum internalformat,
                      GLsizei width,
                      GLsizei height,
                      GLint border,
                      GLsizei imageSize,
                      const GLvoid* data);
 void CompressedTexSubImage2D
                     (GLenum target,
                      GLint level,
                      GLint xoffset,
                      GLint yoffset,
                      GLsizei width,
                      GLsizei height,
                      GLenum format,
                      GLsizei imageSize,
                      const GLvoid* data);
 void SampleCoverage
                     (GLclampf value, GLboolean invert);
 void GetBufferParameteriv
                     (GLenum target, GLenum pname, GLint* params);
 void GenBuffers
                     (GLsizei		 n,
                      GLuint		*buffers);
 void BindBuffer
                     (GLenum		 target,
                      GLuint		 buffer);
 void BufferData
                     (GLenum		 target,
                      GLsizeiptr		 size,
                      const GLvoid		*data,
                      GLenum		 usage);
 void BufferSubData
                     (GLenum		 target,
                      GLintptr		 offset,
                      GLsizeiptr		 size,
                      const GLvoid		*data);
 void DeleteBuffers
                     (GLsizei		 n,
                      const GLuint		*buffers);
 GLboolean IsBuffer
                     (GLuint               buffer);
 void ActiveTexture
                   (GLenum                texture);
 void * MapBuffer
                   (GLenum		 target,
                    GLenum		 access);
 GLboolean UnmapBuffer
                   (GLenum		 target);
 const GLubyte* GetStringi
                     (GLenum name, GLint index);
 void * MapBufferRange
                     (GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access);

