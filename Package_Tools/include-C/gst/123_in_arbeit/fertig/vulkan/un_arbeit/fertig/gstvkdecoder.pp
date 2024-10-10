
unit gstvkdecoder;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstvkdecoder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkdecoder.h
}

Type
PGArray = ^TGArray;
PGError = ^TGError;
PGstBuffer = ^TGstBuffer;
PGstCaps = ^TGstCaps;
PGstVulkanDecoder = ^TGstVulkanDecoder;
PGstVulkanDecoderClass = ^TGstVulkanDecoderClass;
PGstVulkanDecoderParameters = ^TGstVulkanDecoderParameters;
PGstVulkanDecoderPicture = ^TGstVulkanDecoderPicture;
PGstVulkanImageView = ^TGstVulkanImageView;
PGstVulkanQueue = ^TGstVulkanQueue;
PGstVulkanVideoCapabilities = ^TGstVulkanVideoCapabilities;
PGstVulkanVideoProfile = ^TGstVulkanVideoProfile;
Pguint8 = ^Tguint8;
PVkVideoFormatPropertiesKHR = ^TVkVideoFormatPropertiesKHR;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2023 Igalia, S.L.
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
(** unsupported pragma#pragma once*)
{$include <gst/vulkan/gstvkqueue.h>}
{$include <gst/vulkan/gstvkvideoutils.h>}

{ was #define dname def_expr }
function GST_TYPE_VULKAN_DECODER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DECODER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DECODER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DECODER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DECODER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DECODER_GET_CLASS(o : longint) : longint;

function gst_vulkan_decoder_get_type:TGType;cdecl;external;
{*
 * GstVulkanDecoderPicture:
 * @out: output buffer
 * @dpb: DPB representation of @out if needed by driver
 * @img_view_ref: image view for reference
 * @img_view_out: image view for output
 * @slice_offs: array of offsets of each uploaded slice
 * @refs: references required to decode current pictures
 *
 * It contains the whole state for decoding a single picture.
 *
 * Since: 1.24
  }
{ only used for out-of-place decoding  }
{ Image representation view (reference)  }
{ Image representation view (output-only)  }
{ Picture refs. H264 has the maximum number of refs (36) of any supported
   * codec.  }
{< private > }
{ Current picture  }
{ Main decoding struct  }
type
  PGstVulkanDecoderPicture = ^TGstVulkanDecoderPicture;
  TGstVulkanDecoderPicture = record
      _out : PGstBuffer;
      dpb : PGstBuffer;
      img_view_ref : PGstVulkanImageView;
      img_view_out : PGstVulkanImageView;
      slice_offs : PGArray;
      refs : array[0..35] of PGstVulkanDecoderPicture;
      pics_res : array[0..35] of TVkVideoPictureResourceInfoKHR;
      slots : array[0..35] of TVkVideoReferenceSlotInfoKHR;
      pic_res : TVkVideoPictureResourceInfoKHR;
      slot : TVkVideoReferenceSlotInfoKHR;
      decode_info : TVkVideoDecodeInfoKHR;
    end;

{*
 * GstVulkanDecoder:
 * @parent: the parent #GstObject
 * @queue: the #GstVulkanQueue to command buffers will be allocated from
 * @codec: the configured video codec operation
 * @profile: the configured #GstVulkanVideoProfile
 * @input_buffer: the buffer to upload the bitstream to decode
 * @dedicated_dpb: if decoder needs a dedicated DPB
 * @layered_dpb: if decoder's dedicated DPB has to be a layered image
 *
 * Since: 1.24
 * }
{< private > }
  PGstVulkanDecoder = ^TGstVulkanDecoder;
  TGstVulkanDecoder = record
      parent : TGstObject;
      queue : PGstVulkanQueue;
      codec : Tguint;
      profile : TGstVulkanVideoProfile;
      input_buffer : PGstBuffer;
      layered_buffer : PGstBuffer;
      dedicated_dpb : Tgboolean;
      layered_dpb : Tgboolean;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanDecoderClass:
 * @parent_class: the parent #GstObjectClass
 *
 * Since: 1.24
  }
{< private > }
  PGstVulkanDecoderClass = ^TGstVulkanDecoderClass;
  TGstVulkanDecoderClass = record
      parent : TGstObjectClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanDecoderParameters:
 *
 * Codec specific parameters.
 *
 * Since: 1.24
  }
{< private > }
  PGstVulkanDecoderParameters = ^TGstVulkanDecoderParameters;
  TGstVulkanDecoderParameters = record
      case longint of
        0 : ( h264 : TVkVideoDecodeH264SessionParametersCreateInfoKHR );
        1 : ( h265 : TVkVideoDecodeH265SessionParametersCreateInfoKHR );
      end;


function gst_vulkan_decoder_start(self:PGstVulkanDecoder; profile:PGstVulkanVideoProfile; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_decoder_stop(self:PGstVulkanDecoder):Tgboolean;cdecl;external;
function gst_vulkan_decoder_update_video_session_parameters(self:PGstVulkanDecoder; params:PGstVulkanDecoderParameters; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_decoder_create_dpb_pool(self:PGstVulkanDecoder; caps:PGstCaps):Tgboolean;cdecl;external;
function gst_vulkan_decoder_flush(self:PGstVulkanDecoder; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_decoder_decode(self:PGstVulkanDecoder; pic:PGstVulkanDecoderPicture; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_decoder_is_started(self:PGstVulkanDecoder):Tgboolean;cdecl;external;
function gst_vulkan_decoder_caps(self:PGstVulkanDecoder; caps:PGstVulkanVideoCapabilities):Tgboolean;cdecl;external;
function gst_vulkan_decoder_out_format(self:PGstVulkanDecoder; format:PVkVideoFormatPropertiesKHR):Tgboolean;cdecl;external;
function gst_vulkan_decoder_profile_caps(self:PGstVulkanDecoder):PGstCaps;cdecl;external;
function gst_vulkan_decoder_update_ycbcr_sampler(self:PGstVulkanDecoder; range:TVkSamplerYcbcrRange; xloc:TVkChromaLocation; yloc:TVkChromaLocation; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_decoder_picture_create_view(self:PGstVulkanDecoder; buf:PGstBuffer; is_out:Tgboolean):PGstVulkanImageView;cdecl;external;
function gst_vulkan_decoder_picture_init(self:PGstVulkanDecoder; pic:PGstVulkanDecoderPicture; _out:PGstBuffer):Tgboolean;cdecl;external;
procedure gst_vulkan_decoder_picture_release(pic:PGstVulkanDecoderPicture);cdecl;external;
(* Const before declarator ignored *)
function gst_vulkan_decoder_append_slice(self:PGstVulkanDecoder; pic:PGstVulkanDecoderPicture; data:Pguint8; size:Tsize_t; add_startcode:Tgboolean):Tgboolean;cdecl;external;
function gst_vulkan_decoder_wait(self:PGstVulkanDecoder):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_DECODER : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_DECODER:=gst_vulkan_decoder_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DECODER(o : longint) : longint;
begin
  GST_VULKAN_DECODER:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_VULKAN_DECODER,GstVulkanDecoder);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DECODER_CLASS(k : longint) : longint;
begin
  GST_VULKAN_DECODER_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GST_TYPE_VULKAN_DECODER,GstVulkanDecoderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DECODER(o : longint) : longint;
begin
  GST_IS_VULKAN_DECODER:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_VULKAN_DECODER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DECODER_CLASS(k : longint) : longint;
begin
  GST_IS_VULKAN_DECODER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_VULKAN_DECODER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DECODER_GET_CLASS(o : longint) : longint;
begin
  GST_VULKAN_DECODER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_VULKAN_DECODER,GstVulkanDecoderClass);
end;


end.
