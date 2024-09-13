unit gstbufferlist;

interface

uses
  glib280, common_GST, gstobject;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

  var
    _gst_buffer_list_type : TGType;cvar;external gstreamerlib;

type
  TGstBufferList=record
      end;
  PGstBufferList=^TGstBufferList;
  PPGstBufferList=^PGstBufferList;

  TGstBufferListFunc = function (buffer:PPGstBuffer; idx:Tguint; user_data:Tgpointer):Tgboolean;cdecl;

function gst_buffer_list_ref(list:PGstBufferList):PGstBufferList;cdecl;external gstreamerlib;
procedure gst_buffer_list_unref(list:PGstBufferList);cdecl;external gstreamerlib;
procedure gst_clear_buffer_list(list_ptr:PPGstBufferList);cdecl;external gstreamerlib;
function gst_buffer_list_copy(list:PGstBufferList):PGstBufferList;cdecl;external gstreamerlib;
function gst_buffer_list_replace(old_list:PPGstBufferList; new_list:PGstBufferList):Tgboolean;cdecl;external gstreamerlib;
function gst_buffer_list_take(old_list:PPGstBufferList; new_list:PGstBufferList):Tgboolean;cdecl;external gstreamerlib;
function gst_buffer_list_is_writable(list : longint) : longint;

function gst_buffer_list_make_writable(list : longint) : longint;

function gst_buffer_list_get_type:TGType;cdecl;external gstreamerlib;
function gst_buffer_list_new:PGstBufferList;cdecl;external gstreamerlib;
function gst_buffer_list_new_sized(size:Tguint):PGstBufferList;cdecl;external gstreamerlib;
function gst_buffer_list_length(list:PGstBufferList):Tguint;cdecl;external gstreamerlib;
function gst_buffer_list_get(list:PGstBufferList; idx:Tguint):PGstBuffer;cdecl;external gstreamerlib;
function gst_buffer_list_get_writable(list:PGstBufferList; idx:Tguint):PGstBuffer;cdecl;external gstreamerlib;
procedure gst_buffer_list_insert(list:PGstBufferList; idx:Tgint; buffer:PGstBuffer);cdecl;external gstreamerlib;
procedure gst_buffer_list_remove(list:PGstBufferList; idx:Tguint; length:Tguint);cdecl;external gstreamerlib;
function gst_buffer_list_foreach(list:PGstBufferList; func:TGstBufferListFunc; user_data:Tgpointer):Tgboolean;cdecl;external gstreamerlib;
function gst_buffer_list_copy_deep(list:PGstBufferList):PGstBufferList;cdecl;external gstreamerlib;
function gst_buffer_list_calculate_size(list:PGstBufferList):Tgsize;cdecl;external gstreamerlib;



function GST_TYPE_BUFFER_LIST:TGType;


function GST_IS_BUFFER_LIST(obj : longint) : longint;
function GST_BUFFER_LIST_CAST(obj : longint) : PGstBufferList;
function GST_BUFFER_LIST(obj : longint) : longint;


function gst_buffer_list_add(l,b : longint) : longint;



// === Konventiert am: 13-9-24 18:20:17 ===


implementation

function GST_TYPE_BUFFER_LIST: TGType;
begin
  Result:=_gst_buffer_list_type;
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_BUFFER_LIST(obj : longint) : longint;
begin
  GST_IS_BUFFER_LIST:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_BUFFER_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BUFFER_LIST_CAST(obj : longint) : PGstBufferList;
begin
  GST_BUFFER_LIST_CAST:=PGstBufferList(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_BUFFER_LIST(obj : longint) : longint;
begin
  GST_BUFFER_LIST:=GST_BUFFER_LIST_CAST(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_buffer_list_is_writable(list : longint) : longint;
begin
  gst_buffer_list_is_writable:=gst_mini_object_is_writable(GST_MINI_OBJECT_CAST(list));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_buffer_list_make_writable(list : longint) : longint;
begin
  gst_buffer_list_make_writable:=GST_BUFFER_LIST_CAST(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(list)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_buffer_list_add(l,b : longint) : longint;
begin
  gst_buffer_list_add:=gst_buffer_list_insert(l,-(1),b);
end;


end.
