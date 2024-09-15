unit gst;

interface

uses
  glib280, common_GST;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure gst_init(argc: Plongint; argv: PPPchar); cdecl; external gstreamerlib;
function gst_init_check(argc: Plongint; argv: PPPchar; error: PPGError): Tgboolean; cdecl; external gstreamerlib;
function gst_is_initialized: Tgboolean; cdecl; external gstreamerlib;
function gst_init_get_option_group: PGOptionGroup; cdecl; external gstreamerlib;
procedure gst_deinit; cdecl; external gstreamerlib;
procedure gst_version(major: Pguint; minor: Pguint; micro: Pguint; nano: Pguint); cdecl; external gstreamerlib;
function gst_version_string: Pgchar; cdecl; external gstreamerlib;
function gst_segtrap_is_enabled: Tgboolean; cdecl; external gstreamerlib;
procedure gst_segtrap_set_enabled(Enabled: Tgboolean); cdecl; external gstreamerlib;
function gst_registry_fork_is_enabled: Tgboolean; cdecl; external gstreamerlib;
procedure gst_registry_fork_set_enabled(Enabled: Tgboolean); cdecl; external gstreamerlib;
function gst_update_registry: Tgboolean; cdecl; external gstreamerlib;
function gst_get_main_executable_path: Pgchar; cdecl; external gstreamerlib;

// === Konventiert am: 11-9-24 13:08:23 ===


implementation



end.
