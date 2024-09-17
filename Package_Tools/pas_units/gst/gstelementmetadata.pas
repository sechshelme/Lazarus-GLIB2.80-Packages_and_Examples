unit gstelementmetadata;

interface

uses
  glib280, common_GST, gstobject;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  GST_ELEMENT_METADATA_LONGNAME = 'long-name';
  GST_ELEMENT_METADATA_KLASS = 'klass';
  GST_ELEMENT_METADATA_DESCRIPTION = 'description';
  GST_ELEMENT_METADATA_AUTHOR = 'author';
  GST_ELEMENT_METADATA_DOC_URI = 'doc-uri';
  GST_ELEMENT_METADATA_ICON_NAME = 'icon-name';

  // === Konventiert am: 17-9-24 19:29:35 ===


implementation



end.
