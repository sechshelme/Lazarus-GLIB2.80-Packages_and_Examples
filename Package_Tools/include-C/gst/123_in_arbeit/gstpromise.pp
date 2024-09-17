
unit gstpromise;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstpromise.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstpromise.h
}

    { Pointers to basic pascal types, inserted by h2pas conversion program.}
    Type
      PLongint  = ^Longint;
      PSmallInt = ^SmallInt;
      PByte     = ^Byte;
      PWord     = ^Word;
      PDWord    = ^DWord;
      PDouble   = ^Double;

    Type
    PGstPromise  = ^GstPromise;
    PGstPromiseResult  = ^GstPromiseResult;
    PGstStructure  = ^GstStructure;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2017 Matthew Waters <matthew@centricular.com>
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
{$ifndef __GST_PROMISE_H__}
{$define __GST_PROMISE_H__}
{$include <gst/gst.h>}

function gst_promise_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_PROMISE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PROMISE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PROMISE(obj : longint) : PGstPromise;

type
{*
 * GstPromiseResult:
 * @GST_PROMISE_RESULT_PENDING: Initial state. Waiting for transition to any
 * 	other state.
 * @GST_PROMISE_RESULT_INTERRUPTED: Interrupted by the consumer as it doesn't
 * 	want the value anymore.
 * @GST_PROMISE_RESULT_REPLIED: A producer marked a reply
 * @GST_PROMISE_RESULT_EXPIRED: The promise expired (the carrying object
 * 	lost all refs) and the promise will never be fulfilled.
 *
 * The result of a #GstPromise
 *
 * Since: 1.14
  }

  PGstPromiseResult = ^TGstPromiseResult;
  TGstPromiseResult =  Longint;
  Const
    GST_PROMISE_RESULT_PENDING = 0;
    GST_PROMISE_RESULT_INTERRUPTED = 1;
    GST_PROMISE_RESULT_REPLIED = 2;
    GST_PROMISE_RESULT_EXPIRED = 3;
;
{*
 * GstPromiseChangeFunc:
 * @promise: a #GstPromise
 * @user_data: (closure): user data
 *
 * Since: 1.14
  }
type

  TGstPromiseChangeFunc = procedure (promise:PGstPromise; user_data:Tgpointer);cdecl;
{*
 * GstPromise:
 * @parent: parent #GstMiniObject
 *
 * Since: 1.14
  }
  PGstPromise = ^TGstPromise;
  TGstPromise = record
      parent : TGstMiniObject;cdecl;
    end;


function gst_promise_new:PGstPromise;cdecl;external;
function gst_promise_new_with_change_func(func:TGstPromiseChangeFunc; user_data:Tgpointer; notify:TGDestroyNotify):PGstPromise;cdecl;external;
function gst_promise_wait(promise:PGstPromise):TGstPromiseResult;cdecl;external;
procedure gst_promise_reply(promise:PGstPromise; s:PGstStructure);cdecl;external;
procedure gst_promise_interrupt(promise:PGstPromise);cdecl;external;
procedure gst_promise_expire(promise:PGstPromise);cdecl;external;
(* Const before type ignored *)
function gst_promise_get_reply(promise:PGstPromise):PGstStructure;cdecl;external;
{$ifndef GST_DISABLE_MINIOBJECT_INLINE_FUNCTIONS}
(* error 
static inline GstPromise *
 in declarator_list *)
(* error 
  return (GstPromise *) gst_mini_object_ref (GST_MINI_OBJECT_CAST (promise));
 in declarator_list *)
(* error 
}
in declaration at line 107 *)
(* error 
}
in declaration at line 113 *)
(* error 
}
{$else}
    { GST_DISABLE_MINIOBJECT_INLINE_FUNCTIONS  }
in declaration at line 117 *)

procedure gst_promise_unref(promise:PGstPromise);cdecl;external;
procedure gst_clear_promise(promise_ptr:PPGstPromise);cdecl;external;
{$endif}
    { GST_DISABLE_MINIOBJECT_INLINE_FUNCTIONS  }
{$endif}
    { __GST_PROMISE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_PROMISE : longint; { return type might be wrong }
  begin
    GST_TYPE_PROMISE:=gst_promise_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PROMISE(obj : longint) : longint;
begin
  GST_IS_PROMISE:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_PROMISE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PROMISE(obj : longint) : PGstPromise;
begin
  GST_PROMISE:=PGstPromise(obj);
end;


end.
