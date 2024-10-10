
unit gl;
interface

{
  Automatically converted by H2Pas 0.99.16 from gl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gl
}


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PGLeglImageOES = ^TGLeglImageOES;
  TGLeglImageOES = Tgpointer;
{$endif}
{$if !GST_GL_HAVE_GLCHAR}

  PGLchar = ^TGLchar;
  TGLchar = Tgchar;
{$endif}
{$if !GST_GL_HAVE_GLSIZEIPTR}

  PGLsizeiptr = ^TGLsizeiptr;
  TGLsizeiptr = Tptrdiff_t;
{$endif}
{$if !GST_GL_HAVE_GLINTPTR}

  PGLintptr = ^TGLintptr;
  TGLintptr = Tptrdiff_t;
{$endif}
{$if !GST_GL_HAVE_GLSYNC}

  PGLsync = ^TGLsync;
  TGLsync = Tgpointer;
{$endif}
{$if !GST_GL_HAVE_GLUINT64}

  PGLuint64 = ^TGLuint64;
  TGLuint64 = Tguint64;
{$endif}
{$if !GST_GL_HAVE_GLINT64}

  PGLint64 = ^TGLint64;
  TGLint64 = Tgint64;
{$endif}

implementation


end.
