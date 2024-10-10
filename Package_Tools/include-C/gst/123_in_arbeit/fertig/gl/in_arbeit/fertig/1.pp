
unit 1;
interface

{
  Automatically converted by H2Pas 1.0.0 from 1.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    1.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



{ was #define dname def_expr }
function G_MININT8 : Tgint8;  

{ was #define dname def_expr }
function G_MAXINT8 : Tgint8;  

{ was #define dname def_expr }
function G_MAXUINT8 : Tguint8;  

{*
 * G_MININT16: (value -32768)
 *
 * The minimum value which can be held in a #gint16.
 *
 * Since: 2.4
  }
{ was #define dname def_expr }
function G_MININT16 : Tgint16;  

{ was #define dname def_expr }
function G_MAXINT16 : Tgint16;  

{ was #define dname def_expr }
function G_MAXUINT16 : Tguint16;  

{*
 * G_MININT32: (value -2147483648)
 *
 * The minimum value which can be held in a #gint32.
 *
 * Since: 2.4
  }
{ was #define dname def_expr }
function G_MININT32 : Tgint32;  

{ was #define dname def_expr }
function G_MAXINT32 : Tgint32;  

{ was #define dname def_expr }
function G_MAXUINT32 : Tguint32;  

{*
 * G_MININT64: (value -9223372036854775808)
 *
 * The minimum value which can be held in a #gint64.
  }
{ was #define dname def_expr }
function G_MININT64 : Tgint64;  

{ was #define dname def_expr }
function G_MAXINT64 : longint; { return type might be wrong }

{ was #define dname def_expr }
function G_MAXUINT64 : longint; { return type might be wrong }


implementation

{ was #define dname def_expr }
function G_MININT8 : Tgint8;
  begin
    G_MININT8:=Tgint8((-(G_MAXINT8))-1);
  end;

{ was #define dname def_expr }
function G_MAXINT8 : Tgint8;
  begin
    G_MAXINT8:=Tgint8($7f);
  end;

{ was #define dname def_expr }
function G_MAXUINT8 : Tguint8;
  begin
    G_MAXUINT8:=Tguint8($ff);
  end;

{ was #define dname def_expr }
function G_MININT16 : Tgint16;
  begin
    G_MININT16:=Tgint16((-(G_MAXINT16))-1);
  end;

{ was #define dname def_expr }
function G_MAXINT16 : Tgint16;
  begin
    G_MAXINT16:=Tgint16($7fff);
  end;

{ was #define dname def_expr }
function G_MAXUINT16 : Tguint16;
  begin
    G_MAXUINT16:=Tguint16($ffff);
  end;

{ was #define dname def_expr }
function G_MININT32 : Tgint32;
  begin
    G_MININT32:=Tgint32((-(G_MAXINT32))-1);
  end;

{ was #define dname def_expr }
function G_MAXINT32 : Tgint32;
  begin
    G_MAXINT32:=Tgint32($7fffffff);
  end;

{ was #define dname def_expr }
function G_MAXUINT32 : Tguint32;
  begin
    G_MAXUINT32:=Tguint32($ffffffff);
  end;

{ was #define dname def_expr }
function G_MININT64 : Tgint64;
  begin
    G_MININT64:=Tgint64((-(G_MAXINT64))-(G_GINT64_CONSTANT(1)));
  end;

{ was #define dname def_expr }
function G_MAXINT64 : longint; { return type might be wrong }
  begin
    G_MAXINT64:=G_GINT64_CONSTANT($7fffffffffffffff);
  end;

{ was #define dname def_expr }
function G_MAXUINT64 : longint; { return type might be wrong }
  begin
    G_MAXUINT64:=G_GUINT64_CONSTANT($ffffffffffffffff);
  end;


end.
