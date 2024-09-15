unit gstelementfactory;

interface

uses
  ctypes, glib280, common_GST, gstobject, gstelement, gsturi, gstplugin, gstpluginfeature, gstcaps;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  TGstElementFactoryClass=record
      end;
  PGstElementFactoryClass=^TGstElementFactoryClass;

function gst_element_factory_get_type:TGType;cdecl;external gstreamerlib;
function gst_element_factory_find(name:Pgchar):PGstElementFactory;cdecl;external gstreamerlib;
function gst_element_factory_get_element_type(factory:PGstElementFactory):TGType;cdecl;external gstreamerlib;
function gst_element_factory_get_metadata(factory:PGstElementFactory; key:Pgchar):Pgchar;cdecl;external gstreamerlib;
function gst_element_factory_get_metadata_keys(factory:PGstElementFactory):PPgchar;cdecl;external gstreamerlib;
function gst_element_factory_get_num_pad_templates(factory:PGstElementFactory):Tguint;cdecl;external gstreamerlib;
function gst_element_factory_get_static_pad_templates(factory:PGstElementFactory):PGList;cdecl;external gstreamerlib;
function gst_element_factory_get_uri_type(factory:PGstElementFactory):TGstURIType;cdecl;external gstreamerlib;
function gst_element_factory_get_uri_protocols(factory:PGstElementFactory):PPgchar;cdecl;external gstreamerlib;
function gst_element_factory_has_interface(factory:PGstElementFactory; interfacename:Pgchar):Tgboolean;cdecl;external gstreamerlib;
function gst_element_factory_create(factory:PGstElementFactory; name:Pgchar):PGstElement;cdecl;external gstreamerlib;
function gst_element_factory_create_full(factory:PGstElementFactory; first:Pgchar; args:array of const):PGstElement;cdecl;external gstreamerlib;
function gst_element_factory_create_full(factory:PGstElementFactory; first:Pgchar):PGstElement;cdecl;external gstreamerlib;
function gst_element_factory_create_valist(factory:PGstElementFactory; first:Pgchar; properties:Tva_list):PGstElement;cdecl;external gstreamerlib;
function gst_element_factory_create_with_properties(factory:PGstElementFactory; n:Tguint; names:PPgchar; values:PGValue):PGstElement;cdecl;external gstreamerlib;
function gst_element_factory_make(factoryname:Pgchar; name:Pgchar):PGstElement;cdecl;external gstreamerlib;
function gst_element_factory_make_full(factoryname:Pgchar; first:Pgchar; args:array of const):PGstElement;cdecl;external gstreamerlib;
function gst_element_factory_make_full(factoryname:Pgchar; first:Pgchar):PGstElement;cdecl;external gstreamerlib;
function gst_element_factory_make_valist(factoryname:Pgchar; first:Pgchar; properties:Tva_list):PGstElement;cdecl;external gstreamerlib;
function gst_element_factory_make_with_properties(factoryname:Pgchar; n:Tguint; names:PPgchar; values:PGValue):PGstElement;cdecl;external gstreamerlib;
function gst_element_register(plugin:PGstPlugin; name:Pgchar; rank:Tguint; _type:TGType):Tgboolean;cdecl;external gstreamerlib;
procedure gst_element_type_set_skip_documentation(_type:TGType);cdecl;external gstreamerlib;
function gst_element_factory_get_skip_documentation(factory:PGstElementFactory):Tgboolean;cdecl;external gstreamerlib;

type
  PGstElementFactoryListType = ^TGstElementFactoryListType;
  TGstElementFactoryListType = Tguint64;

function GST_ELEMENT_FACTORY_TYPE_DECODER : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_ENCODER : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_SINK : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_SRC : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_MUXER : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_DEMUXER : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_PARSER : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_PAYLOADER : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_DEPAYLOADER : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_FORMATTER : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_DECRYPTOR : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_ENCRYPTOR : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_HARDWARE : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_TIMESTAMPER : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_MAX_ELEMENTS : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_MEDIA_VIDEO : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_MEDIA_AUDIO : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_MEDIA_IMAGE : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_MEDIA_SUBTITLE : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_MEDIA_METADATA : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_ANY : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_MEDIA_ANY : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_VIDEO_ENCODER : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_AUDIO_ENCODER : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_AUDIOVIDEO_SINKS : TGstElementFactoryListType;
function GST_ELEMENT_FACTORY_TYPE_DECODABLE : TGstElementFactoryListType;

const
  GST_ELEMENT_FACTORY_KLASS_DECODER = 'Decoder';  
  GST_ELEMENT_FACTORY_KLASS_ENCODER = 'Encoder';  
  GST_ELEMENT_FACTORY_KLASS_SINK = 'Sink';  
  GST_ELEMENT_FACTORY_KLASS_SRC = 'Source';  
  GST_ELEMENT_FACTORY_KLASS_MUXER = 'Muxer';  
  GST_ELEMENT_FACTORY_KLASS_DEMUXER = 'Demuxer';  
  GST_ELEMENT_FACTORY_KLASS_PARSER = 'Parser';  
  GST_ELEMENT_FACTORY_KLASS_PAYLOADER = 'Payloader';  
  GST_ELEMENT_FACTORY_KLASS_DEPAYLOADER = 'Depayloader';  
  GST_ELEMENT_FACTORY_KLASS_FORMATTER = 'Formatter';  
  GST_ELEMENT_FACTORY_KLASS_DECRYPTOR = 'Decryptor';  
  GST_ELEMENT_FACTORY_KLASS_ENCRYPTOR = 'Encryptor';  
  GST_ELEMENT_FACTORY_KLASS_MEDIA_VIDEO = 'Video';  
  GST_ELEMENT_FACTORY_KLASS_MEDIA_AUDIO = 'Audio';  
  GST_ELEMENT_FACTORY_KLASS_MEDIA_IMAGE = 'Image';  
  GST_ELEMENT_FACTORY_KLASS_MEDIA_SUBTITLE = 'Subtitle';  
  GST_ELEMENT_FACTORY_KLASS_MEDIA_METADATA = 'Metadata';  
  GST_ELEMENT_FACTORY_KLASS_HARDWARE = 'Hardware';

function gst_element_factory_list_is_type(factory:PGstElementFactory; _type:TGstElementFactoryListType):Tgboolean;cdecl;external gstreamerlib;
function gst_element_factory_list_get_elements(_type:TGstElementFactoryListType; minrank:TGstRank):PGList;cdecl;external gstreamerlib;
function gst_element_factory_list_filter(list:PGList; caps:PGstCaps; direction:TGstPadDirection; subsetonly:Tgboolean):PGList;cdecl;external gstreamerlib;

function GST_ELEMENT_FACTORY_CAST(obj : Pointer) : PGstElementFactory;

// === Konventiert am: 15-9-24 15:53:10 ===

function GST_TYPE_ELEMENT_FACTORY : TGType;
function GST_ELEMENT_FACTORY(obj : Pointer) : PGstElementFactory;
function GST_ELEMENT_FACTORY_CLASS(klass : Pointer) : PGstElementFactoryClass;
function GST_IS_ELEMENT_FACTORY(obj : Pointer) : Tgboolean;
function GST_IS_ELEMENT_FACTORY_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_ELEMENT_FACTORY : TGType;
  begin
    GST_TYPE_ELEMENT_FACTORY:=gst_element_factory_get_type;
  end;

function GST_ELEMENT_FACTORY(obj : Pointer) : PGstElementFactory;
begin
  Result := PGstElementFactory(g_type_check_instance_cast(obj, GST_TYPE_ELEMENT_FACTORY));
end;

function GST_ELEMENT_FACTORY_CLASS(klass : Pointer) : PGstElementFactoryClass;
begin
  Result := PGstElementFactoryClass(g_type_check_class_cast(klass, GST_TYPE_ELEMENT_FACTORY));
end;

function GST_IS_ELEMENT_FACTORY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_ELEMENT_FACTORY);
end;

function GST_IS_ELEMENT_FACTORY_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_ELEMENT_FACTORY);
end;

// ====

function GST_ELEMENT_FACTORY_CAST(obj: Pointer): PGstElementFactory;
begin
  GST_ELEMENT_FACTORY_CAST:=PGstElementFactory(obj);
end;

type
  G_GUINT64_CONSTANT=culong;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_DECODER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_DECODER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 0);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_ENCODER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_ENCODER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 1);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_SINK : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_SINK:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 2);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_SRC : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_SRC:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 3);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MUXER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MUXER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 4);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_DEMUXER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_DEMUXER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 5);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_PARSER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_PARSER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 6);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_PAYLOADER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_PAYLOADER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 7);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_DEPAYLOADER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_DEPAYLOADER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 8);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_FORMATTER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_FORMATTER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 9);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_DECRYPTOR : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_DECRYPTOR:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 10);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_ENCRYPTOR : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_ENCRYPTOR:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 11);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_HARDWARE : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_HARDWARE:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 12);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_TIMESTAMPER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_TIMESTAMPER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 13);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MAX_ELEMENTS : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MAX_ELEMENTS:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 48);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_VIDEO : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MEDIA_VIDEO:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 49);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_AUDIO : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MEDIA_AUDIO:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 50);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_IMAGE : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MEDIA_IMAGE:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 51);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_SUBTITLE : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MEDIA_SUBTITLE:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 52);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_METADATA : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MEDIA_METADATA:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 53);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_ANY : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_ANY:=TGstElementFactoryListType(((G_GUINT64_CONSTANT(1)) shl 49)-1);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_ANY : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MEDIA_ANY:=TGstElementFactoryListType(( not (G_GUINT64_CONSTANT(0))) shl 48);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_VIDEO_ENCODER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_VIDEO_ENCODER:=TGstElementFactoryListType((GST_ELEMENT_FACTORY_TYPE_ENCODER or GST_ELEMENT_FACTORY_TYPE_MEDIA_VIDEO) or GST_ELEMENT_FACTORY_TYPE_MEDIA_IMAGE);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_AUDIO_ENCODER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_AUDIO_ENCODER:=TGstElementFactoryListType(GST_ELEMENT_FACTORY_TYPE_ENCODER or GST_ELEMENT_FACTORY_TYPE_MEDIA_AUDIO);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_AUDIOVIDEO_SINKS : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_AUDIOVIDEO_SINKS:=TGstElementFactoryListType(((GST_ELEMENT_FACTORY_TYPE_SINK or GST_ELEMENT_FACTORY_TYPE_MEDIA_AUDIO) or GST_ELEMENT_FACTORY_TYPE_MEDIA_VIDEO) or GST_ELEMENT_FACTORY_TYPE_MEDIA_IMAGE);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_DECODABLE : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_DECODABLE:=TGstElementFactoryListType((((GST_ELEMENT_FACTORY_TYPE_DECODER or GST_ELEMENT_FACTORY_TYPE_DEMUXER) or GST_ELEMENT_FACTORY_TYPE_DEPAYLOADER) or GST_ELEMENT_FACTORY_TYPE_PARSER) or GST_ELEMENT_FACTORY_TYPE_DECRYPTOR);
  end;


end.
