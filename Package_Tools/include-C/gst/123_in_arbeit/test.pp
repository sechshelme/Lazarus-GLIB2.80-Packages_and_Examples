
unit test;
interface

{
  Automatically converted by H2Pas 0.99.16 from test.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    test.h
}


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



const
  gst_element_class_set_details_simple = gst_element_class_set_metadata;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_element_factory_get_longname(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_klass(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_description(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_author(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_documentation_uri(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_icon_name(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_get_caps_reffed(p : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_peer_get_caps_reffed(p : longint) : longint;

const
  gst_adapter_prev_timestamp = gst_adapter_prev_pts;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_tag_list_free(taglist : longint) : longint;


implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_longname(f : longint) : longint;
begin
  gst_element_factory_get_longname:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_LONGNAME);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_klass(f : longint) : longint;
begin
  gst_element_factory_get_klass:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_KLASS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_description(f : longint) : longint;
begin
  gst_element_factory_get_description:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_DESCRIPTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_author(f : longint) : longint;
begin
  gst_element_factory_get_author:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_AUTHOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_documentation_uri(f : longint) : longint;
begin
  gst_element_factory_get_documentation_uri:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_DOC_URI);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_element_factory_get_icon_name(f : longint) : longint;
begin
  gst_element_factory_get_icon_name:=gst_element_factory_get_metadata(f,GST_ELEMENT_METADATA_ICON_NAME);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_get_caps_reffed(p : longint) : longint;
begin
  gst_pad_get_caps_reffed:=gst_pad_get_caps(p);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_pad_peer_get_caps_reffed(p : longint) : longint;
begin
  gst_pad_peer_get_caps_reffed:=gst_pad_peer_get_caps(p);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_tag_list_free(taglist : longint) : longint;
begin
  gst_tag_list_free:=gst_tag_list_unref(taglist);
end;


end.
