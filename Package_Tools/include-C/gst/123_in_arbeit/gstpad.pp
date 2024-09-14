
unit gstpad;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstpad.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstpad.h
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
Pgchar  = ^gchar;
PGstBuffer  = ^GstBuffer;
PGstBufferList  = ^GstBufferList;
PGstCaps  = ^GstCaps;
PGstEvent  = ^GstEvent;
PGstFlowReturn  = ^GstFlowReturn;
PGstIterator  = ^GstIterator;
PGstObject  = ^GstObject;
PGstPad  = ^GstPad;
PGstPadClass  = ^GstPadClass;
PGstPadDirection  = ^GstPadDirection;
PGstPadFlags  = ^GstPadFlags;
PGstPadIterIntLinkFunction  = ^GstPadIterIntLinkFunction;
PGstPadLinkCheck  = ^GstPadLinkCheck;
PGstPadLinkReturn  = ^GstPadLinkReturn;
PGstPadMode  = ^GstPadMode;
PGstPadPrivate  = ^GstPadPrivate;
PGstPadProbeInfo  = ^GstPadProbeInfo;
PGstPadProbeReturn  = ^GstPadProbeReturn;
PGstPadProbeType  = ^GstPadProbeType;
PGstPadTemplate  = ^GstPadTemplate;
PGstQuery  = ^GstQuery;
PGstStaticPadTemplate  = ^GstStaticPadTemplate;
PGstTask  = ^GstTask;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wim.taymans@chello.be>
 *
 * gstpad.h: Header for GstPad object
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
{$ifndef __GST_PAD_H__}
{$define __GST_PAD_H__}
{$include <gst/gstconfig.h>}
type
{*
 * GstPadDirection:
 * @GST_PAD_UNKNOWN: direction is unknown.
 * @GST_PAD_SRC: the pad is a source pad.
 * @GST_PAD_SINK: the pad is a sink pad.
 *
 * The direction of a pad.
  }

  PGstPadDirection = ^TGstPadDirection;
  TGstPadDirection =  Longint;
  Const
    GST_PAD_UNKNOWN = 0;
    GST_PAD_SRC = 1;
    GST_PAD_SINK = 2;
;
{*
 * GstPadMode:
 * @GST_PAD_MODE_NONE: Pad will not handle dataflow
 * @GST_PAD_MODE_PUSH: Pad handles dataflow in downstream push mode
 * @GST_PAD_MODE_PULL: Pad handles dataflow in upstream pull mode
 *
 * The status of a GstPad. After activating a pad, which usually happens when the
 * parent element goes from READY to PAUSED, the GstPadMode defines if the
 * pad operates in push or pull mode.
  }
type
  PGstPadMode = ^TGstPadMode;
  TGstPadMode =  Longint;
  Const
    GST_PAD_MODE_NONE = 0;
    GST_PAD_MODE_PUSH = 1;
    GST_PAD_MODE_PULL = 2;
;
{$include <glib.h>}
(* Const before type ignored *)

function gst_pad_mode_get_name(mode:TGstPadMode):Pgchar;cdecl;external;
{$include <gst/gstobject.h>}
{$include <gst/gstbuffer.h>}
{$include <gst/gstbufferlist.h>}
{$include <gst/gstcaps.h>}
{$include <gst/gstpadtemplate.h>}
{$include <gst/gstevent.h>}
{$include <gst/gstquery.h>}
{$include <gst/gsttask.h>}
{
 * Pad base class
  }

{ was #define dname def_expr }
function GST_TYPE_PAD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PAD_CAST(obj : longint) : PGstPad;

{*
 * GstPadLinkReturn:
 * @GST_PAD_LINK_OK		: link succeeded
 * @GST_PAD_LINK_WRONG_HIERARCHY: pads have no common grandparent
 * @GST_PAD_LINK_WAS_LINKED	: pad was already linked
 * @GST_PAD_LINK_WRONG_DIRECTION: pads have wrong direction
 * @GST_PAD_LINK_NOFORMAT	: pads do not have common format
 * @GST_PAD_LINK_NOSCHED	: pads cannot cooperate in scheduling
 * @GST_PAD_LINK_REFUSED	: refused for some reason
 *
 * Result values from gst_pad_link and friends.
  }
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
;
{*
 * GST_PAD_LINK_FAILED:
 * @ret: the #GstPadLinkReturn value
 *
 * Macro to test if the given #GstPadLinkReturn value indicates a failed
 * link step.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_PAD_LINK_FAILED(ret : longint) : longint;

{*
 * GST_PAD_LINK_SUCCESSFUL:
 * @ret: the #GstPadLinkReturn value
 *
 * Macro to test if the given #GstPadLinkReturn value indicates a successful
 * link step.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_LINK_SUCCESSFUL(ret : longint) : longint;

{*
 * GstFlowReturn:
 * @GST_FLOW_OK:		 Data passing was ok.
 * @GST_FLOW_NOT_LINKED:	 Pad is not linked.
 * @GST_FLOW_FLUSHING:	         Pad is flushing.
 * @GST_FLOW_EOS:                Pad is EOS.
 * @GST_FLOW_NOT_NEGOTIATED:	 Pad is not negotiated.
 * @GST_FLOW_ERROR:		 Some (fatal) error occurred. Element generating
 *                               this error should post an error message using
 *                               GST_ELEMENT_ERROR() with more details.
 * @GST_FLOW_NOT_SUPPORTED:	 This operation is not supported.
 * @GST_FLOW_CUSTOM_SUCCESS:	 Elements can use values starting from
 *                               this (and higher) to define custom success
 *                               codes.
 * @GST_FLOW_CUSTOM_SUCCESS_1:	 Pre-defined custom success code (define your
 *                               custom success code to this to avoid compiler
 *                               warnings).
 * @GST_FLOW_CUSTOM_SUCCESS_2:	 Pre-defined custom success code.
 * @GST_FLOW_CUSTOM_ERROR:	 Elements can use values starting from
 *                               this (and lower) to define custom error codes.
 * @GST_FLOW_CUSTOM_ERROR_1:	 Pre-defined custom error code (define your
 *                               custom error code to this to avoid compiler
 *                               warnings).
 * @GST_FLOW_CUSTOM_ERROR_2:	 Pre-defined custom error code.
 *
 * The result of passing data to a pad.
 *
 * Note that the custom return values should not be exposed outside of the
 * element scope.
  }
{ custom success starts here  }
{ core predefined  }
{ expected failures  }
{ error cases  }
{ custom error starts here  }
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
;
(* Const before type ignored *)

function gst_flow_get_name(ret:TGstFlowReturn):Pgchar;cdecl;external;
function gst_flow_to_quark(ret:TGstFlowReturn):TGQuark;cdecl;external;
(* Const before type ignored *)
function gst_pad_link_get_name(ret:TGstPadLinkReturn):Pgchar;cdecl;external;
{*
 * GstPadLinkCheck:
 * @GST_PAD_LINK_CHECK_NOTHING: Don't check hierarchy or caps compatibility.
 * @GST_PAD_LINK_CHECK_HIERARCHY: Check the pads have same parents/grandparents.
 *   Could be omitted if it is already known that the two elements that own the
 *   pads are in the same bin.
 * @GST_PAD_LINK_CHECK_TEMPLATE_CAPS: Check if the pads are compatible by using
 *   their template caps. This is much faster than @GST_PAD_LINK_CHECK_CAPS, but
 *   would be unsafe e.g. if one pad has %GST_CAPS_ANY.
 * @GST_PAD_LINK_CHECK_CAPS: Check if the pads are compatible by comparing the
 *   caps returned by gst_pad_query_caps().
 * @GST_PAD_LINK_CHECK_NO_RECONFIGURE: Disables pushing a reconfigure event when pads are
 *   linked.
 * @GST_PAD_LINK_CHECK_DEFAULT: The default checks done when linking
 *   pads (i.e. the ones used by gst_pad_link()).
 *
 * The amount of checking to be done when linking pads. @GST_PAD_LINK_CHECK_CAPS
 * and @GST_PAD_LINK_CHECK_TEMPLATE_CAPS are mutually exclusive. If both are
 * specified, expensive but safe @GST_PAD_LINK_CHECK_CAPS are performed.
 *
 * > Only disable some of the checks if you are 100% certain you know the link
 * > will not fail because of hierarchy/caps compatibility failures. If uncertain,
 * > use the default checks (%GST_PAD_LINK_CHECK_DEFAULT) or the regular methods
 * > for linking the pads.
  }
{ Not really checks, more like flags
   * Added here to avoid creating a new gst_pad_link_variant  }
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
;
{ pad states  }
{*
 * GstPadActivateFunction:
 * @pad: a #GstPad
 * @parent: the parent of @pad
 *
 * This function is called when the pad is activated during the element
 * READY to PAUSED state change. By default this function will call the
 * activate function that puts the pad in push mode but elements can
 * override this function to activate the pad in pull mode if they wish.
 *
 * Returns: %TRUE if the pad could be activated.
  }
type

  TGstPadActivateFunction = function (pad:PGstPad; parent:PGstObject):Tgboolean;cdecl;
{*
 * GstPadActivateModeFunction:
 * @pad: a #GstPad
 * @parent: the parent of @pad
 * @mode: the requested activation mode of @pad
 * @active: activate or deactivate the pad.
 *
 * The prototype of the push and pull activate functions.
 *
 * Returns: %TRUE if the pad could be activated or deactivated.
  }

  TGstPadActivateModeFunction = function (pad:PGstPad; parent:PGstObject; mode:TGstPadMode; active:Tgboolean):Tgboolean;cdecl;
{ data passing  }
{*
 * GstPadChainFunction:
 * @pad: the sink #GstPad that performed the chain.
 * @parent: (allow-none): the parent of @pad. If the #GST_PAD_FLAG_NEED_PARENT
 *          flag is set, @parent is guaranteed to be not-%NULL and remain valid
 *          during the execution of this function.
 * @buffer: (transfer full): the #GstBuffer that is chained, not %NULL.
 *
 * A function that will be called on sinkpads when chaining buffers.
 * The function typically processes the data contained in the buffer and
 * either consumes the data or passes it on to the internally linked pad(s).
 *
 * The implementer of this function receives a refcount to @buffer and should
 * gst_buffer_unref() when the buffer is no longer needed.
 *
 * When a chain function detects an error in the data stream, it must post an
 * error on the bus and return an appropriate #GstFlowReturn value.
 *
 * Returns: #GST_FLOW_OK for success
  }

  TGstPadChainFunction = function (pad:PGstPad; parent:PGstObject; buffer:PGstBuffer):TGstFlowReturn;cdecl;
{*
 * GstPadChainListFunction:
 * @pad: the sink #GstPad that performed the chain.
 * @parent: (allow-none): the parent of @pad. If the #GST_PAD_FLAG_NEED_PARENT
 *          flag is set, @parent is guaranteed to be not-%NULL and remain valid
 *          during the execution of this function.
 * @list: (transfer full): the #GstBufferList that is chained, not %NULL.
 *
 * A function that will be called on sinkpads when chaining buffer lists.
 * The function typically processes the data contained in the buffer list and
 * either consumes the data or passes it on to the internally linked pad(s).
 *
 * The implementer of this function receives a refcount to @list and
 * should gst_buffer_list_unref() when the list is no longer needed.
 *
 * When a chainlist function detects an error in the data stream, it must
 * post an error on the bus and return an appropriate #GstFlowReturn value.
 *
 * Returns: #GST_FLOW_OK for success
  }

  TGstPadChainListFunction = function (pad:PGstPad; parent:PGstObject; list:PGstBufferList):TGstFlowReturn;cdecl;
{*
 * GstPadGetRangeFunction:
 * @pad: the src #GstPad to perform the getrange on.
 * @parent: (allow-none): the parent of @pad. If the #GST_PAD_FLAG_NEED_PARENT
 *          flag is set, @parent is guaranteed to be not-%NULL and remain valid
 *          during the execution of this function.
 * @offset: the offset of the range
 * @length: the length of the range
 * @buffer: a memory location to hold the result buffer, cannot be %NULL.
 *
 * This function will be called on source pads when a peer element
 * request a buffer at the specified @offset and @length. If this function
 * returns #GST_FLOW_OK, the result buffer will be stored in @buffer. The
 * contents of @buffer is invalid for any other return value.
 *
 * This function is installed on a source pad with
 * gst_pad_set_getrange_function() and can only be called on source pads after
 * they are successfully activated with gst_pad_activate_mode() with the
 * #GST_PAD_MODE_PULL.
 *
 * @offset and @length are always given in byte units. @offset must normally be a value
 * between 0 and the length in bytes of the data available on @pad. The
 * length (duration in bytes) can be retrieved with a #GST_QUERY_DURATION or with a
 * #GST_QUERY_SEEKING.
 *
 * Any @offset larger or equal than the length will make the function return
 * #GST_FLOW_EOS, which corresponds to EOS. In this case @buffer does not
 * contain a valid buffer.
 *
 * The buffer size of @buffer will only be smaller than @length when @offset is
 * near the end of the stream. In all other cases, the size of @buffer must be
 * exactly the requested size.
 *
 * It is allowed to call this function with a 0 @length and valid @offset, in
 * which case @buffer will contain a 0-sized buffer and the function returns
 * #GST_FLOW_OK.
 *
 * When this function is called with a -1 @offset, the sequentially next buffer
 * of length @length in the stream is returned.
 *
 * When this function is called with a -1 @length, a buffer with a default
 * optimal length is returned in @buffer. The length might depend on the value
 * of @offset.
 *
 * Returns: #GST_FLOW_OK for success and a valid buffer in @buffer. Any other
 * return value leaves @buffer undefined.
  }

  TGstPadGetRangeFunction = function (pad:PGstPad; parent:PGstObject; offset:Tguint64; length:Tguint; buffer:PPGstBuffer):TGstFlowReturn;cdecl;
{*
 * GstPadEventFunction:
 * @pad: the #GstPad to handle the event.
 * @parent: (allow-none): the parent of @pad. If the #GST_PAD_FLAG_NEED_PARENT
 *          flag is set, @parent is guaranteed to be not-%NULL and remain valid
 *          during the execution of this function.
 * @event: (transfer full): the #GstEvent to handle.
 *
 * Function signature to handle an event for the pad.
 *
 * Returns: %TRUE if the pad could handle the event.
  }

  TGstPadEventFunction = function (pad:PGstPad; parent:PGstObject; event:PGstEvent):Tgboolean;cdecl;
{*
 * GstPadEventFullFunction:
 * @pad: the #GstPad to handle the event.
 * @parent: (allow-none): the parent of @pad. If the #GST_PAD_FLAG_NEED_PARENT
 *          flag is set, @parent is guaranteed to be not-%NULL and remain valid
 *          during the execution of this function.
 * @event: (transfer full): the #GstEvent to handle.
 *
 * Function signature to handle an event for the pad.
 *
 * This variant is for specific elements that will take into account the
 * last downstream flow return (from a pad push), in which case they can
 * return it.
 *
 * Returns: %GST_FLOW_OK if the event was handled properly, or any other
 * #GstFlowReturn dependent on downstream state.
 *
 * Since: 1.8
  }

  TGstPadEventFullFunction = function (pad:PGstPad; parent:PGstObject; event:PGstEvent):TGstFlowReturn;cdecl;
{ internal links  }
{*
 * GstPadIterIntLinkFunction:
 * @pad: The #GstPad to query.
 * @parent: (allow-none): the parent of @pad. If the #GST_PAD_FLAG_NEED_PARENT
 *          flag is set, @parent is guaranteed to be not-%NULL and remain valid
 *          during the execution of this function.
 *
 * The signature of the internal pad link iterator function.
 *
 * Returns: a new #GstIterator that will iterate over all pads that are
 * linked to the given pad on the inside of the parent element.
 *
 * the caller must call gst_iterator_free() after usage.
  }

  PGstPadIterIntLinkFunction = ^TGstPadIterIntLinkFunction;
  TGstPadIterIntLinkFunction = function (pad:PGstPad; parent:PGstObject):PGstIterator;cdecl;
{ generic query function  }
{*
 * GstPadQueryFunction:
 * @pad: the #GstPad to query.
 * @parent: (allow-none): the parent of @pad. If the #GST_PAD_FLAG_NEED_PARENT
 *          flag is set, @parent is guaranteed to be not-%NULL and remain valid
 *          during the execution of this function.
 * @query: the #GstQuery object to execute
 *
 * The signature of the query function.
 *
 * Returns: %TRUE if the query could be performed.
  }

  TGstPadQueryFunction = function (pad:PGstPad; parent:PGstObject; query:PGstQuery):Tgboolean;cdecl;
{ linking  }
{*
 * GstPadLinkFunction:
 * @pad: the #GstPad that is linked.
 * @parent: (allow-none): the parent of @pad. If the #GST_PAD_FLAG_NEED_PARENT
 *          flag is set, @parent is guaranteed to be not-%NULL and remain valid
 *          during the execution of this function.
 * @peer: the peer #GstPad of the link
 *
 * Function signature to handle a new link on the pad.
 *
 * Returns: the result of the link with the specified peer.
  }

  TGstPadLinkFunction = function (pad:PGstPad; parent:PGstObject; peer:PGstPad):TGstPadLinkReturn;cdecl;
{*
 * GstPadUnlinkFunction:
 * @pad: the #GstPad that is linked.
 * @parent: (allow-none): the parent of @pad. If the #GST_PAD_FLAG_NEED_PARENT
 *          flag is set, @parent is guaranteed to be not-%NULL and remain valid
 *          during the execution of this function.
 *
 * Function signature to handle a unlinking the pad prom its peer.
 *
 * The pad's lock is already held when the unlink function is called, so most
 * pad functions cannot be called from within the callback.
  }

  TGstPadUnlinkFunction = procedure (pad:PGstPad; parent:PGstObject);cdecl;
{ misc  }
{*
 * GstPadForwardFunction:
 * @pad: the #GstPad that is forwarded.
 * @user_data: the gpointer to optional user data.
 *
 * A forward function is called for all internally linked pads, see
 * gst_pad_forward().
 *
 * Returns: %TRUE if the dispatching procedure has to be stopped.
  }

  TGstPadForwardFunction = function (pad:PGstPad; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstPadProbeType:
 * @GST_PAD_PROBE_TYPE_INVALID: invalid probe type
 * @GST_PAD_PROBE_TYPE_IDLE: probe idle pads and block while the callback is called
 * @GST_PAD_PROBE_TYPE_BLOCK: probe and block pads
 * @GST_PAD_PROBE_TYPE_BUFFER: probe buffers
 * @GST_PAD_PROBE_TYPE_BUFFER_LIST: probe buffer lists
 * @GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM: probe downstream events
 * @GST_PAD_PROBE_TYPE_EVENT_UPSTREAM: probe upstream events
 * @GST_PAD_PROBE_TYPE_EVENT_FLUSH: probe flush events. This probe has to be
 *     explicitly enabled and is not included in the
 *     @@GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM or
 *     @@GST_PAD_PROBE_TYPE_EVENT_UPSTREAM probe types.
 * @GST_PAD_PROBE_TYPE_QUERY_DOWNSTREAM: probe downstream queries
 * @GST_PAD_PROBE_TYPE_QUERY_UPSTREAM: probe upstream queries
 * @GST_PAD_PROBE_TYPE_PUSH: probe push
 * @GST_PAD_PROBE_TYPE_PULL: probe pull
 * @GST_PAD_PROBE_TYPE_BLOCKING: probe and block at the next opportunity, at data flow or when idle
 * @GST_PAD_PROBE_TYPE_DATA_DOWNSTREAM: probe downstream data (buffers, buffer lists, and events)
 * @GST_PAD_PROBE_TYPE_DATA_UPSTREAM: probe upstream data (events)
 * @GST_PAD_PROBE_TYPE_DATA_BOTH: probe upstream and downstream data (buffers, buffer lists, and events)
 * @GST_PAD_PROBE_TYPE_BLOCK_DOWNSTREAM: probe and block downstream data (buffers, buffer lists, and events)
 * @GST_PAD_PROBE_TYPE_BLOCK_UPSTREAM: probe and block upstream data (events)
 * @GST_PAD_PROBE_TYPE_EVENT_BOTH: probe upstream and downstream events
 * @GST_PAD_PROBE_TYPE_QUERY_BOTH: probe upstream and downstream queries
 * @GST_PAD_PROBE_TYPE_ALL_BOTH: probe upstream events and queries and downstream buffers, buffer lists, events and queries
 * @GST_PAD_PROBE_TYPE_SCHEDULING: probe push and pull
 *
 * The different probing types that can occur. When either one of
 * @GST_PAD_PROBE_TYPE_IDLE or @GST_PAD_PROBE_TYPE_BLOCK is used, the probe will be a
 * blocking probe.
  }
{ flags to control blocking  }
{ flags to select datatypes  }
{ flags to select scheduling mode  }
{ flag combinations  }

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
;
{*
 * GstPadProbeReturn:
 * @GST_PAD_PROBE_OK: normal probe return value. This leaves the probe in
 *        place, and defers decisions about dropping or passing data to other
 *        probes, if any. If there are no other probes, the default behaviour
 *        for the probe type applies ('block' for blocking probes,
 *        and 'pass' for non-blocking probes).
 * @GST_PAD_PROBE_DROP: drop data in data probes. For push mode this means that
 *        the data item is not sent downstream. For pull mode, it means that
 *        the data item is not passed upstream. In both cases, no other probes
 *        are called for this item and %GST_FLOW_OK or %TRUE is returned to the
 *        caller.
 * @GST_PAD_PROBE_REMOVE: remove this probe, passing the data. For blocking probes
 *        this will cause data flow to unblock, unless there are also other
 *        blocking probes installed.
 * @GST_PAD_PROBE_PASS: pass the data item in the block probe and block on the
 *        next item. Note, that if there are multiple pad probes installed and
 *        any probe returns PASS, the data will be passed.
 * @GST_PAD_PROBE_HANDLED: Data has been handled in the probe and will not be
 *        forwarded further. For events and buffers this is the same behaviour as
 *        %GST_PAD_PROBE_DROP (except that in this case you need to unref the buffer
 *        or event yourself). For queries it will also return %TRUE to the caller.
 *        The probe can also modify the #GstFlowReturn value by using the
 *        #GST_PAD_PROBE_INFO_FLOW_RETURN() accessor.
 *        Note that the resulting query must contain valid entries.
 *        Since: 1.6
 *
 * Different return values for the #GstPadProbeCallback.
  }
type
  PGstPadProbeReturn = ^TGstPadProbeReturn;
  TGstPadProbeReturn =  Longint;
  Const
    GST_PAD_PROBE_DROP = 0;
    GST_PAD_PROBE_OK = 1;
    GST_PAD_PROBE_REMOVE = 2;
    GST_PAD_PROBE_PASS = 3;
    GST_PAD_PROBE_HANDLED = 4;
;
{*
 * GstPadProbeInfo:
 * @type: the current probe type
 * @id: the id of the probe
 * @data: (allow-none): type specific data, check the @type field to know the
 *    datatype.  This field can be %NULL.
 * @offset: offset of pull probe, this field is valid when @type contains
 *    #GST_PAD_PROBE_TYPE_PULL
 * @size: size of pull probe, this field is valid when @type contains
 *    #GST_PAD_PROBE_TYPE_PULL
 *
 * Info passed in the #GstPadProbeCallback.
  }
{< private > }
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

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_PAD_PROBE_INFO_TYPE(d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_ID(d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_DATA(d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_FLOW_RETURN(d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_BUFFER(d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_BUFFER_LIST(d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_EVENT(d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_QUERY(d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_OFFSET(d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PROBE_INFO_SIZE(d : longint) : longint;

function gst_pad_probe_info_get_event(info:PGstPadProbeInfo):PGstEvent;cdecl;external;
function gst_pad_probe_info_get_query(info:PGstPadProbeInfo):PGstQuery;cdecl;external;
function gst_pad_probe_info_get_buffer(info:PGstPadProbeInfo):PGstBuffer;cdecl;external;
function gst_pad_probe_info_get_buffer_list(info:PGstPadProbeInfo):PGstBufferList;cdecl;external;
{*
 * GstPadProbeCallback:
 * @pad: the #GstPad that is blocked
 * @info: #GstPadProbeInfo
 * @user_data: the gpointer to optional user data.
 *
 * Callback used by gst_pad_add_probe(). Gets called to notify about the current
 * blocking type.
 *
 * The callback is allowed to modify the data pointer in @info.
 *
 * Returns: a #GstPadProbeReturn
  }
type

  TGstPadProbeCallback = function (pad:PGstPad; info:PGstPadProbeInfo; user_data:Tgpointer):TGstPadProbeReturn;cdecl;
{*
 * GstPadStickyEventsForeachFunction:
 * @pad: the #GstPad.
 * @event: (allow-none): a sticky #GstEvent.
 * @user_data: the #gpointer to optional user data.
 *
 * Callback used by gst_pad_sticky_events_foreach().
 *
 * When this function returns %TRUE, the next event will be
 * returned. When %FALSE is returned, gst_pad_sticky_events_foreach() will return.
 *
 * When @event is set to %NULL, the item will be removed from the list of sticky events.
 * @event can be replaced by assigning a new reference to it.
 * This function is responsible for unreffing the old event when
 * removing or modifying.
 *
 * Returns: %TRUE if the iteration should continue
  }

  TGstPadStickyEventsForeachFunction = function (pad:PGstPad; event:PPGstEvent; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstPadFlags:
 * @GST_PAD_FLAG_BLOCKED: is dataflow on a pad blocked
 * @GST_PAD_FLAG_FLUSHING: is pad flushing
 * @GST_PAD_FLAG_EOS: is pad in EOS state
 * @GST_PAD_FLAG_BLOCKING: is pad currently blocking on a buffer or event
 * @GST_PAD_FLAG_NEED_PARENT: ensure that there is a parent object before calling
 *                       into the pad callbacks.
 * @GST_PAD_FLAG_NEED_RECONFIGURE: the pad should be reconfigured/renegotiated.
 *                            The flag has to be unset manually after
 *                            reconfiguration happened.
 * @GST_PAD_FLAG_PENDING_EVENTS: the pad has pending events
 * @GST_PAD_FLAG_FIXED_CAPS: the pad is using fixed caps. This means that
 *     once the caps are set on the pad, the default caps query function
 *     will only return those caps.
 * @GST_PAD_FLAG_PROXY_CAPS: the default event and query handler will forward
 *                      all events and queries to the internally linked pads
 *                      instead of discarding them.
 * @GST_PAD_FLAG_PROXY_ALLOCATION: the default query handler will forward
 *                      allocation queries to the internally linked pads
 *                      instead of discarding them.
 * @GST_PAD_FLAG_PROXY_SCHEDULING: the default query handler will forward
 *                      scheduling queries to the internally linked pads
 *                      instead of discarding them.
 * @GST_PAD_FLAG_ACCEPT_INTERSECT: the default accept-caps handler will check
 *                      it the caps intersect the query-caps result instead
 *                      of checking for a subset. This is interesting for
 *                      parsers that can accept incompletely specified caps.
 * @GST_PAD_FLAG_ACCEPT_TEMPLATE: the default accept-caps handler will use
 *                      the template pad caps instead of query caps to
 *                      compare with the accept caps. Use this in combination
 *                      with %GST_PAD_FLAG_ACCEPT_INTERSECT. (Since: 1.6)
 * @GST_PAD_FLAG_LAST: offset to define more flags
 *
 * Pad state flags
  }
{ padding  }

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
;
{*
 * GstPad:
 * @element_private: private data owned by the parent element
 * @padtemplate: padtemplate for this pad
 * @direction: the direction of the pad, cannot change after creating
 *             the pad.
 *
 * The #GstPad structure. Use the functions to update the variables.
  }
{< public > }
{< private > }
{ streaming rec_lock  }
{ block cond, mutex is from the object  }
{ pad link  }
{ data transport functions  }
{ pad offset  }
{ generic query method  }
{ internal links  }
{ counts number of probes attached.  }
type
  PGstPad = ^TGstPad;
  TGstPad = record
      object : TGstObject;
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

{ signal callbacks  }
{< private > }
  PGstPadClass = ^TGstPadClass;
  TGstPadClass = record
      parent_class : TGstObjectClass;
      linked : procedure (pad:PGstPad; peer:PGstPad);cdecl;
      unlinked : procedure (pad:PGstPad; peer:PGstPad);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{**** helper macros **** }
{ GstPad  }
{*
 * GST_PAD_NAME:
 * @pad: a #GstPad
 *
 * Get name of the given pad.
 * No locking is performed in this function, use gst_pad_get_name() instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_PAD_NAME(pad : longint) : longint;

{*
 * GST_PAD_PARENT:
 * @pad: a #GstPad
 *
 * Get the @pad parent.
 * No locking is performed in this function, use gst_pad_get_parent() instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PARENT(pad : longint) : longint;

{*
 * GST_PAD_ELEMENT_PRIVATE:
 * @pad: a #GstPad
 *
 * Get the private data of @pad, which is usually some pad- or stream-specific
 * structure created by the element and set on the pad when creating it.
 * No locking is performed in this function.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_ELEMENT_PRIVATE(pad : longint) : longint;

{*
 * GST_PAD_PAD_TEMPLATE:
 * @pad: a #GstPad
 *
 * Get the @pad #GstPadTemplate. It describes the possible media types
 * a @pad or an element factory can handle.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PAD_TEMPLATE(pad : longint) : longint;

{*
 * GST_PAD_DIRECTION:
 * @pad: a #GstPad
 *
 * Get the #GstPadDirection of the given @pad. Accessor macro, use
 * gst_pad_get_direction() instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_DIRECTION(pad : longint) : longint;

{*
 * GST_PAD_TASK:
 * @pad: a #GstPad
 *
 * Get the #GstTask of @pad. Accessor macro used by GStreamer. Use the
 * gst_pad_start_task(), gst_pad_stop_task() and gst_pad_pause_task()
 * functions instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TASK(pad : longint) : longint;

{*
 * GST_PAD_MODE:
 * @pad: a #GstPad
 *
 * Get the #GstPadMode of pad, which will be GST_PAD_MODE_NONE if the pad
 * has not been activated yet, and otherwise either GST_PAD_MODE_PUSH or
 * GST_PAD_MODE_PULL depending on which mode the pad was activated in.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_MODE(pad : longint) : longint;

{*
 * GST_PAD_ACTIVATEFUNC:
 * @pad: a #GstPad
 *
 * Get the #GstPadActivateFunction from @pad.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_ACTIVATEFUNC(pad : longint) : longint;

{*
 * GST_PAD_ACTIVATEMODEFUNC:
 * @pad: a #GstPad
 *
 * Get the #GstPadActivateModeFunction from the given @pad.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_ACTIVATEMODEFUNC(pad : longint) : longint;

{*
 * GST_PAD_CHAINFUNC:
 * @pad: a #GstPad
 *
 * Get the #GstPadChainFunction from the given @pad.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_CHAINFUNC(pad : longint) : longint;

{*
 * GST_PAD_CHAINLISTFUNC:
 * @pad: a #GstPad
 *
 * Get the #GstPadChainListFunction from the given @pad.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_CHAINLISTFUNC(pad : longint) : longint;

{*
 * GST_PAD_GETRANGEFUNC:
 * @pad: a #GstPad
 *
 * Get the #GstPadGetRangeFunction from the given @pad.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_GETRANGEFUNC(pad : longint) : longint;

{*
 * GST_PAD_EVENTFUNC:
 * @pad: a #GstPad
 *
 * Get the #GstPadEventFunction from the given @pad, which
 * is the function that handles events on the pad. You can
 * use this to set your own event handling function on a pad
 * after you create it.  If your element derives from a base
 * class, use the base class's virtual functions instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_EVENTFUNC(pad : longint) : longint;

{*
 * GST_PAD_EVENTFULLFUNC:
 * @pad: a #GstPad
 *
 * Get the #GstPadEventFullFunction from the given @pad, which
 * is the function that handles events on the pad. You can
 * use this to set your own event handling function on a pad
 * after you create it.  If your element derives from a base
 * class, use the base class's virtual functions instead.
 *
 * Since: 1.8
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_EVENTFULLFUNC(pad : longint) : longint;

{*
 * GST_PAD_QUERYFUNC:
 * @pad: a #GstPad
 *
 * Get the #GstPadQueryFunction from @pad, which is the function
 * that handles queries on the pad. You can  use this to set your
 * own query handling function on a pad after you create it. If your
 * element derives from a base class, use the base class's virtual
 * functions instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_QUERYFUNC(pad : longint) : longint;

{*
 * GST_PAD_ITERINTLINKFUNC:
 * @pad: a #GstPad
 *
 * Get the #GstPadIterIntLinkFunction from the given @pad.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_ITERINTLINKFUNC(pad : longint) : longint;

{*
 * GST_PAD_PEER:
 * @pad: a #GstPad
 *
 * Return the pad's peer member. This member is a pointer to the linked @pad.
 * No locking is performed in this function, use gst_pad_get_peer() instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_PEER(pad : longint) : longint;

{*
 * GST_PAD_LINKFUNC:
 * @pad: a #GstPad
 *
 * Get the #GstPadLinkFunction for the given @pad.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_LINKFUNC(pad : longint) : longint;

{*
 * GST_PAD_UNLINKFUNC:
 * @pad: a #GstPad
 *
 * Get the #GstPadUnlinkFunction from the given @pad.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_UNLINKFUNC(pad : longint) : longint;

{*
 * GST_PAD_IS_SRC:
 * @pad: a #GstPad
 *
 * Returns: %TRUE if the pad is a source pad (i.e. produces data).
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_SRC(pad : longint) : longint;

{*
 * GST_PAD_IS_SINK:
 * @pad: a #GstPad
 *
 * Returns: %TRUE if the pad is a sink pad (i.e. consumes data).
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_SINK(pad : longint) : longint;

{*
 * GST_PAD_IS_LINKED:
 * @pad: a #GstPad
 *
 * Returns: %TRUE if the pad is linked to another pad. Use gst_pad_is_linked()
 * instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_LINKED(pad : longint) : longint;

{*
 * GST_PAD_IS_ACTIVE:
 * @pad: a #GstPad
 *
 * Returns: %TRUE if the pad has been activated.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_ACTIVE(pad : longint) : longint;

{*
 * GST_PAD_IS_BLOCKED:
 * @pad: a #GstPad
 *
 * Check if the dataflow on a @pad is blocked. Use gst_pad_is_blocked() instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_BLOCKED(pad : longint) : longint;

{*
 * GST_PAD_IS_BLOCKING:
 * @pad: a #GstPad
 *
 * Check if the @pad is currently blocking on a buffer or event. Use
 * gst_pad_is_blocking() instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_BLOCKING(pad : longint) : longint;

{*
 * GST_PAD_IS_FLUSHING:
 * @pad: a #GstPad
 *
 * Check if the given @pad is flushing.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_FLUSHING(pad : longint) : longint;

{*
 * GST_PAD_SET_FLUSHING:
 * @pad: a #GstPad
 *
 * Set the given @pad to flushing state, which means it will not accept any
 * more events, queries or buffers, and return GST_FLOW_FLUSHING if any buffers
 * are pushed on it. This usually happens when the pad is shut down or when
 * a flushing seek happens. This is used inside GStreamer when flush start/stop
 * events pass through pads, or when an element state is changed and pads are
 * activated or deactivated.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_SET_FLUSHING(pad : longint) : longint;

{*
 * GST_PAD_UNSET_FLUSHING:
 * @pad: a #GstPad
 *
 * Unset the flushing flag.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_UNSET_FLUSHING(pad : longint) : longint;

{*
 * GST_PAD_IS_EOS:
 * @pad: a #GstPad
 *
 * Check if the @pad is in EOS state.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_EOS(pad : longint) : longint;

{*
 * GST_PAD_NEEDS_RECONFIGURE:
 * @pad: a #GstPad
 *
 * Check if the @pad should be reconfigured/renegotiated.
 * The flag has to be unset manually after reconfiguration happened.
 * Use gst_pad_needs_reconfigure() or gst_pad_check_reconfigure() instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_NEEDS_RECONFIGURE(pad : longint) : longint;

{*
 * GST_PAD_HAS_PENDING_EVENTS:
 * @pad: a #GstPad
 *
 * Check if the given @pad has pending events. This is used internally by
 * GStreamer.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_HAS_PENDING_EVENTS(pad : longint) : longint;

{*
 * GST_PAD_IS_FIXED_CAPS:
 * @pad: a #GstPad
 *
 * Check if the given @pad is using fixed caps, which means that
 * once the caps are set on the @pad, the caps query function will
 * only return those caps. See gst_pad_use_fixed_caps().
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_FIXED_CAPS(pad : longint) : longint;

{*
 * GST_PAD_NEEDS_PARENT:
 * @pad: a #GstPad
 *
 * Check if there is a parent object before calling into the @pad callbacks.
 * This is used internally by GStreamer.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_NEEDS_PARENT(pad : longint) : longint;

{*
 * GST_PAD_IS_PROXY_CAPS:
 * @pad: a #GstPad
 *
 * Check if the given @pad is set to proxy caps. This means that the default
 * event and query handler will forward all events and queries to the
 * internally linked @pads instead of discarding them.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_PROXY_CAPS(pad : longint) : longint;

{*
 * GST_PAD_SET_PROXY_CAPS:
 * @pad: a #GstPad
 *
 * Set @pad to proxy caps, so that all caps-related events and queries are
 * proxied down- or upstream to the other side of the element automatically.
 * Set this if the element always outputs data in the exact same format as it
 * receives as input. This is just for convenience to avoid implementing some
 * standard event and query handling code in an element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_SET_PROXY_CAPS(pad : longint) : longint;

{*
 * GST_PAD_UNSET_PROXY_CAPS:
 * @pad: a #GstPad
 *
 * Unset proxy caps flag.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_UNSET_PROXY_CAPS(pad : longint) : longint;

{*
 * GST_PAD_IS_PROXY_ALLOCATION:
 * @pad: a #GstPad
 *
 * Check if the given @pad is set as proxy allocation which means
 * that the default query handler will forward allocation queries to the
 * internally linked @pads instead of discarding them.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_PROXY_ALLOCATION(pad : longint) : longint;

{*
 * GST_PAD_SET_PROXY_ALLOCATION:
 * @pad: a #GstPad
 *
 * Set @pad to proxy allocation queries, which means that the default query
 * handler will forward allocation queries to the internally linked @pads
 * instead of discarding them.
 * Set this if the element always outputs data in the exact same format as it
 * receives as input. This is just for convenience to avoid implementing some
 * standard query handling code in an element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_SET_PROXY_ALLOCATION(pad : longint) : longint;

{*
 * GST_PAD_UNSET_PROXY_ALLOCATION:
 * @pad: a #GstPad
 *
 * Unset proxy allocation flag.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_UNSET_PROXY_ALLOCATION(pad : longint) : longint;

{*
 * GST_PAD_IS_PROXY_SCHEDULING:
 * @pad: a #GstPad
 *
 * Check if the given @pad is set to proxy scheduling queries, which means that
 * the default query handler will forward scheduling queries to the internally
 * linked @pads instead of discarding them.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_PROXY_SCHEDULING(pad : longint) : longint;

{*
 * GST_PAD_SET_PROXY_SCHEDULING:
 * @pad: a #GstPad
 *
 * Set @pad to proxy scheduling queries, which means that the default query
 * handler will forward scheduling queries to the internally linked @pads
 * instead of discarding them. You will usually want to handle scheduling
 * queries explicitly if your element supports multiple scheduling modes.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_SET_PROXY_SCHEDULING(pad : longint) : longint;

{*
 * GST_PAD_UNSET_PROXY_SCHEDULING:
 * @pad: a #GstPad
 *
 * Unset proxy scheduling flag.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_UNSET_PROXY_SCHEDULING(pad : longint) : longint;

{*
 * GST_PAD_IS_ACCEPT_INTERSECT:
 * @pad: a #GstPad
 *
 * Check if the pad's accept intersect flag is set. The default accept-caps
 * handler will check if the caps intersect the query-caps result instead of
 * checking for a subset. This is interesting for parser elements that can
 * accept incompletely specified caps.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_ACCEPT_INTERSECT(pad : longint) : longint;

{*
 * GST_PAD_SET_ACCEPT_INTERSECT:
 * @pad: a #GstPad
 *
 * Set @pad to by default accept caps by intersecting the result instead of
 * checking for a subset. This is interesting for parser elements that can
 * accept incompletely specified caps.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_SET_ACCEPT_INTERSECT(pad : longint) : longint;

{*
 * GST_PAD_UNSET_ACCEPT_INTERSECT:
 * @pad: a #GstPad
 *
 * Unset accept intersect flag.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_UNSET_ACCEPT_INTERSECT(pad : longint) : longint;

{*
 * GST_PAD_IS_ACCEPT_TEMPLATE:
 * @pad: a #GstPad
 *
 * Check if the pad's accept caps operation will use the pad template caps.
 * The default accept-caps will do a query caps to get the caps, which might
 * be querying downstream causing unnecessary overhead. It is recommended to
 * implement a proper accept-caps query handler or to use this flag to prevent
 * recursive accept-caps handling.
 *
 * Since: 1.6
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_IS_ACCEPT_TEMPLATE(pad : longint) : longint;

{*
 * GST_PAD_SET_ACCEPT_TEMPLATE:
 * @pad: a #GstPad
 *
 * Set @pad to by default use the pad template caps to compare with
 * the accept caps instead of using a caps query result.
 *
 * Since: 1.6
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_SET_ACCEPT_TEMPLATE(pad : longint) : longint;

{*
 * GST_PAD_UNSET_ACCEPT_TEMPLATE:
 * @pad: a #GstPad
 *
 * Unset accept template flag.
 *
 * Since: 1.6
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_UNSET_ACCEPT_TEMPLATE(pad : longint) : longint;

{*
 * GST_PAD_GET_STREAM_LOCK:
 * @pad: a #GstPad
 *
 * Get the stream lock of @pad. The stream lock is protecting the
 * resources used in the data processing functions of @pad. Accessor
 * macro, use GST_PAD_STREAM_LOCK() and GST_PAD_STREAM_UNLOCK() instead
 * to take/release the pad's stream lock.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_GET_STREAM_LOCK(pad : longint) : longint;

{*
 * GST_PAD_STREAM_LOCK:
 * @pad: a #GstPad
 *
 * Take the pad's stream lock. The stream lock is recursive and will be taken
 * when buffers or serialized downstream events are pushed on a pad.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_STREAM_LOCK(pad : longint) : longint;

{*
 * GST_PAD_STREAM_AUTO_LOCK
 * @pad: a #GstPad
 * @var: a variable name to be declared
 *
 * Declare a #GRecMutexLocker variable with g_autoptr() and lock the pad. The
 * recursive mutex will be unlocked automatically when leaving the scope.
 *
 * ``` c
 * 
 *   GST_PAD_STREAM_AUTO_LOCK (pad, locker);
 *
 *   gst_pad_push_event(pad, event1);
 *   if (cond) 
 *     // No need to unlock
 *     return;
 *   
 *
 *   // Unlock before end of scope
 *   g_clear_pointer (&locker, g_rec_mutex_locker_free);
 *   gst_pad_push_event(pad, event2);
 * 
 * ```
 * Since: 1.24.0
  }
{#define GST_PAD_STREAM_AUTO_LOCK(pad, var) g_autoptr(GRecMutexLocker) G_GNUC_UNUSED var = g_rec_mutex_locker_new(GST_PAD_GET_STREAM_LOCK(pad)) }
{*
 * GST_PAD_STREAM_TRYLOCK:
 * @pad: a #GstPad
 *
 * Try to take the pad's stream lock, and return %TRUE if the lock could be
 * taken, and otherwise %FALSE.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_STREAM_TRYLOCK(pad : longint) : longint;

{*
 * GST_PAD_STREAM_UNLOCK:
 * @pad: a #GstPad
 *
 * Release the pad's stream lock.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_STREAM_UNLOCK(pad : longint) : longint;

{*
 * GST_PAD_LAST_FLOW_RETURN:
 * @pad: a #GstPad
 *
 * Gets the last flow return on this pad
 *
 * Since: 1.4
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_LAST_FLOW_RETURN(pad : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_BLOCK_GET_COND(pad : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_BLOCK_WAIT(pad : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_BLOCK_SIGNAL(pad : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_BLOCK_BROADCAST(pad : longint) : longint;

function gst_pad_get_type:TGType;cdecl;external;
{ creating pads  }
(* Const before type ignored *)
function gst_pad_new(name:Pgchar; direction:TGstPadDirection):PGstPad;cdecl;external;
(* Const before type ignored *)
function gst_pad_new_from_template(templ:PGstPadTemplate; name:Pgchar):PGstPad;cdecl;external;
(* Const before type ignored *)
function gst_pad_new_from_static_template(templ:PGstStaticPadTemplate; name:Pgchar):PGstPad;cdecl;external;
{*
 * gst_pad_get_name:
 * @pad: the pad to get the name from
 *
 * Get a copy of the name of the pad. g_free() after usage.
 *
 * MT safe.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_get_name(pad : longint) : longint;

{*
 * gst_pad_get_parent:
 * @pad: the pad to get the parent of
 *
 * Get the parent of @pad. This function increases the refcount
 * of the parent object so you should gst_object_unref() it after usage.
 * Can return %NULL if the pad did not have a parent.
 *
 * MT safe.
 *
 * Returns: (nullable): the parent
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_get_parent(pad : longint) : longint;

function gst_pad_get_direction(pad:PGstPad):TGstPadDirection;cdecl;external;
function gst_pad_set_active(pad:PGstPad; active:Tgboolean):Tgboolean;cdecl;external;
function gst_pad_is_active(pad:PGstPad):Tgboolean;cdecl;external;
function gst_pad_activate_mode(pad:PGstPad; mode:TGstPadMode; active:Tgboolean):Tgboolean;cdecl;external;
function gst_pad_add_probe(pad:PGstPad; mask:TGstPadProbeType; callback:TGstPadProbeCallback; user_data:Tgpointer; destroy_data:TGDestroyNotify):Tgulong;cdecl;external;
procedure gst_pad_remove_probe(pad:PGstPad; id:Tgulong);cdecl;external;
function gst_pad_is_blocked(pad:PGstPad):Tgboolean;cdecl;external;
function gst_pad_is_blocking(pad:PGstPad):Tgboolean;cdecl;external;
procedure gst_pad_mark_reconfigure(pad:PGstPad);cdecl;external;
function gst_pad_needs_reconfigure(pad:PGstPad):Tgboolean;cdecl;external;
function gst_pad_check_reconfigure(pad:PGstPad):Tgboolean;cdecl;external;
procedure gst_pad_set_element_private(pad:PGstPad; priv:Tgpointer);cdecl;external;
function gst_pad_get_element_private(pad:PGstPad):Tgpointer;cdecl;external;
function gst_pad_get_pad_template(pad:PGstPad):PGstPadTemplate;cdecl;external;
function gst_pad_store_sticky_event(pad:PGstPad; event:PGstEvent):TGstFlowReturn;cdecl;external;
function gst_pad_get_sticky_event(pad:PGstPad; event_type:TGstEventType; idx:Tguint):PGstEvent;cdecl;external;
procedure gst_pad_sticky_events_foreach(pad:PGstPad; foreach_func:TGstPadStickyEventsForeachFunction; user_data:Tgpointer);cdecl;external;
{ data passing setup functions  }
procedure gst_pad_set_activate_function_full(pad:PGstPad; activate:TGstPadActivateFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
procedure gst_pad_set_activatemode_function_full(pad:PGstPad; activatemode:TGstPadActivateModeFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
{ data passing functions  }
procedure gst_pad_set_chain_function_full(pad:PGstPad; chain:TGstPadChainFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
procedure gst_pad_set_chain_list_function_full(pad:PGstPad; chainlist:TGstPadChainListFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
procedure gst_pad_set_getrange_function_full(pad:PGstPad; get:TGstPadGetRangeFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
procedure gst_pad_set_event_function_full(pad:PGstPad; event:TGstPadEventFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
procedure gst_pad_set_event_full_function_full(pad:PGstPad; event:TGstPadEventFullFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_activate_function(p,f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_activatemode_function(p,f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_chain_function(p,f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_chain_list_function(p,f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_getrange_function(p,f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_event_function(p,f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_event_full_function(p,f : longint) : longint;

{ pad links  }
procedure gst_pad_set_link_function_full(pad:PGstPad; link:TGstPadLinkFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
procedure gst_pad_set_unlink_function_full(pad:PGstPad; unlink:TGstPadUnlinkFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_link_function(p,f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_unlink_function(p,f : longint) : longint;

function gst_pad_can_link(srcpad:PGstPad; sinkpad:PGstPad):Tgboolean;cdecl;external;
function gst_pad_link(srcpad:PGstPad; sinkpad:PGstPad):TGstPadLinkReturn;cdecl;external;
function gst_pad_link_full(srcpad:PGstPad; sinkpad:PGstPad; flags:TGstPadLinkCheck):TGstPadLinkReturn;cdecl;external;
function gst_pad_unlink(srcpad:PGstPad; sinkpad:PGstPad):Tgboolean;cdecl;external;
function gst_pad_is_linked(pad:PGstPad):Tgboolean;cdecl;external;
function gst_pad_get_peer(pad:PGstPad):PGstPad;cdecl;external;
function gst_pad_get_pad_template_caps(pad:PGstPad):PGstCaps;cdecl;external;
{ capsnego function for linked/unlinked pads  }
function gst_pad_get_current_caps(pad:PGstPad):PGstCaps;cdecl;external;
function gst_pad_has_current_caps(pad:PGstPad):Tgboolean;cdecl;external;
{ capsnego for linked pads  }
function gst_pad_get_allowed_caps(pad:PGstPad):PGstCaps;cdecl;external;
{ pad offsets  }
function gst_pad_get_offset(pad:PGstPad):Tgint64;cdecl;external;
procedure gst_pad_set_offset(pad:PGstPad; offset:Tgint64);cdecl;external;
{ data passing functions to peer  }
function gst_pad_push(pad:PGstPad; buffer:PGstBuffer):TGstFlowReturn;cdecl;external;
function gst_pad_push_list(pad:PGstPad; list:PGstBufferList):TGstFlowReturn;cdecl;external;
function gst_pad_pull_range(pad:PGstPad; offset:Tguint64; size:Tguint; buffer:PPGstBuffer):TGstFlowReturn;cdecl;external;
function gst_pad_push_event(pad:PGstPad; event:PGstEvent):Tgboolean;cdecl;external;
function gst_pad_event_default(pad:PGstPad; parent:PGstObject; event:PGstEvent):Tgboolean;cdecl;external;
function gst_pad_get_last_flow_return(pad:PGstPad):TGstFlowReturn;cdecl;external;
{ data passing functions on pad  }
function gst_pad_chain(pad:PGstPad; buffer:PGstBuffer):TGstFlowReturn;cdecl;external;
function gst_pad_chain_list(pad:PGstPad; list:PGstBufferList):TGstFlowReturn;cdecl;external;
function gst_pad_get_range(pad:PGstPad; offset:Tguint64; size:Tguint; buffer:PPGstBuffer):TGstFlowReturn;cdecl;external;
function gst_pad_send_event(pad:PGstPad; event:PGstEvent):Tgboolean;cdecl;external;
{ pad tasks  }
function gst_pad_start_task(pad:PGstPad; func:TGstTaskFunction; user_data:Tgpointer; notify:TGDestroyNotify):Tgboolean;cdecl;external;
function gst_pad_pause_task(pad:PGstPad):Tgboolean;cdecl;external;
function gst_pad_stop_task(pad:PGstPad):Tgboolean;cdecl;external;
function gst_pad_get_task_state(pad:PGstPad):TGstTaskState;cdecl;external;
{ internal links  }
procedure gst_pad_set_iterate_internal_links_function_full(pad:PGstPad; iterintlink:TGstPadIterIntLinkFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
function gst_pad_iterate_internal_links(pad:PGstPad):PGstIterator;cdecl;external;
function gst_pad_iterate_internal_links_default(pad:PGstPad; parent:PGstObject):PGstIterator;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_iterate_internal_links_function(p,f : longint) : longint;

function gst_pad_get_single_internal_link(pad:PGstPad):PGstPad;cdecl;external;
{ generic query function  }
function gst_pad_query(pad:PGstPad; query:PGstQuery):Tgboolean;cdecl;external;
function gst_pad_peer_query(pad:PGstPad; query:PGstQuery):Tgboolean;cdecl;external;
procedure gst_pad_set_query_function_full(pad:PGstPad; query:TGstPadQueryFunction; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
function gst_pad_query_default(pad:PGstPad; parent:PGstObject; query:PGstQuery):Tgboolean;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_set_query_function(p,f : longint) : longint;

{ misc helper functions  }
function gst_pad_forward(pad:PGstPad; forward:TGstPadForwardFunction; user_data:Tgpointer):Tgboolean;cdecl;external;
{$endif}
{ __GST_PAD_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_PAD : longint; { return type might be wrong }
  begin
    GST_TYPE_PAD:=gst_pad_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD(obj : longint) : longint;
begin
  GST_PAD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PAD,GstPad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_CLASS(klass : longint) : longint;
begin
  GST_PAD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PAD,GstPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PAD(obj : longint) : longint;
begin
  GST_IS_PAD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PAD_CLASS(klass : longint) : longint;
begin
  GST_IS_PAD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PAD_CAST(obj : longint) : PGstPad;
begin
  GST_PAD_CAST:=PGstPad(obj);
end;

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
