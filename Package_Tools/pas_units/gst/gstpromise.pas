unit gstpromise;

interface

uses
  glib280, common_GST, gstobject, gststructure, gstminiobject;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function gst_promise_get_type: TGType; cdecl; external gstreamerlib;

type
  PGstPromiseResult = ^TGstPromiseResult;
  TGstPromiseResult = longint;

const
  GST_PROMISE_RESULT_PENDING = 0;
  GST_PROMISE_RESULT_INTERRUPTED = 1;
  GST_PROMISE_RESULT_REPLIED = 2;
  GST_PROMISE_RESULT_EXPIRED = 3;

type
  TGstPromise = record
    parent: TGstMiniObject;
  end;
  PGstPromise = ^TGstPromise;
  PPGstPromise = ^PGstPromise;

  TGstPromiseChangeFunc = procedure(promise: PGstPromise; user_data: Tgpointer); cdecl;

function gst_promise_new: PGstPromise; cdecl; external gstreamerlib;
function gst_promise_new_with_change_func(func: TGstPromiseChangeFunc; user_data: Tgpointer; notify: TGDestroyNotify): PGstPromise; cdecl; external gstreamerlib;
function gst_promise_wait(promise: PGstPromise): TGstPromiseResult; cdecl; external gstreamerlib;
procedure gst_promise_reply(promise: PGstPromise; s: PGstStructure); cdecl; external gstreamerlib;
procedure gst_promise_interrupt(promise: PGstPromise); cdecl; external gstreamerlib;
procedure gst_promise_expire(promise: PGstPromise); cdecl; external gstreamerlib;
function gst_promise_get_reply(promise: PGstPromise): PGstStructure; cdecl; external gstreamerlib;

function gst_promise_ref(promise: PGstPromise): PGstPromise; cdecl; external gstreamerlib;
procedure gst_promise_unref(promise: PGstPromise); cdecl; external gstreamerlib;
procedure gst_clear_promise(promise_ptr: PPGstPromise); cdecl; external gstreamerlib;

function GST_IS_PROMISE(obj: TGType): Tgboolean;
function GST_PROMISE(obj: Pointer): PGstPromise;

// === Konventiert am: 17-9-24 16:01:30 ===

function GST_TYPE_PROMISE: TGType;

implementation

function GST_TYPE_PROMISE: TGType;
begin
  GST_TYPE_PROMISE := gst_promise_get_type;
end;


function GST_IS_PROMISE(obj: TGType): Tgboolean;
begin
  GST_IS_PROMISE := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_PROMISE);
end;

function GST_PROMISE(obj: Pointer): PGstPromise;
begin
  GST_PROMISE := PGstPromise(obj);
end;


end.
