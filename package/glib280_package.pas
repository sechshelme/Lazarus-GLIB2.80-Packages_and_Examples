{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit GLIB280_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  gio280, glib280, gobject280, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('GLIB280_package', @Register);
end.
