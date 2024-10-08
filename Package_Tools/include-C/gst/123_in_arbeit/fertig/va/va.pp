
unit va;
interface

{
  Automatically converted by H2Pas 1.0.0 from va.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    va.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Pdword  = ^dword;
Plongint  = ^longint;
Puint32_t  = ^uint32_t;
Puint8_t  = ^uint8_t;
Puintptr_t  = ^uintptr_t;
PVABufferID  = ^VABufferID;
PVABufferInfo  = ^VABufferInfo;
PVABufferType  = ^VABufferType;
PVACodedBufferSegment  = ^VACodedBufferSegment;
PVAConfigAttrib  = ^VAConfigAttrib;
PVAConfigAttribType  = ^VAConfigAttribType;
PVAConfigAttribValContextPriority  = ^VAConfigAttribValContextPriority;
PVAConfigAttribValDecJPEG  = ^VAConfigAttribValDecJPEG;
PVAConfigAttribValEncJPEG  = ^VAConfigAttribValEncJPEG;
PVAConfigAttribValEncPerBlockControl  = ^VAConfigAttribValEncPerBlockControl;
PVAConfigAttribValEncRateControlExt  = ^VAConfigAttribValEncRateControlExt;
PVAConfigAttribValEncROI  = ^VAConfigAttribValEncROI;
PVAConfigAttribValMaxFrameSize  = ^VAConfigAttribValMaxFrameSize;
PVAConfigAttribValMultipleFrame  = ^VAConfigAttribValMultipleFrame;
PVAConfigID  = ^VAConfigID;
PVAContextID  = ^VAContextID;
PVAContextParameterUpdateBuffer  = ^VAContextParameterUpdateBuffer;
PVACopyObject  = ^VACopyObject;
PVACopyObjectType  = ^VACopyObjectType;
PVACopyOption  = ^VACopyOption;
PVADecodeErrorType  = ^VADecodeErrorType;
PVADisplay  = ^VADisplay;
PVADisplayAttribBLEMode  = ^VADisplayAttribBLEMode;
PVADisplayAttribType  = ^VADisplayAttribType;
PVADisplayAttribute  = ^VADisplayAttribute;
PVADisplayAttribValSubDevice  = ^VADisplayAttribValSubDevice;
PVAEncMiscParameterAIR  = ^VAEncMiscParameterAIR;
PVAEncMiscParameterBuffer  = ^VAEncMiscParameterBuffer;
PVAEncMiscParameterBufferDirtyRect  = ^VAEncMiscParameterBufferDirtyRect;
PVAEncMiscParameterBufferMaxFrameSize  = ^VAEncMiscParameterBufferMaxFrameSize;
PVAEncMiscParameterBufferMultiPassFrameSize  = ^VAEncMiscParameterBufferMultiPassFrameSize;
PVAEncMiscParameterBufferQualityLevel  = ^VAEncMiscParameterBufferQualityLevel;
PVAEncMiscParameterBufferROI  = ^VAEncMiscParameterBufferROI;
PVAEncMiscParameterCustomRoundingControl  = ^VAEncMiscParameterCustomRoundingControl;
PVAEncMiscParameterEncQuality  = ^VAEncMiscParameterEncQuality;
PVAEncMiscParameterFrameRate  = ^VAEncMiscParameterFrameRate;
PVAEncMiscParameterHRD  = ^VAEncMiscParameterHRD;
PVAEncMiscParameterMaxSliceSize  = ^VAEncMiscParameterMaxSliceSize;
PVAEncMiscParameterParallelRateControl  = ^VAEncMiscParameterParallelRateControl;
PVAEncMiscParameterQuantization  = ^VAEncMiscParameterQuantization;
PVAEncMiscParameterRateControl  = ^VAEncMiscParameterRateControl;
PVAEncMiscParameterRIR  = ^VAEncMiscParameterRIR;
PVAEncMiscParameterSkipFrame  = ^VAEncMiscParameterSkipFrame;
PVAEncMiscParameterTemporalLayerStructure  = ^VAEncMiscParameterTemporalLayerStructure;
PVAEncMiscParameterType  = ^VAEncMiscParameterType;
PVAEncPackedHeaderParameterBuffer  = ^VAEncPackedHeaderParameterBuffer;
PVAEncPackedHeaderType  = ^VAEncPackedHeaderType;
PVAEncPictureParameterBufferH263  = ^VAEncPictureParameterBufferH263;
PVAEncPictureParameterBufferMPEG4  = ^VAEncPictureParameterBufferMPEG4;
PVAEncPictureType  = ^VAEncPictureType;
PVAEncROI  = ^VAEncROI;
PVAEncryptionParameters  = ^VAEncryptionParameters;
PVAEncryptionSegmentInfo  = ^VAEncryptionSegmentInfo;
PVAEncSequenceParameterBufferH263  = ^VAEncSequenceParameterBufferH263;
PVAEncSequenceParameterBufferMPEG4  = ^VAEncSequenceParameterBufferMPEG4;
PVAEncSliceParameterBuffer  = ^VAEncSliceParameterBuffer;
PVAEntrypoint  = ^VAEntrypoint;
PVAGenericID  = ^VAGenericID;
PVAGenericValue  = ^VAGenericValue;
PVAGenericValueType  = ^VAGenericValueType;
PVAHuffmanTableBufferJPEGBaseline  = ^VAHuffmanTableBufferJPEGBaseline;
PVAImage  = ^VAImage;
PVAImageFormat  = ^VAImageFormat;
PVAImageID  = ^VAImageID;
PVAIQMatrixBufferH264  = ^VAIQMatrixBufferH264;
PVAIQMatrixBufferMPEG2  = ^VAIQMatrixBufferMPEG2;
PVAIQMatrixBufferMPEG4  = ^VAIQMatrixBufferMPEG4;
PVAMacroblockParameterBufferMPEG2  = ^VAMacroblockParameterBufferMPEG2;
PVAMFContextID  = ^VAMFContextID;
PVAMotionVector  = ^VAMotionVector;
PVAMvModeVC1  = ^VAMvModeVC1;
PVANativeDisplay  = ^VANativeDisplay;
PVAPictureH264  = ^VAPictureH264;
PVAPictureHEVC  = ^VAPictureHEVC;
PVAPictureParameterBufferH264  = ^VAPictureParameterBufferH264;
PVAPictureParameterBufferMPEG2  = ^VAPictureParameterBufferMPEG2;
PVAPictureParameterBufferMPEG4  = ^VAPictureParameterBufferMPEG4;
PVAPictureParameterBufferVC1  = ^VAPictureParameterBufferVC1;
PVAProcessingRateParameter  = ^VAProcessingRateParameter;
PVAProcessingRateParameterDec  = ^VAProcessingRateParameterDec;
PVAProcessingRateParameterEnc  = ^VAProcessingRateParameterEnc;
PVAProfile  = ^VAProfile;
PVARectangle  = ^VARectangle;
PVASliceParameterBufferBase  = ^VASliceParameterBufferBase;
PVASliceParameterBufferH264  = ^VASliceParameterBufferH264;
PVASliceParameterBufferMPEG2  = ^VASliceParameterBufferMPEG2;
PVASliceParameterBufferMPEG4  = ^VASliceParameterBufferMPEG4;
PVASliceParameterBufferVC1  = ^VASliceParameterBufferVC1;
PVAStatus  = ^VAStatus;
PVASubpictureID  = ^VASubpictureID;
PVASurfaceAttrib  = ^VASurfaceAttrib;
PVASurfaceAttribExternalBuffers  = ^VASurfaceAttribExternalBuffers;
PVASurfaceAttribType  = ^VASurfaceAttribType;
PVASurfaceDecodeMBErrors  = ^VASurfaceDecodeMBErrors;
PVASurfaceID  = ^VASurfaceID;
PVASurfaceStatus  = ^VASurfaceStatus;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2007-2009 Intel Corporation. All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sub license, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice (including the
 * next paragraph) shall be included in all copies or substantial portions
 * of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
 * IN NO EVENT SHALL INTEL AND/OR ITS SUPPLIERS BE LIABLE FOR
 * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  }
{
 * Video Acceleration (VA) API Specification
 *
 * Rev. 0.30
 * <jonathan.bian@intel.com>
 *
 * Revision History:
 * rev 0.10 (12/10/2006 Jonathan Bian) - Initial draft
 * rev 0.11 (12/15/2006 Jonathan Bian) - Fixed some errors
 * rev 0.12 (02/05/2007 Jonathan Bian) - Added VC-1 data structures for slice level decode
 * rev 0.13 (02/28/2007 Jonathan Bian) - Added GetDisplay()
 * rev 0.14 (04/13/2007 Jonathan Bian) - Fixed MPEG-2 PictureParameter structure, cleaned up a few funcs.
 * rev 0.15 (04/20/2007 Jonathan Bian) - Overhauled buffer management
 * rev 0.16 (05/02/2007 Jonathan Bian) - Added error codes and fixed some issues with configuration
 * rev 0.17 (05/07/2007 Jonathan Bian) - Added H.264/AVC data structures for slice level decode.
 * rev 0.18 (05/14/2007 Jonathan Bian) - Added data structures for MPEG-4 slice level decode
 *                                       and MPEG-2 motion compensation.
 * rev 0.19 (08/06/2007 Jonathan Bian) - Removed extra type for bitplane data.
 * rev 0.20 (08/08/2007 Jonathan Bian) - Added missing fields to VC-1 PictureParameter structure.
 * rev 0.21 (08/20/2007 Jonathan Bian) - Added image and subpicture support.
 * rev 0.22 (08/27/2007 Jonathan Bian) - Added support for chroma-keying and global alpha.
 * rev 0.23 (09/11/2007 Jonathan Bian) - Fixed some issues with images and subpictures.
 * rev 0.24 (09/18/2007 Jonathan Bian) - Added display attributes.
 * rev 0.25 (10/18/2007 Jonathan Bian) - Changed to use IDs only for some types.
 * rev 0.26 (11/07/2007 Waldo Bastian) - Change vaCreateBuffer semantics
 * rev 0.27 (11/19/2007 Matt Sottek)   - Added DeriveImage
 * rev 0.28 (12/06/2007 Jonathan Bian) - Added new versions of PutImage and AssociateSubpicture
 *                                       to enable scaling
 * rev 0.29 (02/07/2008 Jonathan Bian) - VC1 parameter fixes,
 *                                       added VA_STATUS_ERROR_RESOLUTION_NOT_SUPPORTED
 * rev 0.30 (03/01/2009 Jonathan Bian) - Added encoding support for H.264 BP and MPEG-4 SP and fixes
 *                                       for ISO C conformance.
 * rev 0.31 (09/02/2009 Gwenole Beauchesne) - VC-1/H264 fields change for VDPAU and XvBA backend
 *                                       Application needs to relink with the new library.
 *
 * rev 0.31.1 (03/29/2009)              - Data structure for JPEG encode
 * rev 0.31.2 (01/13/2011 Anthony Pabon)- Added a flag to indicate Subpicture coordinates are screen
 *                                        screen relative rather than source video relative.
 * rev 0.32.0 (01/13/2011 Xiang Haihao) - Add profile into VAPictureParameterBufferVC1
 *                                        update VAAPI to 0.32.0
 *
 * Acknowledgements:
 *  Some concepts borrowed from XvMC and XvImage.
 *  Waldo Bastian (Intel), Matt Sottek (Intel),  Austin Yuan (Intel), and Gwenole Beauchesne (SDS)
 *  contributed to various aspects of the API.
  }
{*
 * \file va.h
 * \brief The Core API
 *
 * This file contains the \ref api_core "Core API".
  }
{$ifndef _VA_H_}
{$define _VA_H_}
{$include <stddef.h>}
{$include <stdint.h>}
{$include <va/va_version.h>}
{*
 * \mainpage Video Acceleration (VA) API
 *
 * \section intro Introduction
 *
 * The main motivation for VA-API (Video Acceleration API) is to
 * enable hardware accelerated video decode and encode at various
 * entry-points (VLD, IDCT, Motion Compensation etc.) for the
 * prevailing coding standards today (MPEG-2, MPEG-4 ASP/H.263, MPEG-4
 * AVC/H.264, VC-1/VMW3, and JPEG, HEVC/H265, VP8, VP9) and video pre/post
 * processing
 *
 * VA-API is split into several modules:
 * - \ref api_core
 * - Encoder (H264, HEVC, JPEG, MPEG2, VP8, VP9)
 *  - \ref api_enc_h264
 *  - \ref api_enc_hevc
 *  - \ref api_enc_jpeg
 *  - \ref api_enc_mpeg2
 *  - \ref api_enc_vp8
 *  - \ref api_enc_vp9
 *  - \ref api_enc_av1
 * - Decoder (HEVC, JPEG, VP8, VP9, AV1)
 *      - \ref api_dec_hevc
 *      - \ref api_dec_jpeg
 *      - \ref api_dec_vp8
 *      - \ref api_dec_vp9
 *      - \ref api_dec_av1
 * - \ref api_vpp
 * - \ref api_prot
 * - FEI (H264, HEVC)
 *  - \ref api_fei
 *  - \ref api_fei_h264
 *  - \ref api_fei_hevc
 *
 * \section threading Multithreading Guide
 * All VAAPI functions implemented in libva are thread-safe. For any VAAPI
 * function that requires the implementation of a backend (e.g. hardware driver),
 * the backend must ensure that its implementation is also thread-safe. If the
 * backend implementation of a VAAPI function is not thread-safe then this should
 * be considered as a bug against the backend implementation.
 *
 * It is assumed that none of the VAAPI functions will be called from signal
 * handlers.
 *
 * Thread-safety in this context means that when VAAPI is being called by multiple
 * concurrent threads, it will not crash or hang the OS, and VAAPI internal
 * data structures will not be corrupted. When multiple threads are operating on
 * the same VAAPI objects, it is the application's responsibility to synchronize
 * these operations in order to generate the expected results. For example, using
 * a single VAContext from multiple threads may generate unexpected results.
 *
 * Following pseudo code illustrates a multithreaded transcoding scenario, where
 * one thread is handling the decoding operation and another thread is handling
 * the encoding operation, while synchronizing the use of a common pool of
 * surfaces.
 *
 * \code
 * // Initialization
 * dpy = vaGetDisplayDRM(fd);
 * vaInitialize(dpy, ...);
 *
 * // Create surfaces required for decoding and subsequence encoding
 * vaCreateSurfaces(dpy, VA_RT_FORMAT_YUV420, width, height, &surfaces[0], ...);
 *
 * // Set up a queue for the surfaces shared between decode and encode threads
 * surface_queue = queue_create();
 *
 * // Create decode_thread
 * pthread_create(&decode_thread, NULL, decode, ...);
 *
 * // Create encode_thread
 * pthread_create(&encode_thread, NULL, encode, ...);
 *
 * // Decode thread function
 * decode() 
 *   // Find the decode entrypoint for H.264
 *   vaQueryConfigEntrypoints(dpy, h264_profile, entrypoints, ...);
 *
 *   // Create a config for H.264 decode
 *   vaCreateConfig(dpy, h264_profile, VAEntrypointVLD, ...);
 *
 *   // Create a context for decode
 *   vaCreateContext(dpy, config, width, height, VA_PROGRESSIVE, surfaces,
 *     num_surfaces, &decode_context);
 *
 *   // Decode frames in the bitstream
 *   for (;;) 
 *     // Parse one frame and decode
 *     vaBeginPicture(dpy, decode_context, surfaces[surface_index]);
 *     vaRenderPicture(dpy, decode_context, buf, ...);
 *     vaEndPicture(dpy, decode_context);
 *     // Poll the decoding status and enqueue the surface in display order after
 *     // decoding is complete
 *     vaQuerySurfaceStatus();
 *     enqueue(surface_queue, surface_index);
 *   
 * 
 *
 * // Encode thread function
 * encode() 
 *   // Find the encode entrypoint for HEVC
 *   vaQueryConfigEntrypoints(dpy, hevc_profile, entrypoints, ...);
 *
 *   // Create a config for HEVC encode
 *   vaCreateConfig(dpy, hevc_profile, VAEntrypointEncSlice, ...);
 *
 *   // Create a context for encode
 *   vaCreateContext(dpy, config, width, height, VA_PROGRESSIVE, surfaces,
 *     num_surfaces, &encode_context);
 *
 *   // Encode frames produced by the decoder
 *   for (;;) 
 *     // Dequeue the surface enqueued by the decoder
 *     surface_index = dequeue(surface_queue);
 *     // Encode using this surface as the source
 *     vaBeginPicture(dpy, encode_context, surfaces[surface_index]);
 *     vaRenderPicture(dpy, encode_context, buf, ...);
 *     vaEndPicture(dpy, encode_context);
 *   
 * 
 * \endcode
  }
{*
 * \defgroup api_core Core API
 *
 * @
  }
{*
Overview

The VA API is intended to provide an interface between a video decode/encode/processing
application (client) and a hardware accelerator (server), to off-load
video decode/encode/processing operations from the host to the hardware accelerator at various
entry-points.

The basic operation steps are:

- Negotiate a mutually acceptable configuration with the server to lock
  down profile, entrypoints, and other attributes that will not change on
  a frame-by-frame basis.
- Create a video decode, encode or processing context which represents a
  "virtualized" hardware device
- Get and fill the render buffers with the corresponding data (depending on
  profiles and entrypoints)
- Pass the render buffers to the server to handle the current frame

Initialization & Configuration Management

- Find out supported profiles
- Find out entrypoints for a given profile
- Find out configuration attributes for a given profile/entrypoint pair
- Create a configuration for use by the application

 }
type
  PVADisplay = ^TVADisplay;
  TVADisplay = pointer;
{ window system dependent  }

  PVAStatus = ^TVAStatus;
  TVAStatus = longint;
{* Return status type from functions  }
{* Values for the return status  }

const
  VA_STATUS_SUCCESS = $00000000;  
  VA_STATUS_ERROR_OPERATION_FAILED = $00000001;  
  VA_STATUS_ERROR_ALLOCATION_FAILED = $00000002;  
  VA_STATUS_ERROR_INVALID_DISPLAY = $00000003;  
  VA_STATUS_ERROR_INVALID_CONFIG = $00000004;  
  VA_STATUS_ERROR_INVALID_CONTEXT = $00000005;  
  VA_STATUS_ERROR_INVALID_SURFACE = $00000006;  
  VA_STATUS_ERROR_INVALID_BUFFER = $00000007;  
  VA_STATUS_ERROR_INVALID_IMAGE = $00000008;  
  VA_STATUS_ERROR_INVALID_SUBPICTURE = $00000009;  
  VA_STATUS_ERROR_ATTR_NOT_SUPPORTED = $0000000a;  
  VA_STATUS_ERROR_MAX_NUM_EXCEEDED = $0000000b;  
  VA_STATUS_ERROR_UNSUPPORTED_PROFILE = $0000000c;  
  VA_STATUS_ERROR_UNSUPPORTED_ENTRYPOINT = $0000000d;  
  VA_STATUS_ERROR_UNSUPPORTED_RT_FORMAT = $0000000e;  
  VA_STATUS_ERROR_UNSUPPORTED_BUFFERTYPE = $0000000f;  
  VA_STATUS_ERROR_SURFACE_BUSY = $00000010;  
  VA_STATUS_ERROR_FLAG_NOT_SUPPORTED = $00000011;  
  VA_STATUS_ERROR_INVALID_PARAMETER = $00000012;  
  VA_STATUS_ERROR_RESOLUTION_NOT_SUPPORTED = $00000013;  
  VA_STATUS_ERROR_UNIMPLEMENTED = $00000014;  
  VA_STATUS_ERROR_SURFACE_IN_DISPLAYING = $00000015;  
  VA_STATUS_ERROR_INVALID_IMAGE_FORMAT = $00000016;  
  VA_STATUS_ERROR_DECODING_ERROR = $00000017;  
  VA_STATUS_ERROR_ENCODING_ERROR = $00000018;  
{*
 * \brief An invalid/unsupported value was supplied.
 *
 * This is a catch-all error code for invalid or unsupported values.
 * e.g. value exceeding the valid range, invalid type in the context
 * of generic attribute values.
  }
  VA_STATUS_ERROR_INVALID_VALUE = $00000019;  
{* \brief An unsupported filter was supplied.  }
  VA_STATUS_ERROR_UNSUPPORTED_FILTER = $00000020;  
{* \brief An invalid filter chain was supplied.  }
  VA_STATUS_ERROR_INVALID_FILTER_CHAIN = $00000021;  
{* \brief Indicate HW busy (e.g. run multiple encoding simultaneously).  }
  VA_STATUS_ERROR_HW_BUSY = $00000022;  
{* \brief An unsupported memory type was supplied.  }
  VA_STATUS_ERROR_UNSUPPORTED_MEMORY_TYPE = $00000024;  
{* \brief Indicate allocated buffer size is not enough for input or output.  }
  VA_STATUS_ERROR_NOT_ENOUGH_BUFFER = $00000025;  
{* \brief Indicate an operation isn't completed because time-out interval elapsed.  }
  VA_STATUS_ERROR_TIMEDOUT = $00000026;  
  VA_STATUS_ERROR_UNKNOWN = $FFFFFFFF;  
{*
 * 1. De-interlacing flags for vaPutSurface()
 * 2. Surface sample type for input/output surface flag
 *    - Progressive: VA_FRAME_PICTURE
 *    - Interleaved: VA_TOP_FIELD_FIRST, VA_BOTTOM_FIELD_FIRST
 *    - Field: VA_TOP_FIELD, VA_BOTTOM_FIELD
 }
  VA_FRAME_PICTURE = $00000000;  
  VA_TOP_FIELD = $00000001;  
  VA_BOTTOM_FIELD = $00000002;  
  VA_TOP_FIELD_FIRST = $00000004;  
  VA_BOTTOM_FIELD_FIRST = $00000008;  
{*
 * Enabled the positioning/cropping/blending feature:
 * 1, specify the video playback position in the isurface
 * 2, specify the cropping info for video playback
 * 3, encoded video will blend with background color
  }
{ video area blend with the constant color  }
  VA_ENABLE_BLEND = $00000004;  
{*
 * Clears the drawable with background color.
 * for hardware overlay based implementation this flag
 * can be used to turn off the overlay
  }
  VA_CLEAR_DRAWABLE = $00000008;  
{* Color space conversion flags for vaPutSurface()  }
  VA_SRC_COLOR_MASK = $000000f0;  
  VA_SRC_BT601 = $00000010;  
  VA_SRC_BT709 = $00000020;  
  VA_SRC_SMPTE_240 = $00000040;  
{* Scaling flags for vaPutSurface()  }
  VA_FILTER_SCALING_DEFAULT = $00000000;  
  VA_FILTER_SCALING_FAST = $00000100;  
  VA_FILTER_SCALING_HQ = $00000200;  
  VA_FILTER_SCALING_NL_ANAMORPHIC = $00000300;  
  VA_FILTER_SCALING_MASK = $00000f00;  
{* Interpolation method for scaling  }
  VA_FILTER_INTERPOLATION_DEFAULT = $00000000;  
  VA_FILTER_INTERPOLATION_NEAREST_NEIGHBOR = $00001000;  
  VA_FILTER_INTERPOLATION_BILINEAR = $00002000;  
  VA_FILTER_INTERPOLATION_ADVANCED = $00003000;  
  VA_FILTER_INTERPOLATION_MASK = $0000f000;  
{* Padding size in 4-bytes  }
  VA_PADDING_LOW = 4;  
  VA_PADDING_MEDIUM = 8;  
  VA_PADDING_HIGH = 16;  
  VA_PADDING_LARGE = 32;  
{* operation options  }
{* synchronization, block call, output should be ready after execution function return }
  VA_EXEC_SYNC = $0;  
{* asynchronization,application should call additonal sync operation to access output  }
  VA_EXEC_ASYNC = $1;  
{* operation mode  }
  VA_EXEC_MODE_DEFAULT = $0;  
  VA_EXEC_MODE_POWER_SAVING = $1;  
  VA_EXEC_MODE_PERFORMANCE = $2;  
{ Values used to describe device features.  }
{* The feature is not supported by the device.
 *
 * Any corresponding feature flag must not be set.
  }
  VA_FEATURE_NOT_SUPPORTED = 0;  
{* The feature is supported by the device.
 *
 * The user may decide whether or not to use this feature.
 *
 * Note that support for a feature only indicates that the hardware
 * is able to use it; whether it is actually a positive change to
 * enable it in a given situation will depend on other factors
 * including the input provided by the user.
  }
  VA_FEATURE_SUPPORTED = 1;  
{* The feature is required by the device.
 *
 * The device does not support not enabling this feature, so any
 * corresponding feature flag must be set and any additional
 * configuration needed by the feature must be supplied.
  }
  VA_FEATURE_REQUIRED = 2;  
{*
 * Returns a short english description of error_status
  }
(* Const before type ignored *)

function vaErrorStr(error_status:TVAStatus):Pchar;cdecl;external;
{* \brief Structure to describe rectangle.  }
type
  PVARectangle = ^TVARectangle;
  TVARectangle = record
      x : Tint16_t;
      y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
    end;
{* \brief Generic motion vector data structure.  }
{* \brief Past reference
     *
     * - \c [0]: horizontal motion vector for past reference
     * - \c [1]: vertical motion vector for past reference
      }
{* \brief Future reference
     *
     * - \c [0]: horizontal motion vector for future reference
     * - \c [1]: vertical motion vector for future reference
      }

  PVAMotionVector = ^TVAMotionVector;
  TVAMotionVector = record
      mv0 : array[0..1] of Tint16_t;
      mv1 : array[0..1] of Tint16_t;
    end;
{* Type of a message callback, used for both error and info log.  }
(* Const before type ignored *)

  TVAMessageCallback = procedure (user_context:pointer; message:Pchar);cdecl;
{*
 * Set the callback for error messages, or NULL for no logging.
 * Returns the previous one, or NULL if it was disabled.
  }

function vaSetErrorCallback(dpy:TVADisplay; callback:TVAMessageCallback; user_context:pointer):TVAMessageCallback;cdecl;external;
{*
 * Set the callback for info messages, or NULL for no logging.
 * Returns the previous one, or NULL if it was disabled.
  }
function vaSetInfoCallback(dpy:TVADisplay; callback:TVAMessageCallback; user_context:pointer):TVAMessageCallback;cdecl;external;
{*
 * Initialization:
 * A display must be obtained by calling vaGetDisplay() before calling
 * vaInitialize() and other functions. This connects the API to the
 * native window system.
 * For X Windows, native_dpy would be from XOpenDisplay()
  }
type
  PVANativeDisplay = ^TVANativeDisplay;
  TVANativeDisplay = pointer;
{ window system dependent  }

function vaDisplayIsValid(dpy:TVADisplay):longint;cdecl;external;
{*
 *  Set the override driver name instead of queried driver driver.
  }
function vaSetDriverName(dpy:TVADisplay; driver_name:Pchar):TVAStatus;cdecl;external;
{*
 * Initialize the library
  }
{ out  }
{ out  }
function vaInitialize(dpy:TVADisplay; major_version:Plongint; minor_version:Plongint):TVAStatus;cdecl;external;
{*
 * After this call, all library internal resources will be cleaned up
  }
function vaTerminate(dpy:TVADisplay):TVAStatus;cdecl;external;
{*
 * vaQueryVendorString returns a pointer to a zero-terminated string
 * describing some aspects of the VA implemenation on a specific
 * hardware accelerator. The format of the returned string is vendor
 * specific and at the discretion of the implementer.
 * e.g. for the Intel GMA500 implementation, an example would be:
 * "Intel GMA500 - 2.0.0.32L.0005"
  }
(* Const before type ignored *)
function vaQueryVendorString(dpy:TVADisplay):Pchar;cdecl;external;
type

  TVAPrivFunc = function (para1:pointer):longint;cdecl;
{*
 * Return a function pointer given a function name in the library.
 * This allows private interfaces into the library
  }
(* Const before type ignored *)

function vaGetLibFunc(dpy:TVADisplay; func:Pchar):TVAPrivFunc;cdecl;external;
{* Currently defined profiles  }
{* \brief Profile ID used for video processing.  }
{* \brief Profile ID used for protected video playback.  }
type
  PVAProfile = ^TVAProfile;
  TVAProfile =  Longint;
  Const
    VAProfileNone = -(1);
    VAProfileMPEG2Simple = 0;
    VAProfileMPEG2Main = 1;
    VAProfileMPEG4Simple = 2;
    VAProfileMPEG4AdvancedSimple = 3;
    VAProfileMPEG4Main = 4;
    VAProfileH264Baseline = 5;
    VAProfileH264Main = 6;
    VAProfileH264High = 7;
    VAProfileVC1Simple = 8;
    VAProfileVC1Main = 9;
    VAProfileVC1Advanced = 10;
    VAProfileH263Baseline = 11;
    VAProfileJPEGBaseline = 12;
    VAProfileH264ConstrainedBaseline = 13;
    VAProfileVP8Version0_3 = 14;
    VAProfileH264MultiviewHigh = 15;
    VAProfileH264StereoHigh = 16;
    VAProfileHEVCMain = 17;
    VAProfileHEVCMain10 = 18;
    VAProfileVP9Profile0 = 19;
    VAProfileVP9Profile1 = 20;
    VAProfileVP9Profile2 = 21;
    VAProfileVP9Profile3 = 22;
    VAProfileHEVCMain12 = 23;
    VAProfileHEVCMain422_10 = 24;
    VAProfileHEVCMain422_12 = 25;
    VAProfileHEVCMain444 = 26;
    VAProfileHEVCMain444_10 = 27;
    VAProfileHEVCMain444_12 = 28;
    VAProfileHEVCSccMain = 29;
    VAProfileHEVCSccMain10 = 30;
    VAProfileHEVCSccMain444 = 31;
    VAProfileAV1Profile0 = 32;
    VAProfileAV1Profile1 = 33;
    VAProfileHEVCSccMain444_10 = 34;
    VAProfileProtected = 35;
    VAProfileH264High10 = 36;
;
{*
 *  Currently defined entrypoints
  }
{ slice level encode  }
{ pictuer encode, JPEG, etc  }
{
     * For an implementation that supports a low power/high performance variant
     * for slice level encode, it can choose to expose the
     * VAEntrypointEncSliceLP entrypoint. Certain encoding tools may not be
     * available with this entrypoint (e.g. interlace, MBAFF) and the
     * application can query the encoding configuration attributes to find
     * out more details if this entrypoint is supported.
      }
{*< Video pre/post-processing.  }
{*
     * \brief VAEntrypointFEI
     *
     * The purpose of FEI (Flexible Encoding Infrastructure) is to allow applications to
     * have more controls and trade off quality for speed with their own IPs.
     * The application can optionally provide input to ENC for extra encode control
     * and get the output from ENC. Application can chose to modify the ENC
     * output/PAK input during encoding, but the performance impact is significant.
     *
     * On top of the existing buffers for normal encode, there will be
     * one extra input buffer (VAEncMiscParameterFEIFrameControl) and
     * three extra output buffers (VAEncFEIMVBufferType, VAEncFEIMBModeBufferType
     * and VAEncFEIDistortionBufferType) for VAEntrypointFEI entry function.
     * If separate PAK is set, two extra input buffers
     * (VAEncFEIMVBufferType, VAEncFEIMBModeBufferType) are needed for PAK input.
     * }
{*
     * \brief VAEntrypointStats
     *
     * A pre-processing function for getting some statistics and motion vectors is added,
     * and some extra controls for Encode pipeline are provided. The application can
     * optionally call the statistics function to get motion vectors and statistics like
     * variances, distortions before calling Encode function via this entry point.
     *
     * Checking whether Statistics is supported can be performed with vaQueryConfigEntrypoints().
     * If Statistics entry point is supported, then the list of returned entry-points will
     * include #VAEntrypointStats. Supported pixel format, maximum resolution and statistics
     * specific attributes can be obtained via normal attribute query. One input buffer
     * (VAStatsStatisticsParameterBufferType) and one or two output buffers
     * (VAStatsStatisticsBufferType, VAStatsStatisticsBottomFieldBufferType (for interlace only)
     * and VAStatsMVBufferType) are needed for this entry point.
     * }
{*
     * \brief VAEntrypointProtectedTEEComm
     *
     * A function for communicating with TEE (Trusted Execution Environment).
     * }
{*
     * \brief VAEntrypointProtectedContent
     *
     * A function for protected content to decrypt encrypted content.
     * }
type
  PVAEntrypoint = ^TVAEntrypoint;
  TVAEntrypoint =  Longint;
  Const
    VAEntrypointVLD = 1;
    VAEntrypointIZZ = 2;
    VAEntrypointIDCT = 3;
    VAEntrypointMoComp = 4;
    VAEntrypointDeblocking = 5;
    VAEntrypointEncSlice = 6;
    VAEntrypointEncPicture = 7;
    VAEntrypointEncSliceLP = 8;
    VAEntrypointVideoProc = 10;
    VAEntrypointFEI = 11;
    VAEntrypointStats = 12;
    VAEntrypointProtectedTEEComm = 13;
    VAEntrypointProtectedContent = 14;
;
{* Currently defined configuration attribute types  }
{* @name Attributes for decoding  }
{*@ }
{*
     * \brief Slice Decoding mode. Read/write.
     *
     * This attribute determines what mode the driver supports for slice
     * decoding, through vaGetConfigAttributes(); and what mode the user
     * will be providing to the driver, through vaCreateConfig(), if the
     * driver supports those. If this attribute is not set by the user then
     * it is assumed that VA_DEC_SLICE_MODE_NORMAL mode is used.
     *
     * See \c VA_DEC_SLICE_MODE_xxx for the list of slice decoding modes.
      }
{*
      * \brief JPEG decoding attribute. Read-only.
      *
      * This attribute exposes a number of capabilities of the underlying
      * JPEG implementation. The attribute value is partitioned into fields as defined in the
      * VAConfigAttribValDecJPEG union.
       }
{*
     * \brief Decode processing support. Read/write.
     *
     * This attribute determines if the driver supports video processing
     * with decoding using the decoding context in a single call, through
     * vaGetConfigAttributes(); and if the user may use this feature,
     * through vaCreateConfig(), if the driver supports the user scenario.
     * The user will essentially create a regular decode VAContext.  Therefore,
     * the parameters of vaCreateContext() such as picture_width, picture_height
     * and render_targets are in relation to the decode output parameters
     * (not processing output parameters) as normal.
     * If this attribute is not set by the user then it is assumed that no
     * extra processing is done after decoding for this decode context.
     *
     * Since essentially the application is creating a decoder config and context,
     * all function calls that take in the config (e.g. vaQuerySurfaceAttributes())
     * or context are in relation to the decoder, except those video processing
     * function specified in the next paragraph.
     *
     * Once the decode config and context are created, the user must further
     * query the supported processing filters using vaQueryVideoProcFilters(),
     * vaQueryVideoProcFilterCaps(), vaQueryVideoProcPipelineCaps() by specifying
     * the created decode context.  The user must provide processing information
     * and extra processing output surfaces as "additional_outputs" to the driver
     * through VAProcPipelineParameterBufferType.  The render_target specified
     * at vaBeginPicture() time refers to the decode output surface.  The
     * target surface for the output of processing needs to be a different
     * surface since the decode process requires the original reconstructed buffer.
     * The "surface" member of VAProcPipelineParameterBuffer should be set to the
     * same as "render_target" set in vaBeginPicture(), but the driver may choose
     * to ignore this parameter.
      }
{* @name Attributes for encoding  }
{*@ }
{*
     * \brief Packed headers mode. Read/write.
     *
     * This attribute determines what packed headers the driver supports,
     * through vaGetConfigAttributes(); and what packed headers the user
     * will be providing to the driver, through vaCreateConfig(), if the
     * driver supports those.
     *
     * See \c VA_ENC_PACKED_HEADER_xxx for the list of packed headers.
      }
{*
     * \brief Interlaced mode. Read/write.
     *
     * This attribute determines what kind of interlaced encoding mode
     * the driver supports.
     *
     * See \c VA_ENC_INTERLACED_xxx for the list of interlaced modes.
      }
{*
     * \brief Maximum number of reference frames. Read-only.
     *
     * This attribute determines the maximum number of reference
     * frames supported for encoding.
     *
     * Note: for H.264 encoding, the value represents the maximum number
     * of reference frames for both the reference picture list 0 (bottom
     * 16 bits) and the reference picture list 1 (top 16 bits).
      }
{*
     * \brief Maximum number of slices per frame. Read-only.
     *
     * This attribute determines the maximum number of slices the
     * driver can support to encode a single frame.
      }
{*
     * \brief Slice structure. Read-only.
     *
     * This attribute determines slice structures supported by the
     * driver for encoding. This attribute is a hint to the user so
     * that he can choose a suitable surface size and how to arrange
     * the encoding process of multiple slices per frame.
     *
     * More specifically, for H.264 encoding, this attribute
     * determines the range of accepted values to
     * VAEncSliceParameterBufferH264::macroblock_address and
     * VAEncSliceParameterBufferH264::num_macroblocks.
     *
     * See \c VA_ENC_SLICE_STRUCTURE_xxx for the supported slice
     * structure types.
      }
{*
     * \brief Macroblock information. Read-only.
     *
     * This attribute determines whether the driver supports extra
     * encoding information per-macroblock. e.g. QP.
     *
     * More specifically, for H.264 encoding, if the driver returns a non-zero
     * value for this attribute, this means the application can create
     * additional #VAEncMacroblockParameterBufferH264 buffers referenced
     * through VAEncSliceParameterBufferH264::macroblock_info.
      }
{*
     * \brief Maximum picture width. Read-only.
     *
     * This attribute determines the maximum picture width the driver supports
     * for a given configuration.
      }
{*
     * \brief Maximum picture height. Read-only.
     *
     * This attribute determines the maximum picture height the driver supports
     * for a given configuration.
      }
{*
     * \brief JPEG encoding attribute. Read-only.
     *
     * This attribute exposes a number of capabilities of the underlying
     * JPEG implementation. The attribute value is partitioned into fields as defined in the
     * VAConfigAttribValEncJPEG union.
      }
{*
     * \brief Encoding quality range attribute. Read-only.
     *
     * This attribute conveys whether the driver supports different quality level settings
     * for encoding. A value less than or equal to 1 means that the encoder only has a single
     * quality setting, and a value greater than 1 represents the number of quality levels
     * that can be configured. e.g. a value of 2 means there are two distinct quality levels.
      }
{*
     * \brief Encoding quantization attribute. Read-only.
     *
     * This attribute conveys whether the driver supports certain types of quantization methods
     * for encoding (e.g. trellis). See \c VA_ENC_QUANTIZATION_xxx for the list of quantization methods
      }
{*
     * \brief Encoding intra refresh attribute. Read-only.
     *
     * This attribute conveys whether the driver supports certain types of intra refresh methods
     * for encoding (e.g. adaptive intra refresh or rolling intra refresh).
     * See \c VA_ENC_INTRA_REFRESH_xxx for intra refresh methods
      }
{*
     * \brief Encoding skip frame attribute. Read-only.
     *
     * This attribute conveys whether the driver supports sending skip frame parameters
     * (VAEncMiscParameterTypeSkipFrame) to the encoder's rate control, when the user has
     * externally skipped frames.
      }
{*
     * \brief Encoding region-of-interest (ROI) attribute. Read-only.
     *
     * This attribute conveys whether the driver supports region-of-interest (ROI) encoding,
     * based on user provided ROI rectangles.  The attribute value is partitioned into fields
     * as defined in the VAConfigAttribValEncROI union.
     *
     * If ROI encoding is supported, the ROI information is passed to the driver using
     * VAEncMiscParameterTypeROI.
      }
{*
     * \brief Encoding extended rate control attribute. Read-only.
     *
     * This attribute conveys whether the driver supports any extended rate control features
     * The attribute value is partitioned into fields as defined in the
     * VAConfigAttribValEncRateControlExt union.
      }
{*
     * \brief Processing rate reporting attribute. Read-only.
     *
     * This attribute conveys whether the driver supports reporting of
     * encode/decode processing rate based on certain set of parameters
     * (i.e. levels, I frame internvals) for a given configuration.
     * If this is supported, vaQueryProcessingRate() can be used to get
     * encode or decode processing rate.
     * See \c VA_PROCESSING_RATE_xxx for encode/decode processing rate
      }
{*
     * \brief Encoding dirty rectangle. Read-only.
     *
     * This attribute conveys whether the driver supports dirty rectangle.
     * encoding, based on user provided ROI rectangles which indicate the rectangular areas
     * where the content has changed as compared to the previous picture.  The regions of the
     * picture that are not covered by dirty rect rectangles are assumed to have not changed
     * compared to the previous picture.  The encoder may do some optimizations based on
     * this information.  The attribute value returned indicates the number of regions that
     * are supported.  e.g. A value of 0 means dirty rect encoding is not supported.  If dirty
     * rect encoding is supported, the ROI information is passed to the driver using
     * VAEncMiscParameterTypeDirtyRect.
      }
{*
     * \brief Parallel Rate Control (hierachical B) attribute. Read-only.
     *
     * This attribute conveys whether the encoder supports parallel rate control.
     * It is a integer value 0 - unsupported, > 0 - maximum layer supported.
     * This is the way when hireachical B frames are encoded, multiple independent B frames
     * on the same layer may be processed at same time. If supported, app may enable it by
     * setting enable_parallel_brc in VAEncMiscParameterRateControl,and the number of B frames
     * per layer per GOP will be passed to driver through VAEncMiscParameterParallelRateControl
     * structure.Currently three layers are defined.
      }
{*
    * \brief Dynamic Scaling Attribute. Read-only.
    *
    * This attribute conveys whether encoder is capable to determine dynamic frame
    * resolutions adaptive to bandwidth utilization and processing power, etc.
    * It is a boolean value 0 - unsupported, 1 - supported.
    * If it is supported,for VP9, suggested frame resolution can be retrieved from VACodedBufferVP9Status.
     }
{*
    * \brief frame size tolerance support
    * it indicates the tolerance of frame size
     }
{*
    * \brief Encode function type for FEI.
    *
    * This attribute conveys whether the driver supports different function types for encode.
    * It can be VA_FEI_FUNCTION_ENC, VA_FEI_FUNCTION_PAK, or VA_FEI_FUNCTION_ENC_PAK. Currently
    * it is for FEI entry point only.
    * Default is VA_FEI_FUNCTION_ENC_PAK.
     }
{*
     * \brief Maximum number of FEI MV predictors. Read-only.
     *
     * This attribute determines the maximum number of MV predictors the driver
     * can support to encode a single frame. 0 means no MV predictor is supported.
     * Currently it is for FEI entry point only.
      }
{*
     * \brief Statistics attribute. Read-only.
     *
     * This attribute exposes a number of capabilities of the VAEntrypointStats entry
     * point. The attribute value is partitioned into fields as defined in the
     * VAConfigAttribValStats union. Currently it is for VAEntrypointStats only.
      }
{*
    * \brief Tile Support Attribute. Read-only.
    *
    * This attribute conveys whether encoder is capable to support tiles.
    * If not supported, the tile related parameters sent to encoder, such as
    * tiling structure, should be ignored. 0 - unsupported, 1 - supported.
     }
{*
     * \brief whether accept rouding setting from application. Read-only.
     * This attribute is for encode quality, if it is report,
     * application can change the rounding setting by VAEncMiscParameterTypeCustomRoundingControl
      }
{*
     * \brief Encoding QP info block size attribute. Read-only.
     * This attribute conveys the block sizes that underlying driver
     * support for QP info for buffer #VAEncQpBuffer.
      }
{*
     * \brief encode max frame size attribute. Read-only
     * attribute value \c VAConfigAttribValMaxFrameSize represent max frame size support
      }
{* \brief inter frame prediction directrion attribute. Read-only.
     * this attribute conveys the prediction direction (backward or forword) for specific config
     * the value could be  VA_PREDICTION_DIRECTION_XXXX. it can be combined with VAConfigAttribEncMaxRefFrames
     * to describe reference list , and the prediction direction. if this attrib is not present,both direction
     * should be supported, no restriction.
     * for example: normal HEVC encoding , maximum reference frame number in reflist 0 and reflist 1 is deduced
     * by  VAConfigAttribEncMaxRefFrames. so there are typical P frame, B frame,
     * if VAConfigAttribPredictionDirection is also present. it will stipulate prediction direction in both
     * reference list. if only one prediction direction present(such as PREVIOUS),all reference frame should be
     *  previous frame (PoC < current).
      }
{* \brief combined submission of multiple frames from different streams, it is optimization for different HW
     * implementation, multiple frames encode/decode can improve HW concurrency
      }
{* \brief priority setting for the context. Read-Write
     *  attribute value is \c VAConfigAttribValContextPriority
     *  this setting also could be update by \c VAContextParameterUpdateBuffer
      }
{* \brief AV1 decoding features.  Read-only.
     *
     * This attribute describes the supported features of an
     * AV1 decoder configuration.  The value returned uses the
     * VAConfigAttribValDecAV1Features type.
      }
{* \brief TEE could be any HW secure device. Read-only  }
{* \brief TEE type client is a specific module supporting specific functions in TEE. Read-only }
{*
     * \brief Cipher algorithm of the protected content session.
     *
     * This attribute specifies the cipher algorithm of the protected content session. It
     * could be \c VA_PC_CIPHER_AES, etc....
      }
{*
     * \brief Cipher block size of the protected content session.
     *
     * This attribute specifies the block size of the protected content session. It could be
     * \c VA_PC_BLOCK_SIZE_128, \c VA_PC_BLOCK_SIZE_192, or \c VA_PC_BLOCK_SIZE_256, etc....
      }
{*
     * \brief Cipher mode of the protected content session.
     *
     * This attribute specifies the cipher mode of the protected content session. It could
     * be \c VA_PC_CIPHER_MODE_ECB, \c VA_PC_CIPHER_MODE_CBC, \c VA_PC_CIPHER_MODE_CTR, etc...
      }
{*
     * \brief Decryption sample type of the protected content session.
     *
     * This attribute specifies the decryption sample type of the protected content session.
     * It could be \c VA_PC_SAMPLE_TYPE_FULLSAMPLE or \c VA_PC_SAMPLE_TYPE_SUBSAMPLE.
      }
{*
     * \brief Special usage attribute of the protected session.
     *
     * The attribute specifies the flow for the protected session could be used. For
     * example, it could be \c VA_PC_USAGE_DEFAULT, \c VA_PC_USAGE_WIDEVINE, etc....
      }
{* \brief HEVC/H.265 encoding features.  Read-only.
     *
     * This attribute describes the supported features of an
     * HEVC/H.265 encoder configuration.  The value returned uses the
     * VAConfigAttribValEncHEVCFeatures type.
     *
     * If this attribute is supported by a driver then it must also
     * support the VAConfigAttribEncHEVCBlockSizes attribute.
      }
{* \brief HEVC/H.265 encoding block sizes.  Read-only.
     *
     * This attribute describes the supported coding tree and transform
     * block sizes of an HEVC/H.265 encoder configuration.  The value
     * returned uses the VAConfigAttribValEncHEVCBlockSizes type.
     *
     * If this attribute is supported by a driver then it must also
     * support the VAConfigAttribEncHEVCFeatures attribute.
      }
{*
     * \brief AV1 encoding attribute. Read-only.
     *
     * This attribute exposes a number of capabilities of the underlying
     * AV1 implementation. The attribute value is partitioned into fields as defined in the
     * VAConfigAttribValEncAV1 union.
      }
{*
     * \brief AV1 encoding attribute extend1. Read-only.
     *
     * This attribute exposes a number of capabilities of the underlying
     * AV1 implementation. The attribute value is partitioned into fields as defined in the
     * VAConfigAttribValEncAV1Ext1 union.
      }
{*
     * \brief AV1 encoding attribute extend2. Read-only.
     *
     * This attribute exposes a number of capabilities of the underlying
     * AV1 implementation. The attribute value is partitioned into fields as defined in the
     * VAConfigAttribValEncAV1Ext2 union.
      }
{* \brief Settings per block attribute for Encoding.  Read-only.
     *
     * This attribute describes whether to support delta qp per block,
     * the supported size of delta qp block and the size of delta QP in bytes.
     * The value returned uses the VAConfigAttribValEncPerBlockControl type.
      }
{*@ }
type
  PVAConfigAttribType = ^TVAConfigAttribType;
  TVAConfigAttribType =  Longint;
  Const
    VAConfigAttribRTFormat = 0;
    VAConfigAttribSpatialResidual = 1;
    VAConfigAttribSpatialClipping = 2;
    VAConfigAttribIntraResidual = 3;
    VAConfigAttribEncryption = 4;
    VAConfigAttribRateControl = 5;
    VAConfigAttribDecSliceMode = 6;
    VAConfigAttribDecJPEG = 7;
    VAConfigAttribDecProcessing = 8;
    VAConfigAttribEncPackedHeaders = 10;
    VAConfigAttribEncInterlaced = 11;
    VAConfigAttribEncMaxRefFrames = 13;
    VAConfigAttribEncMaxSlices = 14;
    VAConfigAttribEncSliceStructure = 15;
    VAConfigAttribEncMacroblockInfo = 16;
    VAConfigAttribMaxPictureWidth = 18;
    VAConfigAttribMaxPictureHeight = 19;
    VAConfigAttribEncJPEG = 20;
    VAConfigAttribEncQualityRange = 21;
    VAConfigAttribEncQuantization = 22;
    VAConfigAttribEncIntraRefresh = 23;
    VAConfigAttribEncSkipFrame = 24;
    VAConfigAttribEncROI = 25;
    VAConfigAttribEncRateControlExt = 26;
    VAConfigAttribProcessingRate = 27;
    VAConfigAttribEncDirtyRect = 28;
    VAConfigAttribEncParallelRateControl = 29;
    VAConfigAttribEncDynamicScaling = 30;
    VAConfigAttribFrameSizeToleranceSupport = 31;
    VAConfigAttribFEIFunctionType = 32;
    VAConfigAttribFEIMVPredictors = 33;
    VAConfigAttribStats = 34;
    VAConfigAttribEncTileSupport = 35;
    VAConfigAttribCustomRoundingControl = 36;
    VAConfigAttribQPBlockSize = 37;
    VAConfigAttribMaxFrameSize = 38;
    VAConfigAttribPredictionDirection = 39;
    VAConfigAttribMultipleFrame = 40;
    VAConfigAttribContextPriority = 41;
    VAConfigAttribDecAV1Features = 42;
    VAConfigAttribTEEType = 43;
    VAConfigAttribTEETypeClient = 44;
    VAConfigAttribProtectedContentCipherAlgorithm = 45;
    VAConfigAttribProtectedContentCipherBlockSize = 46;
    VAConfigAttribProtectedContentCipherMode = 47;
    VAConfigAttribProtectedContentCipherSampleType = 48;
    VAConfigAttribProtectedContentUsage = 49;
    VAConfigAttribEncHEVCFeatures = 50;
    VAConfigAttribEncHEVCBlockSizes = 51;
    VAConfigAttribEncAV1 = 52;
    VAConfigAttribEncAV1Ext1 = 53;
    VAConfigAttribEncAV1Ext2 = 54;
    VAConfigAttribEncPerBlockControl = 55;
    VAConfigAttribTypeMax = 56;
;
{*
 * Configuration attributes
 * If there is more than one value for an attribute, a default
 * value will be assigned to the attribute if the client does not
 * specify the attribute when creating a configuration
  }
{ OR'd flags (bits) for this attribute  }
type
  PVAConfigAttrib = ^TVAConfigAttrib;
  TVAConfigAttrib = record
      _type : TVAConfigAttribType;
      value : Tuint32_t;
    end;
{ Attribute values for VAConfigAttribRTFormat.  }

const
  VA_RT_FORMAT_YUV420 = $00000001;  {/< YUV 4:2:0 8-bit. }
  VA_RT_FORMAT_YUV422 = $00000002;  {/< YUV 4:2:2 8-bit. }
  VA_RT_FORMAT_YUV444 = $00000004;  {/< YUV 4:4:4 8-bit. }
  VA_RT_FORMAT_YUV411 = $00000008;  {/< YUV 4:1:1 8-bit. }
  VA_RT_FORMAT_YUV400 = $00000010;  {/< Greyscale 8-bit. }
  VA_RT_FORMAT_YUV420_10 = $00000100;  {/< YUV 4:2:0 10-bit. }
  VA_RT_FORMAT_YUV422_10 = $00000200;  {/< YUV 4:2:2 10-bit. }
  VA_RT_FORMAT_YUV444_10 = $00000400;  {/< YUV 4:4:4 10-bit. }
  VA_RT_FORMAT_YUV420_12 = $00001000;  {/< YUV 4:2:0 12-bit. }
  VA_RT_FORMAT_YUV422_12 = $00002000;  {/< YUV 4:2:2 12-bit. }
  VA_RT_FORMAT_YUV444_12 = $00004000;  {/< YUV 4:4:4 12-bit. }
  VA_RT_FORMAT_RGB16 = $00010000;  {/< Packed RGB, 16 bits per pixel. }
  VA_RT_FORMAT_RGB32 = $00020000;  {/< Packed RGB, 32 bits per pixel, 8 bits per colour sample. }
  VA_RT_FORMAT_RGBP = $00100000;  {/< Planar RGB, 8 bits per sample. }
  VA_RT_FORMAT_RGB32_10 = $00200000;  {/< Packed RGB, 32 bits per pixel, 10 bits per colour sample. }
  VA_RT_FORMAT_PROTECTED = $80000000;  
  VA_RT_FORMAT_RGB32_10BPP = VA_RT_FORMAT_RGB32_10;  {/< @deprecated use VA_RT_FORMAT_RGB32_10 instead. }
  VA_RT_FORMAT_YUV420_10BPP = VA_RT_FORMAT_YUV420_10;  {/< @deprecated use VA_RT_FORMAT_YUV420_10 instead. }
{* @name Attribute values for VAConfigAttribRateControl  }
{*@ }
{* \brief Driver does not support any form of rate control.  }
  VA_RC_NONE = $00000001;  
{* \brief Constant bitrate.  }
  VA_RC_CBR = $00000002;  
{* \brief Variable bitrate.  }
  VA_RC_VBR = $00000004;  
{* \brief Video conference mode.  }
  VA_RC_VCM = $00000008;  
{* \brief Constant QP.  }
  VA_RC_CQP = $00000010;  
{* \brief Variable bitrate with peak rate higher than average bitrate.  }
  VA_RC_VBR_CONSTRAINED = $00000020;  
{* \brief Intelligent Constant Quality. Provided an initial ICQ_quality_factor,
 *  adjusts QP at a frame and MB level based on motion to improve subjective quality.  }
  VA_RC_ICQ = $00000040;  
{* \brief Macroblock based rate control.  Per MB control is decided
 *  internally in the encoder. It may be combined with other RC modes, except CQP.  }
  VA_RC_MB = $00000080;  
{* \brief Constant Frame Size, it is used for small tolerent   }
  VA_RC_CFS = $00000100;  
{* \brief Parallel BRC, for hierachical B.
 *
 *  For hierachical B, B frames can be refered by other B frames.
 *  Currently three layers of hierachy are defined:
 *  B0 - regular B, no reference to other B frames.
 *  B1 - reference to only I, P and regular B0 frames.
 *  B2 - reference to any other frames, including B1.
 *  In Hierachical B structure, B frames on the same layer can be processed
 *  simultaneously. And BRC would adjust accordingly. This is so called
 *  Parallel BRC.  }
  VA_RC_PARALLEL = $00000200;  
{* \brief Quality defined VBR
 * Use Quality factor to determine the good enough QP for each MB such that
 * good enough quality can be obtained without waste of bits
 * for this BRC mode, you must set all legacy VBR parameters
 * and reuse quality_factor in \c VAEncMiscParameterRateControl
 *  }
  VA_RC_QVBR = $00000400;  
{* \brief Average VBR
 *  Average variable bitrate control algorithm focuses on overall encoding
 *  quality while meeting the specified target bitrate, within the accuracy
 *  range, after a convergence period.
 *  bits_per_second in VAEncMiscParameterRateControl is target bitrate for AVBR.
 *  Convergence is specified in the unit of frame.
 *  window_size in VAEncMiscParameterRateControl is equal to convergence for AVBR.
 *  Accuracy is in the range of [1,100], 1 means one percent, and so on.
 *  target_percentage in VAEncMiscParameterRateControl is equal to accuracy for AVBR.
 *  }
  VA_RC_AVBR = $00000800;  
{* \brief Transport Controlled BRC
 *  Specific bitrate control for real time streaming.
 *  TCBRC can instantly react to channel change to remove or significantly reduce the delay.
 *  Application (transport) provides channel feedback to driver through TargetFrameSize.
 *  When channel condition is very good (almost no constraint on instant frame size),
 *  the app should set target frame size as zero. Otherwise, channel capacity divided by fps
 *  should be used.
 *  }
  VA_RC_TCBRC = $00001000;  
{*@ }
{* @name Attribute values for VAConfigAttribDecSliceMode  }
{*@ }
{* \brief Driver supports normal mode for slice decoding  }
  VA_DEC_SLICE_MODE_NORMAL = $00000001;  
{* \brief Driver supports base mode for slice decoding  }
  VA_DEC_SLICE_MODE_BASE = $00000002;  
{* @name Attribute values for VAConfigAttribDecJPEG  }
{*@ }
{* \brief Set to (1 << VA_ROTATION_xxx) for supported rotation angles.  }
{* \brief set to 1 for crop and partial decode support, 0 if not supported  }
{* \brief Reserved for future use.  }
type
  PVAConfigAttribValDecJPEG = ^TVAConfigAttribValDecJPEG;
  TVAConfigAttribValDecJPEG = record
      case longint of
        0 : ( bits : record
            flag0 : longint;
          end );
        1 : ( value : Tuint32_t );
      end;

const
  bm__VAConfigAttribValDecJPEG_rotation = $F;
  bp__VAConfigAttribValDecJPEG_rotation = 0;
  bm__VAConfigAttribValDecJPEG_crop = $10;
  bp__VAConfigAttribValDecJPEG_crop = 4;
  bm__VAConfigAttribValDecJPEG_reserved = $FFFFFFE0;
  bp__VAConfigAttribValDecJPEG_reserved = 5;

{* @name Attribute values for VAConfigAttribDecProcessing  }
{*@ }
{* \brief No decoding + processing in a single decoding call.  }

const
  VA_DEC_PROCESSING_NONE = $00000000;  
{* \brief Decode + processing in a single decoding call.  }
  VA_DEC_PROCESSING = $00000001;  
{*@ }
{* @name Attribute values for VAConfigAttribEncPackedHeaders  }
{*@ }
{* \brief Driver does not support any packed headers mode.  }
  VA_ENC_PACKED_HEADER_NONE = $00000000;  
{*
 * \brief Driver supports packed sequence headers. e.g. SPS for H.264.
 *
 * Application must provide it to driver once this flag is returned through
 * vaGetConfigAttributes()
  }
  VA_ENC_PACKED_HEADER_SEQUENCE = $00000001;  
{*
 * \brief Driver supports packed picture headers. e.g. PPS for H.264.
 *
 * Application must provide it to driver once this falg is returned through
 * vaGetConfigAttributes()
  }
  VA_ENC_PACKED_HEADER_PICTURE = $00000002;  
{*
 * \brief Driver supports packed slice headers. e.g. slice_header() for H.264.
 *
 * Application must provide it to driver once this flag is returned through
 * vaGetConfigAttributes()
  }
  VA_ENC_PACKED_HEADER_SLICE = $00000004;  
{*
 * \brief Driver supports misc packed headers. e.g. SEI for H.264.
 *
 * @deprecated
 * This is a deprecated packed header flag, All applications can use
 * \c VA_ENC_PACKED_HEADER_RAW_DATA to pass the corresponding packed
 * header data buffer to the driver
  }
  VA_ENC_PACKED_HEADER_MISC = $00000008;  
{* \brief Driver supports raw packed header, see VAEncPackedHeaderRawData  }
  VA_ENC_PACKED_HEADER_RAW_DATA = $00000010;  
{*@ }
{* @name Attribute values for VAConfigAttribEncInterlaced  }
{*@ }
{* \brief Driver does not support interlaced coding.  }
  VA_ENC_INTERLACED_NONE = $00000000;  
{* \brief Driver supports interlaced frame coding.  }
  VA_ENC_INTERLACED_FRAME = $00000001;  
{* \brief Driver supports interlaced field coding.  }
  VA_ENC_INTERLACED_FIELD = $00000002;  
{* \brief Driver supports macroblock adaptive frame field coding.  }
  VA_ENC_INTERLACED_MBAFF = $00000004;  
{* \brief Driver supports picture adaptive frame field coding.  }
  VA_ENC_INTERLACED_PAFF = $00000008;  
{*@ }
{* @name Attribute values for VAConfigAttribEncSliceStructure  }
{*@ }
{* \brief Driver supports a power-of-two number of rows per slice.  }
  VA_ENC_SLICE_STRUCTURE_POWER_OF_TWO_ROWS = $00000001;  
{* \brief Driver supports an arbitrary number of macroblocks per slice.  }
  VA_ENC_SLICE_STRUCTURE_ARBITRARY_MACROBLOCKS = $00000002;  
{* \brief Driver support 1 row per slice  }
  VA_ENC_SLICE_STRUCTURE_EQUAL_ROWS = $00000004;  
{* \brief Driver support max encoded slice size per slice  }
  VA_ENC_SLICE_STRUCTURE_MAX_SLICE_SIZE = $00000008;  
{* \brief Driver supports an arbitrary number of rows per slice.  }
  VA_ENC_SLICE_STRUCTURE_ARBITRARY_ROWS = $00000010;  
{* \brief Driver supports any number of rows per slice but they must be the same
*       for all slices except for the last one, which must be equal or smaller
*       to the previous slices.  }
  VA_ENC_SLICE_STRUCTURE_EQUAL_MULTI_ROWS = $00000020;  
{*@ }
{* \brief Attribute value for VAConfigAttribMaxFrameSize  }
{* \brief support max frame size
          * if max_frame_size == 1, VAEncMiscParameterTypeMaxFrameSize/VAEncMiscParameterBufferMaxFrameSize
          * could be used to set the frame size, if multiple_pass also equal 1, VAEncMiscParameterTypeMultiPassFrameSize
          * VAEncMiscParameterBufferMultiPassFrameSize could be used to set frame size and pass information
           }
{* \brief multiple_pass support  }
{* \brief reserved bits for future, must be zero }
type
  PVAConfigAttribValMaxFrameSize = ^TVAConfigAttribValMaxFrameSize;
  TVAConfigAttribValMaxFrameSize = record
      case longint of
        0 : ( bits : record
            flag0 : longint;
          end );
        1 : ( value : Tuint32_t );
      end;

const
  bm__VAConfigAttribValMaxFrameSize_max_frame_size = $1;
  bp__VAConfigAttribValMaxFrameSize_max_frame_size = 0;
  bm__VAConfigAttribValMaxFrameSize_multiple_pass = $2;
  bp__VAConfigAttribValMaxFrameSize_multiple_pass = 1;
  bm__VAConfigAttribValMaxFrameSize_reserved = $FFFFFFFC;
  bp__VAConfigAttribValMaxFrameSize_reserved = 2;

{* \brief Attribute value for VAConfigAttribEncJPEG  }
{* \brief set to 1 for arithmatic coding.  }
{* \brief set to 1 for progressive dct.  }
{* \brief set to 1 for non-interleaved.  }
{* \brief set to 1 for differential.  }
type
  PVAConfigAttribValEncJPEG = ^TVAConfigAttribValEncJPEG;
  TVAConfigAttribValEncJPEG = record
      case longint of
        0 : ( bits : record
            flag0 : longint;
          end );
        1 : ( value : Tuint32_t );
      end;

const
  bm__VAConfigAttribValEncJPEG_arithmatic_coding_mode = $1;
  bp__VAConfigAttribValEncJPEG_arithmatic_coding_mode = 0;
  bm__VAConfigAttribValEncJPEG_progressive_dct_mode = $2;
  bp__VAConfigAttribValEncJPEG_progressive_dct_mode = 1;
  bm__VAConfigAttribValEncJPEG_non_interleaved_mode = $4;
  bp__VAConfigAttribValEncJPEG_non_interleaved_mode = 2;
  bm__VAConfigAttribValEncJPEG_differential_mode = $8;
  bp__VAConfigAttribValEncJPEG_differential_mode = 3;
  bm__VAConfigAttribValEncJPEG_max_num_components = $70;
  bp__VAConfigAttribValEncJPEG_max_num_components = 4;
  bm__VAConfigAttribValEncJPEG_max_num_scans = $780;
  bp__VAConfigAttribValEncJPEG_max_num_scans = 7;
  bm__VAConfigAttribValEncJPEG_max_num_huffman_tables = $3800;
  bp__VAConfigAttribValEncJPEG_max_num_huffman_tables = 11;
  bm__VAConfigAttribValEncJPEG_max_num_quantization_tables = $1C000;
  bp__VAConfigAttribValEncJPEG_max_num_quantization_tables = 14;

{* @name Attribute values for VAConfigAttribEncQuantization  }
{*@ }
{* \brief Driver does not support special types of quantization  }

const
  VA_ENC_QUANTIZATION_NONE = $00000000;  
{* \brief Driver supports trellis quantization  }
  VA_ENC_QUANTIZATION_TRELLIS_SUPPORTED = $00000001;  
{*@ }
{* @name Attribute values for VAConfigAttribPredictionDirection  }
{*@ }
{* \brief Driver support forward reference frame (inter frame for vpx, P frame for H26x MPEG)
 * can work with the VAConfigAttribEncMaxRefFrames. for example: low delay B frame of HEVC.
 * these value can be OR'd together. typical value should be VA_PREDICTION_DIRECTION_PREVIOUS
 * or VA_PREDICTION_DIRECTION_PREVIOUS | VA_PREDICTION_DIRECTION_FUTURE, theoretically, there
 * are no stream only include future reference frame.
  }
  VA_PREDICTION_DIRECTION_PREVIOUS = $00000001;  
{* \brief Driver support backward prediction frame/slice  }
  VA_PREDICTION_DIRECTION_FUTURE = $00000002;  
{* \brief Dirver require both reference list must be not empty for inter frame  }
  VA_PREDICTION_DIRECTION_BI_NOT_EMPTY = $00000004;  
{*@ }
{* @name Attribute values for VAConfigAttribEncIntraRefresh  }
{*@ }
{* \brief Driver does not support intra refresh  }
  VA_ENC_INTRA_REFRESH_NONE = $00000000;  
{* \brief Driver supports column based rolling intra refresh  }
  VA_ENC_INTRA_REFRESH_ROLLING_COLUMN = $00000001;  
{* \brief Driver supports row based rolling intra refresh  }
  VA_ENC_INTRA_REFRESH_ROLLING_ROW = $00000002;  
{* \brief Driver supports adaptive intra refresh  }
  VA_ENC_INTRA_REFRESH_ADAPTIVE = $00000010;  
{* \brief Driver supports cyclic intra refresh  }
  VA_ENC_INTRA_REFRESH_CYCLIC = $00000020;  
{* \brief Driver supports intra refresh of P frame }
  VA_ENC_INTRA_REFRESH_P_FRAME = $00010000;  
{* \brief Driver supports intra refresh of B frame  }
  VA_ENC_INTRA_REFRESH_B_FRAME = $00020000;  
{* \brief Driver supports intra refresh of multiple reference encoder  }
  VA_ENC_INTRA_REFRESH_MULTI_REF = $00040000;  
{*@ }
{* \brief Attribute value for VAConfigAttribEncROI  }
{* \brief The number of ROI regions supported, 0 if ROI is not supported.  }
{*
         * \brief A flag indicates whether ROI priority is supported
         *
         * \ref roi_rc_priority_support equal to 1 specifies the underlying driver supports
         * ROI priority when VAConfigAttribRateControl != VA_RC_CQP, user can use \c roi_value
         * in #VAEncROI to set ROI priority. \ref roi_rc_priority_support equal to 0 specifies
         * the underlying driver doesn't support ROI priority.
         *
         * User should ignore \ref roi_rc_priority_support when VAConfigAttribRateControl == VA_RC_CQP
         * because ROI delta QP is always required when VAConfigAttribRateControl == VA_RC_CQP.
          }
{*
         * \brief A flag indicates whether ROI delta QP is supported
         *
         * \ref roi_rc_qp_delta_support equal to 1 specifies the underlying driver supports
         * ROI delta QP when VAConfigAttribRateControl != VA_RC_CQP, user can use \c roi_value
         * in #VAEncROI to set ROI delta QP. \ref roi_rc_qp_delta_support equal to 0 specifies
         * the underlying driver doesn't support ROI delta QP.
         *
         * User should ignore \ref roi_rc_qp_delta_support when VAConfigAttribRateControl == VA_RC_CQP
         * because ROI delta QP is always required when VAConfigAttribRateControl == VA_RC_CQP.
          }
type
  PVAConfigAttribValEncROI = ^TVAConfigAttribValEncROI;
  TVAConfigAttribValEncROI = record
      case longint of
        0 : ( bits : record
            flag0 : longint;
          end );
        1 : ( value : Tuint32_t );
      end;

const
  bm__VAConfigAttribValEncROI_num_roi_regions = $FF;
  bp__VAConfigAttribValEncROI_num_roi_regions = 0;
  bm__VAConfigAttribValEncROI_roi_rc_priority_support = $100;
  bp__VAConfigAttribValEncROI_roi_rc_priority_support = 8;
  bm__VAConfigAttribValEncROI_roi_rc_qp_delta_support = $200;
  bp__VAConfigAttribValEncROI_roi_rc_qp_delta_support = 9;
  bm__VAConfigAttribValEncROI_reserved = $FFFFFC00;
  bp__VAConfigAttribValEncROI_reserved = 10;

{* \brief Attribute value for VAConfigAttribEncRateControlExt  }
{*
         * \brief The maximum number of temporal layers minus 1
         *
         * \ref max_num_temporal_layers_minus1 plus 1 specifies the maximum number of temporal
         * layers that supported by the underlying driver. \ref max_num_temporal_layers_minus1
         * equal to 0 implies the underlying driver doesn't support encoding with temporal layer.
          }
{*
         * /brief support temporal layer bit-rate control flag
         *
         * \ref temporal_layer_bitrate_control_flag equal to 1 specifies the underlying driver
         * can support bit-rate control per temporal layer when (#VAConfigAttribRateControl == #VA_RC_CBR ||
         * #VAConfigAttribRateControl == #VA_RC_VBR).
         *
         * The underlying driver must set \ref temporal_layer_bitrate_control_flag to 0 when
         * \c max_num_temporal_layers_minus1 is equal to 0
         *
         * To use bit-rate control per temporal layer, an application must send the right layer
         * structure via #VAEncMiscParameterTemporalLayerStructure at the beginning of a coded sequence
         * and then followed by #VAEncMiscParameterRateControl and #VAEncMiscParameterFrameRate structures
         * for each layer, using the \c temporal_id field as the layer identifier. Otherwise
         * the driver doesn't use bitrate control per temporal layer if an application doesn't send the
         * layer structure via #VAEncMiscParameterTemporalLayerStructure to the driver. The driver returns
         * VA_STATUS_ERROR_INVALID_PARAMETER if an application sends a wrong layer structure or doesn't send
         * #VAEncMiscParameterRateControl and #VAEncMiscParameterFrameRate for each layer.
         *
         * The driver will ignore #VAEncMiscParameterTemporalLayerStructure and the \c temporal_id field
         * in #VAEncMiscParameterRateControl and #VAEncMiscParameterFrameRate if
         * \ref temporal_layer_bitrate_control_flag is equal to 0 or #VAConfigAttribRateControl == #VA_RC_CQP
          }
type
  PVAConfigAttribValEncRateControlExt = ^TVAConfigAttribValEncRateControlExt;
  TVAConfigAttribValEncRateControlExt = record
      case longint of
        0 : ( bits : record
            flag0 : longint;
          end );
        1 : ( value : Tuint32_t );
      end;

const
  bm__VAConfigAttribValEncRateControlExt_max_num_temporal_layers_minus1 = $FF;
  bp__VAConfigAttribValEncRateControlExt_max_num_temporal_layers_minus1 = 0;
  bm__VAConfigAttribValEncRateControlExt_temporal_layer_bitrate_control_flag = $100;
  bp__VAConfigAttribValEncRateControlExt_temporal_layer_bitrate_control_flag = 8;
  bm__VAConfigAttribValEncRateControlExt_reserved = $FFFFFE00;
  bp__VAConfigAttribValEncRateControlExt_reserved = 9;

{* \brief Attribute value for VAConfigAttribMultipleFrame }
{* \brief max num of concurrent frames from different stream  }
{* \brief indicate whether all stream must support same quality level
         *  if mixed_quality_level == 0, same quality level setting for multple streams is required
         *  if mixed_quality_level == 1, different stream can have different quality level }
{* \brief reserved bit for future, must be zero  }
type
  PVAConfigAttribValMultipleFrame = ^TVAConfigAttribValMultipleFrame;
  TVAConfigAttribValMultipleFrame = record
      case longint of
        0 : ( bits : record
            flag0 : longint;
          end );
        1 : ( value : Tuint32_t );
      end;

const
  bm__VAConfigAttribValMultipleFrame_max_num_concurrent_frames = $FF;
  bp__VAConfigAttribValMultipleFrame_max_num_concurrent_frames = 0;
  bm__VAConfigAttribValMultipleFrame_mixed_quality_level = $100;
  bp__VAConfigAttribValMultipleFrame_mixed_quality_level = 8;
  bm__VAConfigAttribValMultipleFrame_reserved = $FFFFFE00;
  bp__VAConfigAttribValMultipleFrame_reserved = 9;

{* brief Attribute value VAConfigAttribValContextPriority  }
{* \brief the priority , for the Query operation (read) it represents highest priority
         * for the set operation (write), value should be [0~highest priority] , 0 is lowest priority }
{* \brief reserved bits for future, must be zero }
type
  PVAConfigAttribValContextPriority = ^TVAConfigAttribValContextPriority;
  TVAConfigAttribValContextPriority = record
      case longint of
        0 : ( bits : record
            flag0 : longint;
          end );
        1 : ( value : Tuint32_t );
      end;

const
  bm__VAConfigAttribValContextPriority_priority = $FFFF;
  bp__VAConfigAttribValContextPriority_priority = 0;
  bm__VAConfigAttribValContextPriority_reserved = $FFFF0000;
  bp__VAConfigAttribValContextPriority_reserved = 16;

{* brief Attribute value VAConfigAttribEncPerBlockControl  }
{* \brief whether to support dela qp per block  }
{* \brief supported size of delta qp block  }
{* \brief size of delta qp per block in bytes }
{* \brief reserved bit for future, must be zero  }
type
  PVAConfigAttribValEncPerBlockControl = ^TVAConfigAttribValEncPerBlockControl;
  TVAConfigAttribValEncPerBlockControl = record
      case longint of
        0 : ( bits : record
            flag0 : longint;
          end );
        1 : ( value : Tuint32_t );
      end;

const
  bm__VAConfigAttribValEncPerBlockControl_delta_qp_support = $1;
  bp__VAConfigAttribValEncPerBlockControl_delta_qp_support = 0;
  bm__VAConfigAttribValEncPerBlockControl_log2_delta_qp_block_size = $1E;
  bp__VAConfigAttribValEncPerBlockControl_log2_delta_qp_block_size = 1;
  bm__VAConfigAttribValEncPerBlockControl_delta_qp_size_in_bytes = $E0;
  bp__VAConfigAttribValEncPerBlockControl_delta_qp_size_in_bytes = 5;
  bm__VAConfigAttribValEncPerBlockControl_reserved = $FFFFFF00;
  bp__VAConfigAttribValEncPerBlockControl_reserved = 8;

{* @name Attribute values for VAConfigAttribProtectedContentCipherAlgorithm  }
{* \brief AES cipher  }

const
  VA_PC_CIPHER_AES = $00000001;  
{* @name Attribute values for VAConfigAttribProtectedContentCipherBlockSize  }
{* \brief 128 bits block size  }
  VA_PC_BLOCK_SIZE_128 = $00000001;  
{* \brief 192 bits block size  }
  VA_PC_BLOCK_SIZE_192 = $00000002;  
{* \brief 256 bits block size  }
  VA_PC_BLOCK_SIZE_256 = $00000004;  
{* @name Attribute values for VAConfigAttribProtectedContentCipherMode  }
{* \brief AES ECB  }
  VA_PC_CIPHER_MODE_ECB = $00000001;  
{* \brief AES CBC  }
  VA_PC_CIPHER_MODE_CBC = $00000002;  
{* \brief AES CTR  }
  VA_PC_CIPHER_MODE_CTR = $00000004;  
{* @name Attribute values for VAConfigAttribProtectedContentCipherSampleType  }
{* \brief Full sample  }
  VA_PC_SAMPLE_TYPE_FULLSAMPLE = $00000001;  
{* \brief Sub sample  }
  VA_PC_SAMPLE_TYPE_SUBSAMPLE = $00000002;  
{* @name Attribute values for VAConfigAttribProtectedContentUsage  }
{* \brief Default usage  }
  VA_PC_USAGE_DEFAULT = $00000000;  
{* \brief Widevine  }
  VA_PC_USAGE_WIDEVINE = $00000001;  
{* @name Attribute values for VAConfigAttribProcessingRate.  }
{*@ }
{* \brief Driver does not support processing rate report  }
  VA_PROCESSING_RATE_NONE = $00000000;  
{* \brief Driver supports encode processing rate report   }
  VA_PROCESSING_RATE_ENCODE = $00000001;  
{* \brief Driver supports decode processing rate report   }
  VA_PROCESSING_RATE_DECODE = $00000002;  
{*@ }
{*
 * if an attribute is not applicable for a given
 * profile/entrypoint pair, then set the value to the following
  }
  VA_ATTRIB_NOT_SUPPORTED = $80000000;  
{* Get maximum number of profiles supported by the implementation  }

function vaMaxNumProfiles(dpy:TVADisplay):longint;cdecl;external;
{* Get maximum number of entrypoints supported by the implementation  }
function vaMaxNumEntrypoints(dpy:TVADisplay):longint;cdecl;external;
{* Get maximum number of attributs supported by the implementation  }
function vaMaxNumConfigAttributes(dpy:TVADisplay):longint;cdecl;external;
{*
 * Query supported profiles
 * The caller must provide a "profile_list" array that can hold at
 * least vaMaxNumProfile() entries. The actual number of profiles
 * returned in "profile_list" is returned in "num_profile".
  }
{ out  }
{ out  }
function vaQueryConfigProfiles(dpy:TVADisplay; profile_list:PVAProfile; num_profiles:Plongint):TVAStatus;cdecl;external;
{*
 * Query supported entrypoints for a given profile
 * The caller must provide an "entrypoint_list" array that can hold at
 * least vaMaxNumEntrypoints() entries. The actual number of entrypoints
 * returned in "entrypoint_list" is returned in "num_entrypoints".
  }
{ out  }
{ out  }
function vaQueryConfigEntrypoints(dpy:TVADisplay; profile:TVAProfile; entrypoint_list:PVAEntrypoint; num_entrypoints:Plongint):TVAStatus;cdecl;external;
{*
 * Get attributes for a given profile/entrypoint pair
 * The caller must provide an "attrib_list" with all attributes to be
 * retrieved.  Upon return, the attributes in "attrib_list" have been
 * updated with their value.  Unknown attributes or attributes that are
 * not supported for the given profile/entrypoint pair will have their
 * value set to VA_ATTRIB_NOT_SUPPORTED
  }
{ in/out  }
function vaGetConfigAttributes(dpy:TVADisplay; profile:TVAProfile; entrypoint:TVAEntrypoint; attrib_list:PVAConfigAttrib; num_attribs:longint):TVAStatus;cdecl;external;
{* Generic ID type, can be re-typed for specific implementation  }
type
  PVAGenericID = ^TVAGenericID;
  TVAGenericID = dword;

  PVAConfigID = ^TVAConfigID;
  TVAConfigID = TVAGenericID;
{*
 * Create a configuration for the video decode/encode/processing pipeline
 * it passes in the attribute list that specifies the attributes it cares
 * about, with the rest taking default values.
  }
{ out  }

function vaCreateConfig(dpy:TVADisplay; profile:TVAProfile; entrypoint:TVAEntrypoint; attrib_list:PVAConfigAttrib; num_attribs:longint; 
           config_id:PVAConfigID):TVAStatus;cdecl;external;
{*
 * Free resources associdated with a given config
  }
function vaDestroyConfig(dpy:TVADisplay; config_id:TVAConfigID):TVAStatus;cdecl;external;
{*
 * Query all attributes for a given configuration
 * The profile of the configuration is returned in "profile"
 * The entrypoint of the configuration is returned in "entrypoint"
 * The caller must provide an "attrib_list" array that can hold at least
 * vaMaxNumConfigAttributes() entries. The actual number of attributes
 * returned in "attrib_list" is returned in "num_attribs"
  }
{ out  }
{ out  }
{ out  }
{ out  }
function vaQueryConfigAttributes(dpy:TVADisplay; config_id:TVAConfigID; profile:PVAProfile; entrypoint:PVAEntrypoint; attrib_list:PVAConfigAttrib; 
           num_attribs:Plongint):TVAStatus;cdecl;external;
{*
 * Contexts and Surfaces
 *
 * Context represents a "virtual" video decode, encode or video processing
 * pipeline. Surfaces are render targets for a given context. The data in the
 * surfaces are not accessible to the client except if derived image is supported
 * and the internal data format of the surface is implementation specific.
 *
 * Surfaces are provided as a hint of what surfaces will be used when the context
 * is created through vaCreateContext(). A surface may be used by different contexts
 * at the same time as soon as application can make sure the operations are synchronized
 * between different contexts, e.g. a surface is used as the output of a decode context
 * and the input of a video process context. Surfaces can only be destroyed after all
 * contexts using these surfaces have been destroyed.
 *
 * Both contexts and surfaces are identified by unique IDs and its
 * implementation specific internals are kept opaque to the clients
  }
type
  PVAContextID = ^TVAContextID;
  TVAContextID = TVAGenericID;

  PVASurfaceID = ^TVASurfaceID;
  TVASurfaceID = TVAGenericID;

const
  VA_INVALID_ID = $ffffffff;  
  VA_INVALID_SURFACE = VA_INVALID_ID;  
{* \brief Generic value types.  }
{*< 32-bit signed integer.  }
{*< 32-bit floating-point value.  }
{*< Generic pointer type  }
{*< Pointer to function  }
type
  PVAGenericValueType = ^TVAGenericValueType;
  TVAGenericValueType =  Longint;
  Const
    VAGenericValueTypeInteger = 1;
    VAGenericValueTypeFloat = 2;
    VAGenericValueTypePointer = 3;
    VAGenericValueTypeFunc = 4;
;
{* \brief Generic function type.  }
type

  TVAGenericFunc = procedure (para1:pointer);cdecl;
{* \brief Generic value.  }
{* \brief Value type. See #VAGenericValueType.  }
{* \brief Value holder.  }
{* \brief 32-bit signed integer.  }
{* \brief 32-bit float.  }
{* \brief Generic pointer.  }
{* \brief Pointer to function.  }

  PVAGenericValue = ^TVAGenericValue;
  TVAGenericValue = record
      _type : TVAGenericValueType;
      value : record
          case longint of
            0 : ( i : Tint32_t );
            1 : ( f : single );
            2 : ( p : pointer );
            3 : ( fn : TVAGenericFunc );
          end;
    end;
{* @name Surface attribute flags  }
{*@ }
{* \brief Surface attribute is not supported.  }

const
  VA_SURFACE_ATTRIB_NOT_SUPPORTED = $00000000;  
{* \brief Surface attribute can be got through vaQuerySurfaceAttributes().  }
  VA_SURFACE_ATTRIB_GETTABLE = $00000001;  
{* \brief Surface attribute can be set through vaCreateSurfaces().  }
  VA_SURFACE_ATTRIB_SETTABLE = $00000002;  
{*@ }
{* \brief Surface attribute types.  }
{*
     * \brief Pixel format as a FOURCC (int, read/write).
     *
     * When vaQuerySurfaceAttributes() is called, the driver will return one
     * PixelFormat attribute per supported pixel format.
     *
     * When provided as an input to vaCreateSurfaces(), the driver will
     * allocate a surface with the provided pixel format.
      }
{* \brief Minimal width in pixels (int, read-only).  }
{* \brief Maximal width in pixels (int, read-only).  }
{* \brief Minimal height in pixels (int, read-only).  }
{* \brief Maximal height in pixels (int, read-only).  }
{* \brief Surface memory type expressed in bit fields (int, read/write).  }
{* \brief External buffer descriptor (pointer, write).
     *
     * Refer to the documentation for the memory type being created to
     * determine what descriptor structure to pass here.  If not otherwise
     * stated, the common VASurfaceAttribExternalBuffers should be used.
      }
{* \brief Surface usage hint, gives the driver a hint of intended usage
     *  to optimize allocation (e.g. tiling) (int, read/write).  }
{* \brief List of possible DRM format modifiers (pointer, write).
     *
     * The value must be a pointer to a VADRMFormatModifierList. This can only
     * be used when allocating a new buffer, it's invalid to use this attribute
     * when importing an existing buffer.
      }
{* \brief Number of surface attributes.  }
type
  PVASurfaceAttribType = ^TVASurfaceAttribType;
  TVASurfaceAttribType =  Longint;
  Const
    VASurfaceAttribNone = 0;
    VASurfaceAttribPixelFormat = 1;
    VASurfaceAttribMinWidth = 2;
    VASurfaceAttribMaxWidth = 3;
    VASurfaceAttribMinHeight = 4;
    VASurfaceAttribMaxHeight = 5;
    VASurfaceAttribMemoryType = 6;
    VASurfaceAttribExternalBufferDescriptor = 7;
    VASurfaceAttribUsageHint = 8;
    VASurfaceAttribDRMFormatModifiers = 9;
    VASurfaceAttribCount = 10;
;
{* \brief Surface attribute.  }
{* \brief Type.  }
{* \brief Flags. See "Surface attribute flags".  }
{* \brief Value. See "Surface attribute types" for the expected types.  }
type
  PVASurfaceAttrib = ^TVASurfaceAttrib;
  TVASurfaceAttrib = record
      _type : TVASurfaceAttribType;
      flags : Tuint32_t;
      value : TVAGenericValue;
    end;
{*
 * @name VASurfaceAttribMemoryType values in bit fields.
 * Bits 0:7 are reserved for generic types. Bits 31:28 are reserved for
 * Linux DRM. Bits 23:20 are reserved for Android. Bits 19:16 are reserved for Win32.
 * DRM, Android and Win32 specific types are defined in respective va_*.h header files.
  }
{*@ }
{* \brief VA memory type (default) is supported.  }

const
  VA_SURFACE_ATTRIB_MEM_TYPE_VA = $00000001;  
{* \brief V4L2 buffer memory type is supported.  }
  VA_SURFACE_ATTRIB_MEM_TYPE_V4L2 = $00000002;  
{* \brief User pointer memory type is supported.  }
  VA_SURFACE_ATTRIB_MEM_TYPE_USER_PTR = $00000004;  
{*@ }
{*
 * \brief VASurfaceAttribExternalBuffers structure for
 * the VASurfaceAttribExternalBufferDescriptor attribute.
  }
{* \brief pixel format in fourcc.  }
{* \brief width in pixels.  }
{* \brief height in pixels.  }
{* \brief total size of the buffer in bytes.  }
{* \brief number of planes for planar layout  }
{* \brief pitch for each plane in bytes  }
{* \brief offset for each plane in bytes  }
{* \brief buffer handles or user pointers  }
{* \brief number of elements in the "buffers" array  }
{* \brief flags. See "Surface external buffer descriptor flags".  }
{* \brief reserved for passing private data  }
type
  PVASurfaceAttribExternalBuffers = ^TVASurfaceAttribExternalBuffers;
  TVASurfaceAttribExternalBuffers = record
      pixel_format : Tuint32_t;
      width : Tuint32_t;
      height : Tuint32_t;
      data_size : Tuint32_t;
      num_planes : Tuint32_t;
      pitches : array[0..3] of Tuint32_t;
      offsets : array[0..3] of Tuint32_t;
      buffers : Puintptr_t;
      num_buffers : Tuint32_t;
      flags : Tuint32_t;
      private_data : pointer;
    end;
{* @name VASurfaceAttribExternalBuffers flags  }
{*@ }
{* \brief Enable memory tiling  }

const
  VA_SURFACE_EXTBUF_DESC_ENABLE_TILING = $00000001;  
{* \brief Memory is cacheable  }
  VA_SURFACE_EXTBUF_DESC_CACHED = $00000002;  
{* \brief Memory is non-cacheable  }
  VA_SURFACE_EXTBUF_DESC_UNCACHED = $00000004;  
{* \brief Memory is write-combined  }
  VA_SURFACE_EXTBUF_DESC_WC = $00000008;  
{* \brief Memory is protected  }
  VA_SURFACE_EXTBUF_DESC_PROTECTED = $80000000;  
{* @name VASurfaceAttribUsageHint attribute usage hint flags  }
{*@ }
{* \brief Surface usage not indicated.  }
  VA_SURFACE_ATTRIB_USAGE_HINT_GENERIC = $00000000;  
{* \brief Surface used by video decoder.  }
  VA_SURFACE_ATTRIB_USAGE_HINT_DECODER = $00000001;  
{* \brief Surface used by video encoder.  }
  VA_SURFACE_ATTRIB_USAGE_HINT_ENCODER = $00000002;  
{* \brief Surface read by video post-processing.  }
  VA_SURFACE_ATTRIB_USAGE_HINT_VPP_READ = $00000004;  
{* \brief Surface written by video post-processing.  }
  VA_SURFACE_ATTRIB_USAGE_HINT_VPP_WRITE = $00000008;  
{* \brief Surface used for display.  }
  VA_SURFACE_ATTRIB_USAGE_HINT_DISPLAY = $00000010;  
{* \brief Surface used for export to third-party APIs, e.g. via
 *  vaExportSurfaceHandle().  }
  VA_SURFACE_ATTRIB_USAGE_HINT_EXPORT = $00000020;  
{*@ }
{*
 * \brief Queries surface attributes for the supplied config.
 *
 * This function queries for all supported attributes for the
 * supplied VA \c config. In particular, if the underlying hardware
 * supports the creation of VA surfaces in various formats, then
 * this function will enumerate all pixel formats that are supported.
 *
 * The \c attrib_list array is allocated by the user and \c
 * num_attribs shall be initialized to the number of allocated
 * elements in that array. Upon successful return, the actual number
 * of attributes will be overwritten into \c num_attribs. Otherwise,
 * \c VA_STATUS_ERROR_MAX_NUM_EXCEEDED is returned and \c num_attribs
 * is adjusted to the number of elements that would be returned if
 * enough space was available.
 *
 * Note: it is perfectly valid to pass NULL to the \c attrib_list
 * argument when vaQuerySurfaceAttributes() is used to determine the
 * actual number of elements that need to be allocated.
 *
 * @param[in] dpy               the VA display
 * @param[in] config            the config identifying a codec or a video
 *     processing pipeline
 * @param[out] attrib_list      the output array of #VASurfaceAttrib elements
 * @param[in,out] num_attribs   the number of elements allocated on
 *      input, the number of elements actually filled in output
  }

function vaQuerySurfaceAttributes(dpy:TVADisplay; config:TVAConfigID; attrib_list:PVASurfaceAttrib; num_attribs:Pdword):TVAStatus;cdecl;external;
{*
 * \brief Creates an array of surfaces
 *
 * Creates an array of surfaces. The optional list of attributes shall
 * be constructed based on what the underlying hardware could expose
 * through vaQuerySurfaceAttributes().
 *
 * @param[in] dpy               the VA display
 * @param[in] format            the desired surface format. See \c VA_RT_FORMAT_*
 * @param[in] width             the surface width
 * @param[in] height            the surface height
 * @param[out] surfaces         the array of newly created surfaces
 * @param[in] num_surfaces      the number of surfaces to create
 * @param[in] attrib_list       the list of (optional) attributes, or \c NULL
 * @param[in] num_attribs       the number of attributes supplied in
 *     \c attrib_list, or zero
  }
function vaCreateSurfaces(dpy:TVADisplay; format:dword; width:dword; height:dword; surfaces:PVASurfaceID; 
           num_surfaces:dword; attrib_list:PVASurfaceAttrib; num_attribs:dword):TVAStatus;cdecl;external;
{*
 * vaDestroySurfaces - Destroy resources associated with surfaces.
 *  Surfaces can only be destroyed after all contexts using these surfaces have been
 *  destroyed.
 *  dpy: display
 *  surfaces: array of surfaces to destroy
 *  num_surfaces: number of surfaces in the array to be destroyed.
  }
function vaDestroySurfaces(dpy:TVADisplay; surfaces:PVASurfaceID; num_surfaces:longint):TVAStatus;cdecl;external;
const
  VA_PROGRESSIVE = $1;  
{*
 * vaCreateContext - Create a context
 *  dpy: display
 *  config_id: configuration for the context
 *  picture_width: coded picture width
 *  picture_height: coded picture height
 *  flag: any combination of the following:
 *    VA_PROGRESSIVE (only progressive frame pictures in the sequence when set)
 *  render_targets: a hint for render targets (surfaces) tied to the context
 *  num_render_targets: number of render targets in the above array
 *  context: created context id upon return
  }
{ out  }

function vaCreateContext(dpy:TVADisplay; config_id:TVAConfigID; picture_width:longint; picture_height:longint; flag:longint; 
           render_targets:PVASurfaceID; num_render_targets:longint; context:PVAContextID):TVAStatus;cdecl;external;
{*
 * vaDestroyContext - Destroy a context
 *  dpy: display
 *  context: context to be destroyed
  }
function vaDestroyContext(dpy:TVADisplay; context:TVAContextID):TVAStatus;cdecl;external;
{Multi-frame context }
type
  PVAMFContextID = ^TVAMFContextID;
  TVAMFContextID = TVAGenericID;
{*
 * vaCreateMFContext - Create a multi-frame context
 *  interface encapsulating common for all streams memory objects and structures
 *  required for single GPU task submission from several VAContextID's.
 *  Allocation: This call only creates an instance, doesn't allocate any additional memory.
 *  Support identification: Application can identify multi-frame feature support by ability
 *  to create multi-frame context. If driver supports multi-frame - call successful,
 *  mf_context != NULL and VAStatus = VA_STATUS_SUCCESS, otherwise if multi-frame processing
 *  not supported driver returns VA_STATUS_ERROR_UNIMPLEMENTED and mf_context = NULL.
 *  return values:
 *  VA_STATUS_SUCCESS - operation successful.
 *  VA_STATUS_ERROR_UNIMPLEMENTED - no support for multi-frame.
 *  dpy: display adapter.
 *  mf_context: Multi-Frame context encapsulating all associated context
 *  for multi-frame submission.
  }
{ out  }

function vaCreateMFContext(dpy:TVADisplay; mf_context:PVAMFContextID):TVAStatus;cdecl;external;
{*
 * vaMFAddContext - Provide ability to associate each context used for
 *  Multi-Frame submission and common Multi-Frame context.
 *  Try to add context to understand if it is supported.
 *  Allocation: this call allocates and/or reallocates all memory objects
 *  common for all contexts associated with particular Multi-Frame context.
 *  All memory required for each context(pixel buffers, internal driver
 *  buffers required for processing) allocated during standard vaCreateContext call for each context.
 *  Runtime dependency - if current implementation doesn't allow to run different entry points/profile,
 *  first context added will set entry point/profile for whole Multi-Frame context,
 *  all other entry points and profiles can be rejected to be added.
 *  Return values:
 *  VA_STATUS_SUCCESS - operation successful, context was added.
 *  VA_STATUS_ERROR_OPERATION_FAILED - something unexpected happened - application have to close
 *  current mf_context and associated contexts and start working with new ones.
 *  VA_STATUS_ERROR_INVALID_CONTEXT - ContextID is invalid, means:
 *  1 - mf_context is not valid context or
 *  2 - driver can't suport different VAEntrypoint or VAProfile simultaneosly
 *  and current context contradicts with previously added, application can continue with current mf_context
 *  and other contexts passed this call, rejected context can continue work in stand-alone
 *  mode or other mf_context.
 *  VA_STATUS_ERROR_UNSUPPORTED_ENTRYPOINT - particular context being added was created with with
 *  unsupported VAEntrypoint. Application can continue with current mf_context
 *  and other contexts passed this call, rejected context can continue work in stand-alone
 *  mode.
 *  VA_STATUS_ERROR_UNSUPPORTED_PROFILE - Current context with Particular VAEntrypoint is supported
 *  but VAProfile is not supported. Application can continue with current mf_context
 *  and other contexts passed this call, rejected context can continue work in stand-alone
 *  mode.
 *  dpy: display adapter.
 *  context: context being associated with Multi-Frame context.
 *  mf_context: - multi-frame context used to associate contexts for multi-frame submission.
  }
function vaMFAddContext(dpy:TVADisplay; mf_context:TVAMFContextID; context:TVAContextID):TVAStatus;cdecl;external;
{*
 * vaMFReleaseContext - Removes context from multi-frame and
 *  association with multi-frame context.
 *  After association removed vaEndPicture will submit tasks, but not vaMFSubmit.
 *  Return values:
 *  VA_STATUS_SUCCESS - operation successful, context was removed.
 *  VA_STATUS_ERROR_OPERATION_FAILED - something unexpected happened.
 *  application need to destroy this VAMFContextID and all assotiated VAContextID
 *  dpy: display
 *  mf_context: VAMFContextID where context is added
 *  context: VAContextID to be added
  }
function vaMFReleaseContext(dpy:TVADisplay; mf_context:TVAMFContextID; context:TVAContextID):TVAStatus;cdecl;external;
{*
 * Buffers
 * Buffers are used to pass various types of data from the
 * client to the server. The server maintains a data store
 * for each buffer created, and the client idenfies a buffer
 * through a unique buffer id assigned by the server.
  }
type
  PVABufferID = ^TVABufferID;
  TVABufferID = TVAGenericID;
{ Following are encode buffer types  }
{*
     * \brief Encoding QP buffer
     *
     * This buffer contains QP per MB for encoding. Currently
     * VAEncQPBufferH264 is defined for H.264 encoding, see
     * #VAEncQPBufferH264 for details
      }
{ Following are video processing buffer types  }
{*
     * \brief Video processing pipeline parameter buffer.
     *
     * This buffer describes the video processing pipeline. See
     * #VAProcPipelineParameterBuffer for details.
      }
{*
     * \brief Video filter parameter buffer.
     *
     * This buffer describes the video filter parameters. All buffers
     * inherit from #VAProcFilterParameterBufferBase, thus including
     * a unique filter buffer type.
     *
     * The default buffer used by most filters is #VAProcFilterParameterBuffer.
     * Filters requiring advanced parameters include, but are not limited to,
     * deinterlacing (#VAProcFilterParameterBufferDeinterlacing),
     * color balance (#VAProcFilterParameterBufferColorBalance), etc.
      }
{*
     * \brief FEI specific buffer types
      }
{* \brief Statistics output for VAEntrypointStats progressive and top field of interlaced case }
{* \brief Statistics output for VAEntrypointStats bottom field of interlaced case }
{* Force MB's to be non skip for encode.it's per-mb control buffer, The width of the MB map
     * Surface is (width of the Picture in MB unit) * 1 byte, multiple of 64 bytes.
     * The height is (height of the picture in MB unit). The picture is either
     * frame or non-interleaved top or bottom field.  If the application provides this
     *surface, it will override the "skipCheckDisable" setting in VAEncMiscParameterEncQuality.
      }
{*
     * \brief HEVC FEI CTB level cmd buffer
     * it is CTB level information for future usage.
      }
{*
     * \brief HEVC FEI CU level data buffer
     * it's CTB level information for future usage
      }
{* decode stream out buffer, intermedia data of decode, it may include MV, MB mode etc.
      * it can be used to detect motion and analyze the frame contain   }
{* \brief HEVC Decoding Subset Parameter buffer type
     *
     * The subsets parameter buffer is concatenation with one or multiple
     * subset entry point offsets. All the offset values are layed out one
     * by one according to slice order with first slice segment first, second
     * slice segment second, etc... The entry number is indicated by parameter
     * \ref num_entry_point_offsets. And the first entry position of the entry
     * point offsets for any slice segment is indicated by parameter
     * entry_offset_to_subset_array in VAPictureParameterBufferHEVC data structure.
      }
{* \brief adjust context parameters dynamically
     *
     * this parameter is used to update context parameters, detail parameter is in
     *  \c VAContextParameterUpdateBuffer
      }
{*
     * \brief Protected session execution buffer type
     *
     * It's for TEE execution usage (vaProtectedSessionExecute()). The buffer structure is in
     * \c VAProtectedSessionExecuteBuffer
      }
{* \brief Encryption parameters buffer for protected content session.
     *
     * Refer to \c VAEncryptionParameters
     }
{*
     * \brief Encoding delta QP per block buffer
     *
     * This buffer only could be created and accepted
     * when \c VAConfigAttribValEncPerBlockControl delta_qp_support == 1.
     * This input buffer contains delta QP per block for encoding.
     * The supported size of delta QP block and the size of delta QP
     * must be quried from \c VAConfigAttribValEncPerBlockControl.
      }

  PVABufferType = ^TVABufferType;
  TVABufferType =  Longint;
  Const
    VAPictureParameterBufferType = 0;
    VAIQMatrixBufferType = 1;
    VABitPlaneBufferType = 2;
    VASliceGroupMapBufferType = 3;
    VASliceParameterBufferType = 4;
    VASliceDataBufferType = 5;
    VAMacroblockParameterBufferType = 6;
    VAResidualDataBufferType = 7;
    VADeblockingParameterBufferType = 8;
    VAImageBufferType = 9;
    VAProtectedSliceDataBufferType = 10;
    VAQMatrixBufferType = 11;
    VAHuffmanTableBufferType = 12;
    VAProbabilityBufferType = 13;
    VAEncCodedBufferType = 21;
    VAEncSequenceParameterBufferType = 22;
    VAEncPictureParameterBufferType = 23;
    VAEncSliceParameterBufferType = 24;
    VAEncPackedHeaderParameterBufferType = 25;
    VAEncPackedHeaderDataBufferType = 26;
    VAEncMiscParameterBufferType = 27;
    VAEncMacroblockParameterBufferType = 28;
    VAEncMacroblockMapBufferType = 29;
    VAEncQPBufferType = 30;
    VAProcPipelineParameterBufferType = 41;
    VAProcFilterParameterBufferType = 42;
    VAEncFEIMVBufferType = 43;
    VAEncFEIMBCodeBufferType = 44;
    VAEncFEIDistortionBufferType = 45;
    VAEncFEIMBControlBufferType = 46;
    VAEncFEIMVPredictorBufferType = 47;
    VAStatsStatisticsParameterBufferType = 48;
    VAStatsStatisticsBufferType = 49;
    VAStatsStatisticsBottomFieldBufferType = 50;
    VAStatsMVBufferType = 51;
    VAStatsMVPredictorBufferType = 52;
    VAEncMacroblockDisableSkipMapBufferType = 53;
    VAEncFEICTBCmdBufferType = 54;
    VAEncFEICURecordBufferType = 55;
    VADecodeStreamoutBufferType = 56;
    VASubsetsParameterBufferType = 57;
    VAContextParameterUpdateBufferType = 58;
    VAProtectedSessionExecuteBufferType = 59;
    VAEncryptionParameterBufferType = 60;
    VAEncDeltaQpPerBlockBufferType = 61;
    VABufferTypeMax = 62;
;
{* \brief update the context parameter
 * this structure is used to update context parameters, such as priority of the context
 * backend driver should keep the parameter unchanged if there no new
 * parameter updated.
  }
{* \brief indicate whether context priority changed  }
{* \brief Reserved bits for future use, must be zero  }
{* \brief task/context priority  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAContextParameterUpdateBuffer = ^TVAContextParameterUpdateBuffer;
  TVAContextParameterUpdateBuffer = record
      flags : record
          case longint of
            0 : ( bits : record
                flag0 : longint;
              end );
            1 : ( value : Tuint32_t );
          end;
      context_priority : TVAConfigAttribValContextPriority;
      reserved : array[0..(VA_PADDING_MEDIUM)-1] of Tuint32_t;
    end;

const
  bm__VAContextParameterUpdateBuffer_context_priority_update = $1;
  bp__VAContextParameterUpdateBuffer_context_priority_update = 0;
  bm__VAContextParameterUpdateBuffer_reserved = $FFFFFFFE;
  bp__VAContextParameterUpdateBuffer_reserved = 1;

{*
 * These ENCRYPTION_TYPEs are used for the attribute values for
 * \c VAConfigAttribEncryption and for encryption_type in
 * VAEncryptionParameters.
 *
 * When used for \c VAConfigAttribEncryption, it be used via
 * vaQueryConfigEntrypoints to check which type are supported for specific
 * profile or not.
 *
 * When used for encryption_type in VAEncryptionParameters, it tells driver
 * the parameters in VAEncryptionParameters are used for which encryption type.
  }
{ AES CTR fullsample  }

const
  VA_ENCRYPTION_TYPE_FULLSAMPLE_CTR = $00000001;  
{ AES CBC fullsample  }
  VA_ENCRYPTION_TYPE_FULLSAMPLE_CBC = $00000002;  
{ AES CTR fullsample  }
  VA_ENCRYPTION_TYPE_SUBSAMPLE_CTR = $00000004;  
{ AES CBC fullsample  }
  VA_ENCRYPTION_TYPE_SUBSAMPLE_CBC = $00000008;  
{* \brief structure for encrypted segment info.  }
{* \brief  The offset relative to the start of the bitstream input in
     *  bytes of the start of the segment  }
{* \brief  The length of the segments in bytes  }
{* \brief  The length in bytes of the remainder of an incomplete block
     *  from a previous segment }
{* \brief  The length in bytes of the initial clear data  }
{* \brief  This will be AES counter for secure decode and secure encode
     *  when numSegments equals 1, valid size is specified by
     * \c key_blob_size  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAEncryptionSegmentInfo = ^TVAEncryptionSegmentInfo;
  TVAEncryptionSegmentInfo = record
      segment_start_offset : Tuint32_t;
      segment_length : Tuint32_t;
      partial_aes_block_size : Tuint32_t;
      init_byte_length : Tuint32_t;
      aes_cbc_iv_or_ctr : array[0..63] of Tuint8_t;
      va_reserved : array[0..(VA_PADDING_MEDIUM)-1] of Tuint32_t;
    end;
{* \brief Encryption parameters buffer for VAEncryptionParameterBufferType  }
{* \brief Encryption type, refer to \c VA_ENCRYPTION_TYPE_FULLSAMPLE_CTR,
     * \c VA_ENCRYPTION_TYPE_FULLSAMPLE_CBC, \c VA_ENCRYPTION_TYPE_SUBSAMPLE_CTR,
     * or \c VA_ENCRYPTION_TYPE_SUBSAMPLE_CBC  }
{* \brief The number of sengments  }
{* \brief Pointer of segments  }
{* \brief The status report index reserved for CENC fullsample workload.
     * The related structures and definitions are vendor specific.
     }
{* \brief CENC counter length  }
{* \brief Wrapped decrypt blob (Snd)kb, valid size is specified by
     * \c key_blob_size  }
{* \brief Wrapped Key blob info (Sne)kb, valid size is specified by
     * \c key_blob_size  }
{* \brief key blob size
     * It could be \c VA_PC_BLOCK_SIZE_128, \c VA_PC_BLOCK_SIZE_192, or
     * \c VA_PC_BLOCK_SIZE_256
      }
{* \brief Indicates the number of 16-byte BLOCKS that are encrypted in any
     *  given encrypted region of segments.
     *  If this value is zero:
     *    1. All bytes in encrypted region of segments are encrypted, i.e. the
     *       CENC or CBC1 scheme is being used
     *    2. blocks_stripe_clear must also be zero.
     *  If this value is non-zero, blocks_stripe_clear must also be non-zero.
      }
{* \brief Indicates the number of 16-byte BLOCKS that are clear in any given
     *  encrypted region of segments, as defined by the CENS and CBCS schemes in
     *  the common encryption spec.
     *  If this value is zero, all bytes in encrypted region of segments are
     *  encrypted, i.e. the CENC or CBC1 scheme is being used.
      }
{* \brief Reserved bytes for future use, must be zero  }

  PVAEncryptionParameters = ^TVAEncryptionParameters;
  TVAEncryptionParameters = record
      encryption_type : Tuint32_t;
      num_segments : Tuint32_t;
      segment_info : PVAEncryptionSegmentInfo;
      status_report_index : Tuint32_t;
      size_of_length : Tuint32_t;
      wrapped_decrypt_blob : array[0..63] of Tuint8_t;
      wrapped_encrypt_blob : array[0..63] of Tuint8_t;
      key_blob_size : Tuint32_t;
      blocks_stripe_encrypted : Tuint32_t;
      blocks_stripe_clear : Tuint32_t;
      va_reserved : array[0..(VA_PADDING_MEDIUM)-1] of Tuint32_t;
    end;
{*
 * Processing rate parameter for encode.
  }
{* \brief Profile level  }
{* \brief quality level. When set to 0, default quality
     * level is used.
      }
{* \brief Period between I frames.  }
{* \brief Period between I/P frames.  }

  PVAProcessingRateParameterEnc = ^TVAProcessingRateParameterEnc;
  TVAProcessingRateParameterEnc = record
      level_idc : Tuint8_t;
      reserved : array[0..2] of Tuint8_t;
      quality_level : Tuint32_t;
      intra_period : Tuint32_t;
      ip_period : Tuint32_t;
    end;
{*
 * Processing rate parameter for decode.
  }
{* \brief Profile level  }

  PVAProcessingRateParameterDec = ^TVAProcessingRateParameterDec;
  TVAProcessingRateParameterDec = record
      level_idc : Tuint8_t;
      reserved0 : array[0..2] of Tuint8_t;
      reserved : Tuint32_t;
    end;

  PVAProcessingRateParameter = ^TVAProcessingRateParameter;
  TVAProcessingRateParameter = record
      uni : record
          case longint of
            0 : ( proc_buf_enc : TVAProcessingRateParameterEnc );
            1 : ( proc_buf_dec : TVAProcessingRateParameterDec );
          end;
    end;
{*
 * \brief Queries processing rate for the supplied config.
 *
 * This function queries the processing rate based on parameters in
 * \c proc_buf for the given \c config. Upon successful return, the processing
 * rate value will be stored in \c processing_rate. Processing rate is
 * specified as the number of macroblocks/CTU per second.
 *
 * If NULL is passed to the \c proc_buf, the default processing rate for the
 * given configuration will be returned.
 *
 * @param[in] dpy               the VA display
 * @param[in] config            the config identifying a codec or a video
 *     processing pipeline
 * @param[in] proc_buf       the buffer that contains the parameters for
        either the encode or decode processing rate
 * @param[out] processing_rate  processing rate in number of macroblocks per
        second constrained by parameters specified in proc_buf
 *
  }

function vaQueryProcessingRate(dpy:TVADisplay; config:TVAConfigID; proc_buf:PVAProcessingRateParameter; processing_rate:Pdword):TVAStatus;cdecl;external;
{* \brief Buffer type used to express a maximum frame size (in bits).  }
{* \brief Buffer type used for HRD parameters.  }
{* \brief Buffer type used for Rolling intra refresh  }
{* \brief Buffer type used for quantization parameters, it's per-sequence parameter }
{* \brief Buffer type used for sending skip frame parameters to the encoder's
      * rate control, when the user has externally skipped frames.  }
{* \brief Buffer type used for region-of-interest (ROI) parameters.  }
{* \brief Buffer type used to express a maximum frame size (in bytes) settings for multiple pass.  }
{* \brief Buffer type used for temporal layer structure  }
{* \brief Buffer type used for dirty region-of-interest (ROI) parameters.  }
{* \brief Buffer type used for parallel BRC parameters.  }
{* \brief Set MB partion mode mask and Half-pel/Quant-pel motion search  }
{* \brief set encode quality tuning  }
{* \brief Buffer type used for encoder rounding offset parameters.  }
{* \brief Buffer type used for FEI input frame level parameters  }
{* \brief encode extension buffer, ect. MPEG2 Sequence extenstion data  }
type
  PVAEncMiscParameterType = ^TVAEncMiscParameterType;
  TVAEncMiscParameterType =  Longint;
  Const
    VAEncMiscParameterTypeFrameRate = 0;
    VAEncMiscParameterTypeRateControl = 1;
    VAEncMiscParameterTypeMaxSliceSize = 2;
    VAEncMiscParameterTypeAIR = 3;
    VAEncMiscParameterTypeMaxFrameSize = 4;
    VAEncMiscParameterTypeHRD = 5;
    VAEncMiscParameterTypeQualityLevel = 6;
    VAEncMiscParameterTypeRIR = 7;
    VAEncMiscParameterTypeQuantization = 8;
    VAEncMiscParameterTypeSkipFrame = 9;
    VAEncMiscParameterTypeROI = 10;
    VAEncMiscParameterTypeMultiPassFrameSize = 11;
    VAEncMiscParameterTypeTemporalLayerStructure = 12;
    VAEncMiscParameterTypeDirtyRect = 13;
    VAEncMiscParameterTypeParallelBRC = 14;
    VAEncMiscParameterTypeSubMbPartPel = 15;
    VAEncMiscParameterTypeEncQuality = 16;
    VAEncMiscParameterTypeCustomRoundingControl = 17;
    VAEncMiscParameterTypeFEIFrameControl = 18;
    VAEncMiscParameterTypeExtensionData = 19;
;
{* \brief Packed header type.  }
{* \brief Packed sequence header.  }
{* \brief Packed picture header.  }
{* \brief Packed slice header.  }
{*
     * \brief Packed raw header.
     *
     * Packed raw data header can be used by the client to insert a header
     * into the bitstream data buffer at the point it is passed, the driver
     * will handle the raw packed header based on "has_emulation_bytes" field
     * in the packed header parameter structure.
      }
{*
     * \brief Misc packed header. See codec-specific definitions.
     *
     * @deprecated
     * This is a deprecated packed header type. All applications can use
     * \c VAEncPackedHeaderRawData to insert a codec-specific packed header
      }
type
  PVAEncPackedHeaderType = ^TVAEncPackedHeaderType;
  TVAEncPackedHeaderType =  Longint;
  Const
    VAEncPackedHeaderSequence = 1;
    VAEncPackedHeaderPicture = 2;
    VAEncPackedHeaderSlice = 3;
    VAEncPackedHeaderRawData = 4;
    VAEncPackedHeaderMiscMask = $80000000;
;
{* \brief Packed header parameter.  }
{* Type of the packed header buffer. See #VAEncPackedHeaderType.  }
{* \brief Size of the #VAEncPackedHeaderDataBuffer in bits.  }
{* \brief Flag: buffer contains start code emulation prevention bytes?  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAEncPackedHeaderParameterBuffer = ^TVAEncPackedHeaderParameterBuffer;
  TVAEncPackedHeaderParameterBuffer = record
      _type : Tuint32_t;
      bit_length : Tuint32_t;
      has_emulation_bytes : Tuint8_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{*
 *  For application, e.g. set a new bitrate
 *    VABufferID buf_id;
 *    VAEncMiscParameterBuffer *misc_param;
 *    VAEncMiscParameterRateControl *misc_rate_ctrl;
 *
 *    vaCreateBuffer(dpy, context, VAEncMiscParameterBufferType,
 *              sizeof(VAEncMiscParameterBuffer) + sizeof(VAEncMiscParameterRateControl),
 *              1, NULL, &buf_id);
 *
 *    vaMapBuffer(dpy,buf_id,(void **)&misc_param);
 *    misc_param->type = VAEncMiscParameterTypeRateControl;
 *    misc_rate_ctrl= (VAEncMiscParameterRateControl *)misc_param->data;
 *    misc_rate_ctrl->bits_per_second = 6400000;
 *    vaUnmapBuffer(dpy, buf_id);
 *    vaRenderPicture(dpy, context, &buf_id, 1);
  }

  PVAEncMiscParameterBuffer = ^TVAEncMiscParameterBuffer;
  TVAEncMiscParameterBuffer = record
      _type : TVAEncMiscParameterType;
      data : Puint32_t;
    end;
{* \brief Temporal layer Structure }
{* \brief The number of temporal layers  }
{* \brief The length of the array defining frame layer membership. Should be 1-32  }
{*
     * \brief The array indicating the layer id for each frame
     *
     * The layer id for the first frame in a coded sequence is always 0, so layer_id[] specifies the layer
     * ids for frames starting from the 2nd frame.
      }
{* \brief Reserved bytes for future use, must be zero  }

  PVAEncMiscParameterTemporalLayerStructure = ^TVAEncMiscParameterTemporalLayerStructure;
  TVAEncMiscParameterTemporalLayerStructure = record
      number_of_layers : Tuint32_t;
      periodicity : Tuint32_t;
      layer_id : array[0..31] of Tuint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{* \brief Rate control parameters  }
{* The maximum bit-rate which the the rate controller should generate.  }
{* The target bit-rate which the rate controller should generate, as a percentage of the
     * maximum bit-rate.
     *
     * In CBR mode this value is ignored (treated as 100%).
      }
{* Rate control window size in milliseconds.
     *
     * The rate controller will attempt to guarantee that the target and maximum bit-rates are
     * correct over this window.
      }
{* Initial quantiser value used at the start of the stream.
     *
     * Ignored if set to zero.
      }
{* Minimum quantiser value to use.
     *
     * The quantiser will not go below the value - if this limit is hit, the output bitrate may
     * be lower than the target.  Ignored if set to zero.
      }
{* Basic unit size.
     *
     * Only used by some drivers - see driver documentation for details.  Set to zero if unused.
      }
{* Force rate controller reset.
             *
             * The next frame will be treated as the start of a new stream, with all rate
             * controller state reset to its initial values.
              }
{* Disable frame skip in rate control mode.  }
{* Disable bit stuffing in rate control mode.  }
{* Macroblock-level rate control.
             *
             * 0: use default, 1: always enable, 2: always disable, other: reserved.
             *
             * This feature is only available if VAConfigAttribRateControl has the
             * \ref VA_RC_MB bit set.
              }
{* The temporal layer that these rate control parameters apply to.  }
{* Ensure that intra frames also conform to the constant frame size.  }
{* Enable parallel rate control for hierarchical B frames.
             *
             * See \ref VA_RC_PARALLEL.
              }
{* Frame tolerance mode.
             *
             *  Indicates the tolerance the application has to variations in the frame size.
             *  For example, wireless display scenarios may require very steady bit rate to
             *  reduce buffering time. It affects the rate control algorithm used,
             *  but may or may not have an effect based on the combination of other BRC
             *  parameters.  Only valid when the driver reports support for
             *  #VAConfigAttribFrameSizeToleranceSupport.
             *
             *  equals 0    -- normal mode;
             *  equals 1    -- maps to sliding window;
             *  equals 2    -- maps to low delay mode;
             *  other       -- invalid.
              }
{* Reserved for future use, must be zero.  }
{* Initial quality factor used in ICQ mode.
     *
     * This value must be between 1 and 51.
     * this value will be deprecated in future, to use quality_factor instead of it.
      }
{* Maximum quantiser value to use.
     *
     * The quantiser will not go above this value - if this limit is hit, the output bitrate
     * may exceed the target.  Ignored if set to zero.
      }
{* Quality factor
     *
     *  the range will be different for different codec
      }
{* Target frame size
     *
     *  Desired frame size in bytes.
     *  This parameter can be used in some RC modes (like Transport Controlled BRC)
     *  where feedback from the app is required.
     *  Zero value means no limits.
     *
      }
{* Reserved bytes for future use, must be zero.  }

  PVAEncMiscParameterRateControl = ^TVAEncMiscParameterRateControl;
  TVAEncMiscParameterRateControl = record
      bits_per_second : Tuint32_t;
      target_percentage : Tuint32_t;
      window_size : Tuint32_t;
      initial_qp : Tuint32_t;
      min_qp : Tuint32_t;
      basic_unit_size : Tuint32_t;
      rc_flags : record
          case longint of
            0 : ( bits : record
                flag0 : longint;
              end );
            1 : ( value : Tuint32_t );
          end;
      ICQ_quality_factor : Tuint32_t;
      max_qp : Tuint32_t;
      quality_factor : Tuint32_t;
      target_frame_size : Tuint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;

const
  bm__VAEncMiscParameterRateControl_reset = $1;
  bp__VAEncMiscParameterRateControl_reset = 0;
  bm__VAEncMiscParameterRateControl_disable_frame_skip = $2;
  bp__VAEncMiscParameterRateControl_disable_frame_skip = 1;
  bm__VAEncMiscParameterRateControl_disable_bit_stuffing = $4;
  bp__VAEncMiscParameterRateControl_disable_bit_stuffing = 2;
  bm__VAEncMiscParameterRateControl_mb_rate_control = $78;
  bp__VAEncMiscParameterRateControl_mb_rate_control = 3;
  bm__VAEncMiscParameterRateControl_temporal_id = $7F80;
  bp__VAEncMiscParameterRateControl_temporal_id = 7;
  bm__VAEncMiscParameterRateControl_cfs_I_frames = $8000;
  bp__VAEncMiscParameterRateControl_cfs_I_frames = 15;
  bm__VAEncMiscParameterRateControl_enable_parallel_brc = $10000;
  bp__VAEncMiscParameterRateControl_enable_parallel_brc = 16;
  bm__VAEncMiscParameterRateControl_enable_dynamic_scaling = $20000;
  bp__VAEncMiscParameterRateControl_enable_dynamic_scaling = 17;
  bm__VAEncMiscParameterRateControl_frame_tolerance_mode = $C0000;
  bp__VAEncMiscParameterRateControl_frame_tolerance_mode = 18;
  bm__VAEncMiscParameterRateControl_reserved = $FFF00000;
  bp__VAEncMiscParameterRateControl_reserved = 20;

{* Encode framerate parameters.
 *
 * Sets the encode framerate used by the rate controller.  This should be
 * provided in all modes using a bitrate target (variable framerate is not
 * supported).
  }
{* Encode framerate.
     *
     * The framerate is specified as a number of frames per second, as a
     * fraction.  The denominator of the fraction is given in the top half
     * (the high two bytes) of the framerate field, and the numerator is
     * given in the bottom half (the low two bytes).
     *
     * That is:
     * denominator = framerate >> 16 & 0xffff;
     * numerator   = framerate & 0xffff;
     * fps         = numerator / denominator;
     *
     * For example, if framerate is set to (100 << 16 | 750), this is
     * 750 / 100, hence 7.5fps.
     *
     * If the denominator is zero (the high two bytes are both zero) then
     * it takes the value one instead, so the framerate is just the integer
     * in the low 2 bytes.
      }
{* The temporal layer that these framerate parameters apply to.  }
{* Reserved for future use, must be zero.  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAEncMiscParameterFrameRate = ^TVAEncMiscParameterFrameRate;
  TVAEncMiscParameterFrameRate = record
      framerate : Tuint32_t;
      framerate_flags : record
          case longint of
            0 : ( bits : record
                flag0 : longint;
              end );
            1 : ( value : Tuint32_t );
          end;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;

const
  bm__VAEncMiscParameterFrameRate_temporal_id = $FF;
  bp__VAEncMiscParameterFrameRate_temporal_id = 0;
  bm__VAEncMiscParameterFrameRate_reserved = $FFFFFF00;
  bp__VAEncMiscParameterFrameRate_reserved = 8;

{*
 * Allow a maximum slice size to be specified (in bits).
 * The encoder will attempt to make sure that individual slices do not exceed this size
 * Or to signal applicate if the slice size exceed this size, see "status" of VACodedBufferSegment
  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAEncMiscParameterMaxSliceSize = ^TVAEncMiscParameterMaxSliceSize;
  TVAEncMiscParameterMaxSliceSize = record
      max_slice_size : Tuint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{ if set to 1 then hardware auto-tune the AIR threshold  }
{* \brief Reserved bytes for future use, must be zero  }

  PVAEncMiscParameterAIR = ^TVAEncMiscParameterAIR;
  TVAEncMiscParameterAIR = record
      air_num_mbs : Tuint32_t;
      air_threshold : Tuint32_t;
      air_auto : Tuint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{
 * \brief Rolling intra refresh data structure for encoding.
  }
{*
         * \brief Indicate if intra refresh is enabled in column/row.
         *
         * App should query VAConfigAttribEncIntraRefresh to confirm RIR support
         * by the driver before sending this structure.
              }
{ \brief enable RIR in column  }
{ \brief enable RIR in row  }
{*
     * \brief Indicates the column or row location in MB. It is ignored if
     * rir_flags is 0.
      }
{*
     * \brief Indicates the number of columns or rows in MB. It is ignored if
     * rir_flags is 0.
      }
{*
     * \brief indicates the Qp difference for inserted intra columns or rows.
     * App can use this to adjust intra Qp based on bitrate & max frame size.
      }
{* \brief Reserved bytes for future use, must be zero  }

  PVAEncMiscParameterRIR = ^TVAEncMiscParameterRIR;
  TVAEncMiscParameterRIR = record
      rir_flags : record
          case longint of
            0 : ( bits : record
                flag0 : longint;
              end );
            1 : ( value : Tuint32_t );
          end;
      intra_insertion_location : Tuint16_t;
      intra_insert_size : Tuint16_t;
      qp_delta_for_inserted_intra : Tuint8_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;

const
  bm__VAEncMiscParameterRIR_enable_rir_column = $1;
  bp__VAEncMiscParameterRIR_enable_rir_column = 0;
  bm__VAEncMiscParameterRIR_enable_rir_row = $2;
  bp__VAEncMiscParameterRIR_enable_rir_row = 1;
  bm__VAEncMiscParameterRIR_reserved = $FFFFFFFC;
  bp__VAEncMiscParameterRIR_reserved = 2;

{* HRD / VBV buffering parameters for encoding.
 *
 * This sets the HRD / VBV parameters which will be used by the rate
 * controller for encoding.  It should be specified in modes using a bitrate
 * target when the buffering of the output stream needs to be constrained.
 *
 * If not provided, the encoder may use arbitrary amounts of buffering.
  }
{* The initial fullness of the HRD coded picture buffer, in bits.
     *
     * This sets how full the CPB is when encoding begins - that is, how much
     * buffering will happen on the decoder side before the first frame.
     * The CPB fullness will be reset to this value after any rate control
     * reset (a change in parameters or an explicit reset).
     *
     * For H.264, it should match the value of initial_cpb_removal_delay in
     * buffering_period SEI messages.
      }
{* The HRD coded picture buffer size, in bits.
     *
     * For H.264, it should match the value of cpb_size_value_minus1 in the VUI
     * parameters.
      }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAEncMiscParameterHRD = ^TVAEncMiscParameterHRD;
  TVAEncMiscParameterHRD = record
      initial_buffer_fullness : Tuint32_t;
      buffer_size : Tuint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{*
 * \brief Defines a maximum frame size (in bits).
 *
 * This misc parameter buffer defines the maximum size of a frame (in
 * bits). The encoder will try to make sure that each frame does not
 * exceed this size. Otherwise, if the frame size exceeds this size,
 * the \c status flag of #VACodedBufferSegment will contain
 * #VA_CODED_BUF_STATUS_FRAME_SIZE_OVERFLOW.
  }
{* \brief Type. Shall be set to #VAEncMiscParameterTypeMaxFrameSize.  }
{* duplicated with VAEncMiscParameterBuffer, should be deprecated }
{* \brief Maximum size of a frame (in bits).  }
{* \brief Reserved bytes for future use, must be zero  }

  PVAEncMiscParameterBufferMaxFrameSize = ^TVAEncMiscParameterBufferMaxFrameSize;
  TVAEncMiscParameterBufferMaxFrameSize = record
      _type : TVAEncMiscParameterType;
      max_frame_size : Tuint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{*
 * \brief Maximum frame size (in bytes) settings for multiple pass.
 *
 * This misc parameter buffer defines the maximum size of a frame (in
 * bytes) settings for multiple pass. currently only AVC encoder can
 * support this settings in multiple pass case. If the frame size exceeds
 * this size, the encoder will do more pak passes to adjust the QP value
 * to control the frame size.
  }
{* \brief Type. Shall be set to #VAEncMiscParameterTypeMultiPassMaxFrameSize.  }
{* duplicated with VAEncMiscParameterBuffer, should be deprecated }
{* \brief Maximum size of a frame (in byte)  }
{* \brief Reserved bytes for future use, must be zero  }
{* \brief number of passes, every pass has different QP, currently AVC encoder can support up to 4 passes  }
{* \brief delta QP list for every pass  }
{* \brief Reserved bytes for future use, must be zero  }

  PVAEncMiscParameterBufferMultiPassFrameSize = ^TVAEncMiscParameterBufferMultiPassFrameSize;
  TVAEncMiscParameterBufferMultiPassFrameSize = record
      _type : TVAEncMiscParameterType;
      max_frame_size : Tuint32_t;
      reserved : Tuint32_t;
      num_passes : Tuint8_t;
      delta_qp : Puint8_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of dword;
    end;
{*
 * \brief Encoding quality level.
 *
 * The encoding quality could be set through this structure, if the implementation
 * supports multiple quality levels. The quality level set through this structure is
 * persistent over the entire coded sequence, or until a new structure is being sent.
 * The quality level range can be queried through the VAConfigAttribEncQualityRange
 * attribute. A lower value means higher quality, and a value of 1 represents the highest
 * quality. The quality level setting is used as a trade-off between quality and speed/power
 * consumption, with higher quality corresponds to lower speed and higher power consumption.
  }
{* \brief Encoding quality level setting. When set to 0, default quality
     * level is used.
      }
{* \brief Reserved bytes for future use, must be zero  }

  PVAEncMiscParameterBufferQualityLevel = ^TVAEncMiscParameterBufferQualityLevel;
  TVAEncMiscParameterBufferQualityLevel = record
      quality_level : Tuint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{*
 * \brief Quantization settings for encoding.
 *
 * Some encoders support special types of quantization such as trellis, and this structure
 * can be used by the app to control these special types of quantization by the encoder.
  }
{ if no flags is set then quantization is determined by the driver  }
{ \brief disable trellis for all frames/fields  }
{ \brief enable trellis for I frames/fields  }
{ \brief enable trellis for P frames/fields  }
{ \brief enable trellis for B frames/fields  }

  PVAEncMiscParameterQuantization = ^TVAEncMiscParameterQuantization;
  TVAEncMiscParameterQuantization = record
      quantization_flags : record
          case longint of
            0 : ( bits : record
                flag0 : longint;
              end );
            1 : ( value : Tuint32_t );
          end;
      va_reserved : Tuint32_t;
    end;

const
  bm__VAEncMiscParameterQuantization_disable_trellis = $1;
  bp__VAEncMiscParameterQuantization_disable_trellis = 0;
  bm__VAEncMiscParameterQuantization_enable_trellis_I = $2;
  bp__VAEncMiscParameterQuantization_enable_trellis_I = 1;
  bm__VAEncMiscParameterQuantization_enable_trellis_P = $4;
  bp__VAEncMiscParameterQuantization_enable_trellis_P = 2;
  bm__VAEncMiscParameterQuantization_enable_trellis_B = $8;
  bp__VAEncMiscParameterQuantization_enable_trellis_B = 3;
  bm__VAEncMiscParameterQuantization_reserved = $FFFFFFF0;
  bp__VAEncMiscParameterQuantization_reserved = 4;

{*
 * \brief Encoding skip frame.
 *
 * The application may choose to skip frames externally to the encoder (e.g. drop completely or
 * code as all skip's). For rate control purposes the encoder will need to know the size and number
 * of skipped frames.  Skip frame(s) indicated through this structure is applicable only to the
 * current frame.  It is allowed for the application to still send in packed headers for the driver to
 * pack, although no frame will be encoded (e.g. for HW to encrypt the frame).
  }
{* \brief Indicates skip frames as below.
      * 0: Encode as normal, no skip.
      * 1: One or more frames were skipped prior to the current frame, encode the current frame as normal.
      * 2: The current frame is to be skipped, do not encode it but pack/encrypt the packed header contents
      *    (all except VAEncPackedHeaderSlice) which could contain actual frame contents (e.g. pack the frame
      *    in VAEncPackedHeaderPicture).   }
{* \brief The number of frames skipped prior to the current frame.  Valid when skip_frame_flag = 1.  }
{* \brief When skip_frame_flag = 1, the size of the skipped frames in bits.   When skip_frame_flag = 2,
      * the size of the current skipped frame that is to be packed/encrypted in bits.  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAEncMiscParameterSkipFrame = ^TVAEncMiscParameterSkipFrame;
  TVAEncMiscParameterSkipFrame = record
      skip_frame_flag : Tuint8_t;
      num_skip_frames : Tuint8_t;
      size_skip_frames : Tuint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{*
 * \brief Encoding region-of-interest (ROI).
 *
 * The encoding ROI can be set through VAEncMiscParameterBufferROI, if the implementation
 * supports ROI input. The ROI set through this structure is applicable only to the
 * current frame or field, so must be sent every frame or field to be applied.  The number of
 * supported ROIs can be queried through the VAConfigAttribEncROI.  The encoder will use the
 * ROI information to adjust the QP values of the MB's that fall within the ROIs.
  }
{* \brief Defines the ROI boundary in pixels, the driver will map it to appropriate
     *  codec coding units.  It is relative to frame coordinates for the frame case and
     *  to field coordinates for the field case.  }
{*
     * \brief ROI value
     *
     * \ref roi_value specifies ROI delta QP or ROI priority.
     * --  ROI delta QP is the value that will be added on top of the frame level QP.
     * --  ROI priority specifies the priority of a region, it can be positive (more important)
     * or negative (less important) values and is compared with non-ROI region (taken as value 0),
     * E.g. ROI region with \ref roi_value -3 is less important than the non-ROI region (\ref roi_value
     * implied to be 0) which is less important than ROI region with roi_value +2. For overlapping
     * regions, the roi_value that is first in the ROI array will have priority.
     *
     * \ref roi_value always specifes ROI delta QP when VAConfigAttribRateControl == VA_RC_CQP, no matter
     * the value of \c roi_value_is_qp_delta in #VAEncMiscParameterBufferROI.
     *
     * \ref roi_value depends on \c roi_value_is_qp_delta in #VAEncMiscParameterBufferROI when
     * VAConfigAttribRateControl != VA_RC_CQP. \ref roi_value specifies ROI_delta QP if \c roi_value_is_qp_delta
     * in VAEncMiscParameterBufferROI is 1, otherwise \ref roi_value specifies ROI priority.
      }

  PVAEncROI = ^TVAEncROI;
  TVAEncROI = record
      roi_rectangle : TVARectangle;
      roi_value : Tint8_t;
    end;
{* \brief Number of ROIs being sent. }
{* \brief Valid when VAConfigAttribRateControl != VA_RC_CQP, then the encoder's
     *  rate control will determine actual delta QPs.  Specifies the max/min allowed delta
     *  QPs.  }
{* \brief Pointer to a VAEncROI array with num_roi elements.  It is relative to frame
      *  coordinates for the frame case and to field coordinates for the field case. }
{*
             * \brief An indication for roi value.
             *
             * \ref roi_value_is_qp_delta equal to 1 indicates \c roi_value in #VAEncROI should
             * be used as ROI delta QP. \ref roi_value_is_qp_delta equal to 0 indicates \c roi_value
             * in #VAEncROI should be used as ROI priority.
             *
             * \ref roi_value_is_qp_delta is only available when VAConfigAttribRateControl != VA_RC_CQP,
             * the setting must comply with \c roi_rc_priority_support and \c roi_rc_qp_delta_support in
             * #VAConfigAttribValEncROI. The underlying driver should ignore this field
             * when VAConfigAttribRateControl == VA_RC_CQP.
              }
{* \brief Reserved bytes for future use, must be zero  }

  PVAEncMiscParameterBufferROI = ^TVAEncMiscParameterBufferROI;
  TVAEncMiscParameterBufferROI = record
      num_roi : Tuint32_t;
      max_delta_qp : Tint8_t;
      min_delta_qp : Tint8_t;
      roi : PVAEncROI;
      roi_flags : record
          case longint of
            0 : ( bits : record
                flag0 : longint;
              end );
            1 : ( value : Tuint32_t );
          end;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;

const
  bm__VAEncMiscParameterBufferROI_roi_value_is_qp_delta = $1;
  bp__VAEncMiscParameterBufferROI_roi_value_is_qp_delta = 0;
  bm__VAEncMiscParameterBufferROI_reserved = $FFFFFFFE;
  bp__VAEncMiscParameterBufferROI_reserved = 1;

{
 * \brief Dirty rectangle data structure for encoding.
 *
 * The encoding dirty rect can be set through VAEncMiscParameterBufferDirtyRect, if the
 * implementation supports dirty rect input. The rect set through this structure is applicable
 * only to the current frame or field, so must be sent every frame or field to be applied.
 * The number of supported rects can be queried through the VAConfigAttribEncDirtyRect.  The
 * encoder will use the rect information to know those rectangle areas have changed while the
 * areas not covered by dirty rect rectangles are assumed to have not changed compared to the
 * previous picture.  The encoder may do some internal optimizations.
  }
{* \brief Number of Rectangle being sent. }
{* \brief Pointer to a VARectangle array with num_roi_rectangle elements. }
type
  PVAEncMiscParameterBufferDirtyRect = ^TVAEncMiscParameterBufferDirtyRect;
  TVAEncMiscParameterBufferDirtyRect = record
      num_roi_rectangle : Tuint32_t;
      roi_rectangle : PVARectangle;
    end;
{* \brief Attribute value for VAConfigAttribEncParallelRateControl  }
{* brief Number of layers }
{* brief Number of B frames per layer per GOP.
     *
     * it should be allocated by application, and the is num_layers.
     *  num_b_in_gop[0] is the number of regular B which refers to only I or P frames.  }

  PVAEncMiscParameterParallelRateControl = ^TVAEncMiscParameterParallelRateControl;
  TVAEncMiscParameterParallelRateControl = record
      num_layers : Tuint32_t;
      num_b_in_gop : Puint32_t;
    end;
{* per frame encoder quality controls, once set they will persist for all future frames
  *till it is updated again.  }
{* Use raw frames for reference instead of reconstructed frames.
              * it only impact motion estimation (ME)  stage, and will not impact MC stage
              * so the reconstruct picture will can match with decode side  }
{*  Disables skip check for ME stage, it will increase the bistream size
              * but will improve the qulity  }
{*  Indicates app will override default driver FTQ settings using FTQEnable.
              *  FTQ is forward transform quantization  }
{* Enables/disables FTQ.  }
{* Indicates the app will provide the Skip Threshold LUT to use when FTQ is
              * enabled (FTQSkipThresholdLUT), else default driver thresholds will be used.  }
{* Indicates the app will provide the Skip Threshold LUT to use when FTQ is
              * disabled (NonFTQSkipThresholdLUT), else default driver thresholds will be used.  }
{* Control to enable the ME mode decision algorithm to bias to fewer B Direct/Skip types.
              * Applies only to B frames, all other frames will ignore this setting.   }
{* Enables global motion bias. global motion also is called HME (Heirarchical Motion Estimation )
              * HME is used to handle large motions and avoiding local minima in the video encoding process
              * down scaled the input and reference picture, then do ME. the result will be a predictor to next level HME or ME
              * current interface divide the HME to 3 level. UltraHME , SuperHME, and HME, result of UltraHME will be input of SurperHME,
              * result of superHME will be a input for HME. HME result will be input of ME. it is a switch for HMEMVCostScalingFactor
              * can change the HME bias inside RDO stage }
{* MV cost scaling ratio for HME ( predictors.  It is used when
              * globalMotionBiasAdjustmentEnable == 1, else it is ignored.  Values are:
              *     0: set MV cost to be 0 for HME predictor.
              *     1: scale MV cost to be 1/2 of the default value for HME predictor.
              *     2: scale MV cost to be 1/4 of the default value for HME predictor.
              *     3: scale MV cost to be 1/8 of the default value for HME predictor.  }
{*disable HME, if it is disabled. Super*ultraHME should also be disabled   }
{*disable Super HME, if it is disabled, ultraHME should be disabled  }
{* disable Ultra HME  }
{* disable panic mode. Panic mode happened when there are extreme BRC (bit rate control) requirement
              * frame size cant achieve the target of BRC.  when Panic mode is triggered, Coefficients will
              *  be set to zero. disable panic mode will improve quality but will impact BRC  }
{* Force RepartitionCheck
             *  0: DEFAULT - follow driver default settings.
             *  1: FORCE_ENABLE - enable this feature totally for all cases.
             *  2: FORCE_DISABLE - disable this feature totally for all cases.  }
{* Maps QP to skip thresholds when FTQ is enabled.  Valid range is 0-255.  }
{* Maps QP to skip thresholds when FTQ is disabled.  Valid range is 0-65535.  }
{ Reserved for future use. }

  PVAEncMiscParameterEncQuality = ^TVAEncMiscParameterEncQuality;
  TVAEncMiscParameterEncQuality = record
      uni : record
          case longint of
            0 : ( struct_ : record
                flag0 : longint;
              end );
            1 : ( encControls : Tuint32_t );
          end;
      FTQSkipThresholdLUT : array[0..51] of Tuint8_t;
      NonFTQSkipThresholdLUT : array[0..51] of Tuint16_t;
      reserved : array[0..(VA_PADDING_HIGH)-1] of Tuint32_t;
    end;

const
  bm__VAEncMiscParameterEncQuality_useRawPicForRef = $1;
  bp__VAEncMiscParameterEncQuality_useRawPicForRef = 0;
  bm__VAEncMiscParameterEncQuality_skipCheckDisable = $2;
  bp__VAEncMiscParameterEncQuality_skipCheckDisable = 1;
  bm__VAEncMiscParameterEncQuality_FTQOverride = $4;
  bp__VAEncMiscParameterEncQuality_FTQOverride = 2;
  bm__VAEncMiscParameterEncQuality_FTQEnable = $8;
  bp__VAEncMiscParameterEncQuality_FTQEnable = 3;
  bm__VAEncMiscParameterEncQuality_FTQSkipThresholdLUTInput = $10;
  bp__VAEncMiscParameterEncQuality_FTQSkipThresholdLUTInput = 4;
  bm__VAEncMiscParameterEncQuality_NonFTQSkipThresholdLUTInput = $20;
  bp__VAEncMiscParameterEncQuality_NonFTQSkipThresholdLUTInput = 5;
  bm__VAEncMiscParameterEncQuality_ReservedBit = $40;
  bp__VAEncMiscParameterEncQuality_ReservedBit = 6;
  bm__VAEncMiscParameterEncQuality_directBiasAdjustmentEnable = $80;
  bp__VAEncMiscParameterEncQuality_directBiasAdjustmentEnable = 7;
  bm__VAEncMiscParameterEncQuality_globalMotionBiasAdjustmentEnable = $100;
  bp__VAEncMiscParameterEncQuality_globalMotionBiasAdjustmentEnable = 8;
  bm__VAEncMiscParameterEncQuality_HMEMVCostScalingFactor = $600;
  bp__VAEncMiscParameterEncQuality_HMEMVCostScalingFactor = 9;
  bm__VAEncMiscParameterEncQuality_HMEDisable = $800;
  bp__VAEncMiscParameterEncQuality_HMEDisable = 11;
  bm__VAEncMiscParameterEncQuality_SuperHMEDisable = $1000;
  bp__VAEncMiscParameterEncQuality_SuperHMEDisable = 12;
  bm__VAEncMiscParameterEncQuality_UltraHMEDisable = $2000;
  bp__VAEncMiscParameterEncQuality_UltraHMEDisable = 13;
  bm__VAEncMiscParameterEncQuality_PanicModeDisable = $4000;
  bp__VAEncMiscParameterEncQuality_PanicModeDisable = 14;
  bm__VAEncMiscParameterEncQuality_ForceRepartitionCheck = $18000;
  bp__VAEncMiscParameterEncQuality_ForceRepartitionCheck = 15;

{*
 *  \brief Custom Encoder Rounding Offset Control.
 *  Application may use this structure to set customized rounding
 *  offset parameters for quantization.
 *  Valid when \c VAConfigAttribCustomRoundingControl equals 1.
  }
{* \brief Enable customized rounding offset for intra blocks.
             *  If 0, default value would be taken by driver for intra
             *  rounding offset.
              }
{* \brief Intra rounding offset
             *  Ignored if \c enable_custom_rouding_intra equals 0.
              }
{* \brief Enable customized rounding offset for inter blocks.
             *  If 0, default value would be taken by driver for inter
             *  rounding offset.
              }
{* \brief Inter rounding offset
             *  Ignored if \c enable_custom_rouding_inter equals 0.
              }
{ Reserved  }
type
  PVAEncMiscParameterCustomRoundingControl = ^TVAEncMiscParameterCustomRoundingControl;
  TVAEncMiscParameterCustomRoundingControl = record
      rounding_offset_setting : record
          case longint of
            0 : ( bits : record
                flag0 : longint;
              end );
            1 : ( value : Tuint32_t );
          end;
    end;

const
  bm__VAEncMiscParameterCustomRoundingControl_enable_custom_rouding_intra = $1;
  bp__VAEncMiscParameterCustomRoundingControl_enable_custom_rouding_intra = 0;
  bm__VAEncMiscParameterCustomRoundingControl_rounding_offset_intra = $FE;
  bp__VAEncMiscParameterCustomRoundingControl_rounding_offset_intra = 1;
  bm__VAEncMiscParameterCustomRoundingControl_enable_custom_rounding_inter = $100;
  bp__VAEncMiscParameterCustomRoundingControl_enable_custom_rounding_inter = 8;
  bm__VAEncMiscParameterCustomRoundingControl_rounding_offset_inter = $FE00;
  bp__VAEncMiscParameterCustomRoundingControl_rounding_offset_inter = 9;
  bm__VAEncMiscParameterCustomRoundingControl_reserved = $FFFF0000;
  bp__VAEncMiscParameterCustomRoundingControl_reserved = 16;

{*
 * There will be cases where the bitstream buffer will not have enough room to hold
 * the data for the entire slice, and the following flags will be used in the slice
 * parameter to signal to the server for the possible cases.
 * If a slice parameter buffer and slice data buffer pair is sent to the server with
 * the slice data partially in the slice data buffer (BEGIN and MIDDLE cases below),
 * then a slice parameter and data buffer needs to be sent again to complete this slice.
  }
{ whole slice is in the buffer  }

const
  VA_SLICE_DATA_FLAG_ALL = $00;  
{ The beginning of the slice is in the buffer but the end if not  }
  VA_SLICE_DATA_FLAG_BEGIN = $01;  
{ Neither beginning nor end of the slice is in the buffer  }
  VA_SLICE_DATA_FLAG_MIDDLE = $02;  
{ end of the slice is in the buffer  }
  VA_SLICE_DATA_FLAG_END = $04;  
{ Codec-independent Slice Parameter Buffer base  }
{ number of bytes in the slice data buffer for this slice  }
{ the offset to the first byte of slice data  }
{ see VA_SLICE_DATA_FLAG_XXX definitions  }
type
  PVASliceParameterBufferBase = ^TVASliceParameterBufferBase;
  TVASliceParameterBufferBase = record
      slice_data_size : Tuint32_t;
      slice_data_offset : Tuint32_t;
      slice_data_flag : Tuint32_t;
    end;
{*********************************
 * JPEG common  data structures
 ********************************* }
{*
 * \brief Huffman table for JPEG decoding.
 *
 * This structure holds the complete Huffman tables. This is an
 * aggregation of all Huffman table (DHT) segments maintained by the
 * application. i.e. up to 2 Huffman tables are stored in there for
 * baseline profile.
 *
 * The #load_huffman_table array can be used as a hint to notify the
 * VA driver implementation about which table(s) actually changed
 * since the last submission of this buffer.
  }
{* \brief Specifies which #huffman_table is valid.  }
{* \brief Huffman tables indexed by table identifier (Th).  }
{* @name DC table (up to 12 categories)  }
{*@ }
{* \brief Number of Huffman codes of length i + 1 (Li).  }
{* \brief Value associated with each Huffman code (Vij).  }
{*@ }
{* @name AC table (2 special codes + up to 16 * 10 codes)  }
{*@ }
{* \brief Number of Huffman codes of length i + 1 (Li).  }
{* \brief Value associated with each Huffman code (Vij).  }
{* \brief Padding to 4-byte boundaries. Must be set to zero.  }
{*@ }
{* \brief Reserved bytes for future use, must be zero  }

  PVAHuffmanTableBufferJPEGBaseline = ^TVAHuffmanTableBufferJPEGBaseline;
  TVAHuffmanTableBufferJPEGBaseline = record
      load_huffman_table : array[0..1] of Tuint8_t;
      huffman_table : array[0..1] of record
          num_dc_codes : array[0..15] of Tuint8_t;
          dc_values : array[0..11] of Tuint8_t;
          num_ac_codes : array[0..15] of Tuint8_t;
          ac_values : array[0..161] of Tuint8_t;
          pad : array[0..1] of Tuint8_t;
        end;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{***************************
 * MPEG-2 data structures
 *************************** }
{ MPEG-2 Picture Parameter Buffer  }
{
 * For each frame or field, and before any slice data, a single
 * picture parameter buffer must be send.
  }
{ meanings of the following fields are the same as in the standard  }
{ pack all four fcode into this  }
{ indicate whether the current field
                                                              * is the first field for field picture
                                                               }
{* \brief Reserved bytes for future use, must be zero  }

  PVAPictureParameterBufferMPEG2 = ^TVAPictureParameterBufferMPEG2;
  TVAPictureParameterBufferMPEG2 = record
      horizontal_size : Tuint16_t;
      vertical_size : Tuint16_t;
      forward_reference_picture : TVASurfaceID;
      backward_reference_picture : TVASurfaceID;
      picture_coding_type : Tint32_t;
      f_code : Tint32_t;
      picture_coding_extension : record
          case longint of
            0 : ( bits : record
                flag0 : word;
              end );
            1 : ( value : Tuint32_t );
          end;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;

const
  bm__VAPictureParameterBufferMPEG2_intra_dc_precision = $3;
  bp__VAPictureParameterBufferMPEG2_intra_dc_precision = 0;
  bm__VAPictureParameterBufferMPEG2_picture_structure = $C;
  bp__VAPictureParameterBufferMPEG2_picture_structure = 2;
  bm__VAPictureParameterBufferMPEG2_top_field_first = $10;
  bp__VAPictureParameterBufferMPEG2_top_field_first = 4;
  bm__VAPictureParameterBufferMPEG2_frame_pred_frame_dct = $20;
  bp__VAPictureParameterBufferMPEG2_frame_pred_frame_dct = 5;
  bm__VAPictureParameterBufferMPEG2_concealment_motion_vectors = $40;
  bp__VAPictureParameterBufferMPEG2_concealment_motion_vectors = 6;
  bm__VAPictureParameterBufferMPEG2_q_scale_type = $80;
  bp__VAPictureParameterBufferMPEG2_q_scale_type = 7;
  bm__VAPictureParameterBufferMPEG2_intra_vlc_format = $100;
  bp__VAPictureParameterBufferMPEG2_intra_vlc_format = 8;
  bm__VAPictureParameterBufferMPEG2_alternate_scan = $200;
  bp__VAPictureParameterBufferMPEG2_alternate_scan = 9;
  bm__VAPictureParameterBufferMPEG2_repeat_first_field = $400;
  bp__VAPictureParameterBufferMPEG2_repeat_first_field = 10;
  bm__VAPictureParameterBufferMPEG2_progressive_frame = $800;
  bp__VAPictureParameterBufferMPEG2_progressive_frame = 11;
  bm__VAPictureParameterBufferMPEG2_is_first_field = $1000;
  bp__VAPictureParameterBufferMPEG2_is_first_field = 12;

{* MPEG-2 Inverse Quantization Matrix Buffer  }
{* \brief Same as the MPEG-2 bitstream syntax element.  }
{* \brief Same as the MPEG-2 bitstream syntax element.  }
{* \brief Same as the MPEG-2 bitstream syntax element.  }
{* \brief Same as the MPEG-2 bitstream syntax element.  }
{* \brief Luminance intra matrix, in zig-zag scan order.  }
{* \brief Luminance non-intra matrix, in zig-zag scan order.  }
{* \brief Chroma intra matrix, in zig-zag scan order.  }
{* \brief Chroma non-intra matrix, in zig-zag scan order.  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAIQMatrixBufferMPEG2 = ^TVAIQMatrixBufferMPEG2;
  TVAIQMatrixBufferMPEG2 = record
      load_intra_quantiser_matrix : Tint32_t;
      load_non_intra_quantiser_matrix : Tint32_t;
      load_chroma_intra_quantiser_matrix : Tint32_t;
      load_chroma_non_intra_quantiser_matrix : Tint32_t;
      intra_quantiser_matrix : array[0..63] of Tuint8_t;
      non_intra_quantiser_matrix : array[0..63] of Tuint8_t;
      chroma_intra_quantiser_matrix : array[0..63] of Tuint8_t;
      chroma_non_intra_quantiser_matrix : array[0..63] of Tuint8_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{* MPEG-2 Slice Parameter Buffer  }
{ number of bytes in the slice data buffer for this slice  }
{ the offset to the first byte of slice data  }
{ see VA_SLICE_DATA_FLAG_XXX defintions  }
{ the offset to the first bit of MB from the first byte of slice data  }
{* \brief Reserved bytes for future use, must be zero  }

  PVASliceParameterBufferMPEG2 = ^TVASliceParameterBufferMPEG2;
  TVASliceParameterBufferMPEG2 = record
      slice_data_size : Tuint32_t;
      slice_data_offset : Tuint32_t;
      slice_data_flag : Tuint32_t;
      macroblock_offset : Tuint32_t;
      slice_horizontal_position : Tuint32_t;
      slice_vertical_position : Tuint32_t;
      quantiser_scale_code : Tint32_t;
      intra_slice_flag : Tint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{* MPEG-2 Macroblock Parameter Buffer  }
{
     * macroblock_address (in raster scan order)
     * top-left: 0
     * bottom-right: picture-height-in-mb*picture-width-in-mb - 1
      }
{ see definition below  }
{
     * motion_vertical_field_select:
     * see section 6.3.17.2 in the spec
     * only the lower 4 bits are used
     * bit 0: first vector forward
     * bit 1: first vector backward
     * bit 2: second vector forward
     * bit 3: second vector backward
      }
{ see Table 7-7 in the spec  }
{
     * The bitplanes for coded_block_pattern are described
     * in Figure 6.10-12 in the spec
      }
{ Number of skipped macroblocks after this macroblock  }
{* \brief Reserved bytes for future use, must be zero  }

  PVAMacroblockParameterBufferMPEG2 = ^TVAMacroblockParameterBufferMPEG2;
  TVAMacroblockParameterBufferMPEG2 = record
      macroblock_address : Tuint16_t;
      macroblock_type : Tuint8_t;
      macroblock_modes : record
          case longint of
            0 : ( bits : record
                flag0 : word;
              end );
            1 : ( value : Tuint32_t );
          end;
      motion_vertical_field_select : Tuint8_t;
      PMV : array[0..1] of array[0..1] of array[0..1] of Tint16_t;
      coded_block_pattern : Tuint16_t;
      num_skipped_macroblocks : Tuint16_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;

const
  bm__VAMacroblockParameterBufferMPEG2_frame_motion_type = $3;
  bp__VAMacroblockParameterBufferMPEG2_frame_motion_type = 0;
  bm__VAMacroblockParameterBufferMPEG2_field_motion_type = $C;
  bp__VAMacroblockParameterBufferMPEG2_field_motion_type = 2;
  bm__VAMacroblockParameterBufferMPEG2_dct_type = $10;
  bp__VAMacroblockParameterBufferMPEG2_dct_type = 4;

{
 * OR'd flags for macroblock_type (section 6.3.17.1 in the spec)
  }

const
  VA_MB_TYPE_MOTION_FORWARD = $02;  
  VA_MB_TYPE_MOTION_BACKWARD = $04;  
  VA_MB_TYPE_MOTION_PATTERN = $08;  
  VA_MB_TYPE_MOTION_INTRA = $10;  
{*
 * MPEG-2 Residual Data Buffer
 * For each macroblock, there wil be 64 shorts (16-bit) in the
 * residual data buffer
  }
{***************************
 * MPEG-4 Part 2 data structures
 *************************** }
{ MPEG-4 Picture Parameter Buffer  }
{
 * For each frame or field, and before any slice data, a single
 * picture parameter buffer must be send.
  }
{ short header related  }
{ for direct mode prediction  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAPictureParameterBufferMPEG4 = ^TVAPictureParameterBufferMPEG4;
  TVAPictureParameterBufferMPEG4 = record
      vop_width : Tuint16_t;
      vop_height : Tuint16_t;
      forward_reference_picture : TVASurfaceID;
      backward_reference_picture : TVASurfaceID;
      vol_fields : record
          case longint of
            0 : ( bits : record
                flag0 : word;
              end );
            1 : ( value : Tuint32_t );
          end;
      no_of_sprite_warping_points : Tuint8_t;
      sprite_trajectory_du : array[0..2] of Tint16_t;
      sprite_trajectory_dv : array[0..2] of Tint16_t;
      quant_precision : Tuint8_t;
      vop_fields : record
          case longint of
            0 : ( bits : record
                flag0 : word;
              end );
            1 : ( value : Tuint32_t );
          end;
      vop_fcode_forward : Tuint8_t;
      vop_fcode_backward : Tuint8_t;
      vop_time_increment_resolution : Tuint16_t;
      num_gobs_in_vop : Tuint8_t;
      num_macroblocks_in_gob : Tuint8_t;
      TRB : Tint16_t;
      TRD : Tint16_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;

const
  bm__VAPictureParameterBufferMPEG4_short_video_header = $1;
  bp__VAPictureParameterBufferMPEG4_short_video_header = 0;
  bm__VAPictureParameterBufferMPEG4_chroma_format = $6;
  bp__VAPictureParameterBufferMPEG4_chroma_format = 1;
  bm__VAPictureParameterBufferMPEG4_interlaced = $8;
  bp__VAPictureParameterBufferMPEG4_interlaced = 3;
  bm__VAPictureParameterBufferMPEG4_obmc_disable = $10;
  bp__VAPictureParameterBufferMPEG4_obmc_disable = 4;
  bm__VAPictureParameterBufferMPEG4_sprite_enable = $60;
  bp__VAPictureParameterBufferMPEG4_sprite_enable = 5;
  bm__VAPictureParameterBufferMPEG4_sprite_warping_accuracy = $180;
  bp__VAPictureParameterBufferMPEG4_sprite_warping_accuracy = 7;
  bm__VAPictureParameterBufferMPEG4_quant_type = $200;
  bp__VAPictureParameterBufferMPEG4_quant_type = 9;
  bm__VAPictureParameterBufferMPEG4_quarter_sample = $400;
  bp__VAPictureParameterBufferMPEG4_quarter_sample = 10;
  bm__VAPictureParameterBufferMPEG4_data_partitioned = $800;
  bp__VAPictureParameterBufferMPEG4_data_partitioned = 11;
  bm__VAPictureParameterBufferMPEG4_reversible_vlc = $1000;
  bp__VAPictureParameterBufferMPEG4_reversible_vlc = 12;
  bm__VAPictureParameterBufferMPEG4_resync_marker_disable = $2000;
  bp__VAPictureParameterBufferMPEG4_resync_marker_disable = 13;
  bm__VAPictureParameterBufferMPEG4_vop_coding_type = $3;
  bp__VAPictureParameterBufferMPEG4_vop_coding_type = 0;
  bm__VAPictureParameterBufferMPEG4_backward_reference_vop_coding_type = $C;
  bp__VAPictureParameterBufferMPEG4_backward_reference_vop_coding_type = 2;
  bm__VAPictureParameterBufferMPEG4_vop_rounding_type = $10;
  bp__VAPictureParameterBufferMPEG4_vop_rounding_type = 4;
  bm__VAPictureParameterBufferMPEG4_intra_dc_vlc_thr = $E0;
  bp__VAPictureParameterBufferMPEG4_intra_dc_vlc_thr = 5;
  bm__VAPictureParameterBufferMPEG4_top_field_first = $100;
  bp__VAPictureParameterBufferMPEG4_top_field_first = 8;
  bm__VAPictureParameterBufferMPEG4_alternate_vertical_scan_flag = $200;
  bp__VAPictureParameterBufferMPEG4_alternate_vertical_scan_flag = 9;

{* MPEG-4 Inverse Quantization Matrix Buffer  }
{* Same as the MPEG-4:2 bitstream syntax element.  }
{* Same as the MPEG-4:2 bitstream syntax element.  }
{* The matrix for intra blocks, in zig-zag scan order.  }
{* The matrix for non-intra blocks, in zig-zag scan order.  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAIQMatrixBufferMPEG4 = ^TVAIQMatrixBufferMPEG4;
  TVAIQMatrixBufferMPEG4 = record
      load_intra_quant_mat : Tint32_t;
      load_non_intra_quant_mat : Tint32_t;
      intra_quant_mat : array[0..63] of Tuint8_t;
      non_intra_quant_mat : array[0..63] of Tuint8_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{* MPEG-4 Slice Parameter Buffer  }
{ number of bytes in the slice data buffer for this slice  }
{ the offset to the first byte of slice data  }
{ see VA_SLICE_DATA_FLAG_XXX defintions  }
{ the offset to the first bit of MB from the first byte of slice data  }
{* \brief Reserved bytes for future use, must be zero  }

  PVASliceParameterBufferMPEG4 = ^TVASliceParameterBufferMPEG4;
  TVASliceParameterBufferMPEG4 = record
      slice_data_size : Tuint32_t;
      slice_data_offset : Tuint32_t;
      slice_data_flag : Tuint32_t;
      macroblock_offset : Tuint32_t;
      macroblock_number : Tuint32_t;
      quant_scale : Tint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{*
 VC-1 data structures
 }
{ see 7.1.1.32  }

  PVAMvModeVC1 = ^TVAMvModeVC1;
  TVAMvModeVC1 =  Longint;
  Const
    VAMvMode1Mv = 0;
    VAMvMode1MvHalfPel = 1;
    VAMvMode1MvHalfPelBilinear = 2;
    VAMvModeMixedMv = 3;
    VAMvModeIntensityCompensation = 4;
;
{* VC-1 Picture Parameter Buffer  }
{
 * For each picture, and before any slice data, a picture parameter
 * buffer must be send. Multiple picture parameter buffers may be
 * sent for a single picture. In that case picture parameters will
 * apply to all slice data that follow it until a new picture
 * parameter buffer is sent.
 *
 * Notes:
 *   pic_quantizer_type should be set to the applicable quantizer
 *   type as defined by QUANTIZER (J.1.19) and either
 *   PQUANTIZER (7.1.1.8) or PQINDEX (7.1.1.6)
  }
{ if out-of-loop post-processing is done on the render
       target, then we need to keep the in-loop decoded
       picture as a reference picture  }
{ sequence layer for AP or meta data for SP and MP  }
{ SEQUENCE_LAYER::PULLDOWN  }
{ SEQUENCE_LAYER::INTERLACE  }
{ SEQUENCE_LAYER::TFCNTRFLAG  }
{ SEQUENCE_LAYER::FINTERPFLAG  }
{ SEQUENCE_LAYER::PSF  }
{ METADATA::MULTIRES  }
{ METADATA::OVERLAP  }
{ METADATA::SYNCMARKER  }
{ METADATA::RANGERED  }
{ METADATA::MAXBFRAMES  }
{ SEQUENCE_LAYER::PROFILE or The MSB of METADATA::PROFILE  }
{ ENTRY_POINT_LAYER::CODED_WIDTH  }
{ ENTRY_POINT_LAYER::CODED_HEIGHT  }
{ ENTRY_POINT_LAYER::BROKEN_LINK  }
{ ENTRY_POINT_LAYER::CLOSED_ENTRY  }
{ ENTRY_POINT_LAYER::PANSCAN_FLAG  }
{ ENTRY_POINT_LAYER::LOOPFILTER  }
{ ENTRY_POINT_LAYER::CONDOVER  }
{ ENTRY_POINT_LAYER::FASTUVMC  }
{ ENTRY_POINT_LAYER::RANGE_MAPY_FLAG  }
{ ENTRY_POINT_LAYER::RANGE_MAPY  }
{ ENTRY_POINT_LAYER::RANGE_MAPUV_FLAG  }
{ ENTRY_POINT_LAYER::RANGE_MAPUV  }
{ Index for PICTURE_LAYER::BFRACTION value in Table 40 (7.1.1.14)  }
{ PICTURE_LAYER::CBPTAB/ICBPTAB  }
{ PICTURE_LAYER::MBMODETAB  }
{ PICTURE_LAYER::RANGEREDFRM  }
{ PICTURE_LAYER::RNDCTRL  }
{ PICTURE_LAYER::POSTPROC  }
{ PICTURE_LAYER::RESPIC  }
{ PICTURE_LAYER::LUMSCALE  }
{ PICTURE_LAYER::LUMSHIFT  }
{ PICTURE_LAYER::PTYPE  }
{ PICTURE_LAYER::FCM  }
{ PICTURE_LAYER::TFF  }
{ set to 1 if it is the first field  }
{ PICTURE_LAYER::INTCOMP  }
{ PICTURE::MVTYPEMB  }
{ PICTURE::DIRECTMB  }
{ PICTURE::SKIPMB  }
{ PICTURE::FIELDTX  }
{ PICTURE::FORWARDMB  }
{ PICTURE::ACPRED  }
{ PICTURE::OVERFLAGS  }
{ PICTURE::MVTYPEMB  }
{ PICTURE::DIRECTMB  }
{ PICTURE::SKIPMB  }
{ PICTURE::FIELDTX  }
{ PICTURE::FORWARDMB  }
{ PICTURE::ACPRED  }
{ PICTURE::OVERFLAGS  }
{ signal what bitplane is being passed via the bitplane buffer  }
{ PICTURE_LAYER::REFDIST_FLAG  }
{ PICTURE_LAYER::REFDIST  }
{ PICTURE_LAYER::NUMREF  }
{ PICTURE_LAYER::REFFIELD  }
{ PICTURE_LAYER::MVMODE  }
{ PICTURE_LAYER::MVMODE2  }
{ PICTURE_LAYER::MVTAB/IMVTAB  }
{ PICTURE_LAYER::2MVBPTAB  }
{ PICTURE_LAYER::4MVSWITCH  }
{ PICTURE_LAYER::4MVBPTAB  }
{ ENTRY_POINT_LAYER::EXTENDED_MV  }
{ PICTURE_LAYER::MVRANGE  }
{ ENTRY_POINT_LAYER::EXTENDED_DMV  }
{ PICTURE_LAYER::DMVRANGE  }
{ ENTRY_POINT_LAYER::DQUANT  }
{ ENTRY_POINT_LAYER::QUANTIZER  }
{ PICTURE_LAYER::HALFQP  }
{ PICTURE_LAYER::PQUANT  }
{ PICTURE_LAYER::PQUANTIZER  }
{ VOPDQUANT::DQUANTFRM  }
{ VOPDQUANT::DQPROFILE  }
{ VOPDQUANT::DQSBEDGE  }
{ VOPDQUANT::DQDBEDGE  }
{ VOPDQUANT::DQBILEVEL  }
{ VOPDQUANT::ALTPQUANT  }
{ ENTRY_POINT_LAYER::VSTRANSFORM  }
{ PICTURE_LAYER::TTMBF  }
{ PICTURE_LAYER::TTFRM  }
{ PICTURE_LAYER::TRANSACFRM  }
{ PICTURE_LAYER::TRANSACFRM2  }
{ PICTURE_LAYER::TRANSDCTAB  }
{ PICTURE_LAYER::LUMSCALE2  }
{ PICTURE_LAYER::LUMSHIFT2  }
{ Index for PICTURE_LAYER::INTCOMPFIELD value in Table 109 (9.1.1.48)  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAPictureParameterBufferVC1 = ^TVAPictureParameterBufferVC1;
  TVAPictureParameterBufferVC1 = record
      forward_reference_picture : TVASurfaceID;
      backward_reference_picture : TVASurfaceID;
      inloop_decoded_picture : TVASurfaceID;
      sequence_fields : record
          case longint of
            0 : ( bits : record
                flag0 : word;
              end );
            1 : ( value : Tuint32_t );
          end;
      coded_width : Tuint16_t;
      coded_height : Tuint16_t;
      entrypoint_fields : record
          case longint of
            0 : ( bits : record
                flag0 : word;
              end );
            1 : ( value : Tuint32_t );
          end;
      conditional_overlap_flag : Tuint8_t;
      fast_uvmc_flag : Tuint8_t;
      range_mapping_fields : record
          case longint of
            0 : ( bits : record
                flag0 : word;
              end );
            1 : ( value : Tuint32_t );
          end;
      b_picture_fraction : Tuint8_t;
      cbp_table : Tuint8_t;
      mb_mode_table : Tuint8_t;
      range_reduction_frame : Tuint8_t;
      rounding_control : Tuint8_t;
      post_processing : Tuint8_t;
      picture_resolution_index : Tuint8_t;
      luma_scale : Tuint8_t;
      luma_shift : Tuint8_t;
      picture_fields : record
          case longint of
            0 : ( bits : record
                flag0 : word;
              end );
            1 : ( value : Tuint32_t );
          end;
      raw_coding : record
          case longint of
            0 : ( flags : record
                flag0 : word;
              end );
            1 : ( value : Tuint32_t );
          end;
      bitplane_present : record
          case longint of
            0 : ( flags : record
                flag0 : word;
              end );
            1 : ( value : Tuint32_t );
          end;
      reference_fields : record
          case longint of
            0 : ( bits : record
                flag0 : word;
              end );
            1 : ( value : Tuint32_t );
          end;
      mv_fields : record
          case longint of
            0 : ( bits : record
                flag0 : longint;
              end );
            1 : ( value : Tuint32_t );
          end;
      pic_quantizer_fields : record
          case longint of
            0 : ( bits : record
                flag0 : longint;
              end );
            1 : ( value : Tuint32_t );
          end;
      transform_fields : record
          case longint of
            0 : ( bits : record
                flag0 : word;
              end );
            1 : ( value : Tuint32_t );
          end;
      luma_scale2 : Tuint8_t;
      luma_shift2 : Tuint8_t;
      intensity_compensation_field : Tuint8_t;
      va_reserved : array[0..(VA_PADDING_MEDIUM-1)-1] of Tuint32_t;
    end;

const
  bm__VAPictureParameterBufferVC1_pulldown = $1;
  bp__VAPictureParameterBufferVC1_pulldown = 0;
  bm__VAPictureParameterBufferVC1_interlace = $2;
  bp__VAPictureParameterBufferVC1_interlace = 1;
  bm__VAPictureParameterBufferVC1_tfcntrflag = $4;
  bp__VAPictureParameterBufferVC1_tfcntrflag = 2;
  bm__VAPictureParameterBufferVC1_finterpflag = $8;
  bp__VAPictureParameterBufferVC1_finterpflag = 3;
  bm__VAPictureParameterBufferVC1_psf = $10;
  bp__VAPictureParameterBufferVC1_psf = 4;
  bm__VAPictureParameterBufferVC1_multires = $20;
  bp__VAPictureParameterBufferVC1_multires = 5;
  bm__VAPictureParameterBufferVC1_overlap = $40;
  bp__VAPictureParameterBufferVC1_overlap = 6;
  bm__VAPictureParameterBufferVC1_syncmarker = $80;
  bp__VAPictureParameterBufferVC1_syncmarker = 7;
  bm__VAPictureParameterBufferVC1_rangered = $100;
  bp__VAPictureParameterBufferVC1_rangered = 8;
  bm__VAPictureParameterBufferVC1_max_b_frames = $E00;
  bp__VAPictureParameterBufferVC1_max_b_frames = 9;
  bm__VAPictureParameterBufferVC1_profile = $3000;
  bp__VAPictureParameterBufferVC1_profile = 12;
  bm__VAPictureParameterBufferVC1_broken_link = $1;
  bp__VAPictureParameterBufferVC1_broken_link = 0;
  bm__VAPictureParameterBufferVC1_closed_entry = $2;
  bp__VAPictureParameterBufferVC1_closed_entry = 1;
  bm__VAPictureParameterBufferVC1_panscan_flag = $4;
  bp__VAPictureParameterBufferVC1_panscan_flag = 2;
  bm__VAPictureParameterBufferVC1_loopfilter = $8;
  bp__VAPictureParameterBufferVC1_loopfilter = 3;
  bm__VAPictureParameterBufferVC1_luma_flag = $1;
  bp__VAPictureParameterBufferVC1_luma_flag = 0;
  bm__VAPictureParameterBufferVC1_luma = $E;
  bp__VAPictureParameterBufferVC1_luma = 1;
  bm__VAPictureParameterBufferVC1_chroma_flag = $10;
  bp__VAPictureParameterBufferVC1_chroma_flag = 4;
  bm__VAPictureParameterBufferVC1_chroma = $E0;
  bp__VAPictureParameterBufferVC1_chroma = 5;
  bm__VAPictureParameterBufferVC1_picture_type = $7;
  bp__VAPictureParameterBufferVC1_picture_type = 0;
  bm__VAPictureParameterBufferVC1_frame_coding_mode = $38;
  bp__VAPictureParameterBufferVC1_frame_coding_mode = 3;
  bm__VAPictureParameterBufferVC1_top_field_first = $40;
  bp__VAPictureParameterBufferVC1_top_field_first = 6;
  bm__VAPictureParameterBufferVC1_is_first_field = $80;
  bp__VAPictureParameterBufferVC1_is_first_field = 7;
  bm__VAPictureParameterBufferVC1_intensity_compensation = $100;
  bp__VAPictureParameterBufferVC1_intensity_compensation = 8;
  bm__VAPictureParameterBufferVC1_mv_type_mb = $1;
  bp__VAPictureParameterBufferVC1_mv_type_mb = 0;
  bm__VAPictureParameterBufferVC1_direct_mb = $2;
  bp__VAPictureParameterBufferVC1_direct_mb = 1;
  bm__VAPictureParameterBufferVC1_skip_mb = $4;
  bp__VAPictureParameterBufferVC1_skip_mb = 2;
  bm__VAPictureParameterBufferVC1_field_tx = $8;
  bp__VAPictureParameterBufferVC1_field_tx = 3;
  bm__VAPictureParameterBufferVC1_forward_mb = $10;
  bp__VAPictureParameterBufferVC1_forward_mb = 4;
  bm__VAPictureParameterBufferVC1_ac_pred = $20;
  bp__VAPictureParameterBufferVC1_ac_pred = 5;
  bm__VAPictureParameterBufferVC1_overflags = $40;
  bp__VAPictureParameterBufferVC1_overflags = 6;
  bm__VAPictureParameterBufferVC1_bp_mv_type_mb = $1;
  bp__VAPictureParameterBufferVC1_bp_mv_type_mb = 0;
  bm__VAPictureParameterBufferVC1_bp_direct_mb = $2;
  bp__VAPictureParameterBufferVC1_bp_direct_mb = 1;
  bm__VAPictureParameterBufferVC1_bp_skip_mb = $4;
  bp__VAPictureParameterBufferVC1_bp_skip_mb = 2;
  bm__VAPictureParameterBufferVC1_bp_field_tx = $8;
  bp__VAPictureParameterBufferVC1_bp_field_tx = 3;
  bm__VAPictureParameterBufferVC1_bp_forward_mb = $10;
  bp__VAPictureParameterBufferVC1_bp_forward_mb = 4;
  bm__VAPictureParameterBufferVC1_bp_ac_pred = $20;
  bp__VAPictureParameterBufferVC1_bp_ac_pred = 5;
  bm__VAPictureParameterBufferVC1_bp_overflags = $40;
  bp__VAPictureParameterBufferVC1_bp_overflags = 6;
  bm__VAPictureParameterBufferVC1_reference_distance_flag = $1;
  bp__VAPictureParameterBufferVC1_reference_distance_flag = 0;
  bm__VAPictureParameterBufferVC1_reference_distance = $3E;
  bp__VAPictureParameterBufferVC1_reference_distance = 1;
  bm__VAPictureParameterBufferVC1_num_reference_pictures = $40;
  bp__VAPictureParameterBufferVC1_num_reference_pictures = 6;
  bm__VAPictureParameterBufferVC1_reference_field_pic_indicator = $80;
  bp__VAPictureParameterBufferVC1_reference_field_pic_indicator = 7;
  bm__VAPictureParameterBufferVC1_mv_mode = $7;
  bp__VAPictureParameterBufferVC1_mv_mode = 0;
  bm__VAPictureParameterBufferVC1_mv_mode2 = $38;
  bp__VAPictureParameterBufferVC1_mv_mode2 = 3;
  bm__VAPictureParameterBufferVC1_mv_table = $1C0;
  bp__VAPictureParameterBufferVC1_mv_table = 6;
  bm__VAPictureParameterBufferVC1_two_mv_block_pattern_table = $600;
  bp__VAPictureParameterBufferVC1_two_mv_block_pattern_table = 9;
  bm__VAPictureParameterBufferVC1_four_mv_switch = $800;
  bp__VAPictureParameterBufferVC1_four_mv_switch = 11;
  bm__VAPictureParameterBufferVC1_four_mv_block_pattern_table = $3000;
  bp__VAPictureParameterBufferVC1_four_mv_block_pattern_table = 12;
  bm__VAPictureParameterBufferVC1_extended_mv_flag = $4000;
  bp__VAPictureParameterBufferVC1_extended_mv_flag = 14;
  bm__VAPictureParameterBufferVC1_extended_mv_range = $18000;
  bp__VAPictureParameterBufferVC1_extended_mv_range = 15;
  bm__VAPictureParameterBufferVC1_extended_dmv_flag = $20000;
  bp__VAPictureParameterBufferVC1_extended_dmv_flag = 17;
  bm__VAPictureParameterBufferVC1_extended_dmv_range = $C0000;
  bp__VAPictureParameterBufferVC1_extended_dmv_range = 18;
  bm__VAPictureParameterBufferVC1_dquant = $3;
  bp__VAPictureParameterBufferVC1_dquant = 0;
  bm__VAPictureParameterBufferVC1_quantizer = $C;
  bp__VAPictureParameterBufferVC1_quantizer = 2;
  bm__VAPictureParameterBufferVC1_half_qp = $10;
  bp__VAPictureParameterBufferVC1_half_qp = 4;
  bm__VAPictureParameterBufferVC1_pic_quantizer_scale = $3E0;
  bp__VAPictureParameterBufferVC1_pic_quantizer_scale = 5;
  bm__VAPictureParameterBufferVC1_pic_quantizer_type = $400;
  bp__VAPictureParameterBufferVC1_pic_quantizer_type = 10;
  bm__VAPictureParameterBufferVC1_dq_frame = $800;
  bp__VAPictureParameterBufferVC1_dq_frame = 11;
  bm__VAPictureParameterBufferVC1_dq_profile = $3000;
  bp__VAPictureParameterBufferVC1_dq_profile = 12;
  bm__VAPictureParameterBufferVC1_dq_sb_edge = $C000;
  bp__VAPictureParameterBufferVC1_dq_sb_edge = 14;
  bm__VAPictureParameterBufferVC1_dq_db_edge = $30000;
  bp__VAPictureParameterBufferVC1_dq_db_edge = 16;
  bm__VAPictureParameterBufferVC1_dq_binary_level = $40000;
  bp__VAPictureParameterBufferVC1_dq_binary_level = 18;
  bm__VAPictureParameterBufferVC1_alt_pic_quantizer = $F80000;
  bp__VAPictureParameterBufferVC1_alt_pic_quantizer = 19;
  bm__VAPictureParameterBufferVC1_variable_sized_transform_flag = $1;
  bp__VAPictureParameterBufferVC1_variable_sized_transform_flag = 0;
  bm__VAPictureParameterBufferVC1_mb_level_transform_type_flag = $2;
  bp__VAPictureParameterBufferVC1_mb_level_transform_type_flag = 1;
  bm__VAPictureParameterBufferVC1_frame_level_transform_type = $C;
  bp__VAPictureParameterBufferVC1_frame_level_transform_type = 2;
  bm__VAPictureParameterBufferVC1_transform_ac_codingset_idx1 = $30;
  bp__VAPictureParameterBufferVC1_transform_ac_codingset_idx1 = 4;
  bm__VAPictureParameterBufferVC1_transform_ac_codingset_idx2 = $C0;
  bp__VAPictureParameterBufferVC1_transform_ac_codingset_idx2 = 6;
  bm__VAPictureParameterBufferVC1_intra_transform_dc_table = $100;
  bp__VAPictureParameterBufferVC1_intra_transform_dc_table = 8;

{* VC-1 Bitplane Buffer
There will be at most three bitplanes coded in any picture header. To send
the bitplane data more efficiently, each byte is divided in two nibbles, with
each nibble carrying three bitplanes for one macroblock.  The following table
shows the bitplane data arrangement within each nibble based on the picture
type.

Picture Type    Bit3        Bit2        Bit1        Bit0
I or BI             OVERFLAGS   ACPRED      FIELDTX
P               MYTYPEMB    SKIPMB      DIRECTMB
B               FORWARDMB   SKIPMB      DIRECTMB

Within each byte, the lower nibble is for the first MB and the upper nibble is
for the second MB.  E.g. the lower nibble of the first byte in the bitplane
buffer is for Macroblock #1 and the upper nibble of the first byte is for
Macroblock #2 in the first row.
 }
{ VC-1 Slice Parameter Buffer  }
{ number of bytes in the slice data buffer for this slice  }
{ the offset to the first byte of slice data  }
{ see VA_SLICE_DATA_FLAG_XXX defintions  }
{ the offset to the first bit of MB from the first byte of slice data  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVASliceParameterBufferVC1 = ^TVASliceParameterBufferVC1;
  TVASliceParameterBufferVC1 = record
      slice_data_size : Tuint32_t;
      slice_data_offset : Tuint32_t;
      slice_data_flag : Tuint32_t;
      macroblock_offset : Tuint32_t;
      slice_vertical_position : Tuint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{ VC-1 Slice Data Buffer  }
{
This is simplely a buffer containing raw bit-stream bytes
 }
{***************************
 * H.264/AVC data structures
 *************************** }
{* \brief Reserved bytes for future use, must be zero  }

  PVAPictureH264 = ^TVAPictureH264;
  TVAPictureH264 = record
      picture_id : TVASurfaceID;
      frame_idx : Tuint32_t;
      flags : Tuint32_t;
      TopFieldOrderCnt : Tint32_t;
      BottomFieldOrderCnt : Tint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{ flags in VAPictureH264 could be OR of the following  }

const
  VA_PICTURE_H264_INVALID = $00000001;  
  VA_PICTURE_H264_TOP_FIELD = $00000002;  
  VA_PICTURE_H264_BOTTOM_FIELD = $00000004;  
  VA_PICTURE_H264_SHORT_TERM_REFERENCE = $00000008;  
  VA_PICTURE_H264_LONG_TERM_REFERENCE = $00000010;  
{* H.264 Picture Parameter Buffer  }
{
 * For each picture, and before any slice data, a single
 * picture parameter buffer must be send.
  }
{ in DPB  }
{ Renamed to separate_colour_plane_flag in newer standard versions.  }
{ see A.3.3.2  }
{ FMO is not supported. }
{ Renamed to bottom_field_pic_order_in_frame_present_flag in newer standard versions.  }
{ nal_ref_idc != 0  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAPictureParameterBufferH264 = ^TVAPictureParameterBufferH264;
  TVAPictureParameterBufferH264 = record
      CurrPic : TVAPictureH264;
      ReferenceFrames : array[0..15] of TVAPictureH264;
      picture_width_in_mbs_minus1 : Tuint16_t;
      picture_height_in_mbs_minus1 : Tuint16_t;
      bit_depth_luma_minus8 : Tuint8_t;
      bit_depth_chroma_minus8 : Tuint8_t;
      num_ref_frames : Tuint8_t;
      seq_fields : record
          case longint of
            0 : ( bits : record
                flag0 : longint;
              end );
            1 : ( value : Tuint32_t );
          end;
      num_slice_groups_minus1 : Tuint8_t;
      slice_group_map_type : Tuint8_t;
      slice_group_change_rate_minus1 : Tuint16_t;
      pic_init_qp_minus26 : Tint8_t;
      pic_init_qs_minus26 : Tint8_t;
      chroma_qp_index_offset : Tint8_t;
      second_chroma_qp_index_offset : Tint8_t;
      pic_fields : record
          case longint of
            0 : ( bits : record
                flag0 : word;
              end );
            1 : ( value : Tuint32_t );
          end;
      frame_num : Tuint16_t;
      va_reserved : array[0..(VA_PADDING_MEDIUM)-1] of Tuint32_t;
    end;

const
  bm__VAPictureParameterBufferH264_chroma_format_idc = $3;
  bp__VAPictureParameterBufferH264_chroma_format_idc = 0;
  bm__VAPictureParameterBufferH264_residual_colour_transform_flag = $4;
  bp__VAPictureParameterBufferH264_residual_colour_transform_flag = 2;
  bm__VAPictureParameterBufferH264_gaps_in_frame_num_value_allowed_flag = $8;
  bp__VAPictureParameterBufferH264_gaps_in_frame_num_value_allowed_flag = 3;
  bm__VAPictureParameterBufferH264_frame_mbs_only_flag = $10;
  bp__VAPictureParameterBufferH264_frame_mbs_only_flag = 4;
  bm__VAPictureParameterBufferH264_mb_adaptive_frame_field_flag = $20;
  bp__VAPictureParameterBufferH264_mb_adaptive_frame_field_flag = 5;
  bm__VAPictureParameterBufferH264_direct_8x8_inference_flag = $40;
  bp__VAPictureParameterBufferH264_direct_8x8_inference_flag = 6;
  bm__VAPictureParameterBufferH264_MinLumaBiPredSize8x8 = $80;
  bp__VAPictureParameterBufferH264_MinLumaBiPredSize8x8 = 7;
  bm__VAPictureParameterBufferH264_log2_max_frame_num_minus4 = $F00;
  bp__VAPictureParameterBufferH264_log2_max_frame_num_minus4 = 8;
  bm__VAPictureParameterBufferH264_pic_order_cnt_type = $3000;
  bp__VAPictureParameterBufferH264_pic_order_cnt_type = 12;
  bm__VAPictureParameterBufferH264_log2_max_pic_order_cnt_lsb_minus4 = $3C000;
  bp__VAPictureParameterBufferH264_log2_max_pic_order_cnt_lsb_minus4 = 14;
  bm__VAPictureParameterBufferH264_delta_pic_order_always_zero_flag = $40000;
  bp__VAPictureParameterBufferH264_delta_pic_order_always_zero_flag = 18;
  bm__VAPictureParameterBufferH264_entropy_coding_mode_flag = $1;
  bp__VAPictureParameterBufferH264_entropy_coding_mode_flag = 0;
  bm__VAPictureParameterBufferH264_weighted_pred_flag = $2;
  bp__VAPictureParameterBufferH264_weighted_pred_flag = 1;
  bm__VAPictureParameterBufferH264_weighted_bipred_idc = $C;
  bp__VAPictureParameterBufferH264_weighted_bipred_idc = 2;
  bm__VAPictureParameterBufferH264_transform_8x8_mode_flag = $10;
  bp__VAPictureParameterBufferH264_transform_8x8_mode_flag = 4;
  bm__VAPictureParameterBufferH264_field_pic_flag = $20;
  bp__VAPictureParameterBufferH264_field_pic_flag = 5;
  bm__VAPictureParameterBufferH264_constrained_intra_pred_flag = $40;
  bp__VAPictureParameterBufferH264_constrained_intra_pred_flag = 6;
  bm__VAPictureParameterBufferH264_pic_order_present_flag = $80;
  bp__VAPictureParameterBufferH264_pic_order_present_flag = 7;
  bm__VAPictureParameterBufferH264_deblocking_filter_control_present_flag = $100;
  bp__VAPictureParameterBufferH264_deblocking_filter_control_present_flag = 8;
  bm__VAPictureParameterBufferH264_redundant_pic_cnt_present_flag = $200;
  bp__VAPictureParameterBufferH264_redundant_pic_cnt_present_flag = 9;
  bm__VAPictureParameterBufferH264_reference_pic_flag = $400;
  bp__VAPictureParameterBufferH264_reference_pic_flag = 10;

{* H.264 Inverse Quantization Matrix Buffer  }
{* \brief 4x4 scaling list, in raster scan order.  }
{* \brief 8x8 scaling list, in raster scan order.  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAIQMatrixBufferH264 = ^TVAIQMatrixBufferH264;
  TVAIQMatrixBufferH264 = record
      ScalingList4x4 : array[0..5] of array[0..15] of Tuint8_t;
      ScalingList8x8 : array[0..1] of array[0..63] of Tuint8_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{* H.264 Slice Parameter Buffer  }
{ number of bytes in the slice data buffer for this slice  }
{* \brief Byte offset to the NAL Header Unit for this slice.  }
{ see VA_SLICE_DATA_FLAG_XXX defintions  }
{*
     * \brief Bit offset from NAL Header Unit to the begining of slice_data().
     *
     * This bit offset is relative to and includes the NAL unit byte
     * and represents the number of bits parsed in the slice_header()
     * after the removal of any emulation prevention bytes in
     * there. However, the slice data buffer passed to the hardware is
     * the original bitstream, thus including any emulation prevention
     * bytes.
      }
{*
     * H264/AVC syntax element
     *
     * if num_ref_idx_active_override_flag equals 0, host decoder should
     * set its value to num_ref_idx_l0_default_active_minus1.
      }
{*
     * H264/AVC syntax element
     *
     * if num_ref_idx_active_override_flag equals 0, host decoder should
     * set its value to num_ref_idx_l1_default_active_minus1.
      }
{ See 8.2.4.2  }
{ See 8.2.4.2  }
{* \brief Reserved bytes for future use, must be zero  }

  PVASliceParameterBufferH264 = ^TVASliceParameterBufferH264;
  TVASliceParameterBufferH264 = record
      slice_data_size : Tuint32_t;
      slice_data_offset : Tuint32_t;
      slice_data_flag : Tuint32_t;
      slice_data_bit_offset : Tuint16_t;
      first_mb_in_slice : Tuint16_t;
      slice_type : Tuint8_t;
      direct_spatial_mv_pred_flag : Tuint8_t;
      num_ref_idx_l0_active_minus1 : Tuint8_t;
      num_ref_idx_l1_active_minus1 : Tuint8_t;
      cabac_init_idc : Tuint8_t;
      slice_qp_delta : Tint8_t;
      disable_deblocking_filter_idc : Tuint8_t;
      slice_alpha_c0_offset_div2 : Tint8_t;
      slice_beta_offset_div2 : Tint8_t;
      RefPicList0 : array[0..31] of TVAPictureH264;
      RefPicList1 : array[0..31] of TVAPictureH264;
      luma_log2_weight_denom : Tuint8_t;
      chroma_log2_weight_denom : Tuint8_t;
      luma_weight_l0_flag : Tuint8_t;
      luma_weight_l0 : array[0..31] of Tint16_t;
      luma_offset_l0 : array[0..31] of Tint16_t;
      chroma_weight_l0_flag : Tuint8_t;
      chroma_weight_l0 : array[0..31] of array[0..1] of Tint16_t;
      chroma_offset_l0 : array[0..31] of array[0..1] of Tint16_t;
      luma_weight_l1_flag : Tuint8_t;
      luma_weight_l1 : array[0..31] of Tint16_t;
      luma_offset_l1 : array[0..31] of Tint16_t;
      chroma_weight_l1_flag : Tuint8_t;
      chroma_weight_l1 : array[0..31] of array[0..1] of Tint16_t;
      chroma_offset_l1 : array[0..31] of array[0..1] of Tint16_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{***************************
 * Common encode data structures
 *************************** }

  PVAEncPictureType = ^TVAEncPictureType;
  TVAEncPictureType =  Longint;
  Const
    VAEncPictureTypeIntra = 0;
    VAEncPictureTypePredictive = 1;
    VAEncPictureTypeBidirectional = 2;
;
{*
 * \brief Encode Slice Parameter Buffer.
 *
 * @deprecated
 * This is a deprecated encode slice parameter buffer, All applications
 * \c can use VAEncSliceParameterBufferXXX (XXX = MPEG2, HEVC, H264, JPEG)
  }
{ starting MB row number for this slice  }
{ slice height measured in MB  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAEncSliceParameterBuffer = ^TVAEncSliceParameterBuffer;
  TVAEncSliceParameterBuffer = record
      start_row_number : Tuint32_t;
      slice_height : Tuint32_t;
      slice_flags : record
          case longint of
            0 : ( bits : record
                flag0 : word;
              end );
            1 : ( value : Tuint32_t );
          end;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;

const
  bm__VAEncSliceParameterBuffer_is_intra = $1;
  bp__VAEncSliceParameterBuffer_is_intra = 0;
  bm__VAEncSliceParameterBuffer_disable_deblocking_filter_idc = $6;
  bp__VAEncSliceParameterBuffer_disable_deblocking_filter_idc = 1;
  bm__VAEncSliceParameterBuffer_uses_long_term_ref = $8;
  bp__VAEncSliceParameterBuffer_uses_long_term_ref = 3;
  bm__VAEncSliceParameterBuffer_is_long_term_ref = $10;
  bp__VAEncSliceParameterBuffer_is_long_term_ref = 4;

{***************************
 * H.263 specific encode data structures
 *************************** }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAEncSequenceParameterBufferH263 = ^TVAEncSequenceParameterBufferH263;
  TVAEncSequenceParameterBufferH263 = record
      intra_period : Tuint32_t;
      bits_per_second : Tuint32_t;
      frame_rate : Tuint32_t;
      initial_qp : Tuint32_t;
      min_qp : Tuint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{* \brief Reserved bytes for future use, must be zero  }

  PVAEncPictureParameterBufferH263 = ^TVAEncPictureParameterBufferH263;
  TVAEncPictureParameterBufferH263 = record
      reference_picture : TVASurfaceID;
      reconstructed_picture : TVASurfaceID;
      coded_buf : TVABufferID;
      picture_width : Tuint16_t;
      picture_height : Tuint16_t;
      picture_type : TVAEncPictureType;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{***************************
 * MPEG-4 specific encode data structures
 *************************** }
{* \brief Reserved bytes for future use, must be zero  }

  PVAEncSequenceParameterBufferMPEG4 = ^TVAEncSequenceParameterBufferMPEG4;
  TVAEncSequenceParameterBufferMPEG4 = record
      profile_and_level_indication : Tuint8_t;
      intra_period : Tuint32_t;
      video_object_layer_width : Tuint32_t;
      video_object_layer_height : Tuint32_t;
      vop_time_increment_resolution : Tuint32_t;
      fixed_vop_rate : Tuint32_t;
      fixed_vop_time_increment : Tuint32_t;
      bits_per_second : Tuint32_t;
      frame_rate : Tuint32_t;
      initial_qp : Tuint32_t;
      min_qp : Tuint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{ number of 1s  }
{* \brief Reserved bytes for future use, must be zero  }

  PVAEncPictureParameterBufferMPEG4 = ^TVAEncPictureParameterBufferMPEG4;
  TVAEncPictureParameterBufferMPEG4 = record
      reference_picture : TVASurfaceID;
      reconstructed_picture : TVASurfaceID;
      coded_buf : TVABufferID;
      picture_width : Tuint16_t;
      picture_height : Tuint16_t;
      modulo_time_base : Tuint32_t;
      vop_time_increment : Tuint32_t;
      picture_type : TVAEncPictureType;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{* Buffer functions  }
{*
 * Creates a buffer for "num_elements" elements of "size" bytes and
 * initalize with "data".
 * if "data" is null, then the contents of the buffer data store
 * are undefined.
 * Basically there are two ways to get buffer data to the server side. One is
 * to call vaCreateBuffer() with a non-null "data", which results the data being
 * copied to the data store on the server side.  A different method that
 * eliminates this copy is to pass null as "data" when calling vaCreateBuffer(),
 * and then use vaMapBuffer() to map the data store from the server side to the
 * client address space for access.
 * The user must call vaDestroyBuffer() to destroy a buffer.
 *  Note: image buffers are created by the library, not the client. Please see
 *        vaCreateImage on how image buffers are managed.
  }
{ in  }
{ in  }
{ in  }
{ in  }
{ out  }

function vaCreateBuffer(dpy:TVADisplay; context:TVAContextID; _type:TVABufferType; size:dword; num_elements:dword; 
           data:pointer; buf_id:PVABufferID):TVAStatus;cdecl;external;
{*
 * Create a buffer for given width & height get unit_size, pitch, buf_id for 2D buffer
 * for permb qp buffer, it will return unit_size for one MB or LCU and the pitch for alignments
 * can call vaMapBuffer with this Buffer ID to get virtual address.
 * e.g. AVC 1080P encode, 1920x1088, the size in MB is 120x68,but inside driver,
 * maybe it should align with 256, and one byte present one Qp.so, call the function.
 * then get unit_size = 1, pitch = 256. call vaMapBuffer to get the virtual address (pBuf).
 * then read write the memory like 2D. the size is 256x68, application can only use 120x68
 * pBuf + 256 is the start of next line.
 * different driver implementation maybe return different unit_size and pitch
  }
function vaCreateBuffer2(dpy:TVADisplay; context:TVAContextID; _type:TVABufferType; width:dword; height:dword; 
           unit_size:Pdword; pitch:Pdword; buf_id:PVABufferID):TVAStatus;cdecl;external;
{*
 * Convey to the server how many valid elements are in the buffer.
 * e.g. if multiple slice parameters are being held in a single buffer,
 * this will communicate to the server the number of slice parameters
 * that are valid in the buffer.
  }
{ in  }
{ in  }
function vaBufferSetNumElements(dpy:TVADisplay; buf_id:TVABufferID; num_elements:dword):TVAStatus;cdecl;external;
{*
 * device independent data structure for codedbuffer
  }
{
 * FICTURE_AVE_QP(bit7-0): The average Qp value used during this frame
 * LARGE_SLICE(bit8):At least one slice in the current frame was large
 *              enough for the encoder to attempt to limit its size.
 * SLICE_OVERFLOW(bit9): At least one slice in the current frame has
 *              exceeded the maximum slice size specified.
 * BITRATE_OVERFLOW(bit10): The peak bitrate was exceeded for this frame.
 * BITRATE_HIGH(bit11): The frame size got within the safety margin of the maximum size (VCM only)
 * AIR_MB_OVER_THRESHOLD: the number of MBs adapted to Intra MB
  }
const
  VA_CODED_BUF_STATUS_PICTURE_AVE_QP_MASK = $ff;  
  VA_CODED_BUF_STATUS_LARGE_SLICE_MASK = $100;  
  VA_CODED_BUF_STATUS_SLICE_OVERFLOW_MASK = $200;  
  VA_CODED_BUF_STATUS_BITRATE_OVERFLOW = $400;  
  VA_CODED_BUF_STATUS_BITRATE_HIGH = $800;  
{*
 * \brief The frame has exceeded the maximum requested size.
 *
 * This flag indicates that the encoded frame size exceeds the value
 * specified through a misc parameter buffer of type
 * #VAEncMiscParameterTypeMaxFrameSize.
  }
  VA_CODED_BUF_STATUS_FRAME_SIZE_OVERFLOW = $1000;  
{*
 * \brief the bitstream is bad or corrupt.
  }
  VA_CODED_BUF_STATUS_BAD_BITSTREAM = $8000;  
  VA_CODED_BUF_STATUS_AIR_MB_OVER_THRESHOLD = $ff0000;  
{*
 * \brief The coded buffer segment status contains frame encoding passes number
 *
 * This is the mask to get the number of encoding passes from the coded
 * buffer segment status.
 * NUMBER_PASS(bit24~bit27): the number for encoding passes executed for the coded frame.
 *
  }
  VA_CODED_BUF_STATUS_NUMBER_PASSES_MASK = $f000000;  
{*
 * \brief The coded buffer segment contains a single NAL unit.
 *
 * This flag indicates that the coded buffer segment contains a
 * single NAL unit. This flag might be useful to the user for
 * processing the coded buffer.
  }
  VA_CODED_BUF_STATUS_SINGLE_NALU = $10000000;  
{*
 * \brief Coded buffer segment.
 *
 * #VACodedBufferSegment is an element of a linked list describing
 * some information on the coded buffer. The coded buffer segment
 * could contain either a single NAL unit, or more than one NAL unit.
 * It is recommended (but not required) to return a single NAL unit
 * in a coded buffer segment, and the implementation should set the
 * VA_CODED_BUF_STATUS_SINGLE_NALU status flag if that is the case.
  }
{*
     * \brief Size of the data buffer in this segment (in bytes).
      }
{* \brief Bit offset into the data buffer where the video data starts.  }
{* \brief Status set by the driver. See \c VA_CODED_BUF_STATUS_*.  }
{* \brief Reserved for future use.  }
{* \brief Pointer to the start of the data buffer.  }
{*
     * \brief Pointer to the next #VACodedBufferSegment element,
     * or \c NULL if there is none.
      }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVACodedBufferSegment = ^TVACodedBufferSegment;
  TVACodedBufferSegment = record
      size : Tuint32_t;
      bit_offset : Tuint32_t;
      status : Tuint32_t;
      reserved : Tuint32_t;
      buf : pointer;
      next : pointer;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{*
 * Map data store of the buffer into the client's address space
 * vaCreateBuffer() needs to be called with "data" set to NULL before
 * calling vaMapBuffer()
 *
 * if buffer type is VAEncCodedBufferType, pbuf points to link-list of
 * VACodedBufferSegment, and the list is terminated if "next" is NULL
  }
{ in  }
{ out  }

function vaMapBuffer(dpy:TVADisplay; buf_id:TVABufferID; pbuf:Ppointer):TVAStatus;cdecl;external;
{*
 * After client making changes to a mapped data store, it needs to
 * "Unmap" it to let the server know that the data is ready to be
 * consumed by the server
  }
{ in  }
function vaUnmapBuffer(dpy:TVADisplay; buf_id:TVABufferID):TVAStatus;cdecl;external;
{*
 * After this call, the buffer is deleted and this buffer_id is no longer valid
 *
 * A buffer can be re-used and sent to the server by another Begin/Render/End
 * sequence if vaDestroyBuffer() is not called with this buffer.
 *
 * Note re-using a shared buffer (e.g. a slice data buffer) between the host and the
 * hardware accelerator can result in performance dropping.
  }
function vaDestroyBuffer(dpy:TVADisplay; buffer_id:TVABufferID):TVAStatus;cdecl;external;
{* \brief VA buffer information  }
{* \brief Buffer handle  }
{* \brief Buffer type (See \ref VABufferType).  }
{*
     * \brief Buffer memory type (See \ref VASurfaceAttribMemoryType).
     *
     * On input to vaAcquireBufferHandle(), this field can serve as a hint
     * to specify the set of memory types the caller is interested in.
     * On successful return from vaAcquireBufferHandle(), the field is
     * updated with the best matching memory type.
      }
{* \brief Size of the underlying buffer.  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVABufferInfo = ^TVABufferInfo;
  TVABufferInfo = record
      handle : Tuintptr_t;
      _type : Tuint32_t;
      mem_type : Tuint32_t;
      mem_size : Tsize_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{*
 * \brief Acquires buffer handle for external API usage
 *
 * Locks the VA buffer object \ref buf_id for external API usage like
 * EGL or OpenCL (OCL). This function is a synchronization point. This
 * means that any pending operation is guaranteed to be completed
 * prior to returning from the function.
 *
 * If the referenced VA buffer object is the backing store of a VA
 * surface, then this function acts as if vaSyncSurface() on the
 * parent surface was called first.
 *
 * The \ref VABufferInfo argument shall be zero'ed on input. On
 * successful output, the data structure is filled in with all the
 * necessary buffer level implementation details like handle, type,
 * memory type and memory size.
 *
 * Note: the external API implementation, or the application, can
 * express the memory types it is interested in by filling in the \ref
 * mem_type field accordingly. On successful output, the memory type
 * that fits best the request and that was used is updated in the \ref
 * VABufferInfo data structure. If none of the supplied memory types
 * is supported, then a \ref VA_STATUS_ERROR_UNSUPPORTED_MEMORY_TYPE
 * error is returned.
 *
 * The \ref VABufferInfo data is valid until vaReleaseBufferHandle()
 * is called. Besides, no additional operation is allowed on any of
 * the buffer parent object until vaReleaseBufferHandle() is called.
 * e.g. decoding into a VA surface backed with the supplied VA buffer
 * object \ref buf_id would fail with a \ref VA_STATUS_ERROR_SURFACE_BUSY
 * error.
 *
 * Possible errors:
 * - \ref VA_STATUS_ERROR_UNIMPLEMENTED: the VA driver implementation
 *   does not support this interface
 * - \ref VA_STATUS_ERROR_INVALID_DISPLAY: an invalid display was supplied
 * - \ref VA_STATUS_ERROR_INVALID_BUFFER: an invalid buffer was supplied
 * - \ref VA_STATUS_ERROR_UNSUPPORTED_BUFFERTYPE: the implementation
 *   does not support exporting buffers of the specified type
 * - \ref VA_STATUS_ERROR_UNSUPPORTED_MEMORY_TYPE: none of the requested
 *   memory types in \ref VABufferInfo.mem_type was supported
 *
 * @param[in] dpy               the VA display
 * @param[in] buf_id            the VA buffer
 * @param[in,out] buf_info      the associated VA buffer information
 * @return VA_STATUS_SUCCESS if successful
  }

function vaAcquireBufferHandle(dpy:TVADisplay; buf_id:TVABufferID; buf_info:PVABufferInfo):TVAStatus;cdecl;external;
{*
 * \brief Releases buffer after usage from external API
 *
 * Unlocks the VA buffer object \ref buf_id from external API usage like
 * EGL or OpenCL (OCL). This function is a synchronization point. This
 * means that any pending operation is guaranteed to be completed
 * prior to returning from the function.
 *
 * The \ref VABufferInfo argument shall point to the original data
 * structure that was obtained from vaAcquireBufferHandle(), unaltered.
 * This is necessary so that the VA driver implementation could
 * deallocate any resources that were needed.
 *
 * In any case, returning from this function invalidates any contents
 * in \ref VABufferInfo. i.e. the underlyng buffer handle is no longer
 * valid. Therefore, VA driver implementations are free to reset this
 * data structure to safe defaults.
 *
 * Possible errors:
 * - \ref VA_STATUS_ERROR_UNIMPLEMENTED: the VA driver implementation
 *   does not support this interface
 * - \ref VA_STATUS_ERROR_INVALID_DISPLAY: an invalid display was supplied
 * - \ref VA_STATUS_ERROR_INVALID_BUFFER: an invalid buffer was supplied
 * - \ref VA_STATUS_ERROR_UNSUPPORTED_BUFFERTYPE: the implementation
 *   does not support exporting buffers of the specified type
 *
 * @param[in] dpy               the VA display
 * @param[in] buf_id            the VA buffer
 * @return VA_STATUS_SUCCESS if successful
  }
function vaReleaseBufferHandle(dpy:TVADisplay; buf_id:TVABufferID):TVAStatus;cdecl;external;
{* @name vaExportSurfaceHandle() flags
 *
 * @
  }
{* Export surface to be read by external API.  }
const
  VA_EXPORT_SURFACE_READ_ONLY = $0001;  
{* Export surface to be written by external API.  }
  VA_EXPORT_SURFACE_WRITE_ONLY = $0002;  
{* Export surface to be both read and written by external API.  }
  VA_EXPORT_SURFACE_READ_WRITE = $0003;  
{* Export surface with separate layers.
 *
 * For example, NV12 surfaces should be exported as two separate
 * planes for luma and chroma.
  }
  VA_EXPORT_SURFACE_SEPARATE_LAYERS = $0004;  
{* Export surface with composed layers.
 *
 * For example, NV12 surfaces should be exported as a single NV12
 * composed object.
  }
  VA_EXPORT_SURFACE_COMPOSED_LAYERS = $0008;  
{* @  }
{*
 * \brief Export a handle to a surface for use with an external API
 *
 * The exported handles are owned by the caller, and the caller is
 * responsible for freeing them when no longer needed (e.g. by closing
 * DRM PRIME file descriptors).
 *
 * This does not perform any synchronisation.  If the contents of the
 * surface will be read, vaSyncSurface() must be called before doing so.
 * If the contents of the surface are written, then all operations must
 * be completed externally before using the surface again by via VA-API
 * functions.
 *
 * @param[in] dpy          VA display.
 * @param[in] surface_id   Surface to export.
 * @param[in] mem_type     Memory type to export to.
 * @param[in] flags        Combination of flags to apply
 *   (VA_EXPORT_SURFACE_*).
 * @param[out] descriptor  Pointer to the descriptor structure to fill
 *   with the handle details.  The type of this structure depends on
 *   the value of mem_type.
 *
 * @return Status code:
 * - VA_STATUS_SUCCESS:    Success.
 * - VA_STATUS_ERROR_INVALID_DISPLAY:  The display is not valid.
 * - VA_STATUS_ERROR_UNIMPLEMENTED:  The driver does not implement
 *     this interface.
 * - VA_STATUS_ERROR_INVALID_SURFACE:  The surface is not valid, or
 *     the surface is not exportable in the specified way.
 * - VA_STATUS_ERROR_UNSUPPORTED_MEMORY_TYPE:  The driver does not
 *     support exporting surfaces to the specified memory type.
  }

function vaExportSurfaceHandle(dpy:TVADisplay; surface_id:TVASurfaceID; mem_type:Tuint32_t; flags:Tuint32_t; descriptor:pointer):TVAStatus;cdecl;external;
{*
 * Render (Video Decode/Encode/Processing) Pictures
 *
 * A picture represents either a frame or a field.
 *
 * The Begin/Render/End sequence sends the video decode/encode/processing buffers
 * to the server
  }
{*
 * Get ready for a video pipeline
 * - decode a picture to a target surface
 * - encode a picture from a target surface
 * - process a picture to a target surface
  }
function vaBeginPicture(dpy:TVADisplay; context:TVAContextID; render_target:TVASurfaceID):TVAStatus;cdecl;external;
{*
 * Send video decode, encode or processing buffers to the server.
  }
function vaRenderPicture(dpy:TVADisplay; context:TVAContextID; buffers:PVABufferID; num_buffers:longint):TVAStatus;cdecl;external;
{*
 * Make the end of rendering for a picture.
 * The server should start processing all pending operations for this
 * surface. This call is non-blocking. The client can start another
 * Begin/Render/End sequence on a different render target.
 * if VAContextID used in this function previously successfully passed
 * vaMFAddContext call, real processing will be started during vaMFSubmit
  }
function vaEndPicture(dpy:TVADisplay; context:TVAContextID):TVAStatus;cdecl;external;
{*
 * Make the end of rendering for a pictures in contexts passed with submission.
 * The server should start processing all pending operations for contexts.
 * All contexts passed should be associated through vaMFAddContext
 * and call sequence Begin/Render/End performed.
 * This call is non-blocking. The client can start another
 * Begin/Render/End/vaMFSubmit sequence on a different render targets.
 * Return values:
 * VA_STATUS_SUCCESS - operation successful, context was removed.
 * VA_STATUS_ERROR_INVALID_CONTEXT - mf_context or one of contexts are invalid
 * due to mf_context not created or one of contexts not assotiated with mf_context
 * through vaAddContext.
 * VA_STATUS_ERROR_INVALID_PARAMETER - one of context has not submitted it's frame
 * through vaBeginPicture vaRenderPicture vaEndPicture call sequence.
 * dpy: display
 * mf_context: Multi-Frame context
 * contexts: list of contexts submitting their tasks for multi-frame operation.
 * num_contexts: number of passed contexts.
  }
function vaMFSubmit(dpy:TVADisplay; mf_context:TVAMFContextID; contexts:PVAContextID; num_contexts:longint):TVAStatus;cdecl;external;
{

Synchronization

 }
{*
 * This function blocks until all pending operations on the render target
 * have been completed.  Upon return it is safe to use the render target for a
 * different picture.
  }
function vaSyncSurface(dpy:TVADisplay; render_target:TVASurfaceID):TVAStatus;cdecl;external;
{* \brief Indicates an infinite timeout.  }
const
  VA_TIMEOUT_INFINITE = $FFFFFFFFFFFFFFFF;  
{*
 * \brief Synchronizes pending operations associated with the supplied surface.
 *
 * This function blocks during specified timeout (in nanoseconds) until
 * all pending operations on the render target have been completed.
 * If timeout is zero, the function returns immediately.
 *
 * Possible errors:
 * - \ref VA_STATUS_ERROR_UNIMPLEMENTED: the VA driver implementation
 *   does not support this interface
 * - \ref VA_STATUS_ERROR_INVALID_DISPLAY: an invalid display was supplied
 * - \ref VA_STATUS_ERROR_INVALID_SURFACE: an invalid surface was supplied
 * - \ref VA_STATUS_ERROR_TIMEDOUT: synchronization is still in progress,
 *   client should call the function again to complete synchronization
 *
 * @param[in] dpy         the VA display
 * @param[in] surface     the surface for which synchronization is performed
 * @param[in] timeout_ns  the timeout in nanoseconds
 *
  }

function vaSyncSurface2(dpy:TVADisplay; surface:TVASurfaceID; timeout_ns:Tuint64_t):TVAStatus;cdecl;external;
{ Rendering in progress  }
{ Displaying in progress (not safe to render into it)  }
{ this status is useful if surface is used as the source  }
{ of an overlay  }
{ not being rendered or displayed  }
{ Indicate a skipped frame during encode  }
type
  PVASurfaceStatus = ^TVASurfaceStatus;
  TVASurfaceStatus =  Longint;
  Const
    VASurfaceRendering = 1;
    VASurfaceDisplaying = 2;
    VASurfaceReady = 4;
    VASurfaceSkipped = 8;
;
{*
 * Find out any pending ops on the render target
  }
{ out  }

function vaQuerySurfaceStatus(dpy:TVADisplay; render_target:TVASurfaceID; status:PVASurfaceStatus):TVAStatus;cdecl;external;
type
  PVADecodeErrorType = ^TVADecodeErrorType;
  TVADecodeErrorType =  Longint;
  Const
    VADecodeSliceMissing = 0;
    VADecodeMBError = 1;
    VADecodeReset = 2;
;
{*
 * Client calls vaQuerySurfaceError with VA_STATUS_ERROR_DECODING_ERROR, server side returns
 * an array of structure VASurfaceDecodeMBErrors, and the array is terminated by setting status=-1
 }
{ 1 if hardware has returned detailed info below, -1 means this record is invalid  }
{ start mb address with errors  }
{ end mb address with errors  }
{ number of mbs with errors  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVASurfaceDecodeMBErrors = ^TVASurfaceDecodeMBErrors;
  TVASurfaceDecodeMBErrors = record
      status : Tint32_t;
      start_mb : Tuint32_t;
      end_mb : Tuint32_t;
      decode_error_type : TVADecodeErrorType;
      num_mb : Tuint32_t;
      va_reserved : array[0..(VA_PADDING_LOW-1)-1] of Tuint32_t;
    end;
{*
 * After the application gets VA_STATUS_ERROR_DECODING_ERROR after calling vaSyncSurface(),
 * it can call vaQuerySurfaceError to find out further details on the particular error.
 * VA_STATUS_ERROR_DECODING_ERROR should be passed in as "error_status".
 *
 * After the applications get VA_STATUS_HW_BUSY or VA_STATUS_SUCCESSFULL from vaSyncSurface(),
 * it still can call vaQuerySurfaceError to find out further details to know if has real hw reset
 * happened on this surface since umd and kmd could recover the context from reset with success in sometimes.
 * VA_STATUS_HW_BUSY or VA_STATUS_SUCCESSFULL also could be passed in as "error_status".
 *
 * Upon the return, error_info will point to an array of _VASurfaceDecodeMBErrors structure,
 * which is allocated and filled by libVA with detailed information on the VADecodeErrorType.
 * The array is terminated if "status==-1" is detected.
  }

function vaQuerySurfaceError(dpy:TVADisplay; surface:TVASurfaceID; error_status:TVAStatus; error_info:Ppointer):TVAStatus;cdecl;external;
{*
 * \brief Synchronizes pending operations associated with the supplied buffer.
 *
 * This function blocks during specified timeout (in nanoseconds) until
 * all pending operations on the supplied buffer have been completed.
 * If timeout is zero, the function returns immediately.
 *
 * Possible errors:
 * - \ref VA_STATUS_ERROR_UNIMPLEMENTED: the VA driver implementation
 *   does not support this interface
 * - \ref VA_STATUS_ERROR_INVALID_DISPLAY: an invalid display was supplied
 * - \ref VA_STATUS_ERROR_INVALID_BUFFER: an invalid buffer was supplied
 * - \ref VA_STATUS_ERROR_TIMEDOUT: synchronization is still in progress,
 *   client should call the function again to complete synchronization
 *
 * @param[in] dpy         the VA display
 * @param[in] buf_id      the buffer for which synchronization is performed
 * @param[in] timeout_ns  the timeout in nanoseconds
 *
  }
function vaSyncBuffer(dpy:TVADisplay; buf_id:TVABufferID; timeout_ns:Tuint64_t):TVAStatus;cdecl;external;
{*
 * Notes about synchronization interfaces:
 * vaSyncSurface:
 * 1. Allows to synchronize output surface (i.e. from decoding or VP)
 * 2. Allows to synchronize all bitstreams being encoded from the given input surface (1->N pipelines).
 *
 * vaSyncSurface2:
 * 1. The same as vaSyncSurface but allows to specify a timeout
 *
 * vaSyncBuffer:
 * 1. Allows to synchronize output buffer (e.g. bitstream from encoding).
 *    Comparing to vaSyncSurface this function synchronizes given bitstream only.
  }
{*
 * Images and Subpictures
 * VAImage is used to either get the surface data to client memory, or
 * to copy image data in client memory to a surface.
 * Both images, subpictures and surfaces follow the same 2D coordinate system where origin
 * is at the upper left corner with positive X to the right and positive Y down
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VA_FOURCC(ch0,ch1,ch2,ch3 : longint) : longint;

{ Pre-defined fourcc codes.  }
{* NV12: two-plane 8-bit YUV 4:2:0.
 * The first plane contains Y, the second plane contains U and V in pairs of bytes.
  }
const
  VA_FOURCC_NV12 = $3231564E;  
{* NV21: two-plane 8-bit YUV 4:2:0.
 * Same as NV12, but with U and V swapped.
  }
  VA_FOURCC_NV21 = $3132564E;  
{* AI44: packed 4-bit YA.
 *
 * The bottom half of each byte contains luma, the top half contains alpha.
  }
  VA_FOURCC_AI44 = $34344149;  
{* RGBA: packed 8-bit RGBA.
 *
 * Four bytes per pixel: red, green, blue, alpha.
  }
  VA_FOURCC_RGBA = $41424752;  
{* RGBX: packed 8-bit RGB.
 *
 * Four bytes per pixel: red, green, blue, unspecified.
  }
  VA_FOURCC_RGBX = $58424752;  
{* BGRA: packed 8-bit RGBA.
 *
 * Four bytes per pixel: blue, green, red, alpha.
  }
  VA_FOURCC_BGRA = $41524742;  
{* BGRX: packed 8-bit RGB.
 *
 * Four bytes per pixel: blue, green, red, unspecified.
  }
  VA_FOURCC_BGRX = $58524742;  
{* ARGB: packed 8-bit RGBA.
 *
 * Four bytes per pixel: alpha, red, green, blue.
  }
  VA_FOURCC_ARGB = $42475241;  
{* XRGB: packed 8-bit RGB.
 *
 * Four bytes per pixel: unspecified, red, green, blue.
  }
  VA_FOURCC_XRGB = $42475258;  
{* ABGR: packed 8-bit RGBA.
 *
 * Four bytes per pixel: alpha, blue, green, red.
  }
  VA_FOURCC_ABGR = $52474241;  
{* XBGR: packed 8-bit RGB.
 *
 * Four bytes per pixel: unspecified, blue, green, red.
  }
  VA_FOURCC_XBGR = $52474258;  
{* UYUV: packed 8-bit YUV 4:2:2.
 *
 * Four bytes per pair of pixels: U, Y, U, V.
  }
  VA_FOURCC_UYVY = $59565955;  
{* YUY2: packed 8-bit YUV 4:2:2.
 *
 * Four bytes per pair of pixels: Y, U, Y, V.
  }
  VA_FOURCC_YUY2 = $32595559;  
{* AYUV: packed 8-bit YUVA 4:4:4.
 *
 * Four bytes per pixel: A, Y, U, V.
  }
  VA_FOURCC_AYUV = $56555941;  
{* NV11: two-plane 8-bit YUV 4:1:1.
 *
 * The first plane contains Y, the second plane contains U and V in pairs of bytes.
  }
  VA_FOURCC_NV11 = $3131564e;  
{* YV12: three-plane 8-bit YUV 4:2:0.
 *
 * The three planes contain Y, V and U respectively.
  }
  VA_FOURCC_YV12 = $32315659;  
{* P208: two-plane 8-bit YUV 4:2:2.
 *
 * The first plane contains Y, the second plane contains U and V in pairs of bytes.
  }
  VA_FOURCC_P208 = $38303250;  
{* I420: three-plane 8-bit YUV 4:2:0.
 *
 * The three planes contain Y, U and V respectively.
  }
  VA_FOURCC_I420 = $30323449;  
{* YV24: three-plane 8-bit YUV 4:4:4.
 *
 * The three planes contain Y, V and U respectively.
  }
  VA_FOURCC_YV24 = $34325659;  
{* YV32: four-plane 8-bit YUVA 4:4:4
 *
 * The four planes contain Y, V, U and A respectively.
  }
  VA_FOURCC_YV32 = $32335659;  
{* Y800: 8-bit greyscale.
  }
  VA_FOURCC_Y800 = $30303859;  
{* IMC3: three-plane 8-bit YUV 4:2:0.
 *
 * Equivalent to YV12, but with the additional constraint that the pitch of all three planes
 * must be the same.
  }
  VA_FOURCC_IMC3 = $33434D49;  
{* 411P: three-plane 8-bit YUV 4:1:1.
 *
 * The three planes contain Y, U and V respectively.
  }
  VA_FOURCC_411P = $50313134;  
{* 411R: three-plane 8-bit YUV.
 *
 * The subsampling is the transpose of 4:1:1 - full chroma appears on every fourth line.
 * The three planes contain Y, U and V respectively.
  }
  VA_FOURCC_411R = $52313134;  
{* 422H: three-plane 8-bit YUV 4:2:2.
 *
 * The three planes contain Y, U and V respectively.
  }
  VA_FOURCC_422H = $48323234;  
{* 422V: three-plane 8-bit YUV 4:4:0.
 *
 * The three planes contain Y, U and V respectively.
  }
  VA_FOURCC_422V = $56323234;  
{* 444P: three-plane 8-bit YUV 4:4:4.
 *
 * The three planes contain Y, U and V respectively.
  }
  VA_FOURCC_444P = $50343434;  
{* RGBP: three-plane 8-bit RGB.
 *
 * The three planes contain red, green and blue respectively.
  }
  VA_FOURCC_RGBP = $50424752;  
{* BGRP: three-plane 8-bit RGB.
 *
 * The three planes contain blue, green and red respectively.
  }
  VA_FOURCC_BGRP = $50524742;  
{* RG16: packed 5/6-bit RGB.
 *
 * Each pixel is a two-byte little-endian value.
 * Red, green and blue are found in bits 15:11, 10:5, 4:0 respectively.
  }
  VA_FOURCC_RGB565 = $36314752;  
{* BG16: packed 5/6-bit RGB.
 *
 * Each pixel is a two-byte little-endian value.
 * Blue, green and red are found in bits 15:11, 10:5, 4:0 respectively.
  }
  VA_FOURCC_BGR565 = $36314742;  
{* Y210: packed 10-bit YUV 4:2:2.
 *
 * Eight bytes represent a pair of pixels.  Each sample is a two-byte little-endian value,
 * with the bottom six bits ignored.  The samples are in the order Y, U, Y, V.
  }
  VA_FOURCC_Y210 = $30313259;  
{* Y212: packed 12-bit YUV 4:2:2.
 *
 * Eight bytes represent a pair of pixels.  Each sample is a two-byte little-endian value.
 * The samples are in the order Y, U, Y, V.
  }
  VA_FOURCC_Y212 = $32313259;  
{* Y216: packed 16-bit YUV 4:2:2.
 *
 * Eight bytes represent a pair of pixels.  Each sample is a two-byte little-endian value.
 * The samples are in the order Y, U, Y, V.
  }
  VA_FOURCC_Y216 = $36313259;  
{* Y410: packed 10-bit YUVA 4:4:4.
 *
 * Each pixel is a four-byte little-endian value.
 * A, V, Y, U are found in bits 31:30, 29:20, 19:10, 9:0 respectively.
  }
  VA_FOURCC_Y410 = $30313459;  
{* Y412 packed 12-bit YUVA 4:4:4.
 *
 * Each pixel is a set of four samples, each of which is a two-byte little-endian value.
 * The samples are in the order A, V, Y, U.
  }
  VA_FOURCC_Y412 = $32313459;  
{* Y416: packed 16-bit YUVA 4:4:4.
 *
 * Each pixel is a set of four samples, each of which is a two-byte little-endian value.
 * The samples are in the order A, V, Y, U.
  }
  VA_FOURCC_Y416 = $36313459;  
{* YV16: three-plane 8-bit YUV 4:2:2.
 *
 * The three planes contain Y, V and U respectively.
  }
  VA_FOURCC_YV16 = $36315659;  
{* P010: two-plane 10-bit YUV 4:2:0.
 *
 * Each sample is a two-byte little-endian value with the bottom six bits ignored.
 * The first plane contains Y, the second plane contains U and V in pairs of samples.
  }
  VA_FOURCC_P010 = $30313050;  
{* P012: two-plane 12-bit YUV 4:2:0.
 *
 * Each sample is a two-byte little-endian value with the bottom four bits ignored.
 * The first plane contains Y, the second plane contains U and V in pairs of samples.
  }
  VA_FOURCC_P012 = $32313050;  
{* P016: two-plane 16-bit YUV 4:2:0.
 *
 * Each sample is a two-byte little-endian value.  The first plane contains Y, the second
 * plane contains U and V in pairs of samples.
  }
  VA_FOURCC_P016 = $36313050;  
{* I010: three-plane 10-bit YUV 4:2:0.
 *
 * Each sample is a two-byte little-endian value with the top six bits ignored.
 * The three planes contain Y, V and U respectively.
  }
  VA_FOURCC_I010 = $30313049;  
{* IYUV: three-plane 8-bit YUV 4:2:0.
 *
 * @deprecated Use I420 instead.
  }
  VA_FOURCC_IYUV = $56555949;  
{*
 * 10-bit Pixel RGB formats.
  }
{ VA_FOURCC('A','R','3','0')  }
  VA_FOURCC_A2R10G10B10 = $30335241;  
{*
 * 10-bit Pixel BGR formats.
  }
{ VA_FOURCC('A','B','3','0')  }
  VA_FOURCC_A2B10G10R10 = $30334241;  
{*
 * 10-bit Pixel RGB formats without alpha.
  }
{ VA_FOURCC('X','R','3','0')  }
  VA_FOURCC_X2R10G10B10 = $30335258;  
{*
 * 10-bit Pixel BGR formats without alpha.
  }
{ VA_FOURCC('X','B','3','0')  }
  VA_FOURCC_X2B10G10R10 = $30334258;  
{* Y8: 8-bit greyscale.
 *
 * Only a single sample, 8 bit Y plane for monochrome images
  }
  VA_FOURCC_Y8 = $20203859;  
{* Y16: 16-bit greyscale.
 *
 * Only a single sample, 16 bit Y plane for monochrome images
  }
  VA_FOURCC_Y16 = $20363159;  
{* VYUV: packed 8-bit YUV 4:2:2.
 *
 * Four bytes per pair of pixels: V, Y, U, V.
  }
  VA_FOURCC_VYUY = $59555956;  
{* YVYU: packed 8-bit YUV 4:2:2.
 *
 * Four bytes per pair of pixels: Y, V, Y, U.
  }
  VA_FOURCC_YVYU = $55595659;  
{* AGRB64: three-plane 16-bit ARGB 16:16:16:16
 *
 * The four planes contain: alpha, red, green, blue respectively.
  }
  VA_FOURCC_ARGB64 = $34475241;  
{* ABGR64: three-plane 16-bit ABGR 16:16:16:16
 *
 * The four planes contain: alpha, blue, green, red respectively.
  }
  VA_FOURCC_ABGR64 = $34474241;  
{* XYUV: packed 8-bit YUVX 4:4:4.
 *
 * Four bytes per pixel: X, Y, U, V.
  }
  VA_FOURCC_XYUV = $56555958;  
{* Q416: three-plane 16-bit YUV 4:4:4.
 *
 * The three planes contain Y, U and V respectively.
  }
  VA_FOURCC_Q416 = $36313451;  
{ byte order  }
  VA_LSB_FIRST = 1;  
  VA_MSB_FIRST = 2;  
{ VA_LSB_FIRST, VA_MSB_FIRST  }
{ for RGB formats  }
{ significant bits per pixel  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAImageFormat = ^TVAImageFormat;
  TVAImageFormat = record
      fourcc : Tuint32_t;
      byte_order : Tuint32_t;
      bits_per_pixel : Tuint32_t;
      depth : Tuint32_t;
      red_mask : Tuint32_t;
      green_mask : Tuint32_t;
      blue_mask : Tuint32_t;
      alpha_mask : Tuint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;

  PVAImageID = ^TVAImageID;
  TVAImageID = TVAGenericID;
{ uniquely identify this image  }
{ image data buffer  }
{
     * Image data will be stored in a buffer of type VAImageBufferType to facilitate
     * data store on the server side for optimal performance. The buffer will be
     * created by the CreateImage function, and proper storage allocated based on the image
     * size and format. This buffer is managed by the library implementation, and
     * accessed by the client through the buffer Map/Unmap functions.
      }
{ can not be greater than 3  }
{
     * An array indicating the scanline pitch in bytes for each plane.
     * Each plane may have a different pitch. Maximum 3 planes for planar formats
      }
{
     * An array indicating the byte offset from the beginning of the image data
     * to the start of each plane.
      }
{ The following fields are only needed for paletted formats  }
{ set to zero for non-palette images  }
{
     * Each component is one byte and entry_bytes indicates the number of components in
     * each entry (eg. 3 for YUV palette entries). set to zero for non-palette images
      }
{
     * An array of ascii characters describing the order of the components within the bytes.
     * Only entry_bytes characters of the string are used.
      }
{* \brief Reserved bytes for future use, must be zero  }

  PVAImage = ^TVAImage;
  TVAImage = record
      image_id : TVAImageID;
      format : TVAImageFormat;
      buf : TVABufferID;
      width : Tuint16_t;
      height : Tuint16_t;
      data_size : Tuint32_t;
      num_planes : Tuint32_t;
      pitches : array[0..2] of Tuint32_t;
      offsets : array[0..2] of Tuint32_t;
      num_palette_entries : Tint32_t;
      entry_bytes : Tint32_t;
      component_order : array[0..3] of Tint8_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{* Get maximum number of image formats supported by the implementation  }

function vaMaxNumImageFormats(dpy:TVADisplay):longint;cdecl;external;
{*
 * Query supported image formats
 * The caller must provide a "format_list" array that can hold at
 * least vaMaxNumImageFormats() entries. The actual number of formats
 * returned in "format_list" is returned in "num_formats".
  }
{ out  }
{ out  }
function vaQueryImageFormats(dpy:TVADisplay; format_list:PVAImageFormat; num_formats:Plongint):TVAStatus;cdecl;external;
{*
 * Create a VAImage structure
 * The width and height fields returned in the VAImage structure may get
 * enlarged for some YUV formats. Upon return from this function,
 * image->buf has been created and proper storage allocated by the library.
 * The client can access the image through the Map/Unmap calls.
  }
{ out  }
function vaCreateImage(dpy:TVADisplay; format:PVAImageFormat; width:longint; height:longint; image:PVAImage):TVAStatus;cdecl;external;
{*
 * Should call DestroyImage before destroying the surface it is bound to
  }
function vaDestroyImage(dpy:TVADisplay; image:TVAImageID):TVAStatus;cdecl;external;
{
     * pointer to an array holding the palette data.  The size of the array is
     * num_palette_entries * entry_bytes in size.  The order of the components
     * in the palette is described by the component_order in VAImage struct
      }
function vaSetImagePalette(dpy:TVADisplay; image:TVAImageID; palette:Pbyte):TVAStatus;cdecl;external;
{*
 * Retrive surface data into a VAImage
 * Image must be in a format supported by the implementation
  }
{ coordinates of the upper left source pixel  }
{ width and height of the region  }
function vaGetImage(dpy:TVADisplay; surface:TVASurfaceID; x:longint; y:longint; width:dword; 
           height:dword; image:TVAImageID):TVAStatus;cdecl;external;
{*
 * Copy data from a VAImage to a surface
 * Image must be in a format supported by the implementation
 * Returns a VA_STATUS_ERROR_SURFACE_BUSY if the surface
 * shouldn't be rendered into when this is called
  }
function vaPutImage(dpy:TVADisplay; surface:TVASurfaceID; image:TVAImageID; src_x:longint; src_y:longint; 
           src_width:dword; src_height:dword; dest_x:longint; dest_y:longint; dest_width:dword; 
           dest_height:dword):TVAStatus;cdecl;external;
{*
 * Derive an VAImage from an existing surface.
 * This interface will derive a VAImage and corresponding image buffer from
 * an existing VA Surface. The image buffer can then be mapped/unmapped for
 * direct CPU access. This operation is only possible on implementations with
 * direct rendering capabilities and internal surface formats that can be
 * represented with a VAImage. When the operation is not possible this interface
 * will return VA_STATUS_ERROR_OPERATION_FAILED. Clients should then fall back
 * to using vaCreateImage + vaPutImage to accomplish the same task in an
 * indirect manner.
 *
 * Implementations should only return success when the resulting image buffer
 * would be useable with vaMap/Unmap.
 *
 * When directly accessing a surface special care must be taken to insure
 * proper synchronization with the graphics hardware. Clients should call
 * vaQuerySurfaceStatus to insure that a surface is not the target of concurrent
 * rendering or currently being displayed by an overlay.
 *
 * Additionally nothing about the contents of a surface should be assumed
 * following a vaPutSurface. Implementations are free to modify the surface for
 * scaling or subpicture blending within a call to vaPutImage.
 *
 * Calls to vaPutImage or vaGetImage using the same surface from which the image
 * has been derived will return VA_STATUS_ERROR_SURFACE_BUSY. vaPutImage or
 * vaGetImage with other surfaces is supported.
 *
 * An image created with vaDeriveImage should be freed with vaDestroyImage. The
 * image and image buffer structures will be destroyed; however, the underlying
 * surface will remain unchanged until freed with vaDestroySurfaces.
  }
{ out  }
function vaDeriveImage(dpy:TVADisplay; surface:TVASurfaceID; image:PVAImage):TVAStatus;cdecl;external;
{*
 * Subpictures
 * Subpicture is a special type of image that can be blended
 * with a surface during vaPutSurface(). Subpicture can be used to render
 * DVD sub-titles or closed captioning text etc.
  }
type
  PVASubpictureID = ^TVASubpictureID;
  TVASubpictureID = TVAGenericID;
{* Get maximum number of subpicture formats supported by the implementation  }

function vaMaxNumSubpictureFormats(dpy:TVADisplay):longint;cdecl;external;
{* flags for subpictures  }
const
  VA_SUBPICTURE_CHROMA_KEYING = $0001;  
  VA_SUBPICTURE_GLOBAL_ALPHA = $0002;  
  VA_SUBPICTURE_DESTINATION_IS_SCREEN_COORD = $0004;  
{*
 * Query supported subpicture formats
 * The caller must provide a "format_list" array that can hold at
 * least vaMaxNumSubpictureFormats() entries. The flags arrary holds the flag
 * for each format to indicate additional capabilities for that format. The actual
 * number of formats returned in "format_list" is returned in "num_formats".
 *  flags: returned value to indicate addtional capabilities
 *         VA_SUBPICTURE_CHROMA_KEYING - supports chroma-keying
 *         VA_SUBPICTURE_GLOBAL_ALPHA - supports global alpha
 *     VA_SUBPICTURE_DESTINATION_IS_SCREEN_COORD - supports unscaled screen relative subpictures for On Screen Display
  }
{ out  }
{ out  }
{ out  }

function vaQuerySubpictureFormats(dpy:TVADisplay; format_list:PVAImageFormat; flags:Pdword; num_formats:Pdword):TVAStatus;cdecl;external;
{*
 * Subpictures are created with an image associated.
  }
{ out  }
function vaCreateSubpicture(dpy:TVADisplay; image:TVAImageID; subpicture:PVASubpictureID):TVAStatus;cdecl;external;
{*
 * Destroy the subpicture before destroying the image it is assocated to
  }
function vaDestroySubpicture(dpy:TVADisplay; subpicture:TVASubpictureID):TVAStatus;cdecl;external;
{*
 * Bind an image to the subpicture. This image will now be associated with
 * the subpicture instead of the one at creation.
  }
function vaSetSubpictureImage(dpy:TVADisplay; subpicture:TVASubpictureID; image:TVAImageID):TVAStatus;cdecl;external;
{*
 * If chromakey is enabled, then the area where the source value falls within
 * the chromakey [min, max] range is transparent
 * The chromakey component format is the following:
 *  For RGB: [0:7] Red [8:15] Blue [16:23] Green
 *  For YUV: [0:7] V [8:15] U [16:23] Y
 * The chromakey mask can be used to mask out certain components for chromakey
 * comparision
  }
function vaSetSubpictureChromakey(dpy:TVADisplay; subpicture:TVASubpictureID; chromakey_min:dword; chromakey_max:dword; chromakey_mask:dword):TVAStatus;cdecl;external;
{*
 * Global alpha value is between 0 and 1. A value of 1 means fully opaque and
 * a value of 0 means fully transparent. If per-pixel alpha is also specified then
 * the overall alpha is per-pixel alpha multiplied by the global alpha
  }
function vaSetSubpictureGlobalAlpha(dpy:TVADisplay; subpicture:TVASubpictureID; global_alpha:single):TVAStatus;cdecl;external;
{*
 * vaAssociateSubpicture associates the subpicture with target_surfaces.
 * It defines the region mapping between the subpicture and the target
 * surfaces through source and destination rectangles (with the same width and height).
 * Both will be displayed at the next call to vaPutSurface.  Additional
 * associations before the call to vaPutSurface simply overrides the association.
  }
{ upper left offset in subpicture  }
{ upper left offset in surface  }
{
     * whether to enable chroma-keying, global-alpha, or screen relative mode
     * see VA_SUBPICTURE_XXX values
      }
function vaAssociateSubpicture(dpy:TVADisplay; subpicture:TVASubpictureID; target_surfaces:PVASurfaceID; num_surfaces:longint; src_x:Tint16_t; 
           src_y:Tint16_t; src_width:Tuint16_t; src_height:Tuint16_t; dest_x:Tint16_t; dest_y:Tint16_t; 
           dest_width:Tuint16_t; dest_height:Tuint16_t; flags:Tuint32_t):TVAStatus;cdecl;external;
{*
 * vaDeassociateSubpicture removes the association of the subpicture with target_surfaces.
  }
function vaDeassociateSubpicture(dpy:TVADisplay; subpicture:TVASubpictureID; target_surfaces:PVASurfaceID; num_surfaces:longint):TVAStatus;cdecl;external;
{*
 * Display attributes
 * Display attributes are used to control things such as contrast, hue, saturation,
 * brightness etc. in the rendering process.  The application can query what
 * attributes are supported by the driver, and then set the appropriate attributes
 * before calling vaPutSurface()
 *
 * Display attributes can also be used to query/set platform or display adaptor (vaDisplay)
 * related information. These attributes do not depend on vaConfig, and could not be used
 * for vaPutSurface. Application can use vaQueryDisplayAttributes/vaGetDisplayAttributes
 * at anytime after vaInitialize, but (for settable attributes) vaSetDisplayAttributes should be
 * called after vaInitialize and before any other function call.
 *
 * To distinguish these two types of display attributes, display adaptor related attributes
 * should be marked as "HW attribute" in the description.
  }
{ PowerVR IEP Lite attributes  }
type
  PVADisplayAttribBLEMode = ^TVADisplayAttribBLEMode;
  TVADisplayAttribBLEMode =  Longint;
  Const
    VADISPLAYATTRIB_BLE_OFF = $00;
    VADISPLAYATTRIB_BLE_LOW = 1;
    VADISPLAYATTRIB_BLE_MEDIUM = 2;
    VADISPLAYATTRIB_BLE_HIGH = 3;
    VADISPLAYATTRIB_BLE_NONE = 4;
;
{* attribute value for VADisplayAttribRotation    }
  VA_ROTATION_NONE = $00000000;  
  VA_ROTATION_90 = $00000001;  
  VA_ROTATION_180 = $00000002;  
  VA_ROTATION_270 = $00000003;  
{*@ }
{*
 * @name Mirroring directions
 *
 * Those values could be used for VADisplayAttribMirror attribute or
 * VAProcPipelineParameterBuffer::mirror_state.

  }
{*@ }
{* \brief No Mirroring.  }
  VA_MIRROR_NONE = $00000000;  
{* \brief Horizontal Mirroring.  }
  VA_MIRROR_HORIZONTAL = $00000001;  
{* \brief Vertical Mirroring.  }
  VA_MIRROR_VERTICAL = $00000002;  
{*@ }
{* attribute value for VADisplayAttribOutOfLoopDeblock  }
  VA_OOL_DEBLOCKING_FALSE = $00000000;  
  VA_OOL_DEBLOCKING_TRUE = $00000001;  
{* Render mode  }
  VA_RENDER_MODE_UNDEFINED = 0;  
  VA_RENDER_MODE_LOCAL_OVERLAY = 1;  
  VA_RENDER_MODE_LOCAL_GPU = 2;  
  VA_RENDER_MODE_EXTERNAL_OVERLAY = 4;  
  VA_RENDER_MODE_EXTERNAL_GPU = 8;  
{* Render device  }
  VA_RENDER_DEVICE_UNDEFINED = 0;  
  VA_RENDER_DEVICE_LOCAL = 1;  
  VA_RENDER_DEVICE_EXTERNAL = 2;  
{*\brief sub device info
 * Sub-device is the concept basing on the "device" behind "vaDisplay".
 * If a device could be divided to several sub devices, the task of
 * decode/encode/vpp could be assigned on one sub-device. So, application
 * could choose the sub device before any other operations. After that,
 * all of the task execution/resource allocation will be dispatched to
 * the sub device. If application does not choose the sub device, driver
 * will assign one as default.
 *
 * If the value == VA_ATTRIB_NOT_SUPPORTED, it mean that the attribute
 * is unsupport or UNKNOWN.
  }
{* \brief current sub device index, read - write  }
{* \brief sub devices count, read - only  }
{* \brief reserved bits for future, must be zero }
{* \brief bit mask to indicate which sub_device is available, read only
         * \code
         * VADisplayAttribValSubDevice reg;
         * VADisplayAttribute reg_attr;
         * reg_attr.type = VADisplayAttribSubDevice;
         * vaGetDisplayAttributes(dpy, &reg_attr, 1);
         * reg.value = reg_attr.value;
         *
         * for(int i = 0; i < reg.bits.sub_device_count; i ++ )
         *    if((1<<i) & reg.bits.sub_device_mask)
         *        printf("sub device  %d can be selected", i);
         *    
         *
         * \endcode
          }
type
  PVADisplayAttribValSubDevice = ^TVADisplayAttribValSubDevice;
  TVADisplayAttribValSubDevice = record
      case longint of
        0 : ( bits : record
            flag0 : longint;
          end );
        1 : ( value : Tuint32_t );
      end;

const
  bm__VADisplayAttribValSubDevice_current_sub_device = $F;
  bp__VADisplayAttribValSubDevice_current_sub_device = 0;
  bm__VADisplayAttribValSubDevice_sub_device_count = $F0;
  bp__VADisplayAttribValSubDevice_sub_device_count = 4;
  bm__VADisplayAttribValSubDevice_reserved = $FF00;
  bp__VADisplayAttribValSubDevice_reserved = 8;
  bm__VADisplayAttribValSubDevice_sub_device_mask = $FFFF0000;
  bp__VADisplayAttribValSubDevice_sub_device_mask = 16;

{* Currently defined display attribute types  }
{ client can specifiy a background color for the target window
     * the new feature of video conference,
     * the uncovered area of the surface is filled by this color
     * also it will blend with the decoded video color
      }
{
     * this is a gettable only attribute. For some implementations that use the
     * hardware overlay, after PutSurface is called, the surface can not be
     * re-used until after the subsequent PutSurface call. If this is the case
     * then the value for this attribute will be set to 1 so that the client
     * will not attempt to re-use the surface right after returning from a call
     * to PutSurface.
     *
     * Don't use it, use flag VASurfaceDisplaying of vaQuerySurfaceStatus since
     * driver may use overlay or GPU alternatively
      }
{ PowerVR IEP Lite specific attributes  }
{
     * For type VADisplayAttribCSCMatrix, "value" field is a pointer to the color
     * conversion matrix. Each element in the matrix is float-point
      }
{ specify the constant color used to blend with video surface
     * Cd = Cv*Cc*Ac + Cb *(1 - Ac) C means the constant RGB
     *      d: the final color to overwrite into the frame buffer
     *      v: decoded video after color conversion,
     *      c: video color specified by VADisplayAttribBlendColor
     *      b: background color of the drawable
      }
{
     * Indicate driver to skip painting color key or not.
     * only applicable if the render is overlay
      }
{
     * customized overlay color key, the format is RGB888
     * [23:16] = Red, [15:08] = Green, [07:00] = Blue.
      }
{
     * The hint for the implementation of vaPutSurface
     * normally, the driver could use an overlay or GPU to render the surface on the screen
     * this flag provides APP the flexibity to switch the render dynamically
      }
{
     * specify if vaPutSurface needs to render into specified monitors
     * one example is that one external monitor (e.g. HDMI) is enabled,
     * but the window manager is not aware of it, and there is no associated drawable
      }
{
     * specify vaPutSurface render area if there is no drawable on the monitor
      }
{
     * HW attribute, read/write, specify the sub device configure
      }
{
     * HW attribute. read only. specify whether vaCopy support on current HW
     * The value of each bit should equal to 1 << VA_EXEC_MODE_XXX to represent
     * modes of vaCopy
      }
{
     * HW attribute. read only. retrieve the device information from backend driver
     * the value should be combined with vendor ID << 16 | device ID
      }
type
  PVADisplayAttribType = ^TVADisplayAttribType;
  TVADisplayAttribType =  Longint;
  Const
    VADisplayAttribBrightness = 0;
    VADisplayAttribContrast = 1;
    VADisplayAttribHue = 2;
    VADisplayAttribSaturation = 3;
    VADisplayAttribBackgroundColor = 4;
    VADisplayAttribDirectSurface = 5;
    VADisplayAttribRotation = 6;
    VADisplayAttribOutofLoopDeblock = 7;
    VADisplayAttribBLEBlackMode = 8;
    VADisplayAttribBLEWhiteMode = 9;
    VADisplayAttribBlueStretch = 10;
    VADisplayAttribSkinColorCorrection = 11;
    VADisplayAttribCSCMatrix = 12;
    VADisplayAttribBlendColor = 13;
    VADisplayAttribOverlayAutoPaintColorKey = 14;
    VADisplayAttribOverlayColorKey = 15;
    VADisplayAttribRenderMode = 16;
    VADisplayAttribRenderDevice = 17;
    VADisplayAttribRenderRect = 18;
    VADisplayAttribSubDevice = 19;
    VADisplayAttribCopy = 20;
    VADisplayPCIID = 21;
;
{ flags for VADisplayAttribute  }
  VA_DISPLAY_ATTRIB_NOT_SUPPORTED = $0000;  
  VA_DISPLAY_ATTRIB_GETTABLE = $0001;  
  VA_DISPLAY_ATTRIB_SETTABLE = $0002;  
{ used by the set/get attribute functions  }
{ flags can be VA_DISPLAY_ATTRIB_GETTABLE or VA_DISPLAY_ATTRIB_SETTABLE or OR'd together  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVADisplayAttribute = ^TVADisplayAttribute;
  TVADisplayAttribute = record
      _type : TVADisplayAttribType;
      min_value : Tint32_t;
      max_value : Tint32_t;
      value : Tint32_t;
      flags : Tuint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{* Get maximum number of display attributs supported by the implementation  }

function vaMaxNumDisplayAttributes(dpy:TVADisplay):longint;cdecl;external;
{*
 * Query display attributes
 * The caller must provide a "attr_list" array that can hold at
 * least vaMaxNumDisplayAttributes() entries. The actual number of attributes
 * returned in "attr_list" is returned in "num_attributes".
  }
{ out  }
{ out  }
function vaQueryDisplayAttributes(dpy:TVADisplay; attr_list:PVADisplayAttribute; num_attributes:Plongint):TVAStatus;cdecl;external;
{*
 * Get display attributes
 * This function returns the current attribute values in "attr_list".
 * Only attributes returned with VA_DISPLAY_ATTRIB_GETTABLE set in the "flags" field
 * from vaQueryDisplayAttributes() can have their values retrieved.
  }
{ in/out  }
function vaGetDisplayAttributes(dpy:TVADisplay; attr_list:PVADisplayAttribute; num_attributes:longint):TVAStatus;cdecl;external;
{*
 * Set display attributes
 * Only attributes returned with VA_DISPLAY_ATTRIB_SETTABLE set in the "flags" field
 * from vaQueryDisplayAttributes() can be set.  If the attribute is not settable or
 * the value is out of range, the function returns VA_STATUS_ERROR_ATTR_NOT_SUPPORTED
  }
function vaSetDisplayAttributes(dpy:TVADisplay; attr_list:PVADisplayAttribute; num_attributes:longint):TVAStatus;cdecl;external;
{***************************
 * HEVC data structures
 *************************** }
{*
 * \brief Description of picture properties of those in DPB surfaces.
 *
 * If only progressive scan is supported, each surface contains one whole
 * frame picture.
 * Otherwise, each surface contains two fields of whole picture.
 * In this case, two entries of ReferenceFrames[] may share same picture_id
 * value.
  }
{* \brief reconstructed picture buffer surface index
     * invalid when taking value VA_INVALID_SURFACE.
      }
{* \brief picture order count.
     * in HEVC, POCs for top and bottom fields of same picture should
     * take different values.
      }
{ described below  }
{* \brief Reserved bytes for future use, must be zero  }
type
  PVAPictureHEVC = ^TVAPictureHEVC;
  TVAPictureHEVC = record
      picture_id : TVASurfaceID;
      pic_order_cnt : Tint32_t;
      flags : Tuint32_t;
      va_reserved : array[0..(VA_PADDING_LOW)-1] of Tuint32_t;
    end;
{ flags in VAPictureHEVC could be OR of the following  }

const
  VA_PICTURE_HEVC_INVALID = $00000001;  
{* \brief indication of interlace scan picture.
 * should take same value for all the pictures in sequence.
  }
  VA_PICTURE_HEVC_FIELD_PIC = $00000002;  
{* \brief polarity of the field picture.
 * top field takes even lines of buffer surface.
 * bottom field takes odd lines of buffer surface.
  }
  VA_PICTURE_HEVC_BOTTOM_FIELD = $00000004;  
{* \brief Long term reference picture  }
  VA_PICTURE_HEVC_LONG_TERM_REFERENCE = $00000008;  
{*
 * VA_PICTURE_HEVC_RPS_ST_CURR_BEFORE, VA_PICTURE_HEVC_RPS_ST_CURR_AFTER
 * and VA_PICTURE_HEVC_RPS_LT_CURR of any picture in ReferenceFrames[] should
 * be exclusive. No more than one of them can be set for any picture.
 * Sum of NumPocStCurrBefore, NumPocStCurrAfter and NumPocLtCurr
 * equals NumPocTotalCurr, which should be equal to or smaller than 8.
 * Application should provide valid values for both short format and long format.
 * The pictures in DPB with any of these three flags turned on are referred by
 * the current picture.
  }
{* \brief RefPicSetStCurrBefore of HEVC spec variable
 * Number of ReferenceFrames[] entries with this bit set equals
 * NumPocStCurrBefore.
  }
  VA_PICTURE_HEVC_RPS_ST_CURR_BEFORE = $00000010;  
{* \brief RefPicSetStCurrAfter of HEVC spec variable
 * Number of ReferenceFrames[] entries with this bit set equals
 * NumPocStCurrAfter.
  }
  VA_PICTURE_HEVC_RPS_ST_CURR_AFTER = $00000020;  
{* \brief RefPicSetLtCurr of HEVC spec variable
 * Number of ReferenceFrames[] entries with this bit set equals
 * NumPocLtCurr.
  }
  VA_PICTURE_HEVC_RPS_LT_CURR = $00000040;  
type
  PVACopyObjectType = ^TVACopyObjectType;
  TVACopyObjectType =  Longint;
  Const
    VACopyObjectSurface = 0;
    VACopyObjectBuffer = 1;
;
{ type of object. }
type
  PVACopyObject = ^TVACopyObject;
  TVACopyObject = record
      obj_type : TVACopyObjectType;
      object : record
          case longint of
            0 : ( surface_id : TVASurfaceID );
            1 : ( buffer_id : TVABufferID );
          end;
      va_reserved : array[0..(VA_PADDING_MEDIUM)-1] of Tuint32_t;
    end;
{* \brief va copy synchronization, the value should be /c VA_EXEC_SYNC or /c VA_EXEC_ASYNC  }
{* \brief va copy mode, the value should be VA_EXEC_MODE_XXX  }

  PVACopyOption = ^TVACopyOption;
  TVACopyOption = record
      case longint of
        0 : ( bits : record
            flag0 : longint;
          end );
        1 : ( value : Tuint32_t );
      end;

const
  bm__VACopyOption_va_copy_sync = $3;
  bp__VACopyOption_va_copy_sync = 0;
  bm__VACopyOption_va_copy_mode = $3C;
  bp__VACopyOption_va_copy_mode = 2;
  bm__VACopyOption_reserved = $FFFFFFC0;
  bp__VACopyOption_reserved = 6;

{* \brief Copies an object.
 *
 * Copies specified object (surface or buffer). If non-blocking copy
 * is requested (VA_COPY_NONBLOCK), then need vaSyncBuffer or vaSyncSurface/vaSyncSurface2
 * to sync the destination object.
 *
 * @param[in] dpy               the VA display
 * @param[in] dst               Destination object to copy to
 * @param[in] src               Source object to copy from
 * @param[in] option            VA copy option
 * @return VA_STATUS_SUCCESS if successful
  }

function vaCopy(dpy:TVADisplay; dst:PVACopyObject; src:PVACopyObject; option:TVACopyOption):TVAStatus;cdecl;external;
{$include <va/va_dec_hevc.h>}
{$include <va/va_dec_jpeg.h>}
{$include <va/va_dec_vp8.h>}
{$include <va/va_dec_vp9.h>}
{$include <va/va_dec_av1.h>}
{$include <va/va_enc_hevc.h>}
{$include <va/va_fei_hevc.h>}
{$include <va/va_enc_h264.h>}
{$include <va/va_enc_jpeg.h>}
{$include <va/va_enc_mpeg2.h>}
{$include <va/va_enc_vp8.h>}
{$include <va/va_enc_vp9.h>}
{$include <va/va_enc_av1.h>}
{$include <va/va_fei.h>}
{$include <va/va_fei_h264.h>}
{$include <va/va_vpp.h>}
{$include <va/va_prot.h>}
{*@ }
{ C++ end of extern C conditionnal removed }
{$endif}
{ _VA_H_  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VA_FOURCC(ch0,ch1,ch2,ch3 : longint) : longint;
begin
  VA_FOURCC:=(((dword(byte(ch0))) or ((dword(byte(ch1))) shl 8)) or ((dword(byte(ch2))) shl 16)) or ((dword(byte(ch3))) shl 24);
end;


end.
