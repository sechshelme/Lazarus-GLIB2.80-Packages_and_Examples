
unit gstvkvideoutils;
interface

{
  Automatically converted by H2Pas 0.99.16 from gstvkvideoutils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkvideoutils.h
}

Type
PGstCaps = ^TGstCaps;
PGstVulkanVideoCapabilities = ^TGstVulkanVideoCapabilities;
PGstVulkanVideoProfile = ^TGstVulkanVideoProfile;

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
{$include <gst/gst.h>}
{$include <gst/vulkan/gstvkapi.h>}
{*
 * GstVulkanVideoProfile:
 * @profile: the generic vulkan video profile
 * @codec: the specific codec profile
 *
 * Since: 1.24
  }
{< private > }
{$if GST_VULKAN_HAVE_VIDEO_EXTENSIONS}
{$endif}
type
  PGstVulkanVideoProfile = ^TGstVulkanVideoProfile;
  TGstVulkanVideoProfile = record
      profile : TVkVideoProfileInfoKHR;
      usage : record
          case longint of
            0 : ( decode : TVkVideoDecodeUsageInfoKHR );
          end;
      codec : record
          case longint of
            0 : ( base : TVkBaseInStructure );
            1 : ( h264dec : TVkVideoDecodeH264ProfileInfoKHR );
            2 : ( h265dec : TVkVideoDecodeH265ProfileInfoKHR );
          end;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanVideoCapabilities:
 *
 * Since: 1.24
  }
{< private > }
{$if GST_VULKAN_HAVE_VIDEO_EXTENSIONS}
{$endif}
  PGstVulkanVideoCapabilities = ^TGstVulkanVideoCapabilities;
  TGstVulkanVideoCapabilities = record
      caps : TVkVideoCapabilitiesKHR;
      codec : record
          case longint of
            0 : ( base : TVkBaseInStructure );
            1 : ( h264dec : TVkVideoDecodeH264CapabilitiesKHR );
            2 : ( h265dec : TVkVideoDecodeH265CapabilitiesKHR );
          end;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanVideoOperation:
 * @GST_VULKAN_VIDEO_OPERATION_DECODE: decode operation
 * @GST_VULKAN_VIDEO_OPERATION_ENCODE: encode operation
 * @GST_VULKAN_VIDEO_OPERATION_UNKNOWN: unknown
 *
 * The type of video operation.
 *
 * Since: 1.24
  }

  PGstVulkanVideoOperation = ^TGstVulkanVideoOperation;
  TGstVulkanVideoOperation =  Longint;
  Const
    GST_VULKAN_VIDEO_OPERATION_DECODE = &;
    GST_VULKAN_VIDEO_OPERATION_ENCODE = (&)+1;
    GST_VULKAN_VIDEO_OPERATION_UNKNOWN = (&)+2;
;
(* Const before declarator ignored *)

function gst_vulkan_video_profile_to_caps(profile:PGstVulkanVideoProfile):PGstCaps;cdecl;external;
function gst_vulkan_video_profile_from_caps(profile:PGstVulkanVideoProfile; caps:PGstCaps; video_operation:TGstVulkanVideoOperation):Tgboolean;cdecl;external;
function gst_vulkan_video_profile_is_valid(profile:PGstVulkanVideoProfile; codec:Tguint):Tgboolean;cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function gst_vulkan_video_profile_is_equal(a:PGstVulkanVideoProfile; b:PGstVulkanVideoProfile):Tgboolean;cdecl;external;

implementation


end.
