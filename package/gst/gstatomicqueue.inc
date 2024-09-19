/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 18-09-2024   17:42                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstAtomicQueue = record
  end;
  PGstAtomicQueue = ^TGstAtomicQueue;

function gst_atomic_queue_get_type: TGType; cdecl; external gstreamerlib;
function gst_atomic_queue_new(initial_size: Tguint): PGstAtomicQueue; cdecl; external gstreamerlib;
procedure gst_atomic_queue_ref(queue: PGstAtomicQueue); cdecl; external gstreamerlib;
procedure gst_atomic_queue_unref(queue: PGstAtomicQueue); cdecl; external gstreamerlib;
procedure gst_atomic_queue_push(queue: PGstAtomicQueue; Data: Tgpointer); cdecl; external gstreamerlib;
function gst_atomic_queue_pop(queue: PGstAtomicQueue): Tgpointer; cdecl; external gstreamerlib;
function gst_atomic_queue_peek(queue: PGstAtomicQueue): Tgpointer; cdecl; external gstreamerlib;
function gst_atomic_queue_length(queue: PGstAtomicQueue): Tguint; cdecl; external gstreamerlib;

// === Konventiert am: 18-9-24 15:52:02 ===

function GST_TYPE_ATOMIC_QUEUE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_ATOMIC_QUEUE: TGType;
begin
  GST_TYPE_ATOMIC_QUEUE := gst_atomic_queue_get_type;
end;



{$ENDIF read_implementation}