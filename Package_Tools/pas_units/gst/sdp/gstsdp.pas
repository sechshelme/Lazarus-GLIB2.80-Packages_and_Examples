unit gstsdp;

interface

uses
  glib280, gst124;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGstSDPResult = ^TGstSDPResult;
  TGstSDPResult = longint;

const
  GST_SDP_OK = 0;
  GST_SDP_EINVAL = -(1);

  // === Konventiert am: 5-10-24 17:59:53 ===


implementation



end.
