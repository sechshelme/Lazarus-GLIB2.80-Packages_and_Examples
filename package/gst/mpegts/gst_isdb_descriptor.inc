/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 06-10-2024   17:58                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstMpegtsISDBDescriptorType = ^TGstMpegtsISDBDescriptorType;
  TGstMpegtsISDBDescriptorType = longint;

const
  GST_MTS_DESC_ISDB_HIERARCHICAL_TRANSMISSION = $C0;
  GST_MTS_DESC_ISDB_DIGITAL_COPY_CONTROL = $C1;
  GST_MTS_DESC_ISDB_NETWORK_IDENTIFICATION = $C2;
  GST_MTS_DESC_ISDB_PARTIAL_TS_TIME = $c3;
  GST_MTS_DESC_ISDB_AUDIO_COMPONENT = $c4;
  GST_MTS_DESC_ISDB_HYPERLINK = $c5;
  GST_MTS_DESC_ISDB_TARGET_REGION = $c6;
  GST_MTS_DESC_ISDB_DATA_CONTENT = $c7;
  GST_MTS_DESC_ISDB_VIDEO_DECODE_CONTROL = $c8;
  GST_MTS_DESC_ISDB_DOWNLOAD_CONTENT = $c9;
  GST_MTS_DESC_ISDB_CA_EMM_TS = $ca;
  GST_MTS_DESC_ISDB_CA_CONTRACT_INFORMATION = $cb;
  GST_MTS_DESC_ISDB_CA_SERVICE = $cc;
  GST_MTS_DESC_ISDB_TS_INFORMATION = $cd;
  GST_MTS_DESC_ISDB_EXTENDED_BROADCASTER = $ce;
  GST_MTS_DESC_ISDB_LOGO_TRANSMISSION = $cf;
  GST_MTS_DESC_ISDB_BASIC_LOCAL_EVENT = $d0;
  GST_MTS_DESC_ISDB_REFERENCE = $d1;
  GST_MTS_DESC_ISDB_NODE_RELATION = $d2;
  GST_MTS_DESC_ISDB_SHORT_NODE_INFORMATION = $d3;
  GST_MTS_DESC_ISDB_STC_REFERENCE = $d4;
  GST_MTS_DESC_ISDB_SERIES = $d5;
  GST_MTS_DESC_ISDB_EVENT_GROUP = $d6;
  GST_MTS_DESC_ISDB_SI_PARAMETER = $d7;
  GST_MTS_DESC_ISDB_BROADCASTER_NAME = $d8;
  GST_MTS_DESC_ISDB_COMPONENT_GROUP = $d9;
  GST_MTS_DESC_ISDB_SI_PRIME_TS = $da;
  GST_MTS_DESC_ISDB_BOARD_INFORMATION = $db;
  GST_MTS_DESC_ISDB_LDT_LINKAGE = $dc;
  GST_MTS_DESC_ISDB_CONNECTED_TRANSMISSION = $dd;
  GST_MTS_DESC_ISDB_CONTENT_AVAILABILITY = $de;
  GST_MTS_DESC_ISDB_SERVICE_GROUP = $e0;

  // === Konventiert am: 6-10-24 16:39:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}