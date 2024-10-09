unit gstgl_enums;

interface

uses
  glib280, gst124;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGstGLTextureTarget = ^TGstGLTextureTarget;
  TGstGLTextureTarget = longint;

const
  GST_GL_TEXTURE_TARGET_NONE = 0;
  GST_GL_TEXTURE_TARGET_2D = 1;
  GST_GL_TEXTURE_TARGET_RECTANGLE = 2;
  GST_GL_TEXTURE_TARGET_EXTERNAL_OES = 3;

  // === Konventiert am: 9-10-24 10:32:22 ===


implementation



end.
