
unit 123;
interface

{
  Automatically converted by H2Pas 1.0.0 from 123.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    123.h
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
PGstGhostPad  = ^GstGhostPad;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



{ was #define dname def_expr }
function GST_TYPE_GHOST_PAD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GHOST_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GHOST_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GHOST_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GHOST_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GHOST_PAD_CAST(obj : longint) : PGstGhostPad;


implementation

{ was #define dname def_expr }
function GST_TYPE_GHOST_PAD : longint; { return type might be wrong }
  begin
    GST_TYPE_GHOST_PAD:=gst_ghost_pad_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GHOST_PAD(obj : longint) : longint;
begin
  GST_GHOST_PAD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GHOST_PAD,GstGhostPad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GHOST_PAD_CLASS(klass : longint) : longint;
begin
  GST_GHOST_PAD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GHOST_PAD,GstGhostPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GHOST_PAD(obj : longint) : longint;
begin
  GST_IS_GHOST_PAD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GHOST_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GHOST_PAD_CLASS(klass : longint) : longint;
begin
  GST_IS_GHOST_PAD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GHOST_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GHOST_PAD_CAST(obj : longint) : PGstGhostPad;
begin
  GST_GHOST_PAD_CAST:=PGstGhostPad(obj);
end;


end.
