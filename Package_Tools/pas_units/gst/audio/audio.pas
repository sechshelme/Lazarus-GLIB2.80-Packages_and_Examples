unit audio;

interface

uses
  glib280, gst124;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  GST_META_TAG_AUDIO_STR = 'audio';
  GST_META_TAG_AUDIO_CHANNELS_STR = 'channels';
  GST_META_TAG_AUDIO_RATE_STR = 'rate';

function gst_audio_buffer_clip(buffer: PGstBuffer; segment: PGstSegment; rate: Tgint; bpf: Tgint): PGstBuffer; cdecl; external libgstaudio;
function gst_audio_buffer_truncate(buffer: PGstBuffer; bpf: Tgint; trim: Tgsize; samples: Tgsize): PGstBuffer; cdecl; external libgstaudio;

function GST_FRAMES_TO_CLOCK_TIME(frames, rate: Tguint64): TGstClockTime;
function GST_CLOCK_TIME_TO_FRAMES(clocktime, rate: Tguint64): Tguint64;


// === Konventiert am: 28-9-24 19:49:02 ===


implementation


function GST_FRAMES_TO_CLOCK_TIME(frames, rate: Tguint64): TGstClockTime;
begin
  GST_FRAMES_TO_CLOCK_TIME := TGstClockTime(gst_util_uint64_scale_round(frames, GST_SECOND, rate));
end;

function GST_CLOCK_TIME_TO_FRAMES(clocktime, rate: Tguint64): Tguint64;
begin
  GST_CLOCK_TIME_TO_FRAMES := gst_util_uint64_scale_round(clocktime, rate, GST_SECOND);
end;


end.
