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

void ClientActiveTexture
                     (GLenum                texture);
void AlphaFunc
                     (GLenum func, GLclampf ref);
void Fogf
                     (GLenum pname, GLfloat param);
void Fogfv
                     (GLenum pname, const GLfloat *params);
void LoadMatrixf
                     (const GLfloat *m);
void Materialfv
                     (GLenum face, GLenum pname, const GLfloat *params);
void PointSize
                     (GLfloat size);
void TexEnvfv
                     (GLenum target, GLenum pname, const GLfloat *params);
void Color4ub
                     (GLubyte red, GLubyte green, GLubyte blue, GLubyte alpha);
void ColorPointer
                     (GLint size,
                      GLenum type,
                      GLsizei stride,
                      const GLvoid *pointer);
void DisableClientState
                     (GLenum array);
void EnableClientState
                     (GLenum array);
void LoadIdentity
                     (void);
void MatrixMode
                     (GLenum mode);
void NormalPointer
                     (GLenum type, GLsizei stride, const GLvoid *pointer);
void TexCoordPointer
                     (GLint size,
                      GLenum type,
                      GLsizei stride,
                      const GLvoid *pointer);
void TexEnvi
                     (GLenum target,
                      GLenum pname,
                      GLint param);
void VertexPointer
                     (GLint size,
                      GLenum type,
                      GLsizei stride,
                      const GLvoid *pointer);
void PushMatrix
                     (void);
void PopMatrix
                     (void);
void PushAttrib
                     (GLbitfield            mask);
void PopAttrib
                     (void);
void TexImage1D
                     (GLenum                target,
                      GLint                 level,
                      GLint                 internalFormat,
                      GLsizei               width,
                      GLint                 border,
                      GLenum                format,
                      GLenum                type,
                      const GLvoid         *data);
void Rotatef
                     (GLfloat angle, GLfloat x, GLfloat y, GLfloat z);
void Translatef
                     (GLfloat x, GLfloat y, GLfloat z);
void Scalef
                     (GLfloat x, GLfloat y, GLfloat z);
void Lightfv
                     (GLenum light, GLenum pname, const GLfloat *params);
void ColorMaterial
                     (GLenum face, GLenum pname);
void ShadeModel
                     (GLenum value);

