unit gstquery;

interface

uses
  glib280, common_GST, gstobject, gststructure, gstformat, gstcaps, gstallocator;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGstQueryTypeFlags = ^TGstQueryTypeFlags;
  TGstQueryTypeFlags = longint;

const
  GST_QUERY_TYPE_UPSTREAM = 1 shl 0;
  GST_QUERY_TYPE_DOWNSTREAM = 1 shl 1;
  GST_QUERY_TYPE_SERIALIZED = 1 shl 2;

const
  GST_QUERY_NUM_SHIFT = 8;

type
  PGstQueryType = ^TGstQueryType;
  TGstQueryType = longint;

  //typedef enum {
  //  GST_QUERY_UNKNOWN      = GST_QUERY_MAKE_TYPE (0, 0),
  //  GST_QUERY_POSITION     = GST_QUERY_MAKE_TYPE (10, _FLAG(BOTH)),
  //  GST_QUERY_DURATION     = GST_QUERY_MAKE_TYPE (20, _FLAG(BOTH)),
  //  GST_QUERY_LATENCY      = GST_QUERY_MAKE_TYPE (30, _FLAG(BOTH)),
  //  GST_QUERY_JITTER       = GST_QUERY_MAKE_TYPE (40, _FLAG(BOTH)),
  //  GST_QUERY_RATE         = GST_QUERY_MAKE_TYPE (50, _FLAG(BOTH)),
  //  GST_QUERY_SEEKING      = GST_QUERY_MAKE_TYPE (60, _FLAG(BOTH)),
  //  GST_QUERY_SEGMENT      = GST_QUERY_MAKE_TYPE (70, _FLAG(BOTH)),
  //  GST_QUERY_CONVERT      = GST_QUERY_MAKE_TYPE (80, _FLAG(BOTH)),
  //  GST_QUERY_FORMATS      = GST_QUERY_MAKE_TYPE (90, _FLAG(BOTH)),
  //  GST_QUERY_BUFFERING    = GST_QUERY_MAKE_TYPE (110, _FLAG(BOTH)),
  //  GST_QUERY_CUSTOM       = GST_QUERY_MAKE_TYPE (120, _FLAG(BOTH)),
  //  GST_QUERY_URI          = GST_QUERY_MAKE_TYPE (130, _FLAG(BOTH)),
  //  GST_QUERY_ALLOCATION   = GST_QUERY_MAKE_TYPE (140, _FLAG(DOWNSTREAM) | _FLAG(SERIALIZED)),
  //  GST_QUERY_SCHEDULING   = GST_QUERY_MAKE_TYPE (150, _FLAG(UPSTREAM)),
  //  GST_QUERY_ACCEPT_CAPS  = GST_QUERY_MAKE_TYPE (160, _FLAG(BOTH)),
  //  GST_QUERY_CAPS         = GST_QUERY_MAKE_TYPE (170, _FLAG(BOTH)),
  //  GST_QUERY_DRAIN        = GST_QUERY_MAKE_TYPE (180, _FLAG(DOWNSTREAM) | _FLAG(SERIALIZED)),
  //  GST_QUERY_CONTEXT      = GST_QUERY_MAKE_TYPE (190, _FLAG(BOTH)),
  //  GST_QUERY_BITRATE      = GST_QUERY_MAKE_TYPE (200, _FLAG(DOWNSTREAM)),

const
  GST_QUERY_UNKNOWN = ((0 shl GST_QUERY_NUM_SHIFT) or 0);
  GST_QUERY_POSITION = ((10 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_DURATION = ((20 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_LATENCY = ((30 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_JITTER = ((40 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_RATE = ((50 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_SEEKING = ((60 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_SEGMENT = ((70 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_CONVERT = ((80 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_FORMATS = ((90 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_BUFFERING = ((110 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_CUSTOM = ((120 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_URI = ((130 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_ALLOCATION = ((140 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_DOWNSTREAM or GST_QUERY_TYPE_SERIALIZED);
  GST_QUERY_SCHEDULING = ((150 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM);
  GST_QUERY_ACCEPT_CAPS = ((160 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_CAPS = ((170 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_DRAIN = ((180 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_DOWNSTREAM or GST_QUERY_TYPE_SERIALIZED);
  GST_QUERY_CONTEXT = ((190 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_BITRATE = ((200 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_SELECTABLE = ((210 shl GST_QUERY_NUM_SHIFT) or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);


var
  _gst_query_type: TGType; cvar;external gstreamerlib;

type
  TGstQuery = record
    mini_object: TGstMiniObject;
    _type: TGstQueryType;
  end;
  PGstQuery = ^TGstQuery;
  PPGstQuery = ^PGstQuery;

  PGstBufferingMode = ^TGstBufferingMode;
  TGstBufferingMode = longint;

const
  GST_BUFFERING_STREAM = 0;
  GST_BUFFERING_DOWNLOAD = 1;
  GST_BUFFERING_TIMESHIFT = 2;
  GST_BUFFERING_LIVE = 3;

function gst_query_type_get_name(_type: TGstQueryType): Pgchar; cdecl; external gstreamerlib;
function gst_query_type_to_quark(_type: TGstQueryType): TGQuark; cdecl; external gstreamerlib;
function gst_query_type_get_flags(_type: TGstQueryType): TGstQueryTypeFlags; cdecl; external gstreamerlib;
function gst_query_get_type: TGType; cdecl; external gstreamerlib;
function gst_query_ref(q: PGstQuery): PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_unref(q: PGstQuery); cdecl; external gstreamerlib;
procedure gst_clear_query(query_ptr: PPGstQuery); cdecl; external gstreamerlib;
function gst_query_copy(q: PGstQuery): PGstQuery; cdecl; external gstreamerlib;

function gst_query_is_writable(q: longint): longint;
function gst_query_make_writable(q: longint): longint;

function gst_query_replace(old_query: PPGstQuery; new_query: PGstQuery): Tgboolean; cdecl; external gstreamerlib;
function gst_query_take(old_query: PPGstQuery; new_query: PGstQuery): Tgboolean; cdecl; external gstreamerlib;
function gst_query_new_custom(_type: TGstQueryType; structure: PGstStructure): PGstQuery; cdecl; external gstreamerlib;
function gst_query_get_structure(query: PGstQuery): PGstStructure; cdecl; external gstreamerlib;
function gst_query_writable_structure(query: PGstQuery): PGstStructure; cdecl; external gstreamerlib;
function gst_query_new_position(format: TGstFormat): PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_set_position(query: PGstQuery; format: TGstFormat; cur: Tgint64); cdecl; external gstreamerlib;
procedure gst_query_parse_position(query: PGstQuery; format: PGstFormat; cur: Pgint64); cdecl; external gstreamerlib;
function gst_query_new_duration(format: TGstFormat): PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_set_duration(query: PGstQuery; format: TGstFormat; duration: Tgint64); cdecl; external gstreamerlib;
procedure gst_query_parse_duration(query: PGstQuery; format: PGstFormat; duration: Pgint64); cdecl; external gstreamerlib;
function gst_query_new_latency: PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_set_latency(query: PGstQuery; live: Tgboolean; min_latency: TGstClockTime; max_latency: TGstClockTime); cdecl; external gstreamerlib;
procedure gst_query_parse_latency(query: PGstQuery; live: Pgboolean; min_latency: PGstClockTime; max_latency: PGstClockTime); cdecl; external gstreamerlib;
function gst_query_new_convert(src_format: TGstFormat; Value: Tgint64; dest_format: TGstFormat): PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_set_convert(query: PGstQuery; src_format: TGstFormat; src_value: Tgint64; dest_format: TGstFormat; dest_value: Tgint64); cdecl; external gstreamerlib;
procedure gst_query_parse_convert(query: PGstQuery; src_format: PGstFormat; src_value: Pgint64; dest_format: PGstFormat; dest_value: Pgint64); cdecl; external gstreamerlib;
function gst_query_new_segment(format: TGstFormat): PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_set_segment(query: PGstQuery; rate: Tgdouble; format: TGstFormat; start_value: Tgint64; stop_value: Tgint64); cdecl; external gstreamerlib;
procedure gst_query_parse_segment(query: PGstQuery; rate: Pgdouble; format: PGstFormat; start_value: Pgint64; stop_value: Pgint64); cdecl; external gstreamerlib;
function gst_query_new_seeking(format: TGstFormat): PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_set_seeking(query: PGstQuery; format: TGstFormat; seekable: Tgboolean; segment_start: Tgint64; segment_end: Tgint64); cdecl; external gstreamerlib;
procedure gst_query_parse_seeking(query: PGstQuery; format: PGstFormat; seekable: Pgboolean; segment_start: Pgint64; segment_end: Pgint64); cdecl; external gstreamerlib;
function gst_query_new_formats: PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_set_formats(query: PGstQuery; n_formats: Tgint; args: array of const); cdecl; external gstreamerlib;
procedure gst_query_set_formats(query: PGstQuery; n_formats: Tgint); cdecl; external gstreamerlib;
procedure gst_query_set_formatsv(query: PGstQuery; n_formats: Tgint; formats: PGstFormat); cdecl; external gstreamerlib;
procedure gst_query_parse_n_formats(query: PGstQuery; n_formats: Pguint); cdecl; external gstreamerlib;
procedure gst_query_parse_nth_format(query: PGstQuery; nth: Tguint; format: PGstFormat); cdecl; external gstreamerlib;
function gst_query_new_buffering(format: TGstFormat): PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_set_buffering_percent(query: PGstQuery; busy: Tgboolean; percent: Tgint); cdecl; external gstreamerlib;
procedure gst_query_parse_buffering_percent(query: PGstQuery; busy: Pgboolean; percent: Pgint); cdecl; external gstreamerlib;
procedure gst_query_set_buffering_stats(query: PGstQuery; mode: TGstBufferingMode; avg_in: Tgint; avg_out: Tgint; buffering_left: Tgint64); cdecl; external gstreamerlib;
procedure gst_query_parse_buffering_stats(query: PGstQuery; mode: PGstBufferingMode; avg_in: Pgint; avg_out: Pgint; buffering_left: Pgint64); cdecl; external gstreamerlib;
procedure gst_query_set_buffering_range(query: PGstQuery; format: TGstFormat; start: Tgint64; stop: Tgint64; estimated_total: Tgint64); cdecl; external gstreamerlib;
procedure gst_query_parse_buffering_range(query: PGstQuery; format: PGstFormat; start: Pgint64; stop: Pgint64; estimated_total: Pgint64); cdecl; external gstreamerlib;
function gst_query_add_buffering_range(query: PGstQuery; start: Tgint64; stop: Tgint64): Tgboolean; cdecl; external gstreamerlib;
function gst_query_get_n_buffering_ranges(query: PGstQuery): Tguint; cdecl; external gstreamerlib;
function gst_query_parse_nth_buffering_range(query: PGstQuery; index: Tguint; start: Pgint64; stop: Pgint64): Tgboolean; cdecl; external gstreamerlib;
function gst_query_new_uri: PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_parse_uri(query: PGstQuery; uri: PPgchar); cdecl; external gstreamerlib;
procedure gst_query_set_uri(query: PGstQuery; uri: Pgchar); cdecl; external gstreamerlib;
procedure gst_query_parse_uri_redirection(query: PGstQuery; uri: PPgchar); cdecl; external gstreamerlib;
procedure gst_query_set_uri_redirection(query: PGstQuery; uri: Pgchar); cdecl; external gstreamerlib;
procedure gst_query_parse_uri_redirection_permanent(query: PGstQuery; permanent: Pgboolean); cdecl; external gstreamerlib;
procedure gst_query_set_uri_redirection_permanent(query: PGstQuery; permanent: Tgboolean); cdecl; external gstreamerlib;
function gst_query_new_allocation(caps: PGstCaps; need_pool: Tgboolean): PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_parse_allocation(query: PGstQuery; caps: PPGstCaps; need_pool: Pgboolean); cdecl; external gstreamerlib;
procedure gst_query_add_allocation_pool(query: PGstQuery; pool: PGstBufferPool; size: Tguint; min_buffers: Tguint; max_buffers: Tguint); cdecl; external gstreamerlib;
function gst_query_get_n_allocation_pools(query: PGstQuery): Tguint; cdecl; external gstreamerlib;
procedure gst_query_parse_nth_allocation_pool(query: PGstQuery; index: Tguint; pool: PPGstBufferPool; size: Pguint; min_buffers: Pguint;
  max_buffers: Pguint); cdecl; external gstreamerlib;
procedure gst_query_set_nth_allocation_pool(query: PGstQuery; index: Tguint; pool: PGstBufferPool; size: Tguint; min_buffers: Tguint;
  max_buffers: Tguint); cdecl; external gstreamerlib;
procedure gst_query_remove_nth_allocation_pool(query: PGstQuery; index: Tguint); cdecl; external gstreamerlib;
procedure gst_query_add_allocation_param(query: PGstQuery; allocator: PGstAllocator; params: PGstAllocationParams); cdecl; external gstreamerlib;
function gst_query_get_n_allocation_params(query: PGstQuery): Tguint; cdecl; external gstreamerlib;
procedure gst_query_parse_nth_allocation_param(query: PGstQuery; index: Tguint; allocator: PPGstAllocator; params: PGstAllocationParams); cdecl; external gstreamerlib;
procedure gst_query_set_nth_allocation_param(query: PGstQuery; index: Tguint; allocator: PGstAllocator; params: PGstAllocationParams); cdecl; external gstreamerlib;
procedure gst_query_remove_nth_allocation_param(query: PGstQuery; index: Tguint); cdecl; external gstreamerlib;
procedure gst_query_add_allocation_meta(query: PGstQuery; api: TGType; params: PGstStructure); cdecl; external gstreamerlib;
function gst_query_get_n_allocation_metas(query: PGstQuery): Tguint; cdecl; external gstreamerlib;
function gst_query_parse_nth_allocation_meta(query: PGstQuery; index: Tguint; params: PPGstStructure): TGType; cdecl; external gstreamerlib;
procedure gst_query_remove_nth_allocation_meta(query: PGstQuery; index: Tguint); cdecl; external gstreamerlib;
function gst_query_find_allocation_meta(query: PGstQuery; api: TGType; index: Pguint): Tgboolean; cdecl; external gstreamerlib;

type
  PGstSchedulingFlags = ^TGstSchedulingFlags;
  TGstSchedulingFlags = longint;

const
  GST_SCHEDULING_FLAG_SEEKABLE = 1 shl 0;
  GST_SCHEDULING_FLAG_SEQUENTIAL = 1 shl 1;
  GST_SCHEDULING_FLAG_BANDWIDTH_LIMITED = 1 shl 2;

function gst_query_new_scheduling: PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_set_scheduling(query: PGstQuery; flags: TGstSchedulingFlags; minsize: Tgint; maxsize: Tgint; align: Tgint); cdecl; external gstreamerlib;
procedure gst_query_parse_scheduling(query: PGstQuery; flags: PGstSchedulingFlags; minsize: Pgint; maxsize: Pgint; align: Pgint); cdecl; external gstreamerlib;
procedure gst_query_add_scheduling_mode(query: PGstQuery; mode: TGstPadMode); cdecl; external gstreamerlib;
function gst_query_get_n_scheduling_modes(query: PGstQuery): Tguint; cdecl; external gstreamerlib;
function gst_query_parse_nth_scheduling_mode(query: PGstQuery; index: Tguint): TGstPadMode; cdecl; external gstreamerlib;
function gst_query_has_scheduling_mode(query: PGstQuery; mode: TGstPadMode): Tgboolean; cdecl; external gstreamerlib;
function gst_query_has_scheduling_mode_with_flags(query: PGstQuery; mode: TGstPadMode; flags: TGstSchedulingFlags): Tgboolean; cdecl; external gstreamerlib;
function gst_query_new_accept_caps(caps: PGstCaps): PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_parse_accept_caps(query: PGstQuery; caps: PPGstCaps); cdecl; external gstreamerlib;
procedure gst_query_set_accept_caps_result(query: PGstQuery; Result: Tgboolean); cdecl; external gstreamerlib;
procedure gst_query_parse_accept_caps_result(query: PGstQuery; Result: Pgboolean); cdecl; external gstreamerlib;
function gst_query_new_caps(filter: PGstCaps): PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_parse_caps(query: PGstQuery; filter: PPGstCaps); cdecl; external gstreamerlib;
procedure gst_query_set_caps_result(query: PGstQuery; caps: PGstCaps); cdecl; external gstreamerlib;
procedure gst_query_parse_caps_result(query: PGstQuery; caps: PPGstCaps); cdecl; external gstreamerlib;
function gst_query_new_drain: PGstQuery; cdecl; external gstreamerlib;
function gst_query_new_context(context_type: Pgchar): PGstQuery; cdecl; external gstreamerlib;
function gst_query_parse_context_type(query: PGstQuery; context_type: PPgchar): Tgboolean; cdecl; external gstreamerlib;
procedure gst_query_set_context(query: PGstQuery; context: PGstContext); cdecl; external gstreamerlib;
procedure gst_query_parse_context(query: PGstQuery; context: PPGstContext); cdecl; external gstreamerlib;
function gst_query_new_bitrate: PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_set_bitrate(query: PGstQuery; nominal_bitrate: Tguint); cdecl; external gstreamerlib;
procedure gst_query_parse_bitrate(query: PGstQuery; nominal_bitrate: Pguint); cdecl; external gstreamerlib;
function gst_query_new_selectable: PGstQuery; cdecl; external gstreamerlib;
procedure gst_query_set_selectable(query: PGstQuery; selectable: Tgboolean); cdecl; external gstreamerlib;
procedure gst_query_parse_selectable(query: PGstQuery; selectable: Pgboolean); cdecl; external gstreamerlib;

function GST_QUERY_TYPE_BOTH: TGstQueryTypeFlags;
function GST_QUERY_MAKE_TYPE(num, flags: longint): longint;

function GST_TYPE_QUERY: TGType;

function GST_IS_QUERY(obj: longint): longint;
function GST_QUERY_CAST(obj: longint): PGstQuery;
function GST_QUERY(obj: longint): longint;
function GST_QUERY_TYPE(query: longint): longint;
function GST_QUERY_TYPE_NAME(query: longint): longint;
function GST_QUERY_IS_UPSTREAM(ev: longint): longint;
function GST_QUERY_IS_DOWNSTREAM(ev: longint): longint;
function GST_QUERY_IS_SERIALIZED(ev: longint): longint;



// === Konventiert am: 13-9-24 19:28:25 ===


implementation


{ was #define dname def_expr }
function GST_QUERY_TYPE_BOTH: TGstQueryTypeFlags;
begin
  GST_QUERY_TYPE_BOTH := TGstQueryTypeFlags(GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function GST_QUERY_MAKE_TYPE(num, flags: longint): longint;
begin
  GST_QUERY_MAKE_TYPE := (num shl GST_QUERY_NUM_SHIFT) or flags;
end;

function GST_TYPE_QUERY: TGType;
begin
  Result := _gst_query_type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function GST_IS_QUERY(obj: longint): longint;
begin
  GST_IS_QUERY := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_QUERY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_QUERY_CAST(obj: longint): PGstQuery;
begin
  GST_QUERY_CAST := PGstQuery(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function GST_QUERY(obj: longint): longint;
begin
  GST_QUERY := GST_QUERY_CAST(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function GST_QUERY_TYPE(query: longint): longint;
begin
  GST_QUERY_TYPE := (PGstQuery(query))^._type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function GST_QUERY_TYPE_NAME(query: longint): longint;
begin
  GST_QUERY_TYPE_NAME := gst_query_type_get_name(GST_QUERY_TYPE(query));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function GST_QUERY_IS_UPSTREAM(ev: longint): longint;
begin
  GST_QUERY_IS_UPSTREAM := not (not ((GST_QUERY_TYPE(ev)) and GST_QUERY_TYPE_UPSTREAM));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function GST_QUERY_IS_DOWNSTREAM(ev: longint): longint;
begin
  GST_QUERY_IS_DOWNSTREAM := not (not ((GST_QUERY_TYPE(ev)) and GST_QUERY_TYPE_DOWNSTREAM));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function GST_QUERY_IS_SERIALIZED(ev: longint): longint;
begin
  GST_QUERY_IS_SERIALIZED := not (not ((GST_QUERY_TYPE(ev)) and GST_QUERY_TYPE_SERIALIZED));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function gst_query_is_writable(q: longint): longint;
begin
  gst_query_is_writable := gst_mini_object_is_writable(GST_MINI_OBJECT_CAST(q));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function gst_query_make_writable(q: longint): longint;
begin
  gst_query_make_writable := GST_QUERY_CAST(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(q)));
end;


end.
