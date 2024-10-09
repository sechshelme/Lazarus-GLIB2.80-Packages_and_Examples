unit mi;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2009 Julien Isorce <julien.isorce@gmail.com>
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
{$ifndef __GST_GL_MIXER_H__}
{$define __GST_GL_MIXER_H__}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{$include <gst/gl/gstglbasemixer.h>}
type

{*
 * GstGLMixer:
 *
 * Since: 1.24
  }
{*
   * GstGLMixer.parent:
   *
   * Since: 1.24
    }
{*
   * GstGLMixer.out_caps:
   *
   * the configured output #GstCaps
   *
   * Since: 1.24
    }
{< private > }
{< private > }
type
  PGstGLMixer = ^TGstGLMixer;
  TGstGLMixer = record
      parent : TGstGLBaseMixer;
      out_caps : PGstCaps;
      priv : PGstGLMixerPrivate;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLMixerClass:
 *
 * Since: 1.24
  }
{*
   * GstGLMixerClass.parent_class:
   *
   * Since: 1.24
    }
{*
   * GstGLMixerClass::process_buffers:
   *
   * Perform operations on the input buffers to produce an
   * output buffer.
   *
   * Since: 1.24
    }
{*
   * GstGLMixerClass::process_textures:
   *
   * perform operations with the input and output buffers mapped
   * as textures.  Will not be called if @process_buffers is overriden.
   *
   * Since: 1.24
    }
{< private > }
  PGstGLMixerClass = ^TGstGLMixerClass;
  TGstGLMixerClass = record
      parent_class : TGstGLBaseMixerClass;
      process_buffers : function (mix:PGstGLMixer; outbuf:PGstBuffer):Tgboolean;cdecl;
      process_textures : function (mix:PGstGLMixer; out_tex:PGstGLMemory):Tgboolean;cdecl;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_mixer_get_type:TGType;cdecl;external libgstgl;
procedure gst_gl_mixer_class_add_rgba_pad_templates(klass:PGstGLMixerClass);cdecl;external libgstgl;
function gst_gl_mixer_process_textures(mix:PGstGLMixer; outbuf:PGstBuffer):Tgboolean;cdecl;external libgstgl;
function gst_gl_mixer_get_framebuffer(mix:PGstGLMixer):PGstGLFramebuffer;cdecl;external libgstgl;
{$endif}
{ __GST_GL_MIXER_H__  }

// === Konventiert am: 9-10-24 14:59:31 ===

function GST_TYPE_GL_MIXER : TGType;
function GST_GL_MIXER(obj : Pointer) : PGstGLMixer;
function GST_GL_MIXER_CLASS(klass : Pointer) : PGstGLMixerClass;
function GST_IS_GL_MIXER(obj : Pointer) : Tgboolean;
function GST_IS_GL_MIXER_CLASS(klass : Pointer) : Tgboolean;
function GST_GL_MIXER_GET_CLASS(obj : Pointer) : PGstGLMixerClass;

implementation

function GST_TYPE_GL_MIXER : TGType;
  begin
    GST_TYPE_GL_MIXER:=gst_gl_mixer_get_type;
  end;

function GST_GL_MIXER(obj : Pointer) : PGstGLMixer;
begin
  Result := PGstGLMixer(g_type_check_instance_cast(obj, GST_TYPE_GL_MIXER));
end;

function GST_GL_MIXER_CLASS(klass : Pointer) : PGstGLMixerClass;
begin
  Result := PGstGLMixerClass(g_type_check_class_cast(klass, GST_TYPE_GL_MIXER));
end;

function GST_IS_GL_MIXER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_GL_MIXER);
end;

function GST_IS_GL_MIXER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_GL_MIXER);
end;

function GST_GL_MIXER_GET_CLASS(obj : Pointer) : PGstGLMixerClass;
begin
  Result := PGstGLMixerClass(PGTypeInstance(obj)^.g_class);
end;



end.
