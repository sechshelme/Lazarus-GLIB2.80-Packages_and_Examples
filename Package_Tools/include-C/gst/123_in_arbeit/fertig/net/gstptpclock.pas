unit gstptpclock;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2015 Sebastian Dröge <sebastian@centricular.com>
 *
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
{$ifndef __GST_PTP_CLOCK_H__}
{$define __GST_PTP_CLOCK_H__}
{$include <gst/gst.h>}
{$include <gst/gstsystemclock.h>}
{$include <gst/net/net-prelude.h>}

type
{*
 * GstPtpClock:
 *
 * Opaque #GstPtpClock structure.
  }
{< private > }
  PGstPtpClock = ^TGstPtpClock;
  TGstPtpClock = record
      clock : TGstSystemClock;
      priv : PGstPtpClockPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstPtpClockClass:
 * @parent_class: parented to #GstSystemClockClass
 *
 * Opaque #GstPtpClockClass structure.
  }
{< private > }
  PGstPtpClockClass = ^TGstPtpClockClass;
  TGstPtpClockClass = record
      parent_class : TGstSystemClockClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GST_PTP_CLOCK_ID_NONE:
 * PTP clock identification that can be passed to gst_ptp_init() to
 * automatically select one based on the MAC address of interfaces
  }

{ was #define dname def_expr }
function GST_PTP_CLOCK_ID_NONE : Tguint64;  

function gst_ptp_clock_get_type:TGType;cdecl;external libgstnet;
function gst_ptp_is_supported:Tgboolean;cdecl;external libgstnet;
function gst_ptp_is_initialized:Tgboolean;cdecl;external libgstnet;
function gst_ptp_init(clock_id:Tguint64; interfaces:PPgchar):Tgboolean;cdecl;external libgstnet;
function gst_ptp_init_full(config:PGstStructure):Tgboolean;cdecl;external libgstnet;
procedure gst_ptp_deinit;cdecl;external libgstnet;
const
  GST_PTP_STATISTICS_NEW_DOMAIN_FOUND = 'GstPtpStatisticsNewDomainFound';  
  GST_PTP_STATISTICS_BEST_MASTER_CLOCK_SELECTED = 'GstPtpStatisticsBestMasterClockSelected';  
  GST_PTP_STATISTICS_PATH_DELAY_MEASURED = 'GstPtpStatisticsPathDelayMeasured';  
  GST_PTP_STATISTICS_TIME_UPDATED = 'GstPtpStatisticsTimeUpdated';  
{*
 * GstPtpStatisticsCallback:
 * @domain: PTP domain identifier
 * @stats: New statistics
 * @user_data: Data passed to gst_ptp_statistics_callback_add()
 *
 * The statistics can be the following structures:
 *
 * GST_PTP_STATISTICS_NEW_DOMAIN_FOUND:
 * "domain"                G_TYPE_UINT          The domain identifier of the domain
 * "clock"                 GST_TYPE_CLOCK       The internal clock that is slaved to the
 *                                              PTP domain
 *
 * GST_PTP_STATISTICS_BEST_MASTER_CLOCK_SELECTED:
 * "domain"                G_TYPE_UINT          The domain identifier of the domain
 * "master-clock-id"       G_TYPE_UINT64        PTP clock identifier of the selected master
 *                                              clock
 * "master-clock-port"     G_TYPE_UINT          PTP port number of the selected master clock
 * "grandmaster-clock-id"  G_TYPE_UINT64        PTP clock identifier of the grandmaster clock
 *
 * GST_PTP_STATISTICS_PATH_DELAY_MEASURED:
 * "domain"                G_TYPE_UINT          The domain identifier of the domain
 * "mean-path-delay-avg"   GST_TYPE_CLOCK_TIME  Average mean path delay
 * "mean-path-delay"       GST_TYPE_CLOCK_TIME  Latest mean path delay
 * "delay-request-delay"   GST_TYPE_CLOCK_TIME  Delay of DELAY_REQ / DELAY_RESP messages
 *
 * GST_PTP_STATISTICS_TIME_UPDATED:
 * "domain"                G_TYPE_UINT          The domain identifier of the domain
 * "mean-path-delay-avg"   GST_TYPE_CLOCK_TIME  Average mean path delay
 * "local-time"            GST_TYPE_CLOCK_TIME  Local time that corresponds to ptp-time
 * "ptp-time"              GST_TYPE_CLOCK_TIME  Newly measured PTP time at local-time
 * "estimated-ptp-time"    GST_TYPE_CLOCK_TIME  Estimated PTP time based on previous measurements
 * "discontinuity"         G_TYPE_INT64         Difference between estimated and measured PTP time
 * "synced"                G_TYPE_BOOLEAN       Currently synced to the remote clock
 * "r-squared"             G_TYPE_DOUBLE        R² of clock estimation regression
 * "internal-time"         GST_TYPE_CLOCK_TIME  Internal time clock parameter
 * "external-time"         GST_TYPE_CLOCK_TIME  External time clock parameter
 * "rate-num"              G_TYPE_UINT64        Internal/external rate numerator
 * "rate-den"              G_TYPE_UINT64        Internal/external rate denominator
 * "rate"                  G_TYPE_DOUBLE        Internal/external rate
 *
 * If %FALSE is returned, the callback is removed and never called again.
 *
  }
type

  TGstPtpStatisticsCallback = function (domain:Tguint8; stats:PGstStructure; user_data:Tgpointer):Tgboolean;cdecl;

function gst_ptp_statistics_callback_add(callback:TGstPtpStatisticsCallback; user_data:Tgpointer; destroy_data:TGDestroyNotify):Tgulong;cdecl;external libgstnet;
procedure gst_ptp_statistics_callback_remove(id:Tgulong);cdecl;external libgstnet;
function gst_ptp_clock_new(name:Pgchar; domain:Tguint):PGstClock;cdecl;external libgstnet;
{$endif}
{ __GST_PTP_CLOCK_H__  }

// === Konventiert am: 11-10-24 14:28:49 ===

function GST_TYPE_PTP_CLOCK : TGType;
function GST_PTP_CLOCK(obj : Pointer) : PGstPtpClock;
function GST_PTP_CLOCK_CLASS(klass : Pointer) : PGstPtpClockClass;
function GST_IS_PTP_CLOCK(obj : Pointer) : Tgboolean;
function GST_IS_PTP_CLOCK_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_PTP_CLOCK : TGType;
  begin
    GST_TYPE_PTP_CLOCK:=gst_ptp_clock_get_type;
  end;

function GST_PTP_CLOCK(obj : Pointer) : PGstPtpClock;
begin
  Result := PGstPtpClock(g_type_check_instance_cast(obj, GST_TYPE_PTP_CLOCK));
end;

function GST_PTP_CLOCK_CLASS(klass : Pointer) : PGstPtpClockClass;
begin
  Result := PGstPtpClockClass(g_type_check_class_cast(klass, GST_TYPE_PTP_CLOCK));
end;

function GST_IS_PTP_CLOCK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_PTP_CLOCK);
end;

function GST_IS_PTP_CLOCK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_PTP_CLOCK);
end;


{ was #define dname def_expr }
function GST_PTP_CLOCK_ID_NONE : Tguint64;
  begin
    GST_PTP_CLOCK_ID_NONE:=Tguint64(-(1));
  end;


end.
