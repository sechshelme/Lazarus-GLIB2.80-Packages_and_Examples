/*
 * GStreamer
 * Copyright (C) 2014 Matthew Waters <ystreet00@gmail.com>
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

 void DebugMessageControl
                     (GLenum source,
                      GLenum type,
                      GLenum severity,
                      GLsizei count,
                      const GLuint* ids,
                      gboolean enabled);
 void DebugMessageInsert
                     (GLenum source,
                      GLenum type,
                      GLuint id,
                      GLenum severity,
                      GLsizei length,
                      const gchar *message);
 void DebugMessageCallback
                     (GST_GL_DEBUG_PROC callback,
                      gpointer user_data);
GLuint GetDebugMessageLog
                     (GLuint count,
                      GLsizei bufSize,
                      GLenum* sources,
                      GLenum* types,
                      GLuint* ids,
                      GLenum* severities,
                      GLsizei* lengths,
                      gchar* messageLog);
 void GetPointerv
                     (GLenum pname,
                      gpointer * params);
 void PushDebugGroup
                     (GLenum source,
                      GLuint id,
                      GLsizei length,
                      const gchar * message);
 void PopDebugGroup (void);
 void ObjectLabel
                     (GLenum identifier,
                      GLuint name,
                      GLsizei length,
                      const gchar *label);
 void GetObjectLabel
                     (GLenum identifier,
                      GLuint name,
                      GLsizei bufSize, 
                      GLsizei *length,
                      gchar *label);
 void ObjectPtrLabel
                     (gpointer ptr,
                      GLsizei length,
                      const gchar *label);
 void GetObjectPtrLabel
                     (gpointer ptr,
                      GLsizei bufSize,
                      GLsizei *length,
                      gchar *label);
 void InsertEventMarker
                     (GLsizei length,
                      const gchar * message);
 void PushGroupMarker
                     (GLsizei length,
                      const gchar * message);
 void PopGroupMarker
                     (void);
 void StringMarker
                     (GLsizei length,
                      const gchar * message);

