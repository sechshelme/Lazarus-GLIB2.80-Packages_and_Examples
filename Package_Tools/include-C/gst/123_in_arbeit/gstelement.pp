
unit gstelement;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstelement.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstelement.h
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
Pchar  = ^char;
Pgchar  = ^gchar;
PGList  = ^GList;
PGstBus  = ^GstBus;
PGstCaps  = ^GstCaps;
PGstClock  = ^GstClock;
PGstContext  = ^GstContext;
PGstElement  = ^GstElement;
PGstElementClass  = ^GstElementClass;
PGstElementFactory  = ^GstElementFactory;
PGstElementFlags  = ^GstElementFlags;
PGstEvent  = ^GstEvent;
PGstIterator  = ^GstIterator;
PGstMessage  = ^GstMessage;
PGstPad  = ^GstPad;
PGstPadTemplate  = ^GstPadTemplate;
PGstQuery  = ^GstQuery;
PGstState  = ^GstState;
PGstStateChange  = ^GstStateChange;
PGstStateChangeReturn  = ^GstStateChangeReturn;
PGstStaticPadTemplate  = ^GstStaticPadTemplate;
PGstStructure  = ^GstStructure;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *               2000,2004 Wim Taymans <wim@fluendo.com>
 *
 * gstelement.h: Header for GstElement
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
{$ifndef __GST_ELEMENT_H__}
{$define __GST_ELEMENT_H__}
{$include <glib.h>}
{*
 * _GST_ELEMENT_REGISTER_DEFINE_BEGIN: (attributes doc.skip=true)
  }
{//#define _GST_ELEMENT_REGISTER_DEFINE_BEGIN(element) \ }
{ \ }
{gboolean G_PASTE (gst_element_register_, element) (GstPlugin * plugin) \ }
{ \ }
{   }
{*
 * _GST_ELEMENT_REGISTER_DEFINE_END: (attributes doc.skip=true)
  }
{#define _GST_ELEMENT_REGISTER_DEFINE_END(element_name, rank, type) \ }
{   \ }
{  return gst_element_register (plugin, element_name, rank, type); \ }
{ \ }
{*
 * GST_ELEMENT_REGISTER_DEFINE_CUSTOM:
 * @element: The element name in lower case, with words separated by '_'.
 * Used to generate `gst_element_register_*(GstPlugin* plugin)`.
 * @register_func: pointer to a method with the format: `gboolean register_func (GstPlugin* plugin);`
 *
 * A convenience macro to define the entry point of an
 * element `gst_element_register_*(GstPlugin* plugin)` which uses
 * register_func as the main registration method for the element.
 * As an example, you may define the element named "streamer-filter"
 * with the namespace `my` as following using `element_register_custom`:
 *
 * ```
 * GST_ELEMENT_REGISTER_DEFINE_CUSTOM (my_element, element_register_custom)
 * ```
 *
 * Since: 1.20
  }
{*
 * GST_ELEMENT_REGISTER_DEFINE:
 * @e: The element name in lower case, with words separated by '_'.
 * Used to generate `gst_element_register_*(GstPlugin* plugin)`.
 * @e_n: The public name of the element
 * @r: The #GstRank of the element (higher rank means more importance when autoplugging, see #GstRank)
 * @t: The #GType of the element.
 *
 * A convenience macro to define the entry point of an
 * element `gst_element_register_*(GstPlugin* plugin)`.
 * As an example, you may define the element named "streamer-filter"
 * with the namespace `my` as following:
 *
 * ```
 * GST_ELEMENT_REGISTER_REGISTER_DEFINE (stream_filter, "stream-filter", GST_RANK_PRIMARY, MY_TYPE_STREAM_FILTER)
 * ```
 *
 * Since: 1.20
  }
{#define GST_ELEMENT_REGISTER_DEFINE(e, e_n, r, t) _GST_ELEMENT_REGISTER_DEFINE_BEGIN(e) _GST_ELEMENT_REGISTER_DEFINE_END(e_n, r, t) }
{*
 * GST_ELEMENT_REGISTER_DEFINE_WITH_CODE:
 * @e: The element name in lower case, with words separated by '_'.
 * Used to generate `gst_element_register_*(GstPlugin* plugin)`.
 * @e_n: The public name of the element
 * @r: The #GstRank of the element (higher rank means more importance when autoplugging, see #GstRank)
 * @t: The #GType of the element.
 * @_c_: Custom code that gets inserted in the gst_element_register_*() function.
 *
 * A convenience macro to define the entry point of an
 * element `gst_element_register_*(GstPlugin* plugin)` executing code
 * before gst_element_register in `gst_element_register_*(GstPlugin* plugin)`.

 * As an example, you may define the element named "stream-filter"
 * with the namespace `my` as following:
 *
 * ```
 * #define _pre_register_init \
 *   my_stream_filter_pre_register (plugin);
 * GST_ELEMENT_REGISTER_DEFINE_WITH_CODE (stream_filter, "stream-filter", GST_RANK_PRIMARY, MY_TYPE_STREAM_FILTER, _pre_register_init)
 * ```
 *
 * Since: 1.20
  }
{#define GST_ELEMENT_REGISTER_DEFINE_WITH_CODE(e, e_n, r, t, _c_) _GST_ELEMENT_REGISTER_DEFINE_BEGIN(e) _c_; _GST_ELEMENT_REGISTER_DEFINE_END(e_n, r, t) }
{*
 * GST_ELEMENT_REGISTER_DECLARE:
 * @element: The element name in lower case, with words separated by '_'.
 *
 * This macro can be used to declare a new element.
 * It has to be used in combination with #GST_ELEMENT_REGISTER_DEFINE macros
 * and must be placed outside any block to declare the element registration
 * function.
 * As an example, you may declare the element named "stream-filter"
 * with the namespace `my` as following:
 *
 * ```
 * GST_ELEMENT_REGISTER_DECLARE (stream_filter)
 * ```
 *
 * Since: 1.20
  }
{*
 * GST_ELEMENT_REGISTER:
 * @element: The element name in lower case, with words separated by '_'.
 * @plugin: The #GstPlugin where to register the element.
 *
 * This macro can be used to register an element into a #GstPlugin.
 * This method will be usually called in the plugin init function
 * but can also be called with a NULL plugin,
 * for example with a static registration of the element.
 * It has to be used in combination with #GST_ELEMENT_REGISTER_DECLARE.
 *
 * ```
 * GstPlugin* plugin;
 *
 * ...
 *
 * GST_ELEMENT_REGISTER (stream_filter, plugin);
 * ```
 *
 * Since: 1.20
  }
{#define GST_ELEMENT_REGISTER(element, plugin) G_PASTE(gst_element_register_, element) (plugin) }
{ gstelement.h and gstelementfactory.h include each other  }
type
{ gstmessage.h needs State  }
{*
 * GstState:
 * @GST_STATE_VOID_PENDING: no pending state.
 * @GST_STATE_NULL        : the NULL state or initial state of an element.
 * @GST_STATE_READY       : the element is ready to go to PAUSED.
 * @GST_STATE_PAUSED      : the element is PAUSED, it is ready to accept and
 *                          process data. Sink elements however only accept one
 *                          buffer and then block.
 * @GST_STATE_PLAYING     : the element is PLAYING, the #GstClock is running and
 *                          the data is flowing.
 *
 * The possible states an element can be in. States can be changed using
 * gst_element_set_state() and checked using gst_element_get_state().
  }

  PGstState = ^TGstState;
  TGstState =  Longint;
  Const
    GST_STATE_VOID_PENDING = 0;
    GST_STATE_NULL = 1;
    GST_STATE_READY = 2;
    GST_STATE_PAUSED = 3;
    GST_STATE_PLAYING = 4;
;

{ was #define dname def_expr }
function GST_TYPE_ELEMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_ELEMENT_CAST(obj : longint) : PGstElement;

{*
 * GstStateChangeReturn:
 * @GST_STATE_CHANGE_FAILURE   : the state change failed
 * @GST_STATE_CHANGE_SUCCESS   : the state change succeeded
 * @GST_STATE_CHANGE_ASYNC     : the state change will happen asynchronously
 * @GST_STATE_CHANGE_NO_PREROLL: the state change succeeded but the element
 *                               cannot produce data in %GST_STATE_PAUSED.
 *                               This typically happens with live sources.
 *
 * The possible return values from a state change function such as
 * gst_element_set_state(). Only @GST_STATE_CHANGE_FAILURE is a real failure.
  }
type
  PGstStateChangeReturn = ^TGstStateChangeReturn;
  TGstStateChangeReturn =  Longint;
  Const
    GST_STATE_CHANGE_FAILURE = 0;
    GST_STATE_CHANGE_SUCCESS = 1;
    GST_STATE_CHANGE_ASYNC = 2;
    GST_STATE_CHANGE_NO_PREROLL = 3;
;
{$include <gst/gstconfig.h>}
{$include <gst/gstobject.h>}
{$include <gst/gstpad.h>}
{$include <gst/gstbus.h>}
{$include <gst/gstclock.h>}
{$include <gst/gstelementfactory.h>}
{$include <gst/gstplugin.h>}
{$include <gst/gstpluginfeature.h>}
{$include <gst/gstiterator.h>}
{$include <gst/gstmessage.h>}
{$include <gst/gstquery.h>}
{$include <gst/gsttaglist.h>}
{$include <gst/gstcontext.h>}
{ NOTE: this probably should be done with an #ifdef to decide
 * whether to safe-cast or to just do the non-checking cast.
  }
{*
 * GST_STATE:
 * @elem: a #GstElement to return state for.
 *
 * This macro returns the current #GstState of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_STATE(elem : longint) : longint;

{*
 * GST_STATE_NEXT:
 * @elem: a #GstElement to return the next state for.
 *
 * This macro returns the next #GstState of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_NEXT(elem : longint) : longint;

{*
 * GST_STATE_PENDING:
 * @elem: a #GstElement to return the pending state for.
 *
 * This macro returns the currently pending #GstState of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_PENDING(elem : longint) : longint;

{*
 * GST_STATE_TARGET:
 * @elem: a #GstElement to return the target state for.
 *
 * This macro returns the target #GstState of the element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_TARGET(elem : longint) : longint;

{*
 * GST_STATE_RETURN:
 * @elem: a #GstElement to return the last state result for.
 *
 * This macro returns the last #GstStateChangeReturn value.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_RETURN(elem : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function __GST_SIGN(val : longint) : longint;

{*
 * GST_STATE_GET_NEXT:
 * @cur: A starting #GstState
 * @pending: A target #GstState
 *
 * Given a current state @cur and a target state @pending, calculate the next (intermediate)
 * #GstState.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_STATE_GET_NEXT(cur,pending : longint) : TGstState;

{*
 * GST_STATE_TRANSITION:
 * @cur: A current state
 * @next: A next state
 *
 * Given a current state @cur and a next state @next, calculate the associated
 * #GstStateChange transition.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_STATE_TRANSITION(cur,next : longint) : TGstStateChange;

{*
 * GST_STATE_TRANSITION_CURRENT:
 * @trans: A #GstStateChange
 *
 * Given a state transition @trans, extract the current #GstState.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_STATE_TRANSITION_CURRENT(trans : longint) : TGstState;

{*
 * GST_STATE_TRANSITION_NEXT:
 * @trans: A #GstStateChange
 *
 * Given a state transition @trans, extract the next #GstState.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_STATE_TRANSITION_NEXT(trans : longint) : TGstState;

{*
 * GstStateChange:
 * @GST_STATE_CHANGE_NULL_TO_READY    : state change from NULL to READY.
 *   * The element must check if the resources it needs are available. Device
 *     sinks and -sources typically try to probe the device to constrain their
 *     caps.
 *   * The element opens the device (in case feature need to be probed).
 * @GST_STATE_CHANGE_READY_TO_PAUSED  : state change from READY to PAUSED.
 *   * The element pads are activated in order to receive data in PAUSED.
 *     Streaming threads are started.
 *   * Some elements might need to return %GST_STATE_CHANGE_ASYNC and complete
 *     the state change when they have enough information. It is a requirement
 *     for sinks to return %GST_STATE_CHANGE_ASYNC and complete the state change
 *     when they receive the first buffer or %GST_EVENT_EOS (preroll).
 *     Sinks also block the dataflow when in PAUSED.
 *   * A pipeline resets the running_time to 0.
 *   * Live sources return %GST_STATE_CHANGE_NO_PREROLL and don't generate data.
 * @GST_STATE_CHANGE_PAUSED_TO_PLAYING: state change from PAUSED to PLAYING.
 *   * Most elements ignore this state change.
 *   * The pipeline selects a #GstClock and distributes this to all the children
 *     before setting them to PLAYING. This means that it is only allowed to
 *     synchronize on the #GstClock in the PLAYING state.
 *   * The pipeline uses the #GstClock and the running_time to calculate the
 *     base_time. The base_time is distributed to all children when performing
 *     the state change.
 *   * Sink elements stop blocking on the preroll buffer or event and start
 *     rendering the data.
 *   * Sinks can post %GST_MESSAGE_EOS in the PLAYING state. It is not allowed
 *     to post %GST_MESSAGE_EOS when not in the PLAYING state.
 *   * While streaming in PAUSED or PLAYING elements can create and remove
 *     sometimes pads.
 *   * Live sources start generating data and return %GST_STATE_CHANGE_SUCCESS.
 * @GST_STATE_CHANGE_PLAYING_TO_PAUSED: state change from PLAYING to PAUSED.
 *   * Most elements ignore this state change.
 *   * The pipeline calculates the running_time based on the last selected
 *     #GstClock and the base_time. It stores this information to continue
 *     playback when going back to the PLAYING state.
 *   * Sinks unblock any #GstClock wait calls.
 *   * When a sink does not have a pending buffer to play, it returns
 *     #GST_STATE_CHANGE_ASYNC from this state change and completes the state
 *     change when it receives a new buffer or an %GST_EVENT_EOS.
 *   * Any queued %GST_MESSAGE_EOS items are removed since they will be reposted
 *     when going back to the PLAYING state. The EOS messages are queued in
 *     #GstBin containers.
 *   * Live sources stop generating data and return %GST_STATE_CHANGE_NO_PREROLL.
 * @GST_STATE_CHANGE_PAUSED_TO_READY  : state change from PAUSED to READY.
 *   * Sinks unblock any waits in the preroll.
 *   * Elements unblock any waits on devices
 *   * Chain or get_range functions return %GST_FLOW_FLUSHING.
 *   * The element pads are deactivated so that streaming becomes impossible and
 *     all streaming threads are stopped.
 *   * The sink forgets all negotiated formats
 *   * Elements remove all sometimes pads
 * @GST_STATE_CHANGE_READY_TO_NULL    : state change from READY to NULL.
 *   * Elements close devices
 *   * Elements reset any internal state.
 * @GST_STATE_CHANGE_NULL_TO_NULL       : state change from NULL to NULL. (Since: 1.14)
 * @GST_STATE_CHANGE_READY_TO_READY     : state change from READY to READY,
 * This might happen when going to PAUSED asynchronously failed, in that case
 * elements should make sure they are in a proper, coherent READY state. (Since: 1.14)
 * @GST_STATE_CHANGE_PAUSED_TO_PAUSED   : state change from PAUSED to PAUSED.
 * This might happen when elements were in PLAYING state and 'lost state',
 * they should make sure to go back to real 'PAUSED' state (prerolling for example). (Since: 1.14)
 * @GST_STATE_CHANGE_PLAYING_TO_PLAYING : state change from PLAYING to PLAYING. (Since: 1.14)
 *
 * These are the different state changes an element goes through.
 * %GST_STATE_NULL &rArr; %GST_STATE_PLAYING is called an upwards state change
 * and %GST_STATE_PLAYING &rArr; %GST_STATE_NULL a downwards state change.
  }
{< flags=0 > }
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
;
{*
 * GstElementFlags:
 * @GST_ELEMENT_FLAG_LOCKED_STATE: ignore state changes from parent
 * @GST_ELEMENT_FLAG_SINK: the element is a sink
 * @GST_ELEMENT_FLAG_SOURCE: the element is a source.
 * @GST_ELEMENT_FLAG_PROVIDE_CLOCK: the element can provide a clock
 * @GST_ELEMENT_FLAG_REQUIRE_CLOCK: the element requires a clock
 * @GST_ELEMENT_FLAG_INDEXABLE: the element can use an index
 * @GST_ELEMENT_FLAG_LAST: offset to define more flags
 *
 * The standard flags that an element may have.
  }
{ padding  }
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
;
{*
 * GST_ELEMENT_IS_LOCKED_STATE:
 * @elem: A #GstElement to query
 *
 * Check if the element is in the locked state and therefore will ignore state
 * changes from its parent object.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_ELEMENT_IS_LOCKED_STATE(elem : longint) : longint;

{*
 * GST_ELEMENT_NAME:
 * @elem: A #GstElement to query
 *
 * Gets the name of this element. This is not thread-safe by default
 * (i.e. you will have to make sure the object lock is taken yourself).
 * If in doubt use gst_element_get_name() instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_NAME(elem : longint) : longint;

{*
 * GST_ELEMENT_PARENT:
 * @elem: A #GstElement to query
 *
 * Get the parent object of this element. This is not thread-safe by default
 * (i.e. you will have to make sure the object lock is taken yourself).
 * If in doubt use gst_object_get_parent() instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_PARENT(elem : longint) : longint;

{*
 * GST_ELEMENT_BUS:
 * @elem: A #GstElement to query
 *
 * Get the message bus of this element. This is not thread-safe by default
 * (i.e. you will have to make sure the object lock is taken yourself).
 * If in doubt use gst_element_get_bus() instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_BUS(elem : longint) : longint;

{*
 * GST_ELEMENT_CLOCK:
 * @elem: A #GstElement to query
 *
 * Get the clock of this element.This is not thread-safe by default
 * (i.e. you will have to make sure it is safe yourself).
 * If in doubt use gst_element_get_clock() instead.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_CLOCK(elem : longint) : longint;

{*
 * GST_ELEMENT_PADS:
 * @elem: A #GstElement to query
 *
 * Get the pads of this elements.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_PADS(elem : longint) : longint;

{*
 * GST_ELEMENT_START_TIME:
 * @elem: a #GstElement to return the start time for.
 *
 * This macro returns the start_time of the @elem. The start_time is the
 * running_time of the pipeline when the element went to PAUSED.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_START_TIME(elem : longint) : longint;

(* Const before type ignored *)
function gst_make_element_message_details(name:Pchar; args:array of const):PGstStructure;cdecl;external;
function gst_make_element_message_details(name:Pchar):PGstStructure;cdecl;external;
{*
 * GST_ELEMENT_FLOW_ERROR:
 * @el:           the element that generates the error
 * @flow_return:  the GstFlowReturn leading to that ERROR message
 *
 * Utility function that elements can use in case they encountered a fatal
 * data processing error due to wrong flow processing.
 *
 * Since: 1.10
  }
{*
 * GST_ELEMENT_ERROR_WITH_DETAILS:
 * @el:     the element that generates the error
 * @domain: like CORE, LIBRARY, RESOURCE or STREAM (see [GstGError](gsterror))
 * @code:   error code defined for that domain (see [GstGError](gsterror))
 * @text:   the message to display (format string and args enclosed in
            parentheses)
 * @debug:  debugging information for the message (format string and args
            enclosed in parentheses)
 * @args:   optional name, type, value triplets, which will be stored
 *          in the associated GstStructure. NULL terminator required.
 *          Must be enclosed within parentheses.
 *
 * Utility function that elements can use in case they encountered a fatal
 * data processing error. The pipeline will post an error message and the
 * application will be requested to stop further media processing.
 *
 * Since: 1.10
  }
{*
 * GST_ELEMENT_ERROR:
 * @el:     the element that generates the error
 * @domain: like CORE, LIBRARY, RESOURCE or STREAM (see [GstGError](gsterror))
 * @code:   error code defined for that domain (see [GstGError](gsterror))
 * @text:   the message to display (format string and args enclosed in
            parentheses)
 * @debug:  debugging information for the message (format string and args
            enclosed in parentheses)
 *
 * Utility function that elements can use in case they encountered a fatal
 * data processing error. The pipeline will post an error message and the
 * application will be requested to stop further media processing.
  }
{*
 * GST_ELEMENT_WARNING_WITH_DETAILS:
 * @el:     the element that generates the warning
 * @domain: like CORE, LIBRARY, RESOURCE or STREAM (see [GstGError](gsterror))
 * @code:   error code defined for that domain (see [GstGError](gsterror))
 * @text:   the message to display (format string and args enclosed in
            parentheses)
 * @debug:  debugging information for the message (format string and args
            enclosed in parentheses)
 * @args:   optional name, type, value triplets, which will be stored
 *          in the associated GstStructure. NULL terminator required.
 *          Must be enclosed within parentheses.
 *
 * Utility function that elements can use in case they encountered a non-fatal
 * data processing problem. The pipeline will post a warning message and the
 * application will be informed.
 *
 * Since: 1.10
  }
{*
 * GST_ELEMENT_WARNING:
 * @el:     the element that generates the warning
 * @domain: like CORE, LIBRARY, RESOURCE or STREAM (see [GstGError](gsterror))
 * @code:   error code defined for that domain (see [GstGError](gsterror))
 * @text:   the message to display (format string and args enclosed in
            parentheses)
 * @debug:  debugging information for the message (format string and args
            enclosed in parentheses)
 *
 * Utility function that elements can use in case they encountered a non-fatal
 * data processing problem. The pipeline will post a warning message and the
 * application will be informed.
  }
{*
 * GST_ELEMENT_INFO_WITH_DETAILS:
 * @el:     the element that generates the information
 * @domain: like CORE, LIBRARY, RESOURCE or STREAM (see [GstGError](gsterror))
 * @code:   error code defined for that domain (see [GstGError](gsterror))
 * @text:   the message to display (format string and args enclosed in
            parentheses)
 * @debug:  debugging information for the message (format string and args
            enclosed in parentheses)
 * @args:   optional name, type, value triplets, which will be stored
 *          in the associated GstStructure. NULL terminator required.
 *          Must be enclosed within parentheses.
 *
 * Utility function that elements can use in case they want to inform
 * the application of something noteworthy that is not an error.
 * The pipeline will post a info message and the
 * application will be informed.
 * Optional name, type, value triplets may be supplied, and will be stored
 * in the associated GstStructure. NULL terminator required.
 *
 * Since: 1.10
  }
{*
 * GST_ELEMENT_INFO:
 * @el:     the element that generates the information
 * @domain: like CORE, LIBRARY, RESOURCE or STREAM (see [GstGError](gsterror))
 * @code:   error code defined for that domain (see [GstGError](gsterror))
 * @text:   the message to display (format string and args enclosed in
            parentheses)
 * @debug:  debugging information for the message (format string and args
            enclosed in parentheses)
 *
 * Utility function that elements can use in case they want to inform
 * the application of something noteworthy that is not an error.
 * The pipeline will post a info message and the
 * application will be informed.
  }
{ the state change mutexes and conds  }
{*
 * GST_STATE_GET_LOCK:
 * @elem:   a #GstElement
 *
 * Get a reference to the state lock of @elem.
 * This lock is used by the core.  It is taken while getting or setting
 * the state, during state changes, and while finalizing.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_GET_LOCK(elem : longint) : longint;

{*
 * GST_STATE_GET_COND:
 * @elem: a #GstElement
 *
 * Get the conditional used to signal the completion of a state change.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_GET_COND(elem : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_LOCK(elem : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_TRYLOCK(elem : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_UNLOCK(elem : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_WAIT(elem : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_WAIT_UNTIL(elem,end_time : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_SIGNAL(elem : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STATE_BROADCAST(elem : longint) : longint;

{*
 * GstElement:
 * @state_lock: Used to serialize execution of gst_element_set_state()
 * @state_cond: Used to signal completion of a state change
 * @state_cookie: Used to detect concurrent execution of
 * gst_element_set_state() and gst_element_get_state()
 * @target_state: the target state of an element as set by the application
 * @current_state: the current state of an element
 * @next_state: the next state of an element, can be #GST_STATE_VOID_PENDING if
 * the element is in the correct state.
 * @pending_state: the final state the element should go to, can be
 * #GST_STATE_VOID_PENDING if the element is in the correct state
 * @last_return: the last return value of an element state change
 * @bus: the bus of the element. This bus is provided to the element by the
 * parent element or the application. A #GstPipeline has a bus of its own.
 * @clock: the clock of the element. This clock is usually provided to the
 * element by the toplevel #GstPipeline.
 * @base_time: the time of the clock right before the element is set to
 * PLAYING. Subtracting @base_time from the current clock time in the PLAYING
 * state will yield the running_time against the clock.
 * @start_time: the running_time of the last PAUSED state
 * @numpads: number of pads of the element, includes both source and sink pads.
 * @pads: (element-type Gst.Pad): list of pads
 * @numsrcpads: number of source pads of the element.
 * @srcpads: (element-type Gst.Pad): list of source pads
 * @numsinkpads: number of sink pads of the element.
 * @sinkpads: (element-type Gst.Pad): list of sink pads
 * @pads_cookie: updated whenever the a pad is added or removed
 * @contexts: (element-type Gst.Context): list of contexts
 *
 * GStreamer element abstract base class.
  }
{< public > }{ with LOCK  }
{ element state  }
{ allocated clock  }
{ NULL/READY: 0 - PAUSED: current time - PLAYING: difference to clock  }
{ element pads, these lists can only be iterated while holding
   * the LOCK or checking the cookie after each LOCK.  }
{ with object LOCK  }
{< private > }
type
  PGstElement = ^TGstElement;
  TGstElement = record
      object : TGstObject;
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

{*
 * GstElementClass:
 * @parent_class: the parent class structure
 * @metadata: metadata for elements of this class
 * @elementfactory: the #GstElementFactory that creates these elements
 * @padtemplates: a #GList of #GstPadTemplate
 * @numpadtemplates: the number of padtemplates
 * @pad_templ_cookie: changed whenever the padtemplates change
 * @request_new_pad: called when a new pad is requested
 * @release_pad: called when a request pad is to be released
 * @get_state: get the state of the element
 * @set_state: set a new state on the element
 * @change_state: called by @set_state to perform an incremental state change
 * @set_bus: set a #GstBus on the element
 * @provide_clock: gets the #GstClock provided by the element
 * @set_clock: set the #GstClock on the element
 * @send_event: send a #GstEvent to the element
 * @query: perform a #GstQuery on the element
 * @state_changed: called immediately after a new state was set.
 * @post_message: called when a message is posted on the element. Chain up to
 *                the parent class' handler to have it posted on the bus.
 * @set_context: set a #GstContext on the element
 *
 * GStreamer element class. Override the vmethods to implement the element
 * functionality.
  }
{< public > }
{ the element metadata  }
{ factory that the element was created from  }
{ templates for our pads  }
{< private > }
{ signal callbacks  }
{< public > }
{ virtual methods for subclasses  }
{ request/release pads  }
{ FIXME 2.0 harmonize naming with gst_element_request_pad  }
(* Const before type ignored *)
(* Const before type ignored *)
{ state changes  }
{ bus  }
{ set/get clocks  }
{ query functions  }
{< private > }
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

{ element class pad templates  }

procedure gst_element_class_add_pad_template(klass:PGstElementClass; templ:PGstPadTemplate);cdecl;external;
procedure gst_element_class_add_static_pad_template(klass:PGstElementClass; static_templ:PGstStaticPadTemplate);cdecl;external;
procedure gst_element_class_add_static_pad_template_with_gtype(klass:PGstElementClass; static_templ:PGstStaticPadTemplate; pad_type:TGType);cdecl;external;
(* Const before type ignored *)
function gst_element_class_get_pad_template(element_class:PGstElementClass; name:Pgchar):PGstPadTemplate;cdecl;external;
function gst_element_class_get_pad_template_list(element_class:PGstElementClass):PGList;cdecl;external;
{ element class meta data  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_element_class_set_metadata(klass:PGstElementClass; longname:Pgchar; classification:Pgchar; description:Pgchar; author:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_element_class_set_static_metadata(klass:PGstElementClass; longname:Pgchar; classification:Pgchar; description:Pgchar; author:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_element_class_add_metadata(klass:PGstElementClass; key:Pgchar; value:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_element_class_add_static_metadata(klass:PGstElementClass; key:Pgchar; value:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_element_class_get_metadata(klass:PGstElementClass; key:Pgchar):Pgchar;cdecl;external;
{ element instance  }
function gst_element_get_type:TGType;cdecl;external;
{ basic name and parentage stuff from GstObject  }
{*
 * gst_element_get_name:
 * @elem: a #GstElement to get the name of @elem.
 *
 * Returns a copy of the name of @elem.
 * Caller should g_free() the return value after usage.
 * For a nameless element, this returns %NULL, which you can safely g_free()
 * as well.
 *
 * Returns: (transfer full) (nullable): the name of @elem. g_free()
 * after usage. MT safe.
 *
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_get_name(elem : longint) : longint;

{*
 * gst_element_set_name:
 * @elem: a #GstElement to set the name of.
 * @name: the new name
 *
 * Sets the name of the element, getting rid of the old name if there was one.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_set_name(elem,name : longint) : longint;

{*
 * gst_element_get_parent:
 * @elem: a #GstElement to get the parent of.
 *
 * Get the parent of an element.
 *
 * Returns: (transfer full): the parent of an element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_get_parent(elem : longint) : longint;

{*
 * gst_element_set_parent:
 * @elem: a #GstElement to set the parent of.
 * @parent: the new parent #GstObject of the element.
 *
 * Sets the parent of an element.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_set_parent(elem,parent : longint) : longint;

{ clocking  }
function gst_element_provide_clock(element:PGstElement):PGstClock;cdecl;external;
function gst_element_get_clock(element:PGstElement):PGstClock;cdecl;external;
function gst_element_set_clock(element:PGstElement; clock:PGstClock):Tgboolean;cdecl;external;
procedure gst_element_set_base_time(element:PGstElement; time:TGstClockTime);cdecl;external;
function gst_element_get_base_time(element:PGstElement):TGstClockTime;cdecl;external;
procedure gst_element_set_start_time(element:PGstElement; time:TGstClockTime);cdecl;external;
function gst_element_get_start_time(element:PGstElement):TGstClockTime;cdecl;external;
function gst_element_get_current_running_time(element:PGstElement):TGstClockTime;cdecl;external;
function gst_element_get_current_clock_time(element:PGstElement):TGstClockTime;cdecl;external;
{ bus  }
procedure gst_element_set_bus(element:PGstElement; bus:PGstBus);cdecl;external;
function gst_element_get_bus(element:PGstElement):PGstBus;cdecl;external;
{ context  }
procedure gst_element_set_context(element:PGstElement; context:PGstContext);cdecl;external;
function gst_element_get_contexts(element:PGstElement):PGList;cdecl;external;
(* Const before type ignored *)
function gst_element_get_context(element:PGstElement; context_type:Pgchar):PGstContext;cdecl;external;
(* Const before type ignored *)
function gst_element_get_context_unlocked(element:PGstElement; context_type:Pgchar):PGstContext;cdecl;external;
{ pad management  }
function gst_element_add_pad(element:PGstElement; pad:PGstPad):Tgboolean;cdecl;external;
function gst_element_remove_pad(element:PGstElement; pad:PGstPad):Tgboolean;cdecl;external;
procedure gst_element_no_more_pads(element:PGstElement);cdecl;external;
(* Const before type ignored *)
function gst_element_get_static_pad(element:PGstElement; name:Pgchar):PGstPad;cdecl;external;
(* Const before type ignored *)
function gst_element_get_request_pad(element:PGstElement; name:Pgchar):PGstPad;cdecl;external;
(* Const before type ignored *)
function gst_element_request_pad_simple(element:PGstElement; name:Pgchar):PGstPad;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_element_request_pad(element:PGstElement; templ:PGstPadTemplate; name:Pgchar; caps:PGstCaps):PGstPad;cdecl;external;
procedure gst_element_release_request_pad(element:PGstElement; pad:PGstPad);cdecl;external;
function gst_element_iterate_pads(element:PGstElement):PGstIterator;cdecl;external;
function gst_element_iterate_src_pads(element:PGstElement):PGstIterator;cdecl;external;
function gst_element_iterate_sink_pads(element:PGstElement):PGstIterator;cdecl;external;
{*
 * GstElementForeachPadFunc:
 * @element: the #GstElement
 * @pad: a #GstPad
 * @user_data: user data passed to the foreach function
 *
 * Function called for each pad when using gst_element_foreach_sink_pad(),
 * gst_element_foreach_src_pad(), or gst_element_foreach_pad().
 *
 * Returns: %FALSE to stop iterating pads, %TRUE to continue
 *
 * Since: 1.14
  }
type

  TGstElementForeachPadFunc = function (element:PGstElement; pad:PGstPad; user_data:Tgpointer):Tgboolean;cdecl;

function gst_element_foreach_sink_pad(element:PGstElement; func:TGstElementForeachPadFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
function gst_element_foreach_src_pad(element:PGstElement; func:TGstElementForeachPadFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
function gst_element_foreach_pad(element:PGstElement; func:TGstElementForeachPadFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
{ event/query/format stuff  }
function gst_element_send_event(element:PGstElement; event:PGstEvent):Tgboolean;cdecl;external;
function gst_element_seek(element:PGstElement; rate:Tgdouble; format:TGstFormat; flags:TGstSeekFlags; start_type:TGstSeekType; 
           start:Tgint64; stop_type:TGstSeekType; stop:Tgint64):Tgboolean;cdecl;external;
function gst_element_query(element:PGstElement; query:PGstQuery):Tgboolean;cdecl;external;
{ messages  }
function gst_element_post_message(element:PGstElement; message:PGstMessage):Tgboolean;cdecl;external;
{ error handling  }
{ gcc versions < 3.3 warn about NULL being passed as format to printf  }
{$if (!defined(__GNUC__) || (__GNUC__ < 3) || (__GNUC__ == 3 && __GNUC_MINOR__ < 3))}
(* Const before type ignored *)

function _gst_element_error_printf(format:Pgchar; args:array of const):Pgchar;cdecl;external;
function _gst_element_error_printf(format:Pgchar):Pgchar;cdecl;external;
{$else}
(* Const before type ignored *)

function _gst_element_error_printf(format:Pgchar; args:array of const):Pgchar;cdecl;external;
function _gst_element_error_printf(format:Pgchar):Pgchar;cdecl;external;
{$endif}
(* Const before type ignored *)
(* Const before type ignored *)

procedure gst_element_message_full(element:PGstElement; _type:TGstMessageType; domain:TGQuark; code:Tgint; text:Pgchar; 
            debug:Pgchar; file:Pgchar; _function:Pgchar; line:Tgint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_element_message_full_with_details(element:PGstElement; _type:TGstMessageType; domain:TGQuark; code:Tgint; text:Pgchar; 
            debug:Pgchar; file:Pgchar; _function:Pgchar; line:Tgint; structure:PGstStructure);cdecl;external;
{ state management  }
function gst_element_is_locked_state(element:PGstElement):Tgboolean;cdecl;external;
function gst_element_set_locked_state(element:PGstElement; locked_state:Tgboolean):Tgboolean;cdecl;external;
function gst_element_sync_state_with_parent(element:PGstElement):Tgboolean;cdecl;external;
function gst_element_get_state(element:PGstElement; state:PGstState; pending:PGstState; timeout:TGstClockTime):TGstStateChangeReturn;cdecl;external;
function gst_element_set_state(element:PGstElement; state:TGstState):TGstStateChangeReturn;cdecl;external;
procedure gst_element_abort_state(element:PGstElement);cdecl;external;
function gst_element_change_state(element:PGstElement; transition:TGstStateChange):TGstStateChangeReturn;cdecl;external;
function gst_element_continue_state(element:PGstElement; ret:TGstStateChangeReturn):TGstStateChangeReturn;cdecl;external;
procedure gst_element_lost_state(element:PGstElement);cdecl;external;
{*
 * GstElementCallAsyncFunc:
 * @element: The #GstElement this function has been called against
 * @user_data: Data passed in the function where that callback has been passed
 *
 * Callback prototype used in #gst_element_call_async
  }
type

  TGstElementCallAsyncFunc = procedure (element:PGstElement; user_data:Tgpointer);cdecl;

procedure gst_element_call_async(element:PGstElement; func:TGstElementCallAsyncFunc; user_data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external;
{ factory management  }
function gst_element_get_factory(element:PGstElement):PGstElementFactory;cdecl;external;
{ utility functions  }
(* Const before type ignored *)
function gst_element_add_property_notify_watch(element:PGstElement; property_name:Pgchar; include_value:Tgboolean):Tgulong;cdecl;external;
(* Const before type ignored *)
function gst_element_add_property_deep_notify_watch(element:PGstElement; property_name:Pgchar; include_value:Tgboolean):Tgulong;cdecl;external;
procedure gst_element_remove_property_notify_watch(element:PGstElement; watch_id:Tgulong);cdecl;external;
(* Const before type ignored *)
function gst_element_get_pad_template(element:PGstElement; name:Pgchar):PGstPadTemplate;cdecl;external;
function gst_element_get_pad_template_list(element:PGstElement):PGList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_element_get_metadata(element:PGstElement; key:Pgchar):Pgchar;cdecl;external;
{$endif}
{ __GST_ELEMENT_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_ELEMENT : longint; { return type might be wrong }
  begin
    GST_TYPE_ELEMENT:=gst_element_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT(obj : longint) : longint;
begin
  GST_ELEMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_ELEMENT,GstElement);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_CLASS(klass : longint) : longint;
begin
  GST_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_ELEMENT,GstElementClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ELEMENT(obj : longint) : longint;
begin
  GST_IS_ELEMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ELEMENT_CLASS(klass : longint) : longint;
begin
  GST_IS_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_GET_CLASS(obj : longint) : longint;
begin
  GST_ELEMENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_ELEMENT,GstElementClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_ELEMENT_CAST(obj : longint) : PGstElement;
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
