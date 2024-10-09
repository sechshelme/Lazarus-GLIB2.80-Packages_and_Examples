unit 1;

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
{$ifndef __GST_GL_BASE_MIXER_H__}
{$define __GST_GL_BASE_MIXER_H__}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{$include <gst/video/gstvideoaggregator.h>}
{$include <gst/gl/gstglcontext.h>}

type
{*
 * GstGLBaseMixer:
 *
 * Since: 1.24
  }
{*
   * GstGLBaseMixer.parent:
   *
   * parent #GstVideoAggregator
   *
   * Since: 1.24
    }
{*
   * GstGLBaseMixer.display:
   *
   * the currently configured #GstGLDisplay
   *
   * Since: 1.24
    }
{*
   * GstGLBaseMixer.context:
   *
   * the currently configured #GstGLContext
   *
   * Since: 1.24
    }
{< private > }
  PGstGLBaseMixer = ^TGstGLBaseMixer;
  TGstGLBaseMixer = record
      parent : TGstVideoAggregator;
      display : PGstGLDisplay;
      context : PGstGLContext;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
      priv : PGstGLBaseMixerPrivate;
    end;

{*
 * GstGLBaseMixerClass:
 *
 * Since: 1.24
  }
{*
   * GstGLBaseMixerClass.parent_class:
   *
   * the parent #GstVideoAggregatorClass
   *
   * Since: 1.24
    }
{*
   * GstGLBaseMixerClass.supported_gl_api:
   *
   * the logical-OR of #GstGLAPI's supported by this element
   *
   * Since: 1.24
    }
{*
   * GstGLBaseMixerClass::gl_start:
   *
   * called in the GL thread to setup the element GL state.
   *
   * Returns: whether the start was successful
   *
   * Since: 1.24
    }
{*
   * GstGLBaseMixerClass::gl_stop:
   *
   * called in the GL thread to setup the element GL state.
   *
   * Since: 1.24
    }
{< private > }
  PGstGLBaseMixerClass = ^TGstGLBaseMixerClass;
  TGstGLBaseMixerClass = record
      parent_class : TGstVideoAggregatorClass;
      supported_gl_api : TGstGLAPI;
      gl_start : function (mix:PGstGLBaseMixer):Tgboolean;cdecl;
      gl_stop : procedure (mix:PGstGLBaseMixer);cdecl;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_base_mixer_get_type:TGType;cdecl;external libgstgl;
function gst_gl_base_mixer_get_gl_context(mix:PGstGLBaseMixer):PGstGLContext;cdecl;external libgstgl;
{$endif}
{ __GST_GL_BASE_MIXER_H__  }

// === Konventiert am: 9-10-24 09:18:18 ===

function GST_TYPE_GL_BASE_MIXER : TGType;
function GST_GL_BASE_MIXER(obj : Pointer) : PGstGLBaseMixer;
function GST_GL_BASE_MIXER_CLASS(klass : Pointer) : PGstGLBaseMixerClass;
function GST_IS_GL_BASE_MIXER(obj : Pointer) : Tgboolean;
function GST_IS_GL_BASE_MIXER_CLASS(klass : Pointer) : Tgboolean;
function GST_GL_BASE_MIXER_GET_CLASS(obj : Pointer) : PGstGLBaseMixerClass;

implementation

function GST_TYPE_GL_BASE_MIXER : TGType;
  begin
    GST_TYPE_GL_BASE_MIXER:=gst_gl_base_mixer_get_type;
  end;

function GST_GL_BASE_MIXER(obj : Pointer) : PGstGLBaseMixer;
begin
  Result := PGstGLBaseMixer(g_type_check_instance_cast(obj, GST_TYPE_GL_BASE_MIXER));
end;

function GST_GL_BASE_MIXER_CLASS(klass : Pointer) : PGstGLBaseMixerClass;
begin
  Result := PGstGLBaseMixerClass(g_type_check_class_cast(klass, GST_TYPE_GL_BASE_MIXER));
end;

function GST_IS_GL_BASE_MIXER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_GL_BASE_MIXER);
end;

function GST_IS_GL_BASE_MIXER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_GL_BASE_MIXER);
end;

function GST_GL_BASE_MIXER_GET_CLASS(obj : Pointer) : PGstGLBaseMixerClass;
begin
  Result := PGstGLBaseMixerClass(PGTypeInstance(obj)^.g_class);
end;



end.
