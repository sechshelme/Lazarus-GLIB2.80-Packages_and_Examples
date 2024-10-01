unit gstanalyticsobjectdetectionmtd;

interface

uses
  glib280, gst124, gstanalyticsmeta;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGstAnalyticsODMtd = TGstAnalyticsMtd;
  PGstAnalyticsODMtd = ^TGstAnalyticsMtd;

function gst_analytics_od_mtd_get_mtd_type: TGstAnalyticsMtdType; cdecl; external libgstanalytics;
function gst_analytics_od_mtd_get_location(instance: PGstAnalyticsODMtd; x: Pgint; y: Pgint; w: Pgint; h: Pgint;
  loc_conf_lvl: Pgfloat): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_od_mtd_get_confidence_lvl(instance: PGstAnalyticsODMtd; loc_conf_lvl: Pgfloat): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_od_mtd_get_obj_type(handle: PGstAnalyticsODMtd): TGQuark; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_add_od_mtd(instance: PGstAnalyticsRelationMeta; _type: TGQuark; x: Tgint; y: Tgint; w: Tgint;
  h: Tgint; loc_conf_lvl: Tgfloat; od_mtd: PGstAnalyticsODMtd): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_get_od_mtd(meta: PGstAnalyticsRelationMeta; an_meta_id: Tguint; rlt: PGstAnalyticsODMtd): Tgboolean; cdecl; external libgstanalytics;

implementation



end.
