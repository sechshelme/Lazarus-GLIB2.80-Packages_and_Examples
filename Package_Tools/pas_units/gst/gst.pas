unit gst;

interface

uses
  glib280, common_GST;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  //
  //{$include <gst/glib-compat.h>}
  //{$include <gst/gstenumtypes.h>}
  //{$include <gst/gstversion.h>}
  //{$include <gst/gstatomicqueue.h>}
  //{$include <gst/gstbin.h>}
  //{$include <gst/gstbuffer.h>}
  //{$include <gst/gstbufferlist.h>}
  //{$include <gst/gstbufferpool.h>}
  //{$include <gst/gstbytearrayinterface.h>}
  //{$include <gst/gstcaps.h>}
  //{$include <gst/gstcapsfeatures.h>}
  //{$include <gst/gstchildproxy.h>}
  //{$include <gst/gstclock.h>}
  //{$include <gst/gstcontrolsource.h>}
  //{$include <gst/gstdatetime.h>}
  //{$include <gst/gstdebugutils.h>}
  //{$include <gst/gstdevice.h>}
  //{$include <gst/gstdevicemonitor.h>}
  //{$include <gst/gstdeviceprovider.h>}
  //{$include <gst/gstdynamictypefactory.h>}
  //{$include <gst/gstelement.h>}
  //{$include <gst/gstelementmetadata.h>}
  //{$include <gst/gsterror.h>}
  //{$include <gst/gstevent.h>}
  //{$include <gst/gstghostpad.h>}
  //{$include <gst/gstinfo.h>}
  //{$include <gst/gstiterator.h>}
  //{$include <gst/gstmessage.h>}
  //{$include <gst/gstmemory.h>}
  //{$include <gst/gstmeta.h>}
  //{$include <gst/gstminiobject.h>}
  //{$include <gst/gstobject.h>}
  //{$include <gst/gststreamcollection.h>}
  //{$include <gst/gstpad.h>}
  //{$include <gst/gstparamspecs.h>}
  //{$include <gst/gstpipeline.h>}
  //{$include <gst/gstplugin.h>}
  //{$include <gst/gstpoll.h>}
  //{$include <gst/gstpreset.h>}
  //{$include <gst/gstprotection.h>}
  //{$include <gst/gstquery.h>}
  //{$include <gst/gstregistry.h>}
  //{$include <gst/gstpromise.h>}
  //{$include <gst/gstsample.h>}
  //{$include <gst/gstsegment.h>}
  //{$include <gst/gststreams.h>}
  //{$include <gst/gststructure.h>}
  //{$include <gst/gstsystemclock.h>}
  //{$include <gst/gsttaglist.h>}
  //{$include <gst/gsttagsetter.h>}
  //{$include <gst/gsttask.h>}
  //{$include <gst/gsttaskpool.h>}
  //{$include <gst/gsttoc.h>}
  //{$include <gst/gsttocsetter.h>}
  //{$include <gst/gsttracer.h>}
  //{$include <gst/gsttracerfactory.h>}
  //{$include <gst/gsttracerrecord.h>}
  //{$include <gst/gsttypefind.h>}
  //{$include <gst/gsttypefindfactory.h>}
  //{$include <gst/gsturi.h>}
  //{$include <gst/gstutils.h>}
  //{$include <gst/gstvalue.h>}
  //{$include <gst/gstparse.h>}

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
