unit gstsample;

interface

uses
  glib280, common_GST, gstobject, gstbuffer, gstcaps, gstsegment, gststructure, gstbufferlist;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

  var
    _gst_sample_type : TGType;cvar;external gstreamerlib;

type
  TGstSample=record
      end;
  PGstSample=^TGstSample;
  PPGstSample=^PGstSample;

function gst_sample_get_type:TGType;cdecl;external gstreamerlib;
function gst_sample_new(buffer:PGstBuffer; caps:PGstCaps; segment:PGstSegment; info:PGstStructure):PGstSample;cdecl;external gstreamerlib;
function gst_sample_get_buffer(sample:PGstSample):PGstBuffer;cdecl;external gstreamerlib;
function gst_sample_get_caps(sample:PGstSample):PGstCaps;cdecl;external gstreamerlib;
function gst_sample_get_segment(sample:PGstSample):PGstSegment;cdecl;external gstreamerlib;
function gst_sample_get_info(sample:PGstSample):PGstStructure;cdecl;external gstreamerlib;
function gst_sample_get_buffer_list(sample:PGstSample):PGstBufferList;cdecl;external gstreamerlib;
procedure gst_sample_set_buffer_list(sample:PGstSample; buffer_list:PGstBufferList);cdecl;external gstreamerlib;
procedure gst_sample_set_buffer(sample:PGstSample; buffer:PGstBuffer);cdecl;external gstreamerlib;
procedure gst_sample_set_caps(sample:PGstSample; caps:PGstCaps);cdecl;external gstreamerlib;
procedure gst_sample_set_segment(sample:PGstSample; segment:PGstSegment);cdecl;external gstreamerlib;
function gst_sample_set_info(sample:PGstSample; info:PGstStructure):Tgboolean;cdecl;external gstreamerlib;
function gst_sample_ref(sample:PGstSample):PGstSample;cdecl;external gstreamerlib;
procedure gst_sample_unref(sample:PGstSample);cdecl;external gstreamerlib;
function gst_sample_copy(sample:PGstSample):PGstSample;cdecl;external gstreamerlib;
procedure gst_clear_sample(sample_ptr:PPGstSample);cdecl;external gstreamerlib;

function GST_TYPE_SAMPLE : TGType;
function GST_IS_SAMPLE(obj : longint) : longint;
function GST_SAMPLE_CAST(obj : longint) : PGstSample;
function GST_SAMPLE(obj : longint) : longint;

function gst_sample_is_writable(sample : longint) : longint;
function gst_sample_make_writable(sample : longint) : longint;

function gst_value_set_sample(v,b : longint) : longint;
function gst_value_take_sample(v,b : longint) : longint;
function gst_value_get_sample(v : longint) : longint;


// === Konventiert am: 12-9-24 17:47:22 ===


implementation

function GST_TYPE_SAMPLE : TGType;
begin
  Result:=_gst_sample_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_SAMPLE(obj : longint) : longint;
begin
  GST_IS_SAMPLE:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_SAMPLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_SAMPLE_CAST(obj : longint) : PGstSample;
begin
  GST_SAMPLE_CAST:=PGstSample(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_SAMPLE(obj : longint) : longint;
begin
  GST_SAMPLE:=GST_SAMPLE_CAST(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_sample_is_writable(sample : longint) : longint;
begin
  gst_sample_is_writable:=gst_mini_object_is_writable(GST_MINI_OBJECT_CAST(sample));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_sample_make_writable(sample : longint) : longint;
begin
  gst_sample_make_writable:=GST_SAMPLE_CAST(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(sample)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_set_sample(v,b : longint) : longint;
begin
  gst_value_set_sample:=g_value_set_boxed(v,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_take_sample(v,b : longint) : longint;
begin
  gst_value_take_sample:=g_value_take_boxed(v,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_value_get_sample(v : longint) : longint;
begin
  gst_value_get_sample:=GST_SAMPLE_CAST(g_value_get_boxed(v));
end;


end.
