unit gstpad;

interface

uses
  glib280, common_GST, gstobject, gstpadtemplate, gsttask, gstbufferlist, gstevent;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  PGstPadMode = ^TGstPadMode;
  TGstPadMode =  Longint;
  Const
    GST_PAD_MODE_NONE = 0;
    GST_PAD_MODE_PUSH = 1;
    GST_PAD_MODE_PULL = 2;

function gst_pad_mode_get_name(mode:TGstPadMode):Pgchar;cdecl;external gstreamerlib;

type
  PGstPadLinkReturn = ^TGstPadLinkReturn;
  TGstPadLinkReturn =  Longint;
  Const
    GST_PAD_LINK_OK = 0;
    GST_PAD_LINK_WRONG_HIERARCHY = -(1);
    GST_PAD_LINK_WAS_LINKED = -(2);
    GST_PAD_LINK_WRONG_DIRECTION = -(3);
    GST_PAD_LINK_NOFORMAT = -(4);
    GST_PAD_LINK_NOSCHED = -(5);
    GST_PAD_LINK_REFUSED = -(6);

type
  PGstFlowReturn = ^TGstFlowReturn;
  TGstFlowReturn =  Longint;
  Const
    GST_FLOW_CUSTOM_SUCCESS_2 = 102;
    GST_FLOW_CUSTOM_SUCCESS_1 = 101;
    GST_FLOW_CUSTOM_SUCCESS = 100;
    GST_FLOW_OK = 0;
    GST_FLOW_NOT_LINKED = -(1);
    GST_FLOW_FLUSHING = -(2);
    GST_FLOW_EOS = -(3);
    GST_FLOW_NOT_NEGOTIATED = -(4);
    GST_FLOW_ERROR = -(5);
    GST_FLOW_NOT_SUPPORTED = -(6);
    GST_FLOW_CUSTOM_ERROR = -(100);
    GST_FLOW_CUSTOM_ERROR_1 = -(101);
    GST_FLOW_CUSTOM_ERROR_2 = -(102);

function gst_flow_get_name(ret:TGstFlowReturn):Pgchar;cdecl;external gstreamerlib;
function gst_flow_to_quark(ret:TGstFlowReturn):TGQuark;cdecl;external gstreamerlib;
function gst_pad_link_get_name(ret:TGstPadLinkReturn):Pgchar;cdecl;external gstreamerlib;
type
  PGstPadLinkCheck = ^TGstPadLinkCheck;
  TGstPadLinkCheck =  Longint;
  Const
    GST_PAD_LINK_CHECK_NOTHING = 0;
    GST_PAD_LINK_CHECK_HIERARCHY = 1 shl 0;
    GST_PAD_LINK_CHECK_TEMPLATE_CAPS = 1 shl 1;
    GST_PAD_LINK_CHECK_CAPS = 1 shl 2;
    GST_PAD_LINK_CHECK_NO_RECONFIGURE = 1 shl 3;
    GST_PAD_LINK_CHECK_DEFAULT = GST_PAD_LINK_CHECK_HIERARCHY or GST_PAD_LINK_CHECK_CAPS;


  type
    PGstPad = ^TGstPad;

    TGstPadActivateFunction = function (pad:PGstPad; parent:PGstObject):Tgboolean;cdecl;
    TGstPadActivateModeFunction = function (pad:PGstPad; parent:PGstObject; mode:TGstPadMode; active:Tgboolean):Tgboolean;cdecl;
    TGstPadChainFunction = function (pad:PGstPad; parent:PGstObject; buffer:PGstBuffer):TGstFlowReturn;cdecl;
    TGstPadChainListFunction = function (pad:PGstPad; parent:PGstObject; list:PGstBufferList):TGstFlowReturn;cdecl;
    TGstPadGetRangeFunction = function (pad:PGstPad; parent:PGstObject; offset:Tguint64; length:Tguint; buffer:PPGstBuffer):TGstFlowReturn;cdecl;
    TGstPadEventFunction = function (pad:PGstPad; parent:PGstObject; event:PGstEvent):Tgboolean;cdecl;
    TGstPadEventFullFunction = function (pad:PGstPad; parent:PGstObject; event:PGstEvent):TGstFlowReturn;cdecl;

    PGstPadIterIntLinkFunction = ^TGstPadIterIntLinkFunction;
    TGstPadIterIntLinkFunction = function (pad:PGstPad; parent:PGstObject):PGstIterator;cdecl;

    TGstPadQueryFunction = function (pad:PGstPad; parent:PGstObject; query:PGstQuery):Tgboolean;cdecl;
    TGstPadLinkFunction = function (pad:PGstPad; parent:PGstObject; peer:PGstPad):TGstPadLinkReturn;cdecl;
    TGstPadUnlinkFunction = procedure (pad:PGstPad; parent:PGstObject);cdecl;
    TGstPadForwardFunction = function (pad:PGstPad; user_data:Tgpointer):Tgboolean;cdecl;

    TGstPad = record
        obj : TGstObject;
        element_private : Tgpointer;
        padtemplate : PGstPadTemplate;
        direction : TGstPadDirection;
        stream_rec_lock : TGRecMutex;
        task : PGstTask;
        block_cond : TGCond;
        probes : TGHookList;
        mode : TGstPadMode;
        activatefunc : TGstPadActivateFunction;
        activatedata : Tgpointer;
        activatenotify : TGDestroyNotify;
        activatemodefunc : TGstPadActivateModeFunction;
        activatemodedata : Tgpointer;
        activatemodenotify : TGDestroyNotify;
        peer : PGstPad;
        linkfunc : TGstPadLinkFunction;
        linkdata : Tgpointer;
        linknotify : TGDestroyNotify;
        unlinkfunc : TGstPadUnlinkFunction;
        unlinkdata : Tgpointer;
        unlinknotify : TGDestroyNotify;
        chainfunc : TGstPadChainFunction;
        chaindata : Tgpointer;
        chainnotify : TGDestroyNotify;
        chainlistfunc : TGstPadChainListFunction;
        chainlistdata : Tgpointer;
        chainlistnotify : TGDestroyNotify;
        getrangefunc : TGstPadGetRangeFunction;
        getrangedata : Tgpointer;
        getrangenotify : TGDestroyNotify;
        eventfunc : TGstPadEventFunction;
        eventdata : Tgpointer;
        eventnotify : TGDestroyNotify;
        offset : Tgint64;
        queryfunc : TGstPadQueryFunction;
        querydata : Tgpointer;
        querynotify : TGDestroyNotify;
        iterintlinkfunc : TGstPadIterIntLinkFunction;
        iterintlinkdata : Tgpointer;
        iterintlinknotify : TGDestroyNotify;
        num_probes : Tgint;
        num_blocked : Tgint;
        priv : PGstPadPrivate;
        ABI : record
            case longint of
              0 : ( _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer );
              1 : ( abi : record
                  last_flowret : TGstFlowReturn;
                  eventfullfunc : TGstPadEventFullFunction;
                end );
            end;
      end;


type
  PGstPadProbeType = ^TGstPadProbeType;
  TGstPadProbeType =  Longint;
  Const
    GST_PAD_PROBE_TYPE_INVALID = 0;
    GST_PAD_PROBE_TYPE_IDLE = 1 shl 0;
    GST_PAD_PROBE_TYPE_BLOCK = 1 shl 1;
    GST_PAD_PROBE_TYPE_BUFFER = 1 shl 4;
    GST_PAD_PROBE_TYPE_BUFFER_LIST = 1 shl 5;
    GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM = 1 shl 6;
    GST_PAD_PROBE_TYPE_EVENT_UPSTREAM = 1 shl 7;
    GST_PAD_PROBE_TYPE_EVENT_FLUSH = 1 shl 8;
    GST_PAD_PROBE_TYPE_QUERY_DOWNSTREAM = 1 shl 9;
    GST_PAD_PROBE_TYPE_QUERY_UPSTREAM = 1 shl 10;
    GST_PAD_PROBE_TYPE_PUSH = 1 shl 12;
    GST_PAD_PROBE_TYPE_PULL = 1 shl 13;
    GST_PAD_PROBE_TYPE_BLOCKING = GST_PAD_PROBE_TYPE_IDLE or GST_PAD_PROBE_TYPE_BLOCK;
    GST_PAD_PROBE_TYPE_DATA_DOWNSTREAM = (GST_PAD_PROBE_TYPE_BUFFER or GST_PAD_PROBE_TYPE_BUFFER_LIST) or GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM;
    GST_PAD_PROBE_TYPE_DATA_UPSTREAM = GST_PAD_PROBE_TYPE_EVENT_UPSTREAM;
    GST_PAD_PROBE_TYPE_DATA_BOTH = GST_PAD_PROBE_TYPE_DATA_DOWNSTREAM or GST_PAD_PROBE_TYPE_DATA_UPSTREAM;
    GST_PAD_PROBE_TYPE_BLOCK_DOWNSTREAM = GST_PAD_PROBE_TYPE_BLOCK or GST_PAD_PROBE_TYPE_DATA_DOWNSTREAM;
    GST_PAD_PROBE_TYPE_BLOCK_UPSTREAM = GST_PAD_PROBE_TYPE_BLOCK or GST_PAD_PROBE_TYPE_DATA_UPSTREAM;
    GST_PAD_PROBE_TYPE_EVENT_BOTH = GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM or GST_PAD_PROBE_TYPE_EVENT_UPSTREAM;
    GST_PAD_PROBE_TYPE_QUERY_BOTH = GST_PAD_PROBE_TYPE_QUERY_DOWNSTREAM or GST_PAD_PROBE_TYPE_QUERY_UPSTREAM;
    GST_PAD_PROBE_TYPE_ALL_BOTH = GST_PAD_PROBE_TYPE_DATA_BOTH or GST_PAD_PROBE_TYPE_QUERY_BOTH;
    GST_PAD_PROBE_TYPE_SCHEDULING = GST_PAD_PROBE_TYPE_PUSH or GST_PAD_PROBE_TYPE_PULL;
type
  PGstPadProbeReturn = ^TGstPadProbeReturn;
  TGstPadProbeReturn =  Longint;
  Const
    GST_PAD_PROBE_DROP = 0;
    GST_PAD_PROBE_OK = 1;
    GST_PAD_PROBE_REMOVE = 2;
    GST_PAD_PROBE_PASS = 3;
    GST_PAD_PROBE_HANDLED = 4;
type
  PGstPadProbeInfo = ^TGstPadProbeInfo;
  TGstPadProbeInfo = record
      _type : TGstPadProbeType;
      id : Tgulong;
      data : Tgpointer;
      offset : Tguint64;
      size : Tguint;
      ABI : record
          case longint of
            0 : ( _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer );
            1 : ( abi : record
                flow_ret : TGstFlowReturn;
              end );
          end;
    end;


function gst_pad_probe_info_get_event(info:PGstPadProbeInfo):PGstEvent;cdecl;external gstreamerlib;
function gst_pad_probe_info_get_query(info:PGstPadProbeInfo):PGstQuery;cdecl;external gstreamerlib;
function gst_pad_probe_info_get_buffer(info:PGstPadProbeInfo):PGstBuffer;cdecl;external gstreamerlib;
function gst_pad_probe_info_get_buffer_list(info:PGstPadProbeInfo):PGstBufferList;cdecl;external gstreamerlib;
type
  TGstPadProbeCallback = function (pad:PGstPad; info:PGstPadProbeInfo; user_data:Tgpointer):TGstPadProbeReturn;cdecl;
  TGstPadStickyEventsForeachFunction = function (pad:PGstPad; event:PPGstEvent; user_data:Tgpointer):Tgboolean;cdecl;

  PGstPadFlags = ^TGstPadFlags;
  TGstPadFlags =  Longint;
  Const
    GST_PAD_FLAG_BLOCKED = GST_OBJECT_FLAG_LAST shl 0;
    GST_PAD_FLAG_FLUSHING = GST_OBJECT_FLAG_LAST shl 1;
    GST_PAD_FLAG_EOS = GST_OBJECT_FLAG_LAST shl 2;
    GST_PAD_FLAG_BLOCKING = GST_OBJECT_FLAG_LAST shl 3;
    GST_PAD_FLAG_NEED_PARENT = GST_OBJECT_FLAG_LAST shl 4;
    GST_PAD_FLAG_NEED_RECONFIGURE = GST_OBJECT_FLAG_LAST shl 5;
    GST_PAD_FLAG_PENDING_EVENTS = GST_OBJECT_FLAG_LAST shl 6;
    GST_PAD_FLAG_FIXED_CAPS = GST_OBJECT_FLAG_LAST shl 7;
    GST_PAD_FLAG_PROXY_CAPS = GST_OBJECT_FLAG_LAST shl 8;
    GST_PAD_FLAG_PROXY_ALLOCATION = GST_OBJECT_FLAG_LAST shl 9;
    GST_PAD_FLAG_PROXY_SCHEDULING = GST_OBJECT_FLAG_LAST shl 10;
    GST_PAD_FLAG_ACCEPT_INTERSECT = GST_OBJECT_FLAG_LAST shl 11;
    GST_PAD_FLAG_ACCEPT_TEMPLATE = GST_OBJECT_FLAG_LAST shl 12;
    GST_PAD_FLAG_LAST = GST_OBJECT_FLAG_LAST shl 16;
type
  PGstPadClass = ^TGstPadClass;
  TGstPadClass = record
      parent_class : TGstObjectClass;
      linked : procedure (pad:PGstPad; peer:PGstPad);cdecl;
      unlinked : procedure (pad:PGstPad; peer:PGstPad);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

function gst_pad_get_type:TGType;cdecl;external gstreamerlib;
function gst_pad_new(name:Pgchar; direction:TGstPadDirection):PGstPad;cdecl;external gstreamerlib;
function gst_pad_new_from_template(templ:PGstPadTemplate; name:Pgchar):PGstPad;cdecl;external gstreamerlib;
function gst_pad_new_from_static_template(templ:PGstStaticPadTemplate; name:Pgchar):PGstPad;cdecl;external gstreamerlib;

function gst_pad_get_direction(pad:PGstPad):TGstPadDirection;cdecl;external gstreamerlib;
function gst_pad_set_active(pad:PGstPad; active:Tgboolean):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_is_active(pad:PGstPad):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_activate_mode(pad:PGstPad; mode:TGstPadMode; active:Tgboolean):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_add_probe(pad:PGstPad; mask:TGstPadProbeType; callback:TGstPadProbeCallback; user_data:Tgpointer; destroy_data:TGDestroyNotify):Tgulong;cdecl;external gstreamerlib;
procedure gst_pad_remove_probe(pad:PGstPad; id:Tgulong);cdecl;external gstreamerlib;
function gst_pad_is_blocked(pad:PGstPad):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_is_blocking(pad:PGstPad):Tgboolean;cdecl;external gstreamerlib;
procedure gst_pad_mark_reconfigure(pad:PGstPad);cdecl;external gstreamerlib;
function gst_pad_needs_reconfigure(pad:PGstPad):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_check_reconfigure(pad:PGstPad):Tgboolean;cdecl;external gstreamerlib;
procedure gst_pad_set_element_private(pad:PGstPad; priv:Tgpointer);cdecl;external gstreamerlib;
function gst_pad_get_element_private(pad:PGstPad):Tgpointer;cdecl;external gstreamerlib;
function gst_pad_get_pad_template(pad:PGstPad):PGstPadTemplate;cdecl;external gstreamerlib;
function gst_pad_store_sticky_event(pad:PGstPad; event:PGstEvent):TGstFlowReturn;cdecl;external gstreamerlib;
function gst_pad_get_sticky_event(pad:PGstPad; event_type:TGstEventType; idx:Tguint):PGstEvent;cdecl;external gstreamerlib;
procedure gst_pad_sticky_events_foreach(pad:PGstPad; foreach_func:TGstPadStickyEventsForeachFunction; user_data:Tgpointer);cdecl;external gstreamerlib;
procedure gst_pad_set_activate_function_full(pad:PGstPad; activate:TGstPadActivateFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external gstreamerlib;
procedure gst_pad_set_activatemode_function_full(pad:PGstPad; activatemode:TGstPadActivateModeFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external gstreamerlib;
procedure gst_pad_set_chain_function_full(pad:PGstPad; chain:TGstPadChainFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external gstreamerlib;
procedure gst_pad_set_chain_list_function_full(pad:PGstPad; chainlist:TGstPadChainListFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external gstreamerlib;
procedure gst_pad_set_getrange_function_full(pad:PGstPad; get:TGstPadGetRangeFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external gstreamerlib;
procedure gst_pad_set_event_function_full(pad:PGstPad; event:TGstPadEventFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external gstreamerlib;
procedure gst_pad_set_event_full_function_full(pad:PGstPad; event:TGstPadEventFullFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external gstreamerlib;

procedure gst_pad_set_link_function_full(pad:PGstPad; link:TGstPadLinkFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external gstreamerlib;
procedure gst_pad_set_unlink_function_full(pad:PGstPad; unlink:TGstPadUnlinkFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external gstreamerlib;

function gst_pad_can_link(srcpad:PGstPad; sinkpad:PGstPad):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_link(srcpad:PGstPad; sinkpad:PGstPad):TGstPadLinkReturn;cdecl;external gstreamerlib;
function gst_pad_link_full(srcpad:PGstPad; sinkpad:PGstPad; flags:TGstPadLinkCheck):TGstPadLinkReturn;cdecl;external gstreamerlib;
function gst_pad_unlink(srcpad:PGstPad; sinkpad:PGstPad):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_is_linked(pad:PGstPad):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_get_peer(pad:PGstPad):PGstPad;cdecl;external gstreamerlib;
function gst_pad_get_pad_template_caps(pad:PGstPad):PGstCaps;cdecl;external gstreamerlib;
function gst_pad_get_current_caps(pad:PGstPad):PGstCaps;cdecl;external gstreamerlib;
function gst_pad_has_current_caps(pad:PGstPad):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_get_allowed_caps(pad:PGstPad):PGstCaps;cdecl;external gstreamerlib;
function gst_pad_get_offset(pad:PGstPad):Tgint64;cdecl;external gstreamerlib;
procedure gst_pad_set_offset(pad:PGstPad; offset:Tgint64);cdecl;external gstreamerlib;
function gst_pad_push(pad:PGstPad; buffer:PGstBuffer):TGstFlowReturn;cdecl;external gstreamerlib;
function gst_pad_push_list(pad:PGstPad; list:PGstBufferList):TGstFlowReturn;cdecl;external gstreamerlib;
function gst_pad_pull_range(pad:PGstPad; offset:Tguint64; size:Tguint; buffer:PPGstBuffer):TGstFlowReturn;cdecl;external gstreamerlib;
function gst_pad_push_event(pad:PGstPad; event:PGstEvent):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_event_default(pad:PGstPad; parent:PGstObject; event:PGstEvent):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_get_last_flow_return(pad:PGstPad):TGstFlowReturn;cdecl;external gstreamerlib;
function gst_pad_chain(pad:PGstPad; buffer:PGstBuffer):TGstFlowReturn;cdecl;external gstreamerlib;
function gst_pad_chain_list(pad:PGstPad; list:PGstBufferList):TGstFlowReturn;cdecl;external gstreamerlib;
function gst_pad_get_range(pad:PGstPad; offset:Tguint64; size:Tguint; buffer:PPGstBuffer):TGstFlowReturn;cdecl;external gstreamerlib;
function gst_pad_send_event(pad:PGstPad; event:PGstEvent):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_start_task(pad:PGstPad; func:TGstTaskFunction; user_data:Tgpointer; notify:TGDestroyNotify):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_pause_task(pad:PGstPad):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_stop_task(pad:PGstPad):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_get_task_state(pad:PGstPad):TGstTaskState;cdecl;external gstreamerlib;
procedure gst_pad_set_iterate_internal_links_function_full(pad:PGstPad; iterintlink:TGstPadIterIntLinkFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external gstreamerlib;
function gst_pad_iterate_internal_links(pad:PGstPad):PGstIterator;cdecl;external gstreamerlib;
function gst_pad_iterate_internal_links_default(pad:PGstPad; parent:PGstObject):PGstIterator;cdecl;external gstreamerlib;

function gst_pad_get_single_internal_link(pad:PGstPad):PGstPad;cdecl;external gstreamerlib;
function gst_pad_query(pad:PGstPad; query:PGstQuery):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_peer_query(pad:PGstPad; query:PGstQuery):Tgboolean;cdecl;external gstreamerlib;
procedure gst_pad_set_query_function_full(pad:PGstPad; query:TGstPadQueryFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external gstreamerlib;
function gst_pad_query_default(pad:PGstPad; parent:PGstObject; query:PGstQuery):Tgboolean;cdecl;external gstreamerlib;
function gst_pad_forward(pad:PGstPad; forward:TGstPadForwardFunction; user_data:Tgpointer):Tgboolean;cdecl;external gstreamerlib;


function GST_PAD_LINK_FAILED(ret : longint) : longint;
function GST_PAD_LINK_SUCCESSFUL(ret : longint) : longint;

function GST_PAD_PROBE_INFO_TYPE(d : longint) : longint;
function GST_PAD_PROBE_INFO_ID(d : longint) : longint;
function GST_PAD_PROBE_INFO_DATA(d : longint) : longint;
function GST_PAD_PROBE_INFO_FLOW_RETURN(d : longint) : longint;
function GST_PAD_PROBE_INFO_BUFFER(d : longint) : longint;
function GST_PAD_PROBE_INFO_BUFFER_LIST(d : longint) : longint;
function GST_PAD_PROBE_INFO_EVENT(d : longint) : longint;
function GST_PAD_PROBE_INFO_QUERY(d : longint) : longint;
function GST_PAD_PROBE_INFO_OFFSET(d : longint) : longint;
function GST_PAD_PROBE_INFO_SIZE(d : longint) : longint;

function GST_PAD_NAME(pad : longint) : longint;
function GST_PAD_PARENT(pad : longint) : longint;
function GST_PAD_ELEMENT_PRIVATE(pad : longint) : longint;
function GST_PAD_PAD_TEMPLATE(pad : longint) : longint;
function GST_PAD_DIRECTION(pad : longint) : longint;
function GST_PAD_TASK(pad : longint) : longint;
function GST_PAD_MODE(pad : longint) : longint;
function GST_PAD_ACTIVATEFUNC(pad : longint) : longint;
function GST_PAD_ACTIVATEMODEFUNC(pad : longint) : longint;
function GST_PAD_CHAINFUNC(pad : longint) : longint;
function GST_PAD_CHAINLISTFUNC(pad : longint) : longint;
function GST_PAD_GETRANGEFUNC(pad : longint) : longint;
function GST_PAD_EVENTFUNC(pad : longint) : longint;
function GST_PAD_EVENTFULLFUNC(pad : longint) : longint;
function GST_PAD_QUERYFUNC(pad : longint) : longint;
function GST_PAD_ITERINTLINKFUNC(pad : longint) : longint;
function GST_PAD_PEER(pad : longint) : longint;
function GST_PAD_LINKFUNC(pad : longint) : longint;
function GST_PAD_UNLINKFUNC(pad : longint) : longint;
function GST_PAD_IS_SRC(pad : longint) : longint;
function GST_PAD_IS_SINK(pad : longint) : longint;
function GST_PAD_IS_LINKED(pad : longint) : longint;
function GST_PAD_IS_ACTIVE(pad : longint) : longint;
function GST_PAD_IS_BLOCKED(pad : longint) : longint;
function GST_PAD_IS_BLOCKING(pad : longint) : longint;
function GST_PAD_IS_FLUSHING(pad : longint) : longint;
function GST_PAD_SET_FLUSHING(pad : longint) : longint;
function GST_PAD_UNSET_FLUSHING(pad : longint) : longint;
function GST_PAD_IS_EOS(pad : longint) : longint;
function GST_PAD_NEEDS_RECONFIGURE(pad : longint) : longint;
function GST_PAD_HAS_PENDING_EVENTS(pad : longint) : longint;
function GST_PAD_IS_FIXED_CAPS(pad : longint) : longint;
function GST_PAD_NEEDS_PARENT(pad : longint) : longint;
function GST_PAD_IS_PROXY_CAPS(pad : longint) : longint;
function GST_PAD_SET_PROXY_CAPS(pad : longint) : longint;
function GST_PAD_UNSET_PROXY_CAPS(pad : longint) : longint;
function GST_PAD_IS_PROXY_ALLOCATION(pad : longint) : longint;
function GST_PAD_SET_PROXY_ALLOCATION(pad : longint) : longint;
function GST_PAD_UNSET_PROXY_ALLOCATION(pad : longint) : longint;
function GST_PAD_IS_PROXY_SCHEDULING(pad : longint) : longint;
function GST_PAD_SET_PROXY_SCHEDULING(pad : longint) : longint;
function GST_PAD_UNSET_PROXY_SCHEDULING(pad : longint) : longint;
function GST_PAD_IS_ACCEPT_INTERSECT(pad : longint) : longint;
function GST_PAD_SET_ACCEPT_INTERSECT(pad : longint) : longint;
function GST_PAD_UNSET_ACCEPT_INTERSECT(pad : longint) : longint;
function GST_PAD_IS_ACCEPT_TEMPLATE(pad : longint) : longint;
function GST_PAD_SET_ACCEPT_TEMPLATE(pad : longint) : longint;
function GST_PAD_UNSET_ACCEPT_TEMPLATE(pad : longint) : longint;
function GST_PAD_GET_STREAM_LOCK(pad : longint) : longint;
function GST_PAD_STREAM_LOCK(pad : longint) : longint;

{#define GST_PAD_STREAM_AUTO_LOCK(pad, var) g_autoptr(GRecMutexLocker) G_GNUC_UNUSED var = g_rec_mutex_locker_new(GST_PAD_GET_STREAM_LOCK(pad)) }

function GST_PAD_STREAM_TRYLOCK(pad : longint) : longint;
function GST_PAD_STREAM_UNLOCK(pad : longint) : longint;
function GST_PAD_LAST_FLOW_RETURN(pad : longint) : longint;
function GST_PAD_BLOCK_GET_COND(pad : longint) : longint;
function GST_PAD_BLOCK_WAIT(pad : longint) : longint;
function GST_PAD_BLOCK_SIGNAL(pad : longint) : longint;
function GST_PAD_BLOCK_BROADCAST(pad : longint) : longint;

function gst_pad_get_name(pad : longint) : longint;
function gst_pad_get_parent(pad : longint) : longint;

function gst_pad_set_activate_function(p,f : longint) : longint;
function gst_pad_set_activatemode_function(p,f : longint) : longint;
function gst_pad_set_chain_function(p,f : longint) : longint;
function gst_pad_set_chain_list_function(p,f : longint) : longint;
function gst_pad_set_getrange_function(p,f : longint) : longint;
function gst_pad_set_event_function(p,f : longint) : longint;
function gst_pad_set_event_full_function(p,f : longint) : longint;

function gst_pad_set_link_function(p,f : longint) : longint;
function gst_pad_set_unlink_function(p,f : longint) : longint;

function gst_pad_set_iterate_internal_links_function(p,f : longint) : longint;
function gst_pad_set_query_function(p,f : longint) : longint;



// === Konventiert am: 14-9-24 13:33:22 ===

function GST_TYPE_PAD : TGType;
function GST_PAD(obj : Pointer) : PGstPad;
function GST_PAD_CLASS(klass : Pointer) : PGstPadClass;
function GST_IS_PAD(obj : Pointer) : Tgboolean;
function GST_IS_PAD_CLASS(klass : Pointer) : Tgboolean;
begin

implementation
{ was #define dname(params) para_def_expr }
function GST_TYPE_PAD : TGType;
  begin
    GST_TYPE_PAD:=gst_pad_get_type;
  end;

function GST_PAD(obj : Pointer) : PGstPad;
begin
  Result := PGstPad(g_type_check_instance_cast(obj, GST_TYPE_PAD));
end;

function GST_PAD_CLASS(klass : Pointer) : PGstPadClass;
begin
  Result := PGstPadClass(g_type_check_class_cast(klass, GST_TYPE_PAD));
end;

function GST_IS_PAD(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_PAD);
end;

function GST_IS_PAD_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_PAD);
end;

begin
  GST_PAD_CAST:=PGstPad(obj);
  Result := PGstPadClass(PGTypeInstance(obj)^.g_class);

{ was #define dname(params) para_def_expr }

{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_LINK_FAILED(ret : longint) : longint;
begin
  GST_PAD_LINK_FAILED:=ret<GST_PAD_LINK_OK;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_LINK_SUCCESSFUL(ret : longint) : longint;
begin
  GST_PAD_LINK_SUCCESSFUL:=ret>=GST_PAD_LINK_OK;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_TYPE(d : longint) : longint;
begin
  GST_PAD_PROBE_INFO_TYPE:=d^._type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_ID(d : longint) : longint;
begin
  GST_PAD_PROBE_INFO_ID:=d^.id;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_DATA(d : longint) : longint;
begin
  GST_PAD_PROBE_INFO_DATA:=d^.data;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_FLOW_RETURN(d : longint) : longint;
begin
  GST_PAD_PROBE_INFO_FLOW_RETURN:=d^.(ABI.(abi.flow_ret));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_BUFFER(d : longint) : longint;
begin
  GST_PAD_PROBE_INFO_BUFFER:=GST_BUFFER_CAST(GST_PAD_PROBE_INFO_DATA(d));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_BUFFER_LIST(d : longint) : longint;
begin
  GST_PAD_PROBE_INFO_BUFFER_LIST:=GST_BUFFER_LIST_CAST(GST_PAD_PROBE_INFO_DATA(d));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_EVENT(d : longint) : longint;
begin
  GST_PAD_PROBE_INFO_EVENT:=GST_EVENT_CAST(GST_PAD_PROBE_INFO_DATA(d));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_QUERY(d : longint) : longint;
begin
  GST_PAD_PROBE_INFO_QUERY:=GST_QUERY_CAST(GST_PAD_PROBE_INFO_DATA(d));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_OFFSET(d : longint) : longint;
begin
  GST_PAD_PROBE_INFO_OFFSET:=d^.offset;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_SIZE(d : longint) : longint;
begin
  GST_PAD_PROBE_INFO_SIZE:=d^.size;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_NAME(pad : longint) : longint;
begin
  GST_PAD_NAME:=GST_OBJECT_NAME(pad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PARENT(pad : longint) : longint;
begin
  GST_PAD_PARENT:=GST_ELEMENT_CAST(GST_OBJECT_PARENT(pad));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_ELEMENT_PRIVATE(pad : longint) : longint;
begin
  GST_PAD_ELEMENT_PRIVATE:=(GST_PAD_CAST(pad))^.element_private;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PAD_TEMPLATE(pad : longint) : longint;
begin
  GST_PAD_PAD_TEMPLATE:=(GST_PAD_CAST(pad))^.padtemplate;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_DIRECTION(pad : longint) : longint;
begin
  GST_PAD_DIRECTION:=(GST_PAD_CAST(pad))^.direction;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TASK(pad : longint) : longint;
begin
  GST_PAD_TASK:=(GST_PAD_CAST(pad))^.task;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_MODE(pad : longint) : longint;
begin
  GST_PAD_MODE:=(GST_PAD_CAST(pad))^.mode;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_ACTIVATEFUNC(pad : longint) : longint;
begin
  GST_PAD_ACTIVATEFUNC:=(GST_PAD_CAST(pad))^.activatefunc;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_ACTIVATEMODEFUNC(pad : longint) : longint;
begin
  GST_PAD_ACTIVATEMODEFUNC:=(GST_PAD_CAST(pad))^.activatemodefunc;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_CHAINFUNC(pad : longint) : longint;
begin
  GST_PAD_CHAINFUNC:=(GST_PAD_CAST(pad))^.chainfunc;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_CHAINLISTFUNC(pad : longint) : longint;
begin
  GST_PAD_CHAINLISTFUNC:=(GST_PAD_CAST(pad))^.chainlistfunc;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_GETRANGEFUNC(pad : longint) : longint;
begin
  GST_PAD_GETRANGEFUNC:=(GST_PAD_CAST(pad))^.getrangefunc;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_EVENTFUNC(pad : longint) : longint;
begin
  GST_PAD_EVENTFUNC:=(GST_PAD_CAST(pad))^.eventfunc;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_EVENTFULLFUNC(pad : longint) : longint;
begin
  GST_PAD_EVENTFULLFUNC:=(GST_PAD_CAST(pad))^.(ABI.(abi.eventfullfunc));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_QUERYFUNC(pad : longint) : longint;
begin
  GST_PAD_QUERYFUNC:=(GST_PAD_CAST(pad))^.queryfunc;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_ITERINTLINKFUNC(pad : longint) : longint;
begin
  GST_PAD_ITERINTLINKFUNC:=(GST_PAD_CAST(pad))^.iterintlinkfunc;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PEER(pad : longint) : longint;
begin
  GST_PAD_PEER:=(GST_PAD_CAST(pad))^.peer;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_LINKFUNC(pad : longint) : longint;
begin
  GST_PAD_LINKFUNC:=(GST_PAD_CAST(pad))^.linkfunc;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_UNLINKFUNC(pad : longint) : longint;
begin
  GST_PAD_UNLINKFUNC:=(GST_PAD_CAST(pad))^.unlinkfunc;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_SRC(pad : longint) : longint;
begin
  GST_PAD_IS_SRC:=(GST_PAD_DIRECTION(pad))=GST_PAD_SRC;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_SINK(pad : longint) : longint;
begin
  GST_PAD_IS_SINK:=(GST_PAD_DIRECTION(pad))=GST_PAD_SINK;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_LINKED(pad : longint) : longint;
begin
  GST_PAD_IS_LINKED:=(GST_PAD_PEER(pad))<>NULL;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_ACTIVE(pad : longint) : longint;
begin
  GST_PAD_IS_ACTIVE:=(GST_PAD_MODE(pad))<>GST_PAD_MODE_NONE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_BLOCKED(pad : longint) : longint;
begin
  GST_PAD_IS_BLOCKED:=GST_OBJECT_FLAG_IS_SET(pad,GST_PAD_FLAG_BLOCKED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_BLOCKING(pad : longint) : longint;
begin
  GST_PAD_IS_BLOCKING:=GST_OBJECT_FLAG_IS_SET(pad,GST_PAD_FLAG_BLOCKING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_FLUSHING(pad : longint) : longint;
begin
  GST_PAD_IS_FLUSHING:=GST_OBJECT_FLAG_IS_SET(pad,GST_PAD_FLAG_FLUSHING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_SET_FLUSHING(pad : longint) : longint;
begin
  GST_PAD_SET_FLUSHING:=GST_OBJECT_FLAG_SET(pad,GST_PAD_FLAG_FLUSHING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_UNSET_FLUSHING(pad : longint) : longint;
begin
  GST_PAD_UNSET_FLUSHING:=GST_OBJECT_FLAG_UNSET(pad,GST_PAD_FLAG_FLUSHING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_EOS(pad : longint) : longint;
begin
  GST_PAD_IS_EOS:=GST_OBJECT_FLAG_IS_SET(pad,GST_PAD_FLAG_EOS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_NEEDS_RECONFIGURE(pad : longint) : longint;
begin
  GST_PAD_NEEDS_RECONFIGURE:=GST_OBJECT_FLAG_IS_SET(pad,GST_PAD_FLAG_NEED_RECONFIGURE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_HAS_PENDING_EVENTS(pad : longint) : longint;
begin
  GST_PAD_HAS_PENDING_EVENTS:=GST_OBJECT_FLAG_IS_SET(pad,GST_PAD_FLAG_PENDING_EVENTS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_FIXED_CAPS(pad : longint) : longint;
begin
  GST_PAD_IS_FIXED_CAPS:=GST_OBJECT_FLAG_IS_SET(pad,GST_PAD_FLAG_FIXED_CAPS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_NEEDS_PARENT(pad : longint) : longint;
begin
  GST_PAD_NEEDS_PARENT:=GST_OBJECT_FLAG_IS_SET(pad,GST_PAD_FLAG_NEED_PARENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_PROXY_CAPS(pad : longint) : longint;
begin
  GST_PAD_IS_PROXY_CAPS:=GST_OBJECT_FLAG_IS_SET(pad,GST_PAD_FLAG_PROXY_CAPS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_SET_PROXY_CAPS(pad : longint) : longint;
begin
  GST_PAD_SET_PROXY_CAPS:=GST_OBJECT_FLAG_SET(pad,GST_PAD_FLAG_PROXY_CAPS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_UNSET_PROXY_CAPS(pad : longint) : longint;
begin
  GST_PAD_UNSET_PROXY_CAPS:=GST_OBJECT_FLAG_UNSET(pad,GST_PAD_FLAG_PROXY_CAPS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_PROXY_ALLOCATION(pad : longint) : longint;
begin
  GST_PAD_IS_PROXY_ALLOCATION:=GST_OBJECT_FLAG_IS_SET(pad,GST_PAD_FLAG_PROXY_ALLOCATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_SET_PROXY_ALLOCATION(pad : longint) : longint;
begin
  GST_PAD_SET_PROXY_ALLOCATION:=GST_OBJECT_FLAG_SET(pad,GST_PAD_FLAG_PROXY_ALLOCATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_UNSET_PROXY_ALLOCATION(pad : longint) : longint;
begin
  GST_PAD_UNSET_PROXY_ALLOCATION:=GST_OBJECT_FLAG_UNSET(pad,GST_PAD_FLAG_PROXY_ALLOCATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_PROXY_SCHEDULING(pad : longint) : longint;
begin
  GST_PAD_IS_PROXY_SCHEDULING:=GST_OBJECT_FLAG_IS_SET(pad,GST_PAD_FLAG_PROXY_SCHEDULING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_SET_PROXY_SCHEDULING(pad : longint) : longint;
begin
  GST_PAD_SET_PROXY_SCHEDULING:=GST_OBJECT_FLAG_SET(pad,GST_PAD_FLAG_PROXY_SCHEDULING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_UNSET_PROXY_SCHEDULING(pad : longint) : longint;
begin
  GST_PAD_UNSET_PROXY_SCHEDULING:=GST_OBJECT_FLAG_UNSET(pad,GST_PAD_FLAG_PROXY_SCHEDULING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_ACCEPT_INTERSECT(pad : longint) : longint;
begin
  GST_PAD_IS_ACCEPT_INTERSECT:=GST_OBJECT_FLAG_IS_SET(pad,GST_PAD_FLAG_ACCEPT_INTERSECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_SET_ACCEPT_INTERSECT(pad : longint) : longint;
begin
  GST_PAD_SET_ACCEPT_INTERSECT:=GST_OBJECT_FLAG_SET(pad,GST_PAD_FLAG_ACCEPT_INTERSECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_UNSET_ACCEPT_INTERSECT(pad : longint) : longint;
begin
  GST_PAD_UNSET_ACCEPT_INTERSECT:=GST_OBJECT_FLAG_UNSET(pad,GST_PAD_FLAG_ACCEPT_INTERSECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_ACCEPT_TEMPLATE(pad : longint) : longint;
begin
  GST_PAD_IS_ACCEPT_TEMPLATE:=GST_OBJECT_FLAG_IS_SET(pad,GST_PAD_FLAG_ACCEPT_TEMPLATE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_SET_ACCEPT_TEMPLATE(pad : longint) : longint;
begin
  GST_PAD_SET_ACCEPT_TEMPLATE:=GST_OBJECT_FLAG_SET(pad,GST_PAD_FLAG_ACCEPT_TEMPLATE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_UNSET_ACCEPT_TEMPLATE(pad : longint) : longint;
begin
  GST_PAD_UNSET_ACCEPT_TEMPLATE:=GST_OBJECT_FLAG_UNSET(pad,GST_PAD_FLAG_ACCEPT_TEMPLATE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_GET_STREAM_LOCK(pad : longint) : longint;
begin
  GST_PAD_GET_STREAM_LOCK:=@((GST_PAD_CAST(pad))^.stream_rec_lock);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_STREAM_LOCK(pad : longint) : longint;
begin
  GST_PAD_STREAM_LOCK:=g_rec_mutex_lock(GST_PAD_GET_STREAM_LOCK(pad));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_STREAM_TRYLOCK(pad : longint) : longint;
begin
  GST_PAD_STREAM_TRYLOCK:=g_rec_mutex_trylock(GST_PAD_GET_STREAM_LOCK(pad));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_STREAM_UNLOCK(pad : longint) : longint;
begin
  GST_PAD_STREAM_UNLOCK:=g_rec_mutex_unlock(GST_PAD_GET_STREAM_LOCK(pad));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_LAST_FLOW_RETURN(pad : longint) : longint;
begin
  GST_PAD_LAST_FLOW_RETURN:=(GST_PAD_CAST(pad))^.(ABI.(abi.last_flowret));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_BLOCK_GET_COND(pad : longint) : longint;
begin
  GST_PAD_BLOCK_GET_COND:=@((GST_PAD_CAST(pad))^.block_cond);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_BLOCK_WAIT(pad : longint) : longint;
begin
  GST_PAD_BLOCK_WAIT:=g_cond_wait(GST_PAD_BLOCK_GET_COND(pad),GST_OBJECT_GET_LOCK(pad));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_BLOCK_SIGNAL(pad : longint) : longint;
begin
  GST_PAD_BLOCK_SIGNAL:=g_cond_signal(GST_PAD_BLOCK_GET_COND(pad));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_BLOCK_BROADCAST(pad : longint) : longint;
begin
  GST_PAD_BLOCK_BROADCAST:=g_cond_broadcast(GST_PAD_BLOCK_GET_COND(pad));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_get_name(pad : longint) : longint;
begin
  gst_pad_get_name:=gst_object_get_name(GST_OBJECT_CAST(pad));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_get_parent(pad : longint) : longint;
begin
  gst_pad_get_parent:=gst_object_get_parent(GST_OBJECT_CAST(pad));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_activate_function(p,f : longint) : longint;
begin
  gst_pad_set_activate_function:=gst_pad_set_activate_function_full(p,f,NULL,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_activatemode_function(p,f : longint) : longint;
begin
  gst_pad_set_activatemode_function:=gst_pad_set_activatemode_function_full(p,f,NULL,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_chain_function(p,f : longint) : longint;
begin
  gst_pad_set_chain_function:=gst_pad_set_chain_function_full(p,f,NULL,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_chain_list_function(p,f : longint) : longint;
begin
  gst_pad_set_chain_list_function:=gst_pad_set_chain_list_function_full(p,f,NULL,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_getrange_function(p,f : longint) : longint;
begin
  gst_pad_set_getrange_function:=gst_pad_set_getrange_function_full(p,f,NULL,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_event_function(p,f : longint) : longint;
begin
  gst_pad_set_event_function:=gst_pad_set_event_function_full(p,f,NULL,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_event_full_function(p,f : longint) : longint;
begin
  gst_pad_set_event_full_function:=gst_pad_set_event_full_function_full(p,f,NULL,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_link_function(p,f : longint) : longint;
begin
  gst_pad_set_link_function:=gst_pad_set_link_function_full(p,f,NULL,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_unlink_function(p,f : longint) : longint;
begin
  gst_pad_set_unlink_function:=gst_pad_set_unlink_function_full(p,f,NULL,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_iterate_internal_links_function(p,f : longint) : longint;
begin
  gst_pad_set_iterate_internal_links_function:=gst_pad_set_iterate_internal_links_function_full(p,f,NULL,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_query_function(p,f : longint) : longint;
begin
  gst_pad_set_query_function:=gst_pad_set_query_function_full(p,f,NULL,NULL);
end;


end.
