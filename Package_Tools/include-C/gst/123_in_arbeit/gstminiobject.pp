
unit gstminiobject;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstminiobject.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstminiobject.h
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
PGstLockFlags  = ^GstLockFlags;
PGstMiniObject  = ^GstMiniObject;
PGstMiniObjectCopyFunction  = ^GstMiniObjectCopyFunction;
PGstMiniObjectFlags  = ^GstMiniObjectFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2005 David Schleef <ds@schleef.org>
 *
 * gstminiobject.h: Header for GstMiniObject
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
{$ifndef __GST_MINI_OBJECT_H__}
{$define __GST_MINI_OBJECT_H__}
{$include <gst/gstconfig.h>}
{$include <glib-object.h>}
  var
    _gst_mini_object_type : TGType;cvar;external;

const
  GST_TYPE_MINI_OBJECT = _gst_mini_object_type;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_IS_MINI_OBJECT_TYPE(obj,_type : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_MINI_OBJECT_CAST(obj : longint) : PGstMiniObject;

(* Const before type ignored *)
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_MINI_OBJECT_CONST_CAST(obj : longint) : PGstMiniObject;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT(obj : longint) : longint;

type

function gst_mini_object_get_type:TGType;cdecl;external;
{*
 * GstMiniObjectCopyFunction:
 * @obj: MiniObject to copy
 *
 * Function prototype for methods to create copies of instances.
 *
 * Returns: reference to cloned instance.
  }
(* Const before type ignored *)
type
  PGstMiniObjectCopyFunction = ^TGstMiniObjectCopyFunction;
  TGstMiniObjectCopyFunction = function (obj:PGstMiniObject):PGstMiniObject;cdecl;
{*
 * GstMiniObjectDisposeFunction:
 * @obj: MiniObject to dispose
 *
 * Function prototype for when a miniobject has lost its last refcount.
 * Implementation of the mini object are allowed to revive the
 * passed object by doing a gst_mini_object_ref(). If the object is not
 * revived after the dispose function, the function should return %TRUE
 * and the memory associated with the object is freed.
 *
 * Returns: %TRUE if the object should be cleaned up.
  }

  TGstMiniObjectDisposeFunction = function (obj:PGstMiniObject):Tgboolean;cdecl;
{*
 * GstMiniObjectFreeFunction:
 * @obj: MiniObject to free
 *
 * Virtual function prototype for methods to free resources used by
 * mini-objects.
  }

  TGstMiniObjectFreeFunction = procedure (obj:PGstMiniObject);cdecl;
{*
 * GstMiniObjectNotify:
 * @user_data: data that was provided when the notify was added
 * @obj: the mini object
 *
 * A #GstMiniObjectNotify function can be added to a mini object as a
 * callback that gets triggered when gst_mini_object_unref() drops the
 * last ref and @obj is about to be freed.
  }

  TGstMiniObjectNotify = procedure (user_data:Tgpointer; obj:PGstMiniObject);cdecl;
{*
 * GST_MINI_OBJECT_TYPE:
 * @obj: MiniObject to return type for.
 *
 * This macro returns the type of the mini-object.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_MINI_OBJECT_TYPE(obj : longint) : longint;

{*
 * GST_MINI_OBJECT_FLAGS:
 * @obj: MiniObject to return flags for.
 *
 * This macro returns the entire set of flags for the mini-object.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT_FLAGS(obj : longint) : longint;

{*
 * GST_MINI_OBJECT_FLAG_IS_SET:
 * @obj: MiniObject to check for flags.
 * @flag: Flag to check for
 *
 * This macro checks to see if the given flag is set.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT_FLAG_IS_SET(obj,flag : longint) : longint;

{*
 * GST_MINI_OBJECT_FLAG_SET:
 * @obj: MiniObject to set flag in.
 * @flag: Flag to set, can by any number of bits in guint32.
 *
 * This macro sets the given bits.
  }
{ #define GST_MINI_OBJECT_FLAG_SET(obj,flag)           (GST_MINI_OBJECT_FLAGS (obj) |= (flag)) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT_FLAG_SET(obj,flag : longint) : longint;

{*
 * GST_MINI_OBJECT_FLAG_UNSET:
 * @obj: MiniObject to unset flag in.
 * @flag: Flag to set, must be a single bit in guint32.
 *
 * This macro unsets the given bits.
  }
{#define GST_MINI_OBJECT_FLAG_UNSET(obj,flag)         (GST_MINI_OBJECT_FLAGS (obj) &= ~(flag)) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT_FLAG_UNSET(obj,flag : longint) : longint;

{*
 * GstMiniObjectFlags:
 * @GST_MINI_OBJECT_FLAG_LOCKABLE: the object can be locked and unlocked with
 * gst_mini_object_lock() and gst_mini_object_unlock().
 * @GST_MINI_OBJECT_FLAG_LOCK_READONLY: the object is permanently locked in
 * READONLY mode. Only read locks can be performed on the object.
 * @GST_MINI_OBJECT_FLAG_MAY_BE_LEAKED: the object is expected to stay alive
 * even after gst_deinit() has been called and so should be ignored by leak
 * detection tools. (Since: 1.10)
 * @GST_MINI_OBJECT_FLAG_LAST: first flag that can be used by subclasses.
 *
 * Flags for the mini object
  }
{ padding  }
type
  PGstMiniObjectFlags = ^TGstMiniObjectFlags;
  TGstMiniObjectFlags =  Longint;
  Const
    GST_MINI_OBJECT_FLAG_LOCKABLE = 1 shl 0;
    GST_MINI_OBJECT_FLAG_LOCK_READONLY = 1 shl 1;
    GST_MINI_OBJECT_FLAG_MAY_BE_LEAKED = 1 shl 2;
    GST_MINI_OBJECT_FLAG_LAST = 1 shl 4;
;
{*
 * GST_MINI_OBJECT_IS_LOCKABLE:
 * @obj: a #GstMiniObject
 *
 * Check if @obj is lockable. A lockable object can be locked and unlocked with
 * gst_mini_object_lock() and gst_mini_object_unlock().
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_MINI_OBJECT_IS_LOCKABLE(obj : longint) : longint;

{*
 * GstLockFlags:
 * @GST_LOCK_FLAG_READ: lock for read access
 * @GST_LOCK_FLAG_WRITE: lock for write access
 * @GST_LOCK_FLAG_EXCLUSIVE: lock for exclusive access
 * @GST_LOCK_FLAG_LAST: first flag that can be used for custom purposes
 *
 * Flags used when locking miniobjects
  }
type
  PGstLockFlags = ^TGstLockFlags;
  TGstLockFlags =  Longint;
  Const
    GST_LOCK_FLAG_READ = 1 shl 0;
    GST_LOCK_FLAG_WRITE = 1 shl 1;
    GST_LOCK_FLAG_EXCLUSIVE = 1 shl 2;
    GST_LOCK_FLAG_LAST = 1 shl 8;
;
{*
 * GST_LOCK_FLAG_READWRITE: (value 3) (type GstLockFlags)
 *
 * GstLockFlags value alias for GST_LOCK_FLAG_READ | GST_LOCK_FLAG_WRITE
  }

{ was #define dname def_expr }
function GST_LOCK_FLAG_READWRITE : TGstLockFlags;  

{*
 * GST_MINI_OBJECT_REFCOUNT:
 * @obj: a #GstMiniObject
 *
 * Get access to the reference count field of the mini-object.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT_REFCOUNT(obj : longint) : longint;

{*
 * GST_MINI_OBJECT_REFCOUNT_VALUE:
 * @obj: a #GstMiniObject
 *
 * Get the reference count value of the mini-object.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT_REFCOUNT_VALUE(obj : longint) : longint;

{*
 * GstMiniObject: (ref-func gst_mini_object_ref) (unref-func gst_mini_object_unref) (set-value-func g_value_set_boxed) (get-value-func g_value_get_boxed)
 * @type: the GType of the object
 * @refcount: atomic refcount
 * @lockstate: atomic state of the locks
 * @flags: extra flags.
 * @copy: a copy function
 * @dispose: a dispose function
 * @free: the free function
 *
 * Base class for refcounted lightweight objects.
  }
{< public > }{ with COW  }
{ < private >  }
{ Used to keep track of parents, weak ref notifies and qdata  }
type
  PGstMiniObject = ^TGstMiniObject;
  TGstMiniObject = record
      _type : TGType;
      refcount : Tgint;
      lockstate : Tgint;
      flags : Tguint;
      copy : TGstMiniObjectCopyFunction;
      _dispose : TGstMiniObjectDisposeFunction;
      free : TGstMiniObjectFreeFunction;
      priv_uint : Tguint;
      priv_pointer : Tgpointer;
    end;


procedure gst_mini_object_init(mini_object:PGstMiniObject; flags:Tguint; _type:TGType; copy_func:TGstMiniObjectCopyFunction; dispose_func:TGstMiniObjectDisposeFunction; 
            free_func:TGstMiniObjectFreeFunction);cdecl;external;
{ refcounting  }
function gst_mini_object_ref(mini_object:PGstMiniObject):PGstMiniObject;cdecl;external;
procedure gst_mini_object_unref(mini_object:PGstMiniObject);cdecl;external;
procedure gst_clear_mini_object(object_ptr:PPGstMiniObject);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_clear_mini_object(object_ptr : longint) : longint;

procedure gst_mini_object_weak_ref(object:PGstMiniObject; notify:TGstMiniObjectNotify; data:Tgpointer);cdecl;external;
procedure gst_mini_object_weak_unref(object:PGstMiniObject; notify:TGstMiniObjectNotify; data:Tgpointer);cdecl;external;
{ locking  }
function gst_mini_object_lock(object:PGstMiniObject; flags:TGstLockFlags):Tgboolean;cdecl;external;
procedure gst_mini_object_unlock(object:PGstMiniObject; flags:TGstLockFlags);cdecl;external;
(* Const before type ignored *)
function gst_mini_object_is_writable(mini_object:PGstMiniObject):Tgboolean;cdecl;external;
function gst_mini_object_make_writable(mini_object:PGstMiniObject):PGstMiniObject;cdecl;external;
{ copy  }
(* Const before type ignored *)
function gst_mini_object_copy(mini_object:PGstMiniObject):PGstMiniObject;cdecl;external;
procedure gst_mini_object_set_qdata(object:PGstMiniObject; quark:TGQuark; data:Tgpointer; destroy:TGDestroyNotify);cdecl;external;
function gst_mini_object_get_qdata(object:PGstMiniObject; quark:TGQuark):Tgpointer;cdecl;external;
function gst_mini_object_steal_qdata(object:PGstMiniObject; quark:TGQuark):Tgpointer;cdecl;external;
procedure gst_mini_object_add_parent(object:PGstMiniObject; parent:PGstMiniObject);cdecl;external;
procedure gst_mini_object_remove_parent(object:PGstMiniObject; parent:PGstMiniObject);cdecl;external;
function gst_mini_object_replace(olddata:PPGstMiniObject; newdata:PGstMiniObject):Tgboolean;cdecl;external;
function gst_mini_object_take(olddata:PPGstMiniObject; newdata:PGstMiniObject):Tgboolean;cdecl;external;
function gst_mini_object_steal(olddata:PPGstMiniObject):PGstMiniObject;cdecl;external;
{*
 * GST_DEFINE_MINI_OBJECT_TYPE:
 * @TypeName: name of the new type in CamelCase
 * @type_name: name of the new type
 *
 * Define a new mini-object type with the given name
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEFINE_MINI_OBJECT_TYPE(TypeName,type_name : longint) : longint;

{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_MINI_OBJECT_TYPE(obj,_type : longint) : longint;
begin
  GST_IS_MINI_OBJECT_TYPE:=(Tobj(@(@(GST_MINI_OBJECT_TYPE(obj)))))=_type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_MINI_OBJECT_CAST(obj : longint) : PGstMiniObject;
begin
  GST_MINI_OBJECT_CAST:=PGstMiniObject(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_MINI_OBJECT_CONST_CAST(obj : longint) : PGstMiniObject;
begin
  GST_MINI_OBJECT_CONST_CAST:=PGstMiniObject(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT(obj : longint) : longint;
begin
  GST_MINI_OBJECT:=GST_MINI_OBJECT_CAST(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT_TYPE(obj : longint) : longint;
begin
  GST_MINI_OBJECT_TYPE:=(GST_MINI_OBJECT_CAST(obj))^._type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT_FLAGS(obj : longint) : longint;
begin
  GST_MINI_OBJECT_FLAGS:=(GST_MINI_OBJECT_CAST(obj))^.flags;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT_FLAG_IS_SET(obj,flag : longint) : longint;
begin
  GST_MINI_OBJECT_FLAG_IS_SET:= not ( not ((GST_MINI_OBJECT_FLAGS(obj)) and flag));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT_FLAG_SET(obj,flag : longint) : longint;
begin
  GST_MINI_OBJECT_FLAG_SET:=(GST_MINI_OBJECT_FLAGS(obj)) and flag;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT_FLAG_UNSET(obj,flag : longint) : longint;
begin
  GST_MINI_OBJECT_FLAG_UNSET:=(GST_MINI_OBJECT_FLAGS(obj)) and ( not (flag));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT_IS_LOCKABLE(obj : longint) : longint;
begin
  GST_MINI_OBJECT_IS_LOCKABLE:=GST_MINI_OBJECT_FLAG_IS_SET(obj,GST_MINI_OBJECT_FLAG_LOCKABLE);
end;

{ was #define dname def_expr }
function GST_LOCK_FLAG_READWRITE : TGstLockFlags;
  begin
    GST_LOCK_FLAG_READWRITE:=TGstLockFlags(GST_LOCK_FLAG_READ or GST_LOCK_FLAG_WRITE);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT_REFCOUNT(obj : longint) : longint;
begin
  GST_MINI_OBJECT_REFCOUNT:=(GST_MINI_OBJECT_CAST(obj))^.refcount;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT_REFCOUNT_VALUE(obj : longint) : longint;
begin
  GST_MINI_OBJECT_REFCOUNT_VALUE:=g_atomic_int_get(@((GST_MINI_OBJECT_CAST(obj))^.refcount));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_clear_mini_object(object_ptr : longint) : longint;
begin
  gst_clear_mini_object:=g_clear_pointer(object_ptr,gst_mini_object_unref);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_DEFINE_MINI_OBJECT_TYPE(TypeName,type_name : longint) : longint;
begin
  GST_DEFINE_MINI_OBJECT_TYPE:=G_DEFINE_BOXED_TYPE(TypeName,type_name,TGBoxedCopyFunc(gst_mini_object_ref),TGBoxedFreeFunc(gst_mini_object_unref));
end;


end.
