
unit gl_enumtypes;
interface

{
  Automatically converted by H2Pas 1.0.0 from gl_enumtypes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gl_enumtypes.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is generated by glib-mkenums, do not modify it. This code is licensed under the same license as the containing project. Note that it links to GLib, so must comply with the LGPL linking clauses.  }
(** unsupported pragma#pragma once*)
{$include <gst/gst.h>}
{$include <gst/gl/gstgl_fwd.h>}
{ enumerations from "gstgl_enums.h"  }

function gst_gl_texture_target_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_TEXTURE_TARGET : longint; { return type might be wrong }

{ enumerations from "gstglapi.h"  }
function gst_gl_api_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_API : longint; { return type might be wrong }

function gst_gl_platform_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_PLATFORM : longint; { return type might be wrong }

{ enumerations from "gstglbasememory.h"  }
function gst_gl_base_memory_error_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_BASE_MEMORY_ERROR : longint; { return type might be wrong }

function gst_gl_base_memory_transfer_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_BASE_MEMORY_TRANSFER : longint; { return type might be wrong }

{ enumerations from "gstglcontext.h"  }
function gst_gl_context_error_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_CONTEXT_ERROR : longint; { return type might be wrong }

{ enumerations from "gstglcontextconfig.h"  }
function gst_gl_config_caveat_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_CONFIG_CAVEAT : longint; { return type might be wrong }

function gst_gl_config_surface_type_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_CONFIG_SURFACE_TYPE : longint; { return type might be wrong }

{ enumerations from "gstgldisplay.h"  }
function gst_gl_display_type_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_DISPLAY_TYPE : longint; { return type might be wrong }

{ enumerations from "gstglformat.h"  }
function gst_gl_format_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_FORMAT : longint; { return type might be wrong }

{ enumerations from "gstglquery.h"  }
function gst_gl_query_type_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_QUERY_TYPE : longint; { return type might be wrong }

{ enumerations from "gstglsl.h"  }
function gst_glsl_error_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GLSL_ERROR : longint; { return type might be wrong }

function gst_glsl_version_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GLSL_VERSION : longint; { return type might be wrong }

function gst_glsl_profile_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GLSL_PROFILE : longint; { return type might be wrong }

{ enumerations from "gstglupload.h"  }
function gst_gl_upload_return_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_UPLOAD_RETURN : longint; { return type might be wrong }

{ enumerations from "gstglviewconvert.h"  }
function gst_gl_stereo_downmix_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_STEREO_DOWNMIX : longint; { return type might be wrong }

{ enumerations from "gstglwindow.h"  }
function gst_gl_window_error_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_WINDOW_ERROR : longint; { return type might be wrong }

{ Generated data ends here  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_TEXTURE_TARGET : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_TEXTURE_TARGET:=gst_gl_texture_target_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_API : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_API:=gst_gl_api_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_PLATFORM : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_PLATFORM:=gst_gl_platform_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_BASE_MEMORY_ERROR : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_BASE_MEMORY_ERROR:=gst_gl_base_memory_error_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_BASE_MEMORY_TRANSFER : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_BASE_MEMORY_TRANSFER:=gst_gl_base_memory_transfer_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_CONTEXT_ERROR : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_CONTEXT_ERROR:=gst_gl_context_error_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_CONFIG_CAVEAT : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_CONFIG_CAVEAT:=gst_gl_config_caveat_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_CONFIG_SURFACE_TYPE : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_CONFIG_SURFACE_TYPE:=gst_gl_config_surface_type_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_DISPLAY_TYPE : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_DISPLAY_TYPE:=gst_gl_display_type_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_FORMAT : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_FORMAT:=gst_gl_format_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_QUERY_TYPE : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_QUERY_TYPE:=gst_gl_query_type_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GLSL_ERROR : longint; { return type might be wrong }
  begin
    GST_TYPE_GLSL_ERROR:=gst_glsl_error_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GLSL_VERSION : longint; { return type might be wrong }
  begin
    GST_TYPE_GLSL_VERSION:=gst_glsl_version_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GLSL_PROFILE : longint; { return type might be wrong }
  begin
    GST_TYPE_GLSL_PROFILE:=gst_glsl_profile_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_UPLOAD_RETURN : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_UPLOAD_RETURN:=gst_gl_upload_return_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_STEREO_DOWNMIX : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_STEREO_DOWNMIX:=gst_gl_stereo_downmix_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_WINDOW_ERROR : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_WINDOW_ERROR:=gst_gl_window_error_get_type;
  end;


end.
