unit gstcamerabin_enum;

interface

uses
  glib280, gst124, gstbasecamerasrc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  DEFAULT_WIDTH = 640;
  DEFAULT_HEIGHT = 480;
  DEFAULT_CAPTURE_WIDTH = 800;
  DEFAULT_CAPTURE_HEIGHT = 600;
  DEFAULT_FPS_N = 0;
  DEFAULT_FPS_D = 1;
  DEFAULT_ZOOM = MIN_ZOOM;

function gst_camerabin_mode_get_type: TGType; cdecl; external libgstbasecamerabinsrc;

function GST_TYPE_CAMERABIN_MODE: TGType;

// === Konventiert am: 12-10-24 17:24:59 ===


implementation

function GST_TYPE_CAMERABIN_MODE: TGType;
begin
  GST_TYPE_CAMERABIN_MODE := gst_camerabin_mode_get_type;
end;


end.
