unit common_GST;

{$mode ObjFPC}{$H+}

interface

uses
  glib280;

const
  {$ifdef Linux}
  gstreamerlib = 'libgstreamer-1.0';
  {$endif}
  {$ifdef Windows}
  gstreamerlib = 'gstreamer-1.0-0.dll';
  {$endif}

  // ==== Externes;

type
  Ttimespec = record
    tv_sec: int64;
    tv_nsec: int64;
  end;

  // === GST

const
  GST_PADDING = 4;

type
  PGstClockTime = ^TGstClockTime;
  TGstClockTime = Tguint64;

type
  PGstObject = ^TGstObject;

  TGstObject = record
    obj: TGInitiallyUnowned;
    lock: TGMutex;
    Name: Pgchar;
    parent: PGstObject;
    flags: Tguint32;
    control_bindings: PGList;
    control_rate: Tguint64;
    last_sync: Tguint64;
    _gst_reserved: Tgpointer;
  end;
  PPGstObject = ^PGstObject;

  TGstControlBindingPrivate = record
  end;
  PGstControlBindingPrivate = ^TGstControlBindingPrivate;

  PGstControlBinding = ^TGstControlBinding;

  TGstControlBinding = record
    parent: TGstObject;
    Name: Pgchar;
    pspec: PGParamSpec;
    obj: PGstObject;
    __object: Tgpointer;
    disabled: Tgboolean;
    ABI: record
      case longint of
        0: (abi: record
            priv: PGstControlBindingPrivate;
            end);
        1: (_gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer);
      end;
  end;

  TGstBufferPoolPrivate = record
  end;
  PGstBufferPoolPrivate = ^TGstBufferPoolPrivate;

  TGstBufferPool = record
    obj: TGstObject;
    flushing: Tgint;
    priv: PGstBufferPoolPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstBufferPool = ^TGstBufferPool;


  type
  PGstMiniObject = ^TGstMiniObject;
  PPGstMiniObject = ^PGstMiniObject;

  PGstMiniObjectCopyFunction = ^TGstMiniObjectCopyFunction;
  TGstMiniObjectCopyFunction = function(obj: PGstMiniObject): PGstMiniObject; cdecl;
  TGstMiniObjectDisposeFunction = function(obj: PGstMiniObject): Tgboolean; cdecl;
  TGstMiniObjectFreeFunction = procedure(obj: PGstMiniObject); cdecl;
  TGstMiniObjectNotify = procedure(user_data: Tgpointer; obj: PGstMiniObject); cdecl;

  TGstMiniObject = record
    _type: TGType;
    refcount: Tgint;
    lockstate: Tgint;
    flags: Tguint;
    copy: TGstMiniObjectCopyFunction;
    _dispose: TGstMiniObjectDisposeFunction;
    Free: TGstMiniObjectFreeFunction;
    priv_uint: Tguint;
    priv_pointer: Tgpointer;
  end;

  type
    TGstBuffer = record
        mini_object : TGstMiniObject;
        pool : PGstBufferPool;
        pts : TGstClockTime;
        dts : TGstClockTime;
        duration : TGstClockTime;
        offset : Tguint64;
        offset_end : Tguint64;
      end;
    PGstBuffer = ^TGstBuffer;
    PPGstBuffer = ^PGstBuffer;





implementation

end.
