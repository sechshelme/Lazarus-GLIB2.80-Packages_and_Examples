unit blending;

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

procedure BlendEquation(mode:TGLenum);cdecl;external libgstgl;
procedure BlendColor(red:TGLclampf; green:TGLclampf; blue:TGLclampf; alpha:TGLclampf);cdecl;external libgstgl;
procedure BlendFuncSeparate(srcRGB:TGLenum; dstRGB:TGLenum; srcAlpha:TGLenum; dstAlpha:TGLenum);cdecl;external libgstgl;
procedure BlendEquationSeparate(modeRGB:TGLenum; modeAlpha:TGLenum);cdecl;external libgstgl;
procedure StencilFuncSeparate(face:TGLenum; func:TGLenum; ref:TGLint; mask:TGLuint);cdecl;external libgstgl;
procedure StencilMaskSeparate(face:TGLenum; mask:TGLuint);cdecl;external libgstgl;
procedure StencilOpSeparate(face:TGLenum; fail:TGLenum; zfail:TGLenum; zpass:TGLenum);cdecl;external libgstgl;

// === Konventiert am: 9-10-24 17:17:41 ===


implementation



end.
