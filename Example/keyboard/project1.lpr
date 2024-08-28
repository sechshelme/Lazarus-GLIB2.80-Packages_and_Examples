program project1;

uses
  ctypes,
  Strings,
  Math,
  BaseUnix,
  glib280;

const
  lib_stdio = 'c';
type
  TFILE = record
  end;
  PFILE = ^TFILE;
var
  stdin: PFILE; cvar;external lib_stdio;
  stdout: PFILE; cvar;external lib_stdio;
  stderr: PFILE; cvar;external lib_stdio;

  // https://fluendo.com/fluendo-sdk/docs/tutorials/playback_controls.html

  function fileno(f: PFILE): cint; cdecl; external libglib2;

  function onKeyPress(Source: PGIOChannel; condition: TGIOCondition; Data: Tgpointer): Tgboolean; cdecl;
  var
    loop: PGMainLoop absolute Data;
    len, ter_pos: SizeUInt;
    status: TGIOStatus;
    error_: PGError = nil;
    buffer: Pgchar = nil;
    //    buffer: Pgchar;
  begin
    status := g_io_channel_read_line(Source, @buffer, @len, @ter_pos, @error_);
    if status = G_IO_STATUS_NORMAL then begin
      buffer[ter_pos] := #0;

      WriteLn('len:    ', len);
      WriteLn('terpos: ', ter_pos);
      WriteLn('Buffer: ', buffer);
      WriteLn('Buffer: ', string(buffer));
      if strcomp(buffer, 'q') = 0 then begin
        g_main_loop_quit(loop);
      end;
    end;
    g_free(buffer);
    Result := G_SOURCE_CONTINUE;
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    loop: PGMainLoop;
    channel: PGIOChannel;
  begin
    loop := g_main_loop_new(nil, False);

    channel := g_io_channel_unix_new(fileno(stdin));
    g_io_channel_set_encoding(channel, nil, nil);

    g_io_add_watch(channel, G_IO_IN, @onKeyPress, loop);


    g_main_loop_run(loop);

    g_io_channel_unref(channel);
    g_main_loop_unref(loop);
    Result := 0;
  end;

begin
  SetExceptionMask([exDenormalized, exInvalidOp, exOverflow, exPrecision, exUnderflow, exZeroDivide]);
  main(argc, argv);
end.
