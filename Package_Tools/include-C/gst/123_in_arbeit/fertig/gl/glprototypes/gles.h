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

void DepthRangef
                     (GLfloat near_val, GLfloat far_val);
void ClearDepthf
                     (GLclampf depth);
void ClipPlanef (GLenum plane, const GLfloat *equation);
void ReleaseShaderCompiler (void);
void GetShaderPrecisionFormat
                     (GLenum shadertype,
                      GLenum precisiontype,
                      GLint* range,
                      GLint* precision);
void ShaderBinary
                     (GLsizei n,
                      const GLuint* shaders,
                      GLenum binaryformat,
                      const GLvoid* binary,
                      GLsizei length);
void RenderbufferStorageMultisampleIMG
                     (GLenum           target,
                      GLsizei          samples,
                      GLenum           internal_format,
                      GLsizei          width,
                      GLsizei          height);
void FramebufferTexture2DMultisampleIMG
                     (GLenum           target,
                      GLenum           attachment,
                      GLenum           textarget,
                      GLuint           texture,
                      GLint            level,
                      GLsizei          samples);

