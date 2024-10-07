/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 06-10-2024   17:58                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstMpegtsHdmvStreamType = ^TGstMpegtsHdmvStreamType;
  TGstMpegtsHdmvStreamType = longint;

const
  GST_MPEGTS_STREAM_TYPE_HDMV_AUDIO_LPCM = $80;
  GST_MPEGTS_STREAM_TYPE_HDMV_AUDIO_AC3 = $81;
  GST_MPEGTS_STREAM_TYPE_HDMV_AUDIO_DTS = $82;
  GST_MPEGTS_STREAM_TYPE_HDMV_AUDIO_AC3_TRUE_HD = $83;
  GST_MPEGTS_STREAM_TYPE_HDMV_AUDIO_AC3_PLUS = $84;
  GST_MPEGTS_STREAM_TYPE_HDMV_AUDIO_DTS_HD = $85;
  GST_MPEGTS_STREAM_TYPE_HDMV_AUDIO_DTS_HD_MASTER_AUDIO = $86;
  GST_MPEGTS_STREAM_TYPE_HDMV_AUDIO_EAC3 = $87;
  GST_MPEGTS_STREAM_TYPE_HDMV_SUBPICTURE_PGS = $90;
  GST_MPEGTS_STREAM_TYPE_HDMV_IGS = $91;
  GST_MPEGTS_STREAM_TYPE_HDMV_SUBTITLE = $92;
  GST_MPEGTS_STREAM_TYPE_HDMV_AUDIO_AC3_PLUS_SECONDARY = $a1;
  GST_MPEGTS_STREAM_TYPE_HDMV_AUDIO_DTS_HD_SECONDARY = $a2;

  // === Konventiert am: 6-10-24 16:39:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}