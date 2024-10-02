
unit gsttestclock;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsttestclock.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttestclock.h
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
PGList  = ^GList;
PGstClock  = ^GstClock;
PGstClockID  = ^GstClockID;
PGstTestClock  = ^GstTestClock;
PGstTestClockClass  = ^GstTestClockClass;
PGstTestClockPrivate  = ^GstTestClockPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GstTestClock - A deterministic clock for GStreamer unit tests
 *
 * Copyright (C) 2008 Ole André Vadla Ravnås <ole.andre.ravnas@tandberg.com>
 * Copyright (C) 2012 Sebastian Rasmussen <sebastian.rasmussen@axis.com>
 * Copyright (C) 2012 Havard Graff <havard@pexip.com>
 * Copyright (C) 2013 Haakon Sporsheim <haakon@pexip.com>
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
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __GST_TEST_CLOCK_H__}
{$define __GST_TEST_CLOCK_H__}
{$include <gst/gst.h>}
{$include <gst/check/check-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_TEST_CLOCK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TEST_CLOCK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TEST_CLOCK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TEST_CLOCK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TEST_CLOCK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TEST_CLOCK_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TEST_CLOCK_CAST(obj : longint) : PGstTestClock;

type
{*
 * GstTestClock:
 *
 * A #GstTestClock structure which is based on a #GstClock along with some
 * private data.
 *
 * Since: 1.2
  }
{< private > }
  PGstTestClock = ^TGstTestClock;
  TGstTestClock = record
      parent : TGstClock;
      priv : PGstTestClockPrivate;
    end;

{*
 * GstTestClockClass:
 * @parent_class: the parent class structure
 *
 * The class of a #GstTestClock, which has no virtual methods to override.
 *
 * Since: 1.2
  }
  PGstTestClockClass = ^TGstTestClockClass;
  TGstTestClockClass = record
      parent_class : TGstClockClass;
    end;


function gst_test_clock_get_type:TGType;cdecl;external;
function gst_test_clock_new:PGstClock;cdecl;external;
function gst_test_clock_new_with_start_time(start_time:TGstClockTime):PGstClock;cdecl;external;
procedure gst_test_clock_set_time(test_clock:PGstTestClock; new_time:TGstClockTime);cdecl;external;
procedure gst_test_clock_advance_time(test_clock:PGstTestClock; delta:TGstClockTimeDiff);cdecl;external;
function gst_test_clock_peek_id_count(test_clock:PGstTestClock):Tguint;cdecl;external;
function gst_test_clock_has_id(test_clock:PGstTestClock; id:TGstClockID):Tgboolean;cdecl;external;
function gst_test_clock_peek_next_pending_id(test_clock:PGstTestClock; pending_id:PGstClockID):Tgboolean;cdecl;external;
procedure gst_test_clock_wait_for_next_pending_id(test_clock:PGstTestClock; pending_id:PGstClockID);cdecl;external;
procedure gst_test_clock_wait_for_pending_id_count(test_clock:PGstTestClock; count:Tguint);cdecl;external;
function gst_test_clock_process_next_clock_id(test_clock:PGstTestClock):TGstClockID;cdecl;external;
function gst_test_clock_get_next_entry_time(test_clock:PGstTestClock):TGstClockTime;cdecl;external;
procedure gst_test_clock_wait_for_multiple_pending_ids(test_clock:PGstTestClock; count:Tguint; pending_list:PPGList);cdecl;external;
function gst_test_clock_timed_wait_for_multiple_pending_ids(test_clock:PGstTestClock; count:Tguint; timeout_ms:Tguint; pending_list:PPGList):Tgboolean;cdecl;external;
function gst_test_clock_process_id(test_clock:PGstTestClock; pending_id:TGstClockID):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_test_clock_process_id_list(test_clock:PGstTestClock; pending_list:PGList):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_test_clock_id_list_get_latest_time(pending_list:PGList):TGstClockTime;cdecl;external;
function gst_test_clock_crank(test_clock:PGstTestClock):Tgboolean;cdecl;external;
{$endif}
{ __GST_TEST_CLOCK_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_TEST_CLOCK : longint; { return type might be wrong }
  begin
    GST_TYPE_TEST_CLOCK:=gst_test_clock_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TEST_CLOCK(obj : longint) : longint;
begin
  GST_TEST_CLOCK:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_TEST_CLOCK,GstTestClock);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TEST_CLOCK_CLASS(klass : longint) : longint;
begin
  GST_TEST_CLOCK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_TEST_CLOCK,GstTestClockClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TEST_CLOCK(obj : longint) : longint;
begin
  GST_IS_TEST_CLOCK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_TEST_CLOCK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TEST_CLOCK_CLASS(klass : longint) : longint;
begin
  GST_IS_TEST_CLOCK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_TEST_CLOCK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_TEST_CLOCK_GET_CLASS(obj : longint) : longint;
begin
  GST_TEST_CLOCK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_TEST_CLOCK,GstTestClockClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TEST_CLOCK_CAST(obj : longint) : PGstTestClock;
begin
  GST_TEST_CLOCK_CAST:=PGstTestClock(obj);
end;


end.
