
unit gstmikey;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstmikey.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstmikey.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PGArray  = ^GArray;
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGError  = ^GError;
PGstCaps  = ^GstCaps;
PGstMIKEYCacheType  = ^GstMIKEYCacheType;
PGstMIKEYDecryptInfo  = ^GstMIKEYDecryptInfo;
PGstMIKEYEncAlg  = ^GstMIKEYEncAlg;
PGstMIKEYEncryptInfo  = ^GstMIKEYEncryptInfo;
PGstMIKEYKeyDataType  = ^GstMIKEYKeyDataType;
PGstMIKEYKVType  = ^GstMIKEYKVType;
PGstMIKEYMacAlg  = ^GstMIKEYMacAlg;
PGstMIKEYMapSRTP  = ^GstMIKEYMapSRTP;
PGstMIKEYMapType  = ^GstMIKEYMapType;
PGstMIKEYMessage  = ^GstMIKEYMessage;
PGstMIKEYPayload  = ^GstMIKEYPayload;
PGstMIKEYPayloadKEMAC  = ^GstMIKEYPayloadKEMAC;
PGstMIKEYPayloadKeyData  = ^GstMIKEYPayloadKeyData;
PGstMIKEYPayloadPKE  = ^GstMIKEYPayloadPKE;
PGstMIKEYPayloadRAND  = ^GstMIKEYPayloadRAND;
PGstMIKEYPayloadSP  = ^GstMIKEYPayloadSP;
PGstMIKEYPayloadSPParam  = ^GstMIKEYPayloadSPParam;
PGstMIKEYPayloadT  = ^GstMIKEYPayloadT;
PGstMIKEYPayloadType  = ^GstMIKEYPayloadType;
PGstMIKEYPRFFunc  = ^GstMIKEYPRFFunc;
PGstMIKEYSecProto  = ^GstMIKEYSecProto;
PGstMIKEYSecSRTP  = ^GstMIKEYSecSRTP;
PGstMIKEYTSType  = ^GstMIKEYTSType;
PGstMIKEYType  = ^GstMIKEYType;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2014> Wim Taymans <wim.taymans@gmail.com>
 *
 * gstmikey.h: various helper functions to manipulate mikey messages
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_MIKEY_H__}
{$define __GST_MIKEY_H__}
{$include <gst/gst.h>}
{$include <gst/sdp/sdp-prelude.h>}

function gst_mikey_message_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_MIKEY_MESSAGE : longint; { return type might be wrong }

type
{*
 * GST_MIKEY_VERSION:
 *
 * The supported MIKEY version 1.
  }

const
  GST_MIKEY_VERSION = 1;  
{*
 * GstMIKEYType:
 * @GST_MIKEY_TYPE_INVALID: Invalid type
 * @GST_MIKEY_TYPE_PSK_INIT: Initiator's pre-shared key message
 * @GST_MIKEY_TYPE_PSK_VERIFY: Verification message of a Pre-shared key message
 * @GST_MIKEY_TYPE_PK_INIT: Initiator's public-key transport message
 * @GST_MIKEY_TYPE_PK_VERIFY: Verification message of a public-key message
 * @GST_MIKEY_TYPE_DH_INIT: Initiator's DH exchange message
 * @GST_MIKEY_TYPE_DH_RESP: Responder's DH exchange message
 * @GST_MIKEY_TYPE_ERROR: Error message
 *
 * Different MIKEY data types.
  }
type
  PGstMIKEYType = ^TGstMIKEYType;
  TGstMIKEYType =  Longint;
  Const
    GST_MIKEY_TYPE_INVALID = -(1);
    GST_MIKEY_TYPE_PSK_INIT = 0;
    GST_MIKEY_TYPE_PSK_VERIFY = 1;
    GST_MIKEY_TYPE_PK_INIT = 2;
    GST_MIKEY_TYPE_PK_VERIFY = 3;
    GST_MIKEY_TYPE_DH_INIT = 4;
    GST_MIKEY_TYPE_DH_RESP = 5;
    GST_MIKEY_TYPE_ERROR = 6;
;
{*
 * GstMIKEYPayloadType:
 * @GST_MIKEY_PT_LAST: Last payload
 * @GST_MIKEY_PT_KEMAC: Key data transport payload
 * @GST_MIKEY_PT_PKE: Envelope data payload
 * @GST_MIKEY_PT_DH: DH data payload
 * @GST_MIKEY_PT_SIGN: Signature payload
 * @GST_MIKEY_PT_T: Timestamp payload
 * @GST_MIKEY_PT_ID: ID payload
 * @GST_MIKEY_PT_CERT: Certificate Payload
 * @GST_MIKEY_PT_CHASH: Cert hash payload
 * @GST_MIKEY_PT_V: Verification message payload
 * @GST_MIKEY_PT_SP: Security Policy payload
 * @GST_MIKEY_PT_RAND: RAND payload
 * @GST_MIKEY_PT_ERR: Error payload
 * @GST_MIKEY_PT_KEY_DATA: Key data sub-payload
 * @GST_MIKEY_PT_GEN_EXT: General Extension Payload

 * Different MIKEY Payload types.
  }
type
  PGstMIKEYPayloadType = ^TGstMIKEYPayloadType;
  TGstMIKEYPayloadType =  Longint;
  Const
    GST_MIKEY_PT_LAST = 0;
    GST_MIKEY_PT_KEMAC = 1;
    GST_MIKEY_PT_PKE = 2;
    GST_MIKEY_PT_DH = 3;
    GST_MIKEY_PT_SIGN = 4;
    GST_MIKEY_PT_T = 5;
    GST_MIKEY_PT_ID = 6;
    GST_MIKEY_PT_CERT = 7;
    GST_MIKEY_PT_CHASH = 8;
    GST_MIKEY_PT_V = 9;
    GST_MIKEY_PT_SP = 10;
    GST_MIKEY_PT_RAND = 11;
    GST_MIKEY_PT_ERR = 12;
    GST_MIKEY_PT_KEY_DATA = 20;
    GST_MIKEY_PT_GEN_EXT = 21;
;
{*
 * GstMIKEYPRFFunc:
 * @GST_MIKEY_PRF_MIKEY_1: MIKEY-1 PRF function
 *
 * The PRF function that has been/will be used for key derivation
  }
type
  PGstMIKEYPRFFunc = ^TGstMIKEYPRFFunc;
  TGstMIKEYPRFFunc =  Longint;
  Const
    GST_MIKEY_PRF_MIKEY_1 = 0;
;
{*
 * GstMIKEYMapType:
 * @GST_MIKEY_MAP_TYPE_SRTP: SRTP
 *
 * Specifies the method of uniquely mapping Crypto Sessions to the security
 * protocol sessions.
  }
type
  PGstMIKEYMapType = ^TGstMIKEYMapType;
  TGstMIKEYMapType =  Longint;
  Const
    GST_MIKEY_MAP_TYPE_SRTP = 0;
;
{*
 * GstMIKEYMapSRTP:
 * @policy: The security policy applied for the stream with @ssrc
 * @ssrc: the SSRC that must be used for the stream
 * @roc: current rollover counter
 *
 * The Security policy Map item for SRTP
  }
type
  PGstMIKEYMapSRTP = ^TGstMIKEYMapSRTP;
  TGstMIKEYMapSRTP = record
      policy : Tguint8;
      ssrc : Tguint32;
      roc : Tguint32;
    end;

function gst_mikey_payload_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_MIKEY_PAYLOAD : longint; { return type might be wrong }

{*
 * GstMIKEYPayload:
 * @type: the payload type
 * @len: length of the payload
 *
 * Hold the common fields for all payloads
  }
{ < private >  }
{ < public >  }
type
  PGstMIKEYPayload = ^TGstMIKEYPayload;
  TGstMIKEYPayload = record
      mini_object : TGstMiniObject;
      _type : TGstMIKEYPayloadType;
      len : Tguint;
    end;


function gst_mikey_payload_new(_type:TGstMIKEYPayloadType):PGstMIKEYPayload;cdecl;external;
{*
 * gst_mikey_payload_ref:
 * @payload: The payload to refcount
 *
 * Increase the refcount of this payload.
 *
 * Returns: (transfer full): @payload (for convenience when doing assignments)
 *
 * Since: 1.4
  }
{ xxxxxxxxxxxxxxxxx }
{static inline GstMIKEYPayload * }
{gst_mikey_payload_ref (GstMIKEYPayload * payload) }
{ }
{  return (GstMIKEYPayload *) gst_mini_object_ref (GST_MINI_OBJECT_CAST (payload)); }
{ }
{*
 * gst_mikey_payload_unref:
 * @payload: (transfer full): the payload to refcount
 *
 * Decrease the refcount of an payload, freeing it if the refcount reaches 0.
 *
 * Since: 1.4
  }
{static inline void }
{gst_mikey_payload_unref (GstMIKEYPayload * payload) }
{ }
{  gst_mini_object_unref (GST_MINI_OBJECT_CAST (payload)); }
{ }
{*
 * gst_mikey_payload_copy:
 * @payload: a #GstMIKEYPayload.
 *
 * Create a copy of the given payload.
 *
 * Returns: (transfer full): a new copy of @payload.
 *
 * Since: 1.4
  }
{static inline GstMIKEYPayload * }
{gst_mikey_payload_copy (const GstMIKEYPayload * payload) }
{ }
{  return (GstMIKEYPayload *) gst_mini_object_copy (GST_MINI_OBJECT_CONST_CAST (payload)); }
{ }
{*
 * GstMIKEYEncAlg:
 * @GST_MIKEY_ENC_NULL: no encryption
 * @GST_MIKEY_ENC_AES_CM_128: AES-CM using a 128-bit key
 * @GST_MIKEY_ENC_AES_KW_128: AES Key Wrap using a 128-bit key
 * @GST_MIKEY_ENC_AES_GCM_128: AES-GCM using a 128-bit key (Since: 1.16)
 *
 * The encryption algorithm used to encrypt the Encr data field
  }
type
  PGstMIKEYEncAlg = ^TGstMIKEYEncAlg;
  TGstMIKEYEncAlg =  Longint;
  Const
    GST_MIKEY_ENC_NULL = 0;
    GST_MIKEY_ENC_AES_CM_128 = 1;
    GST_MIKEY_ENC_AES_KW_128 = 2;
    GST_MIKEY_ENC_AES_GCM_128 = 6;
;
{*
 * GstMIKEYMacAlg:
 * @GST_MIKEY_MAC_NULL: no authentication
 * @GST_MIKEY_MAC_HMAC_SHA_1_160: HMAC-SHA-1-160
 *
 * Specifies the authentication algorithm used
  }
type
  PGstMIKEYMacAlg = ^TGstMIKEYMacAlg;
  TGstMIKEYMacAlg =  Longint;
  Const
    GST_MIKEY_MAC_NULL = 0;
    GST_MIKEY_MAC_HMAC_SHA_1_160 = 1;
;
{*
 * GstMIKEYPayloadKEMAC:
 * @pt: the common #GstMIKEYPayload
 * @enc_alg: the #GstMIKEYEncAlg
 * @mac_alg: the #GstMIKEYMacAlg
 * @subpayloads: the subpayloads
 *
 * A structure holding the KEMAC payload
  }
type
  PGstMIKEYPayloadKEMAC = ^TGstMIKEYPayloadKEMAC;
  TGstMIKEYPayloadKEMAC = record
      pt : TGstMIKEYPayload;
      enc_alg : TGstMIKEYEncAlg;
      mac_alg : TGstMIKEYMacAlg;
      subpayloads : PGArray;
    end;

function gst_mikey_payload_kemac_set(payload:PGstMIKEYPayload; enc_alg:TGstMIKEYEncAlg; mac_alg:TGstMIKEYMacAlg):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mikey_payload_kemac_get_n_sub(payload:PGstMIKEYPayload):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_mikey_payload_kemac_get_sub(payload:PGstMIKEYPayload; idx:Tguint):PGstMIKEYPayload;cdecl;external;
function gst_mikey_payload_kemac_remove_sub(payload:PGstMIKEYPayload; idx:Tguint):Tgboolean;cdecl;external;
function gst_mikey_payload_kemac_add_sub(payload:PGstMIKEYPayload; newpay:PGstMIKEYPayload):Tgboolean;cdecl;external;
{*
 * GstMIKEYCacheType:
 * @GST_MIKEY_CACHE_NONE: The envelope key MUST NOT be cached
 * @GST_MIKEY_CACHE_ALWAYS: The envelope key MUST be cached
 * @GST_MIKEY_CACHE_FOR_CSB: The envelope key MUST be cached, but only
 *                           to be used for the specific CSB.
 *
 * The different cache types
  }
type
  PGstMIKEYCacheType = ^TGstMIKEYCacheType;
  TGstMIKEYCacheType =  Longint;
  Const
    GST_MIKEY_CACHE_NONE = 0;
    GST_MIKEY_CACHE_ALWAYS = 1;
    GST_MIKEY_CACHE_FOR_CSB = 2;
;
{*
 * GstMIKEYPayloadPKE:
 * @pt: the common #GstMIKEYPayload
 * @C: envelope key cache indicator
 * @data_len: length of @data
 * @data: the encrypted envelope key
 *
 * The Envelope data payload contains the encrypted envelope key that is
 * used in the public-key transport to protect the data in the Key data
 * transport payload.  The encryption algorithm used is implicit from
 * the certificate/public key used.
  }
type
  PGstMIKEYPayloadPKE = ^TGstMIKEYPayloadPKE;
  TGstMIKEYPayloadPKE = record
      pt : TGstMIKEYPayload;
      C : TGstMIKEYCacheType;
      data_len : Tguint16;
      data : Pguint8;
    end;
(* Const before type ignored *)

function gst_mikey_payload_pke_set(payload:PGstMIKEYPayload; C:TGstMIKEYCacheType; data_len:Tguint16; data:Pguint8):Tgboolean;cdecl;external;
{*
 * GstMIKEYTSType:
 * @GST_MIKEY_TS_TYPE_NTP_UTC: an NTP time in UTC timezone
 * @GST_MIKEY_TS_TYPE_NTP: an NTP time
 * @GST_MIKEY_TS_TYPE_COUNTER: a counter
 *
 * Specifies the timestamp type.
  }
type
  PGstMIKEYTSType = ^TGstMIKEYTSType;
  TGstMIKEYTSType =  Longint;
  Const
    GST_MIKEY_TS_TYPE_NTP_UTC = 0;
    GST_MIKEY_TS_TYPE_NTP = 1;
    GST_MIKEY_TS_TYPE_COUNTER = 2;
;
{*
 * GstMIKEYPayloadT:
 * @pt: the payload header
 * @type: a #GstMIKEYTSType
 * @ts_value: the timestamp value
 *
 * The timestamp payload carries the timestamp information
  }
type
  PGstMIKEYPayloadT = ^TGstMIKEYPayloadT;
  TGstMIKEYPayloadT = record
      pt : TGstMIKEYPayload;
      _type : TGstMIKEYTSType;
      ts_value : Pguint8;
    end;
(* Const before type ignored *)

function gst_mikey_payload_t_set(payload:PGstMIKEYPayload; _type:TGstMIKEYTSType; ts_value:Pguint8):Tgboolean;cdecl;external;
{*
 * GstMIKEYPayloadSPParam:
 * @type: specifies the type of the parameter
 * @len: specifies the length of @val
 * @val: specifies the value of the parameter
 *
 * A Type/Length/Value field for security parameters
  }
type
  PGstMIKEYPayloadSPParam = ^TGstMIKEYPayloadSPParam;
  TGstMIKEYPayloadSPParam = record
      _type : Tguint8;
      len : Tguint8;
      val : Pguint8;
    end;
{*
 * GstMIKEYSecProto:
 * @GST_MIKEY_SEC_PROTO_SRTP: SRTP
 *
 * Specifies the security protocol
  }

  PGstMIKEYSecProto = ^TGstMIKEYSecProto;
  TGstMIKEYSecProto =  Longint;
  Const
    GST_MIKEY_SEC_PROTO_SRTP = 0;
;
{*
 * GstMIKEYSecSRTP:
 * @GST_MIKEY_SP_SRTP_ENC_ALG: Encryption algorithm
 * @GST_MIKEY_SP_SRTP_ENC_KEY_LEN: Session Encr. key length
 * @GST_MIKEY_SP_SRTP_AUTH_ALG: Authentication algorithm
 * @GST_MIKEY_SP_SRTP_AUTH_KEY_LEN: Session Auth. key length
 * @GST_MIKEY_SP_SRTP_SALT_KEY_LEN: Session Salt key length
 * @GST_MIKEY_SP_SRTP_PRF: SRTP Pseudo Random Function
 * @GST_MIKEY_SP_SRTP_KEY_DERIV_RATE: Key derivation rate
 * @GST_MIKEY_SP_SRTP_SRTP_ENC: SRTP encryption off/on, 0 if off, 1 if on
 * @GST_MIKEY_SP_SRTP_SRTCP_ENC: SRTCP encryption off/on, 0 if off, 1 if on
 * @GST_MIKEY_SP_SRTP_FEC_ORDER: sender's FEC order
 * @GST_MIKEY_SP_SRTP_SRTP_AUTH: SRTP authentication off/on, 0 if off, 1 if on
 * @GST_MIKEY_SP_SRTP_AUTH_TAG_LEN: Authentication tag length
 * @GST_MIKEY_SP_SRTP_SRTP_PREFIX_LEN: SRTP prefix length
 * @GST_MIKEY_SP_SRTP_AEAD_AUTH_TAG_LEN: AEAD authentication tag length (Since: 1.16)
 *
 * This policy specifies the parameters for SRTP and SRTCP
  }
type
  PGstMIKEYSecSRTP = ^TGstMIKEYSecSRTP;
  TGstMIKEYSecSRTP =  Longint;
  Const
    GST_MIKEY_SP_SRTP_ENC_ALG = 0;
    GST_MIKEY_SP_SRTP_ENC_KEY_LEN = 1;
    GST_MIKEY_SP_SRTP_AUTH_ALG = 2;
    GST_MIKEY_SP_SRTP_AUTH_KEY_LEN = 3;
    GST_MIKEY_SP_SRTP_SALT_KEY_LEN = 4;
    GST_MIKEY_SP_SRTP_PRF = 5;
    GST_MIKEY_SP_SRTP_KEY_DERIV_RATE = 6;
    GST_MIKEY_SP_SRTP_SRTP_ENC = 7;
    GST_MIKEY_SP_SRTP_SRTCP_ENC = 8;
    GST_MIKEY_SP_SRTP_FEC_ORDER = 9;
    GST_MIKEY_SP_SRTP_SRTP_AUTH = 10;
    GST_MIKEY_SP_SRTP_AUTH_TAG_LEN = 11;
    GST_MIKEY_SP_SRTP_SRTP_PREFIX_LEN = 12;
    GST_MIKEY_SP_SRTP_AEAD_AUTH_TAG_LEN = 20;
;
{*
 * GstMIKEYPayloadSP:
 * @pt: the payload header
 * @policy: the policy number
 * @proto: the security protocol
 * @params: array of #GstMIKEYPayloadSPParam
 *
 * The Security Policy payload defines a set of policies that apply to a
 * specific security protocol
  }
type
  PGstMIKEYPayloadSP = ^TGstMIKEYPayloadSP;
  TGstMIKEYPayloadSP = record
      pt : TGstMIKEYPayload;
      policy : Tguint;
      proto : TGstMIKEYSecProto;
      params : PGArray;
    end;

function gst_mikey_payload_sp_set(payload:PGstMIKEYPayload; policy:Tguint; proto:TGstMIKEYSecProto):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mikey_payload_sp_get_n_params(payload:PGstMIKEYPayload):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_mikey_payload_sp_get_param(payload:PGstMIKEYPayload; idx:Tguint):PGstMIKEYPayloadSPParam;cdecl;external;
function gst_mikey_payload_sp_remove_param(payload:PGstMIKEYPayload; idx:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mikey_payload_sp_add_param(payload:PGstMIKEYPayload; _type:Tguint8; len:Tguint8; val:Pguint8):Tgboolean;cdecl;external;
{*
 * GstMIKEYPayloadRAND:
 * @pt: the payload header
 * @len: the length of @rand
 * @rand: random values
 *
 * The RAND payload consists of a (pseudo-)random bit-string
  }
type
  PGstMIKEYPayloadRAND = ^TGstMIKEYPayloadRAND;
  TGstMIKEYPayloadRAND = record
      pt : TGstMIKEYPayload;
      len : Tguint8;
      rand : Pguint8;
    end;
(* Const before type ignored *)

function gst_mikey_payload_rand_set(payload:PGstMIKEYPayload; len:Tguint8; rand:Pguint8):Tgboolean;cdecl;external;
{*
 * GstMIKEYKeyDataType:
 * @GST_MIKEY_KD_TGK: a TEK Generation Key
 * @GST_MIKEY_KD_TEK: Traffic-Encrypting Key
 *
 * The type of key.
  }
type
  PGstMIKEYKeyDataType = ^TGstMIKEYKeyDataType;
  TGstMIKEYKeyDataType =  Longint;
  Const
    GST_MIKEY_KD_TGK = 0;
    GST_MIKEY_KD_TEK = 2;
;
{*
 * GstMIKEYKVType:
 * @GST_MIKEY_KV_NULL: No specific usage rule
 * @GST_MIKEY_KV_SPI: The key is associated with the SPI/MKI
 * @GST_MIKEY_KV_INTERVAL: The key has a start and expiration time
 *
 * The key validity type
  }
type
  PGstMIKEYKVType = ^TGstMIKEYKVType;
  TGstMIKEYKVType =  Longint;
  Const
    GST_MIKEY_KV_NULL = 0;
    GST_MIKEY_KV_SPI = 1;
    GST_MIKEY_KV_INTERVAL = 2;
;
{*
 * GstMIKEYPayloadKeyData:
 * @pt: the payload header
 * @key_type: the #GstMIKEYKeyDataType of @key_data
 * @key_len: length of @key_data
 * @key_data: the key data
 * @salt_len: the length of @salt_data, can be 0
 * @salt_data: salt data
 * @kv_type: the Key Validity type
 * @kv_len: length of @kv_data
 * @kv_data: key validity data
 *
 * The Key data payload contains key material. It should be added as sub
 * payload to the KEMAC.
  }
type
  PGstMIKEYPayloadKeyData = ^TGstMIKEYPayloadKeyData;
  TGstMIKEYPayloadKeyData = record
      pt : TGstMIKEYPayload;
      key_type : TGstMIKEYKeyDataType;
      key_len : Tguint16;
      key_data : Pguint8;
      salt_len : Tguint16;
      salt_data : Pguint8;
      kv_type : TGstMIKEYKVType;
      kv_len : array[0..1] of Tguint8;
      kv_data : array[0..1] of Pguint8;
    end;
(* Const before type ignored *)

function gst_mikey_payload_key_data_set_key(payload:PGstMIKEYPayload; key_type:TGstMIKEYKeyDataType; key_len:Tguint16; key_data:Pguint8):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mikey_payload_key_data_set_salt(payload:PGstMIKEYPayload; salt_len:Tguint16; salt_data:Pguint8):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mikey_payload_key_data_set_spi(payload:PGstMIKEYPayload; spi_len:Tguint8; spi_data:Pguint8):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_mikey_payload_key_data_set_interval(payload:PGstMIKEYPayload; vf_len:Tguint8; vf_data:Pguint8; vt_len:Tguint8; vt_data:Pguint8):Tgboolean;cdecl;external;
{*
 * GstMIKEYMessage:
 * @version: the version
 * @type: the #GstMIKEYType message type
 * @V: verify flag
 * @prf_func: a #GstMIKEYPRFFunc
 * @CSB_id: Identifies the Crypto Session Bundle
 * @map_type: a #GstMIKEYMapType
 * @map_info: map info array of type depending on @map_type
 * @payloads: the payload array of #GstMIKEYPayload
 *
 * Structure holding the information of the MIKEY message
  }
{ < private >  }
{ < public >  }
type
  PGstMIKEYMessage = ^TGstMIKEYMessage;
  TGstMIKEYMessage = record
      mini_object : TGstMiniObject;
      version : Tguint8;
      _type : TGstMIKEYType;
      V : Tgboolean;
      prf_func : TGstMIKEYPRFFunc;
      CSB_id : Tguint32;
      map_type : TGstMIKEYMapType;
      map_info : PGArray;
      payloads : PGArray;
    end;


function gst_mikey_message_new:PGstMIKEYMessage;cdecl;external;
function gst_mikey_message_new_from_data(data:Tgconstpointer; size:Tgsize; info:PGstMIKEYDecryptInfo; error:PPGError):PGstMIKEYMessage;cdecl;external;
function gst_mikey_message_new_from_bytes(bytes:PGBytes; info:PGstMIKEYDecryptInfo; error:PPGError):PGstMIKEYMessage;cdecl;external;
function gst_mikey_message_to_bytes(msg:PGstMIKEYMessage; info:PGstMIKEYEncryptInfo; error:PPGError):PGBytes;cdecl;external;
function gst_mikey_message_new_from_caps(caps:PGstCaps):PGstMIKEYMessage;cdecl;external;
(* Const before type ignored *)
function gst_mikey_message_to_caps(msg:PGstMIKEYMessage; caps:PGstCaps):Tgboolean;cdecl;external;
function gst_mikey_message_base64_encode(msg:PGstMIKEYMessage):Pgchar;cdecl;external;
{*
 * gst_mikey_message_ref:
 * @message: The message to refcount
 *
 * Increase the refcount of this message.
 *
 * Returns: (transfer full): @message (for convenience when doing assignments)
 *
 * Since: 1.4
  }
{ xxxxxxxxxx }
{static inline GstMIKEYMessage * }
{gst_mikey_message_ref (GstMIKEYMessage * message) }
{ }
{  return (GstMIKEYMessage *) gst_mini_object_ref (GST_MINI_OBJECT_CAST (message)); }
{ }
{*
 * gst_mikey_message_unref:
 * @message: (transfer full): the message to refcount
 *
 * Decrease the refcount of an message, freeing it if the refcount reaches 0.
 *
 * Since: 1.4
  }
{static inline void }
{gst_mikey_message_unref (GstMIKEYMessage * message) }
{ }
{  gst_mini_object_unref (GST_MINI_OBJECT_CAST (message)); }
{ }
{*
 * gst_mikey_message_copy:
 * @message: a #GstMIKEYMessage.
 *
 * Create a copy of the given message.
 *
 * Returns: (transfer full): a new copy of @message.
 *
 * Since: 1.4
  }
{static inline GstMIKEYMessage * }
{gst_mikey_message_copy (const GstMIKEYMessage * message) }
{ }
{  return (GstMIKEYMessage *) gst_mini_object_copy (GST_MINI_OBJECT_CONST_CAST (message)); }
{ }
function gst_mikey_message_set_info(msg:PGstMIKEYMessage; version:Tguint8; _type:TGstMIKEYType; V:Tgboolean; prf_func:TGstMIKEYPRFFunc; 
           CSB_id:Tguint32; map_type:TGstMIKEYMapType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mikey_message_get_n_cs(msg:PGstMIKEYMessage):Tguint;cdecl;external;
{ SRTP crypto sessions  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_mikey_message_get_cs_srtp(msg:PGstMIKEYMessage; idx:Tguint):PGstMIKEYMapSRTP;cdecl;external;
(* Const before type ignored *)
function gst_mikey_message_insert_cs_srtp(msg:PGstMIKEYMessage; idx:Tgint; map:PGstMIKEYMapSRTP):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_mikey_message_replace_cs_srtp(msg:PGstMIKEYMessage; idx:Tgint; map:PGstMIKEYMapSRTP):Tgboolean;cdecl;external;
function gst_mikey_message_remove_cs_srtp(msg:PGstMIKEYMessage; idx:Tgint):Tgboolean;cdecl;external;
function gst_mikey_message_add_cs_srtp(msg:PGstMIKEYMessage; policy:Tguint8; ssrc:Tguint32; roc:Tguint32):Tgboolean;cdecl;external;
{ adding/retrieving payloads  }
(* Const before type ignored *)
function gst_mikey_message_get_n_payloads(msg:PGstMIKEYMessage):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_mikey_message_get_payload(msg:PGstMIKEYMessage; idx:Tguint):PGstMIKEYPayload;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_mikey_message_find_payload(msg:PGstMIKEYMessage; _type:TGstMIKEYPayloadType; nth:Tguint):PGstMIKEYPayload;cdecl;external;
function gst_mikey_message_remove_payload(msg:PGstMIKEYMessage; idx:Tguint):Tgboolean;cdecl;external;
function gst_mikey_message_insert_payload(msg:PGstMIKEYMessage; idx:Tguint; payload:PGstMIKEYPayload):Tgboolean;cdecl;external;
function gst_mikey_message_add_payload(msg:PGstMIKEYMessage; payload:PGstMIKEYPayload):Tgboolean;cdecl;external;
function gst_mikey_message_replace_payload(msg:PGstMIKEYMessage; idx:Tguint; payload:PGstMIKEYPayload):Tgboolean;cdecl;external;
{ Key data transport payload (KEMAC)  }
{ Envelope data payload (PKE)  }
(* Const before type ignored *)
function gst_mikey_message_add_pke(msg:PGstMIKEYMessage; C:TGstMIKEYCacheType; data_len:Tguint16; data:Pguint8):Tgboolean;cdecl;external;
{ DH data payload (DH)  }
{ Signature payload (SIGN)  }
{ Timestamp payload (T)  }
(* Const before type ignored *)
function gst_mikey_message_add_t(msg:PGstMIKEYMessage; _type:TGstMIKEYTSType; ts_value:Pguint8):Tgboolean;cdecl;external;
function gst_mikey_message_add_t_now_ntp_utc(msg:PGstMIKEYMessage):Tgboolean;cdecl;external;
{ ID payload (ID)  }
{ Certificate Payload (CERT)  }
{ Cert hash payload (CHASH) }
{ Ver msg payload (V)  }
{ Security Policy payload (SP) }
{ RAND payload (RAND)  }
(* Const before type ignored *)
function gst_mikey_message_add_rand(msg:PGstMIKEYMessage; len:Tguint8; rand:Pguint8):Tgboolean;cdecl;external;
function gst_mikey_message_add_rand_len(msg:PGstMIKEYMessage; len:Tguint8):Tgboolean;cdecl;external;
{ Error payload (ERR)  }
{ Key data sub-payload  }
{ General Extension Payload  }
{$endif}
{ __GST_MIKEY_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_MIKEY_MESSAGE : longint; { return type might be wrong }
  begin
    GST_TYPE_MIKEY_MESSAGE:=gst_mikey_message_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_MIKEY_PAYLOAD : longint; { return type might be wrong }
  begin
    GST_TYPE_MIKEY_PAYLOAD:=gst_mikey_payload_get_type;
  end;


end.
