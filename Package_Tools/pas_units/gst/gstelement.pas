unit gstelement;

interface

uses
  glib280, common_GST, gstobject, gststructure, gstbus;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  PGstState = ^TGstState;
  TGstState =  Longint;
  Const
    GST_STATE_VOID_PENDING = 0;
    GST_STATE_NULL = 1;
    GST_STATE_READY = 2;
    GST_STATE_PAUSED = 3;
    GST_STATE_PLAYING = 4;

type
  PGstStateChangeReturn = ^TGstStateChangeReturn;
  TGstStateChangeReturn =  Longint;
  Const
    GST_STATE_CHANGE_FAILURE = 0;
    GST_STATE_CHANGE_SUCCESS = 1;
    GST_STATE_CHANGE_ASYNC = 2;
    GST_STATE_CHANGE_NO_PREROLL = 3;

type
  PGstStateChange = ^TGstStateChange;
  TGstStateChange =  Longint;
  Const
    GST_STATE_CHANGE_NULL_TO_READY = (GST_STATE_NULL shl 3) or GST_STATE_READY;
    GST_STATE_CHANGE_READY_TO_PAUSED = (GST_STATE_READY shl 3) or GST_STATE_PAUSED;
    GST_STATE_CHANGE_PAUSED_TO_PLAYING = (GST_STATE_PAUSED shl 3) or GST_STATE_PLAYING;
    GST_STATE_CHANGE_PLAYING_TO_PAUSED = (GST_STATE_PLAYING shl 3) or GST_STATE_PAUSED;
    GST_STATE_CHANGE_PAUSED_TO_READY = (GST_STATE_PAUSED shl 3) or GST_STATE_READY;
    GST_STATE_CHANGE_READY_TO_NULL = (GST_STATE_READY shl 3) or GST_STATE_NULL;
    GST_STATE_CHANGE_NULL_TO_NULL = (GST_STATE_NULL shl 3) or GST_STATE_NULL;
    GST_STATE_CHANGE_READY_TO_READY = (GST_STATE_READY shl 3) or GST_STATE_READY;
    GST_STATE_CHANGE_PAUSED_TO_PAUSED = (GST_STATE_PAUSED shl 3) or GST_STATE_PAUSED;
    GST_STATE_CHANGE_PLAYING_TO_PLAYING = (GST_STATE_PLAYING shl 3) or GST_STATE_PLAYING;
type
  PGstElementFlags = ^TGstElementFlags;
  TGstElementFlags =  Longint;
  Const
    GST_ELEMENT_FLAG_LOCKED_STATE = GST_OBJECT_FLAG_LAST shl 0;
    GST_ELEMENT_FLAG_SINK = GST_OBJECT_FLAG_LAST shl 1;
    GST_ELEMENT_FLAG_SOURCE = GST_OBJECT_FLAG_LAST shl 2;
    GST_ELEMENT_FLAG_PROVIDE_CLOCK = GST_OBJECT_FLAG_LAST shl 3;
    GST_ELEMENT_FLAG_REQUIRE_CLOCK = GST_OBJECT_FLAG_LAST shl 4;
    GST_ELEMENT_FLAG_INDEXABLE = GST_OBJECT_FLAG_LAST shl 5;
    GST_ELEMENT_FLAG_LAST = GST_OBJECT_FLAG_LAST shl 10;

    function gst_make_element_message_details(name:Pchar; args:array of const):PGstStructure;cdecl;external gstreamerlib;
    function gst_make_element_message_details(name:Pchar):PGstStructure;cdecl;external gstreamerlib;


type
  PGstElement = ^TGstElement;
  TGstElement = record
      obj : TGstObject;
      state_lock : TGRecMutex;
      state_cond : TGCond;
      state_cookie : Tguint32;
      target_state : TGstState;
      current_state : TGstState;
      next_state : TGstState;
      pending_state : TGstState;
      last_return : TGstStateChangeReturn;
      bus : PGstBus;
      clock : PGstClock;
      base_time : TGstClockTimeDiff;
      start_time : TGstClockTime;
      numpads : Tguint16;
      pads : PGList;
      numsrcpads : Tguint16;
      srcpads : PGList;
      numsinkpads : Tguint16;
      sinkpads : PGList;
      pads_cookie : Tguint32;
      contexts : PGList;
      _gst_reserved : array[0..(GST_PADDING-1)-1] of Tgpointer;
    end;

  PGstElementClass = ^TGstElementClass;
  TGstElementClass = record
      parent_class : TGstObjectClass;
      metadata : Tgpointer;
      elementfactory : PGstElementFactory;
      padtemplates : PGList;
      numpadtemplates : Tgint;
      pad_templ_cookie : Tguint32;
      pad_added : procedure (element:PGstElement; pad:PGstPad);cdecl;
      pad_removed : procedure (element:PGstElement; pad:PGstPad);cdecl;
      no_more_pads : procedure (element:PGstElement);cdecl;
      request_new_pad : function (element:PGstElement; templ:PGstPadTemplate; name:Pgchar; caps:PGstCaps):PGstPad;cdecl;
      release_pad : procedure (element:PGstElement; pad:PGstPad);cdecl;
      get_state : function (element:PGstElement; state:PGstState; pending:PGstState; timeout:TGstClockTime):TGstStateChangeReturn;cdecl;
      set_state : function (element:PGstElement; state:TGstState):TGstStateChangeReturn;cdecl;
      change_state : function (element:PGstElement; transition:TGstStateChange):TGstStateChangeReturn;cdecl;
      state_changed : procedure (element:PGstElement; oldstate:TGstState; newstate:TGstState; pending:TGstState);cdecl;
      set_bus : procedure (element:PGstElement; bus:PGstBus);cdecl;
      provide_clock : function (element:PGstElement):PGstClock;cdecl;
      set_clock : function (element:PGstElement; clock:PGstClock):Tgboolean;cdecl;
      send_event : function (element:PGstElement; event:PGstEvent):Tgboolean;cdecl;
      query : function (element:PGstElement; query:PGstQuery):Tgboolean;cdecl;
      post_message : function (element:PGstElement; message:PGstMessage):Tgboolean;cdecl;
      set_context : procedure (element:PGstElement; context:PGstContext);cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE-2)-1] of Tgpointer;
    end;

procedure gst_element_class_add_pad_template(klass:PGstElementClass; templ:PGstPadTemplate);cdecl;external gstreamerlib;
procedure gst_element_class_add_static_pad_template(klass:PGstElementClass; static_templ:PGstStaticPadTemplate);cdecl;external gstreamerlib;
procedure gst_element_class_add_static_pad_template_with_gtype(klass:PGstElementClass; static_templ:PGstStaticPadTemplate; pad_type:TGType);cdecl;external gstreamerlib;
function gst_element_class_get_pad_template(element_class:PGstElementClass; name:Pgchar):PGstPadTemplate;cdecl;external gstreamerlib;
function gst_element_class_get_pad_template_list(element_class:PGstElementClass):PGList;cdecl;external gstreamerlib;
procedure gst_element_class_set_metadata(klass:PGstElementClass; longname:Pgchar; classification:Pgchar; description:Pgchar; author:Pgchar);cdecl;external gstreamerlib;
procedure gst_element_class_set_static_metadata(klass:PGstElementClass; longname:Pgchar; classification:Pgchar; description:Pgchar; author:Pgchar);cdecl;external gstreamerlib;
procedure gst_element_class_add_metadata(klass:PGstElementClass; key:Pgchar; value:Pgchar);cdecl;external gstreamerlib;
procedure gst_element_class_add_static_metadata(klass:PGstElementClass; key:Pgchar; value:Pgchar);cdecl;external gstreamerlib;
function gst_element_class_get_metadata(klass:PGstElementClass; key:Pgchar):Pgchar;cdecl;external gstreamerlib;
function gst_element_get_type:TGType;cdecl;external gstreamerlib;

function gst_element_provide_clock(element:PGstElement):PGstClock;cdecl;external gstreamerlib;
function gst_element_get_clock(element:PGstElement):PGstClock;cdecl;external gstreamerlib;
function gst_element_set_clock(element:PGstElement; clock:PGstClock):Tgboolean;cdecl;external gstreamerlib;
procedure gst_element_set_base_time(element:PGstElement; time:TGstClockTime);cdecl;external gstreamerlib;
function gst_element_get_base_time(element:PGstElement):TGstClockTime;cdecl;external gstreamerlib;
procedure gst_element_set_start_time(element:PGstElement; time:TGstClockTime);cdecl;external gstreamerlib;
function gst_element_get_start_time(element:PGstElement):TGstClockTime;cdecl;external gstreamerlib;
function gst_element_get_current_running_time(element:PGstElement):TGstClockTime;cdecl;external gstreamerlib;
function gst_element_get_current_clock_time(element:PGstElement):TGstClockTime;cdecl;external gstreamerlib;
procedure gst_element_set_bus(element:PGstElement; bus:PGstBus);cdecl;external gstreamerlib;
function gst_element_get_bus(element:PGstElement):PGstBus;cdecl;external gstreamerlib;
procedure gst_element_set_context(element:PGstElement; context:PGstContext);cdecl;external gstreamerlib;
function gst_element_get_contexts(element:PGstElement):PGList;cdecl;external gstreamerlib;
function gst_element_get_context(element:PGstElement; context_type:Pgchar):PGstContext;cdecl;external gstreamerlib;
function gst_element_get_context_unlocked(element:PGstElement; context_type:Pgchar):PGstContext;cdecl;external gstreamerlib;
function gst_element_add_pad(element:PGstElement; pad:PGstPad):Tgboolean;cdecl;external gstreamerlib;
function gst_element_remove_pad(element:PGstElement; pad:PGstPad):Tgboolean;cdecl;external gstreamerlib;
procedure gst_element_no_more_pads(element:PGstElement);cdecl;external gstreamerlib;
function gst_element_get_static_pad(element:PGstElement; name:Pgchar):PGstPad;cdecl;external gstreamerlib;
function gst_element_get_request_pad(element:PGstElement; name:Pgchar):PGstPad;cdecl;external gstreamerlib;
function gst_element_request_pad_simple(element:PGstElement; name:Pgchar):PGstPad;cdecl;external gstreamerlib;
function gst_element_request_pad(element:PGstElement; templ:PGstPadTemplate; name:Pgchar; caps:PGstCaps):PGstPad;cdecl;external gstreamerlib;
procedure gst_element_release_request_pad(element:PGstElement; pad:PGstPad);cdecl;external gstreamerlib;
function gst_element_iterate_pads(element:PGstElement):PGstIterator;cdecl;external gstreamerlib;
function gst_element_iterate_src_pads(element:PGstElement):PGstIterator;cdecl;external gstreamerlib;
function gst_element_iterate_sink_pads(element:PGstElement):PGstIterator;cdecl;external gstreamerlib;
type
  TGstElementForeachPadFunc = function (element:PGstElement; pad:PGstPad; user_data:Tgpointer):Tgboolean;cdecl;

function gst_element_foreach_sink_pad(element:PGstElement; func:TGstElementForeachPadFunc; user_data:Tgpointer):Tgboolean;cdecl;external gstreamerlib;
function gst_element_foreach_src_pad(element:PGstElement; func:TGstElementForeachPadFunc; user_data:Tgpointer):Tgboolean;cdecl;external gstreamerlib;
function gst_element_foreach_pad(element:PGstElement; func:TGstElementForeachPadFunc; user_data:Tgpointer):Tgboolean;cdecl;external gstreamerlib;
function gst_element_send_event(element:PGstElement; event:PGstEvent):Tgboolean;cdecl;external gstreamerlib;
function gst_element_seek(element:PGstElement; rate:Tgdouble; format:TGstFormat; flags:TGstSeekFlags; start_type:TGstSeekType; 
           start:Tgint64; stop_type:TGstSeekType; stop:Tgint64):Tgboolean;cdecl;external gstreamerlib;
function gst_element_query(element:PGstElement; query:PGstQuery):Tgboolean;cdecl;external gstreamerlib;
function gst_element_post_message(element:PGstElement; message:PGstMessage):Tgboolean;cdecl;external gstreamerlib;

function _gst_element_error_printf(format:Pgchar; args:array of const):Pgchar;cdecl;external gstreamerlib;
function _gst_element_error_printf(format:Pgchar):Pgchar;cdecl;external gstreamerlib;

procedure gst_element_message_full(element:PGstElement; _type:TGstMessageType; domain:TGQuark; code:Tgint; text:Pgchar; 
            debug:Pgchar; file_:Pgchar; _function:Pgchar; line:Tgint);cdecl;external gstreamerlib;
procedure gst_element_message_full_with_details(element:PGstElement; _type:TGstMessageType; domain:TGQuark; code:Tgint; text:Pgchar; 
            debug:Pgchar; file_:Pgchar; _function:Pgchar; line:Tgint; structure:PGstStructure);cdecl;external gstreamerlib;
function gst_element_is_locked_state(element:PGstElement):Tgboolean;cdecl;external gstreamerlib;
function gst_element_set_locked_state(element:PGstElement; locked_state:Tgboolean):Tgboolean;cdecl;external gstreamerlib;
function gst_element_sync_state_with_parent(element:PGstElement):Tgboolean;cdecl;external gstreamerlib;
function gst_element_get_state(element:PGstElement; state:PGstState; pending:PGstState; timeout:TGstClockTime):TGstStateChangeReturn;cdecl;external gstreamerlib;
function gst_element_set_state(element:PGstElement; state:TGstState):TGstStateChangeReturn;cdecl;external gstreamerlib;
procedure gst_element_abort_state(element:PGstElement);cdecl;external gstreamerlib;
function gst_element_change_state(element:PGstElement; transition:TGstStateChange):TGstStateChangeReturn;cdecl;external gstreamerlib;
function gst_element_continue_state(element:PGstElement; ret:TGstStateChangeReturn):TGstStateChangeReturn;cdecl;external gstreamerlib;
procedure gst_element_lost_state(element:PGstElement);cdecl;external gstreamerlib;
type
  TGstElementCallAsyncFunc = procedure (element:PGstElement; user_data:Tgpointer);cdecl;

procedure gst_element_call_async(element:PGstElement; func:TGstElementCallAsyncFunc; user_data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external gstreamerlib;
function gst_element_get_factory(element:PGstElement):PGstElementFactory;cdecl;external gstreamerlib;
function gst_element_add_property_notify_watch(element:PGstElement; property_name:Pgchar; include_value:Tgboolean):Tgulong;cdecl;external gstreamerlib;
function gst_element_add_property_deep_notify_watch(element:PGstElement; property_name:Pgchar; include_value:Tgboolean):Tgulong;cdecl;external gstreamerlib;
procedure gst_element_remove_property_notify_watch(element:PGstElement; watch_id:Tgulong);cdecl;external gstreamerlib;
function gst_element_get_pad_template(element:PGstElement; name:Pgchar):PGstPadTemplate;cdecl;external gstreamerlib;
function gst_element_get_pad_template_list(element:PGstElement):PGList;cdecl;external gstreamerlib;
function gst_element_get_metadata(element:PGstElement; key:Pgchar):Pgchar;cdecl;external gstreamerlib;


function GST_ELEMENT_CAST(obj : Pointer) : PGstElement;

function GST_STATE(elem : longint) : longint;
function GST_STATE_NEXT(elem : longint) : longint;
function GST_STATE_PENDING(elem : longint) : longint;
function GST_STATE_TARGET(elem : longint) : longint;
function GST_STATE_RETURN(elem : longint) : longint;
function __GST_SIGN(val : longint) : longint;
function GST_STATE_GET_NEXT(cur,pending : longint) : TGstState;
function GST_STATE_TRANSITION(cur,next : longint) : TGstStateChange;
function GST_STATE_TRANSITION_CURRENT(trans : longint) : TGstState;
function GST_STATE_TRANSITION_NEXT(trans : longint) : TGstState;

function GST_ELEMENT_IS_LOCKED_STATE(elem : longint) : longint;
function GST_ELEMENT_NAME(elem : longint) : longint;
function GST_ELEMENT_PARENT(elem : longint) : longint;
function GST_ELEMENT_BUS(elem : longint) : longint;
function GST_ELEMENT_CLOCK(elem : longint) : longint;
function GST_ELEMENT_PADS(elem : longint) : longint;
function GST_ELEMENT_START_TIME(elem : longint) : longint;

function GST_STATE_GET_LOCK(elem : longint) : longint;
function GST_STATE_GET_COND(elem : longint) : longint;
function GST_STATE_LOCK(elem : longint) : longint;
function GST_STATE_TRYLOCK(elem : longint) : longint;
function GST_STATE_UNLOCK(elem : longint) : longint;
function GST_STATE_WAIT(elem : longint) : longint;
function GST_STATE_WAIT_UNTIL(elem,end_time : longint) : longint;
function GST_STATE_SIGNAL(elem : longint) : longint;
function GST_STATE_BROADCAST(elem : longint) : longint;

function gst_element_get_name(elem : longint) : longint;
function gst_element_set_name(elem,name : longint) : longint;
function gst_element_get_parent(elem : longint) : longint;
function gst_element_set_parent(elem,parent : longint) : longint;

// === Konventiert am: 11-9-24 16:14:38 ===

function GST_TYPE_ELEMENT : TGType;
function GST_ELEMENT(obj : Pointer) : PGstElement;
function GST_ELEMENT_CLASS(klass : Pointer) : PGstElementClass;
function GST_IS_ELEMENT(obj : Pointer) : Tgboolean;
function GST_IS_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
function GST_ELEMENT_GET_CLASS(obj : Pointer) : PGstElementClass;

implementation

function GST_TYPE_ELEMENT : TGType;
  begin
    GST_TYPE_ELEMENT:=gst_element_get_type;
  end;

function GST_ELEMENT(obj : Pointer) : PGstElement;
begin
  Result := PGstElement(g_type_check_instance_cast(obj, GST_TYPE_ELEMENT));
end;

function GST_ELEMENT_CLASS(klass : Pointer) : PGstElementClass;
begin
  Result := PGstElementClass(g_type_check_class_cast(klass, GST_TYPE_ELEMENT));
end;

function GST_IS_ELEMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_ELEMENT);
end;

function GST_IS_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_ELEMENT);
end;

function GST_ELEMENT_GET_CLASS(obj : Pointer) : PGstElementClass;
begin
  Result := PGstElementClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_ELEMENT_CAST(obj: Pointer): PGstElement;
begin
  GST_ELEMENT_CAST:=PGstElement(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE(elem : longint) : longint;
begin
  GST_STATE:=(GST_ELEMENT_CAST(elem))^.current_state;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_NEXT(elem : longint) : longint;
begin
  GST_STATE_NEXT:=(GST_ELEMENT_CAST(elem))^.next_state;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_PENDING(elem : longint) : longint;
begin
  GST_STATE_PENDING:=(GST_ELEMENT_CAST(elem))^.pending_state;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_TARGET(elem : longint) : longint;
begin
  GST_STATE_TARGET:=(GST_ELEMENT_CAST(elem))^.target_state;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_RETURN(elem : longint) : longint;
begin
  GST_STATE_RETURN:=(GST_ELEMENT_CAST(elem))^.last_return;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function __GST_SIGN(val : longint) : longint;
var
   if_local1, if_local2 : longint;
(* result types are not known *)
begin
  if 0 then
    if_local1:=1
  else
    if_local1:=0;
  if 0 then
    if_local2:=-(1)
  else
    if_local2:=val>(if_local1);
  __GST_SIGN:=val<(if_local2);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_STATE_GET_NEXT(cur,pending : longint) : TGstState;
begin
  GST_STATE_GET_NEXT:=TGstState(Tcur(+(__GST_SIGN(Tgint(Tpending(-(Tgint(cur))))))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_STATE_TRANSITION(cur,next : longint) : TGstStateChange;
begin
  GST_STATE_TRANSITION:=TGstStateChange((cur shl 3) or next);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_STATE_TRANSITION_CURRENT(trans : longint) : TGstState;
begin
  GST_STATE_TRANSITION_CURRENT:=TGstState(trans shr 3);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_STATE_TRANSITION_NEXT(trans : longint) : TGstState;
begin
  GST_STATE_TRANSITION_NEXT:=TGstState(Ttrans(@($7)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_IS_LOCKED_STATE(elem : longint) : longint;
begin
  GST_ELEMENT_IS_LOCKED_STATE:=GST_OBJECT_FLAG_IS_SET(elem,GST_ELEMENT_FLAG_LOCKED_STATE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_NAME(elem : longint) : longint;
begin
  GST_ELEMENT_NAME:=GST_OBJECT_NAME(elem);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_PARENT(elem : longint) : longint;
begin
  GST_ELEMENT_PARENT:=GST_ELEMENT_CAST(GST_OBJECT_PARENT(elem));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_BUS(elem : longint) : longint;
begin
  GST_ELEMENT_BUS:=(GST_ELEMENT_CAST(elem))^.bus;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_CLOCK(elem : longint) : longint;
begin
  GST_ELEMENT_CLOCK:=(GST_ELEMENT_CAST(elem))^.clock;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_PADS(elem : longint) : longint;
begin
  GST_ELEMENT_PADS:=(GST_ELEMENT_CAST(elem))^.pads;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_START_TIME(elem : longint) : longint;
begin
  GST_ELEMENT_START_TIME:=(GST_ELEMENT_CAST(elem))^.start_time;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_GET_LOCK(elem : longint) : longint;
begin
  GST_STATE_GET_LOCK:=@((GST_ELEMENT_CAST(elem))^.state_lock);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_GET_COND(elem : longint) : longint;
begin
  GST_STATE_GET_COND:=@((GST_ELEMENT_CAST(elem))^.state_cond);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_LOCK(elem : longint) : longint;
begin
  GST_STATE_LOCK:=g_rec_mutex_lock(GST_STATE_GET_LOCK(elem));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_TRYLOCK(elem : longint) : longint;
begin
  GST_STATE_TRYLOCK:=g_rec_mutex_trylock(GST_STATE_GET_LOCK(elem));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_UNLOCK(elem : longint) : longint;
begin
  GST_STATE_UNLOCK:=g_rec_mutex_unlock(GST_STATE_GET_LOCK(elem));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_WAIT(elem : longint) : longint;
begin
  GST_STATE_WAIT:=g_cond_wait(GST_STATE_GET_COND(elem),GST_OBJECT_GET_LOCK(elem));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_WAIT_UNTIL(elem,end_time : longint) : longint;
begin
  GST_STATE_WAIT_UNTIL:=g_cond_wait_until(GST_STATE_GET_COND(elem),GST_OBJECT_GET_LOCK(elem),end_time);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_SIGNAL(elem : longint) : longint;
begin
  GST_STATE_SIGNAL:=g_cond_signal(GST_STATE_GET_COND(elem));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_BROADCAST(elem : longint) : longint;
begin
  GST_STATE_BROADCAST:=g_cond_broadcast(GST_STATE_GET_COND(elem));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_get_name(elem : longint) : longint;
begin
  gst_element_get_name:=gst_object_get_name(GST_OBJECT_CAST(elem));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_set_name(elem,name : longint) : longint;
begin
  gst_element_set_name:=gst_object_set_name(GST_OBJECT_CAST(elem),name);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_get_parent(elem : longint) : longint;
begin
  gst_element_get_parent:=gst_object_get_parent(GST_OBJECT_CAST(elem));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_set_parent(elem,parent : longint) : longint;
begin
  gst_element_set_parent:=gst_object_set_parent(GST_OBJECT_CAST(elem),parent);
end;


end.
