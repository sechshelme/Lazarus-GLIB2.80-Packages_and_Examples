unit gstcompat;

interface

uses
  glib280, common_GST, gstobject, gstelement, gstmessage;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function gst_buffer_new_and_alloc(s : longint) : longint;

{ ************* }
{
static inline gboolean
gst_pad_set_caps (GstPad * pad, GstCaps * caps)

  GstEvent *event;
  gboolean res = TRUE;

  g_return_val_if_fail (GST_IS_PAD (pad), FALSE);
  g_return_val_if_fail (caps != NULL && gst_caps_is_fixed (caps), FALSE);

  event = gst_event_new_caps (caps);

  if (GST_PAD_IS_SRC (pad))
    res = gst_pad_push_event (pad, event);
  else
    res = gst_pad_send_event (pad, event);

  return res;

 }
{$ifndef GST_DISABLE_DEPRECATED}
{ added to ease the transition to 0.11  }

procedure gst_element_class_set_details_simple(klass: PGstElementClass; longname: Pgchar; classification: Pgchar; description: Pgchar; author: Pgchar);
cdecl;  external gstreamerlib name 'gst_element_class_set_metadata';

//const
//  gst_element_class_set_details_simple = gst_element_class_set_metadata;  

function gst_element_factory_get_longname(f : longint) : longint;

function gst_element_factory_get_klass(f : longint) : longint;

function gst_element_factory_get_description(f : longint) : longint;

function gst_element_factory_get_author(f : longint) : longint;

function gst_element_factory_get_documentation_uri(f : longint) : longint;

function gst_element_factory_get_icon_name(f : longint) : longint;

function gst_pad_get_caps_reffed(p : longint) : longint;

function gst_pad_peer_get_caps_reffed(p : longint) : longint;

//const
//  gst_adapter_prev_timestamp = gst_adapter_prev_pts;  

function gst_tag_list_free(taglist : longint) : longint;

const
  GST_MESSAGE_DURATION = GST_MESSAGE_DURATION_CHANGED;  

function gst_message_new_duration(src,fmt,dur : longint) : longint;


function  GST_BUFFER_TIMESTAMP(buf:PGstBuffer):TGstClockTime;
function  GST_BUFFER_TIMESTAMP_IS_VALID(buf:PGstBuffer):TGstClockTime;


// === Konventiert am: 17-9-24 17:52:07 ===


implementation


function gst_buffer_new_and_alloc(s : longint) : longint;
begin
  gst_buffer_new_and_alloc:=gst_buffer_new_allocate(NULL,s,NULL);
end;

function gst_element_factory_get_longname(f : longint) : longint;
begin
  gst_element_factory_get_longname:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_LONGNAME);
end;

function gst_element_factory_get_klass(f : longint) : longint;
begin
  gst_element_factory_get_klass:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_KLASS);
end;

function gst_element_factory_get_description(f : longint) : longint;
begin
  gst_element_factory_get_description:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_DESCRIPTION);
end;

function gst_element_factory_get_author(f : longint) : longint;
begin
  gst_element_factory_get_author:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_AUTHOR);
end;

function gst_element_factory_get_documentation_uri(f : longint) : longint;
begin
  gst_element_factory_get_documentation_uri:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_DOC_URI);
end;

function gst_element_factory_get_icon_name(f : longint) : longint;
begin
  gst_element_factory_get_icon_name:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_ICON_NAME);
end;

function gst_pad_get_caps_reffed(p : longint) : longint;
begin
  gst_pad_get_caps_reffed:=gst_pad_get_caps(p);
end;

function gst_pad_peer_get_caps_reffed(p : longint) : longint;
begin
  gst_pad_peer_get_caps_reffed:=gst_pad_peer_get_caps(p);
end;

function gst_tag_list_free(taglist : longint) : longint;
begin
  gst_tag_list_free:=gst_tag_list_unref(taglist);
end;

function gst_message_new_duration(src,fmt,dur : longint) : longint;
begin
  gst_message_new_duration:=gst_message_new_duration_changed(src);
end;

function GST_BUFFER_TIMESTAMP(buf: PGstBuffer): TGstClockTime;
begin
  GST_BUFFER_PTS := (GST_BUFFER_CAST(buf))^.pts;
end;

function GST_BUFFER_TIMESTAMP_IS_VALID(buf: PGstBuffer): TGstClockTime;
begin
  if GST_BUFFER_DTS_IS_VALID(buf) then begin
    Result := GST_BUFFER_DTS(buf);
  end else begin
    Result := GST_BUFFER_PTS(buf);
  end;
end;


end.
