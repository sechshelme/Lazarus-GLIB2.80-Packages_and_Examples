#define gst_element_class_set_details_simple  gst_element_class_set_metadata

#define gst_element_factory_get_longname(f)    gst_element_factory_get_metadata(f, GST_ELEMENT_METADATA_LONGNAME)
#define gst_element_factory_get_klass(f)       gst_element_factory_get_metadata(f, GST_ELEMENT_METADATA_KLASS)
#define gst_element_factory_get_description(f) gst_element_factory_get_metadata(f, GST_ELEMENT_METADATA_DESCRIPTION)
#define gst_element_factory_get_author(f)      gst_element_factory_get_metadata(f, GST_ELEMENT_METADATA_AUTHOR)
#define gst_element_factory_get_documentation_uri(f)  gst_element_factory_get_metadata(f, GST_ELEMENT_METADATA_DOC_URI)
#define gst_element_factory_get_icon_name(f)   gst_element_factory_get_metadata(f, GST_ELEMENT_METADATA_ICON_NAME)

#define gst_pad_get_caps_reffed(p)             gst_pad_get_caps(p)
#define gst_pad_peer_get_caps_reffed(p)        gst_pad_peer_get_caps(p)

#define gst_adapter_prev_timestamp    gst_adapter_prev_pts

#define gst_tag_list_free(taglist)    gst_tag_list_unref(taglist)
