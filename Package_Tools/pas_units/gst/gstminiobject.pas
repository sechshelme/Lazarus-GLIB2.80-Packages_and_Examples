unit gstminiobject;

interface

uses
  glib280, common_GST, gstobject;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


  var
    _gst_mini_object_type : TGType;cvar;external gstreamerlib;

  type
    PGstMiniObject = ^TGstMiniObject;
    PPGstMiniObject = ^PGstMiniObject;

    PGstMiniObjectCopyFunction = ^TGstMiniObjectCopyFunction;
    TGstMiniObjectCopyFunction = function (obj:PGstMiniObject):PGstMiniObject;cdecl;
    TGstMiniObjectDisposeFunction = function (obj:PGstMiniObject):Tgboolean;cdecl;
    TGstMiniObjectFreeFunction = procedure (obj:PGstMiniObject);cdecl;
    TGstMiniObjectNotify = procedure (user_data:Tgpointer; obj:PGstMiniObject);cdecl;

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
function gst_mini_object_get_type:TGType;cdecl;external gstreamerlib;

type
  PGstMiniObjectFlags = ^TGstMiniObjectFlags;
  TGstMiniObjectFlags =  Longint;
  Const
    GST_MINI_OBJECT_FLAG_LOCKABLE = 1 shl 0;
    GST_MINI_OBJECT_FLAG_LOCK_READONLY = 1 shl 1;
    GST_MINI_OBJECT_FLAG_MAY_BE_LEAKED = 1 shl 2;
    GST_MINI_OBJECT_FLAG_LAST = 1 shl 4;
type
  PGstLockFlags = ^TGstLockFlags;
  TGstLockFlags =  Longint;
  Const
    GST_LOCK_FLAG_READ = 1 shl 0;
    GST_LOCK_FLAG_WRITE = 1 shl 1;
    GST_LOCK_FLAG_EXCLUSIVE = 1 shl 2;
    GST_LOCK_FLAG_LAST = 1 shl 8;

procedure gst_mini_object_init(mini_object:PGstMiniObject; flags:Tguint; _type:TGType; copy_func:TGstMiniObjectCopyFunction; dispose_func:TGstMiniObjectDisposeFunction; 
            free_func:TGstMiniObjectFreeFunction);cdecl;external gstreamerlib;
function gst_mini_object_ref(mini_object:PGstMiniObject):PGstMiniObject;cdecl;external gstreamerlib;
procedure gst_mini_object_unref(mini_object:PGstMiniObject);cdecl;external gstreamerlib;
procedure gst_clear_mini_object(object_ptr:PPGstMiniObject);cdecl;external gstreamerlib;

procedure gst_mini_object_weak_ref(obj:PGstMiniObject; notify:TGstMiniObjectNotify; data:Tgpointer);cdecl;external gstreamerlib;
procedure gst_mini_object_weak_unref(obj:PGstMiniObject; notify:TGstMiniObjectNotify; data:Tgpointer);cdecl;external gstreamerlib;
function gst_mini_object_lock(obj:PGstMiniObject; flags:TGstLockFlags):Tgboolean;cdecl;external gstreamerlib;
procedure gst_mini_object_unlock(obj:PGstMiniObject; flags:TGstLockFlags);cdecl;external gstreamerlib;
function gst_mini_object_is_writable(mini_object:PGstMiniObject):Tgboolean;cdecl;external gstreamerlib;
function gst_mini_object_make_writable(mini_object:PGstMiniObject):PGstMiniObject;cdecl;external gstreamerlib;
function gst_mini_object_copy(mini_object:PGstMiniObject):PGstMiniObject;cdecl;external gstreamerlib;
procedure gst_mini_object_set_qdata(obj:PGstMiniObject; quark:TGQuark; data:Tgpointer; destroy:TGDestroyNotify);cdecl;external gstreamerlib;
function gst_mini_object_get_qdata(obj:PGstMiniObject; quark:TGQuark):Tgpointer;cdecl;external gstreamerlib;
function gst_mini_object_steal_qdata(obj:PGstMiniObject; quark:TGQuark):Tgpointer;cdecl;external gstreamerlib;
procedure gst_mini_object_add_parent(obj:PGstMiniObject; parent:PGstMiniObject);cdecl;external gstreamerlib;
procedure gst_mini_object_remove_parent(obj:PGstMiniObject; parent:PGstMiniObject);cdecl;external gstreamerlib;
function gst_mini_object_replace(olddata:PPGstMiniObject; newdata:PGstMiniObject):Tgboolean;cdecl;external gstreamerlib;
function gst_mini_object_take(olddata:PPGstMiniObject; newdata:PGstMiniObject):Tgboolean;cdecl;external gstreamerlib;
function gst_mini_object_steal(olddata:PPGstMiniObject):PGstMiniObject;cdecl;external gstreamerlib;


function  GST_TYPE_MINI_OBJECT:TGType;
function GST_IS_MINI_OBJECT_TYPE(obj,_type : longint) : longint;
function GST_MINI_OBJECT_CAST(obj : longint) : PGstMiniObject;
function GST_MINI_OBJECT_CONST_CAST(obj : longint) : PGstMiniObject;
function GST_MINI_OBJECT(obj : longint) : longint;

function gst_clear_mini_object(object_ptr : longint) : longint;

function GST_LOCK_FLAG_READWRITE : TGstLockFlags;
function GST_MINI_OBJECT_REFCOUNT(obj : longint) : longint;
function GST_MINI_OBJECT_REFCOUNT_VALUE(obj : longint) : longint;


function GST_MINI_OBJECT_IS_LOCKABLE(obj : longint) : longint;


function GST_MINI_OBJECT_TYPE(obj : longint) : longint;
function GST_MINI_OBJECT_FLAGS(obj : longint) : longint;
function GST_MINI_OBJECT_FLAG_IS_SET(obj,flag : longint) : longint;
function GST_MINI_OBJECT_FLAG_SET(obj,flag : longint) : longint;
function GST_MINI_OBJECT_FLAG_UNSET(obj,flag : longint) : longint;


function GST_DEFINE_MINI_OBJECT_TYPE(TypeName,type_name : longint) : longint;

// === Konventiert am: 11-9-24 17:15:38 ===


implementation

function GST_TYPE_MINI_OBJECT: TGType;
begin
  Result:= _gst_mini_object_type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_MINI_OBJECT_TYPE(obj,_type : longint) : longint;
begin
// #define GST_IS_MINI_OBJECT_TYPE(obj,type)  ((obj) && GST_MINI_OBJECT_TYPE(obj) == (type))

  GST_IS_MINI_OBJECT_TYPE:=(obj(@(@(GST_MINI_OBJECT_TYPE(obj)))))=_type;
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
  { #define GST_MINI_OBJECT_FLAG_SET(obj,flag)           (GST_MINI_OBJECT_FLAGS (obj) |= (flag)) }
  GST_MINI_OBJECT_FLAG_SET:=obj := obj  or  flag;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_MINI_OBJECT_FLAG_UNSET(obj,flag : longint) : longint;
begin
  {#define GST_MINI_OBJECT_FLAG_UNSET(obj,flag)         (GST_MINI_OBJECT_FLAGS (obj) &= ~(flag)) }
  GST_MINI_OBJECT_FLAG_UNSET:=obj :=obj  and ( not flag;
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
