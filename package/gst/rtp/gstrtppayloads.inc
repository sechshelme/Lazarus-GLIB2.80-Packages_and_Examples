/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 07-10-2024   16:40                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstRTPPayload = ^TGstRTPPayload;
  TGstRTPPayload = longint;

const
  GST_RTP_PAYLOAD_PCMU = 0;
  GST_RTP_PAYLOAD_1016 = 1;
  GST_RTP_PAYLOAD_G721 = 2;
  GST_RTP_PAYLOAD_GSM = 3;
  GST_RTP_PAYLOAD_G723 = 4;
  GST_RTP_PAYLOAD_DVI4_8000 = 5;
  GST_RTP_PAYLOAD_DVI4_16000 = 6;
  GST_RTP_PAYLOAD_LPC = 7;
  GST_RTP_PAYLOAD_PCMA = 8;
  GST_RTP_PAYLOAD_G722 = 9;
  GST_RTP_PAYLOAD_L16_STEREO = 10;
  GST_RTP_PAYLOAD_L16_MONO = 11;
  GST_RTP_PAYLOAD_QCELP = 12;
  GST_RTP_PAYLOAD_CN = 13;
  GST_RTP_PAYLOAD_MPA = 14;
  GST_RTP_PAYLOAD_G728 = 15;
  GST_RTP_PAYLOAD_DVI4_11025 = 16;
  GST_RTP_PAYLOAD_DVI4_22050 = 17;
  GST_RTP_PAYLOAD_G729 = 18;
  GST_RTP_PAYLOAD_CELLB = 25;
  GST_RTP_PAYLOAD_JPEG = 26;
  GST_RTP_PAYLOAD_NV = 28;
  GST_RTP_PAYLOAD_H261 = 31;
  GST_RTP_PAYLOAD_MPV = 32;
  GST_RTP_PAYLOAD_MP2T = 33;
  GST_RTP_PAYLOAD_H263 = 34;

const
  GST_RTP_PAYLOAD_G723_63 = 16;
  GST_RTP_PAYLOAD_G723_53 = 17;
  GST_RTP_PAYLOAD_TS48 = 18;
  GST_RTP_PAYLOAD_TS41 = 19;
  GST_RTP_PAYLOAD_G723_63_STRING = '16';
  GST_RTP_PAYLOAD_G723_53_STRING = '17';
  GST_RTP_PAYLOAD_TS48_STRING = '18';
  GST_RTP_PAYLOAD_TS41_STRING = '19';
  GST_RTP_PAYLOAD_PCMU_STRING = '0';
  GST_RTP_PAYLOAD_1016_STRING = '1';
  GST_RTP_PAYLOAD_G721_STRING = '2';
  GST_RTP_PAYLOAD_GSM_STRING = '3';
  GST_RTP_PAYLOAD_G723_STRING = '4';
  GST_RTP_PAYLOAD_DVI4_8000_STRING = '5';
  GST_RTP_PAYLOAD_DVI4_16000_STRING = '6';
  GST_RTP_PAYLOAD_LPC_STRING = '7';
  GST_RTP_PAYLOAD_PCMA_STRING = '8';
  GST_RTP_PAYLOAD_G722_STRING = '9';
  GST_RTP_PAYLOAD_L16_STEREO_STRING = '10';
  GST_RTP_PAYLOAD_L16_MONO_STRING = '11';
  GST_RTP_PAYLOAD_QCELP_STRING = '12';
  GST_RTP_PAYLOAD_CN_STRING = '13';
  GST_RTP_PAYLOAD_MPA_STRING = '14';
  GST_RTP_PAYLOAD_G728_STRING = '15';
  GST_RTP_PAYLOAD_DVI4_11025_STRING = '16';
  GST_RTP_PAYLOAD_DVI4_22050_STRING = '17';
  GST_RTP_PAYLOAD_G729_STRING = '18';
  GST_RTP_PAYLOAD_CELLB_STRING = '25';
  GST_RTP_PAYLOAD_JPEG_STRING = '26';
  GST_RTP_PAYLOAD_NV_STRING = '28';
  GST_RTP_PAYLOAD_H261_STRING = '31';
  GST_RTP_PAYLOAD_MPV_STRING = '32';
  GST_RTP_PAYLOAD_MP2T_STRING = '33';
  GST_RTP_PAYLOAD_H263_STRING = '34';
  GST_RTP_PAYLOAD_DYNAMIC_STRING = '[96, 127]';

type
  TGstRTPPayloadInfo = record
    payload_type: Tguint8;
    media: Pgchar;
    encoding_name: Pgchar;
    clock_rate: Tguint;
    encoding_parameters: Pgchar;
    bitrate: Tguint;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstRTPPayloadInfo = ^TGstRTPPayloadInfo;


function gst_rtp_payload_info_for_pt(payload_type: Tguint8): PGstRTPPayloadInfo; cdecl; external libgstrtp;
function gst_rtp_payload_info_for_name(media: Pgchar; encoding_name: Pgchar): PGstRTPPayloadInfo; cdecl; external libgstrtp;

function GST_RTP_PAYLOAD_IS_DYNAMIC(pt: Tguint8): Tgboolean;

// === Konventiert am: 7-10-24 16:10:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_RTP_PAYLOAD_IS_DYNAMIC(pt: Tguint8): Tgboolean;
begin
  GST_RTP_PAYLOAD_IS_DYNAMIC := (pt >= 96) and (pt <= 127);
end;


{$ENDIF read_implementation}