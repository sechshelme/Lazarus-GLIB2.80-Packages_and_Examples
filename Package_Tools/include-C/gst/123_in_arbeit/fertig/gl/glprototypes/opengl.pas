unit opengl;

interface

uses
  glib280, gst124;

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
  }
{ These are the core GL functions which are only available in big
   GL  }

procedure GetTexLevelParameteriv(target:TGLenum; level:TGLint; pname:TGLenum; params:PGLint);cdecl;external libgstgl;
procedure GetTexImage(target:TGLenum; level:TGLint; format:TGLenum; _type:TGLenum; pixels:PGLvoid);cdecl;external libgstgl;
procedure DepthRange(near_val:Tdouble; far_val:Tdouble);cdecl;external libgstgl;
procedure DrawBuffer(mode:TGLenum);cdecl;external libgstgl;
procedure ClearDepth(depth:Tdouble);cdecl;external libgstgl;
procedure ClipPlane(plane:TGLenum; equation:Pdouble);cdecl;external libgstgl;

// === Konventiert am: 9-10-24 17:18:09 ===


implementation



end.
