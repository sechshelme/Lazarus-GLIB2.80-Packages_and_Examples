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

 void GenRenderbuffers
                     (GLsizei               n,
                      GLuint               *renderbuffers);
 void DeleteRenderbuffers
                     (GLsizei               n,
                      const GLuint         *renderbuffers);
 void BindRenderbuffer
                     (GLenum                target,
                      GLuint                renderbuffer);
 void RenderbufferStorage
                     (GLenum                target,
                      GLenum                internalformat,
                      GLsizei               width,
                      GLsizei               height);
 void GenFramebuffers
                     (GLsizei               n,
                      GLuint               *framebuffers);
 void BindFramebuffer
                     (GLenum                target,
                      GLuint                framebuffer);
 void FramebufferTexture2D
                     (GLenum                target,
                      GLenum                attachment,
                      GLenum                textarget,
                      GLuint                texture,
                      GLint                 level);
 void FramebufferRenderbuffer
                     (GLenum                target,
                      GLenum                attachment,
                      GLenum                renderbuffertarget,
                      GLuint                renderbuffer);
 GLboolean IsRenderbuffer
                     (GLuint                renderbuffer);
 GLenum CheckFramebufferStatus
                     (GLenum                target);
 void DeleteFramebuffers
                     (GLsizei               n,
                      const                 GLuint *framebuffers);
 void GenerateMipmap
                     (GLenum                target);
 void GetFramebufferAttachmentParameteriv
                     (GLenum                target,
                      GLenum                attachment,
                      GLenum                pname,
                      GLint                *params);
 void GetRenderbufferParameteriv
                     (GLenum                target,
                      GLenum                pname,
                      GLint                *params);
 GLboolean IsFramebuffer
                     (GLuint                framebuffer);
 void BlitFramebuffer
                     (GLint                 srcX0,
                      GLint                 srcY0,
                      GLint                 srcX1,
                      GLint                 srcY1,
                      GLint                 dstX0,
                      GLint                 dstY0,
                      GLint                 dstX1,
                      GLint                 dstY1,
                      GLbitfield            mask,
                      GLenum                filter);
 void DiscardFramebuffer
                     (GLenum           target,
                      GLsizei          numAttachments,
                      const GLenum    *attachments);

 void ReadBuffer
                     (GLenum mode);
 void DrawBuffers
                     (GLsizei n, const GLenum *bufs);

