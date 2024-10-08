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

 void BlendEquation
                     (GLenum                mode);
 void BlendColor
                     (GLclampf              red,
                      GLclampf              green,
                      GLclampf              blue,
                      GLclampf              alpha);
 void BlendFuncSeparate
                     (GLenum                srcRGB,
                      GLenum                dstRGB,
                      GLenum                srcAlpha,
                      GLenum                dstAlpha);
 void BlendEquationSeparate
                     (GLenum                modeRGB,
                      GLenum                modeAlpha);
 void StencilFuncSeparate
                     (GLenum face, GLenum func, GLint ref, GLuint mask);
 void StencilMaskSeparate
                     (GLenum face, GLuint mask);
 void StencilOpSeparate
                     (GLenum face, GLenum fail, GLenum zfail, GLenum zpass);

