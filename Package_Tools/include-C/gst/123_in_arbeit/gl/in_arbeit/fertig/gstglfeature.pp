
unit gstglfeature;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstglfeature.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglfeature.h
}

Type
Pgchar = ^Tgchar;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
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
  }
{
 * Cogl
 *
 * An object oriented GL/GLES Abstraction/Utility Layer
 *
 * Copyright (C) 2009 Intel Corporation.
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
 *
 *
  }
{$ifndef __GST_GL_FEATURE_H__}
{$define __GST_GL_FEATURE_H__}
{$include <gst/gst.h>}
{$include <gst/gl/gstgl_fwd.h>}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_GL_CHECK_GL_VERSION(driver_major,driver_minor,target_major,target_minor : longint) : longint;

(* Const before declarator ignored *)
(* Const before declarator ignored *)
function gst_gl_check_extension(name:Pansichar; ext:Pgchar):Tgboolean;cdecl;external;
{$endif}
{ __GST_GL_FEATURE_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_CHECK_GL_VERSION(driver_major,driver_minor,target_major,target_minor : longint) : longint;
begin
  GST_GL_CHECK_GL_VERSION:=driver_major>(target_major or ((driver_major=(Ttarget_major(@(driver_minor))))>=target_minor));
end;


end.
