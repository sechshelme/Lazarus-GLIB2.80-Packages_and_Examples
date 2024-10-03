
unit gstinsertbin;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstinsertbin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstinsertbin.h
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
Pgchar  = ^gchar;
PGstElement  = ^GstElement;
PGstInsertBin  = ^GstInsertBin;
PGstInsertBinClass  = ^GstInsertBinClass;
PGstInsertBinPrivate  = ^GstInsertBinPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 *
 *  Copyright 2013 Collabora Ltd
 *   @author: Olivier Crete <olivier.crete@collabora.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 *
  }
{$ifndef __GST_INSERT_BIN_H__}
{$define __GST_INSERT_BIN_H__}
{#ifndef GST_USE_UNSTABLE_API }
{#warning "The GStreamer insertbin library is unstable API and may change in future." }
{#warning "You can define GST_USE_UNSTABLE_API to avoid this warning." }
{#endif }
{$include <gst/gst.h>}
{$ifndef }
{$ifdef BUILDING_GST_INSERT_BIN}
{ from config.h  }
{$define extern_EXPORT}
{$else}
{$define extern_IMPORT}
{$endif}
{$endif}

{ was #define dname def_expr }
function GST_TYPE_INSERT_BIN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_INSERT_BIN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_INSERT_BIN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_INSERT_BIN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_INSERT_BIN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_INSERT_BIN_GET_CLASS(obj : longint) : longint;

type
{*
 * GstInsertBinCallback:
 * @insertbin: A #GstInsertBin
 * @element: The #GstElement on which the operation was performed
 * @success: %TRUE if the operation was successful
 * @user_data: The user data passed
 *
 * This is the prototype of callbacks to be called when the operation completes.
 * It could be called at any time, including as a re-entrant call while the
 * operation is requested.
 *
 * Since: 1.2
  }

  TGstInsertBinCallback = procedure (insertbin:PGstInsertBin; element:PGstElement; success:Tgboolean; user_data:Tgpointer);cdecl;
{*
 * GstInsertBin:
 *
 * The object structure.
 *
 * Since: 1.2
  }
{< private > }
  PGstInsertBin = ^TGstInsertBin;
  TGstInsertBin = record
      parent : TGstBin;cdecl;
      priv : PGstInsertBinPrivate;
    end;

{*
 * GstInsertBinClass:
 *
 * The object class structure.
 *
 * Since: 1.2
  }
  PGstInsertBinClass = ^TGstInsertBinClass;
  TGstInsertBinClass = record
      parent_class : TGstBinClass;
    end;


function gst_insert_bin_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_insert_bin_new(name:Pgchar):PGstElement;cdecl;external;
procedure gst_insert_bin_prepend(self:PGstInsertBin; element:PGstElement; callback:TGstInsertBinCallback; user_data:Tgpointer);cdecl;external;
procedure gst_insert_bin_append(self:PGstInsertBin; element:PGstElement; callback:TGstInsertBinCallback; user_data:Tgpointer);cdecl;external;
procedure gst_insert_bin_insert_before(self:PGstInsertBin; element:PGstElement; sibling:PGstElement; callback:TGstInsertBinCallback; user_data:Tgpointer);cdecl;external;
procedure gst_insert_bin_insert_after(self:PGstInsertBin; element:PGstElement; sibling:PGstElement; callback:TGstInsertBinCallback; user_data:Tgpointer);cdecl;external;
procedure gst_insert_bin_remove(self:PGstInsertBin; element:PGstElement; callback:TGstInsertBinCallback; user_data:Tgpointer);cdecl;external;
{$endif}
{ __GST_INSERT_BIN_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_INSERT_BIN : longint; { return type might be wrong }
  begin
    GST_TYPE_INSERT_BIN:=gst_insert_bin_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_INSERT_BIN(obj : longint) : longint;
begin
  GST_INSERT_BIN:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_INSERT_BIN,GstInsertBin);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_INSERT_BIN_CLASS(klass : longint) : longint;
begin
  GST_INSERT_BIN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_INSERT_BIN,GstInsertBinClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_INSERT_BIN(obj : longint) : longint;
begin
  GST_IS_INSERT_BIN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_INSERT_BIN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_INSERT_BIN_CLASS(klass : longint) : longint;
begin
  GST_IS_INSERT_BIN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_INSERT_BIN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_INSERT_BIN_GET_CLASS(obj : longint) : longint;
begin
  GST_INSERT_BIN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_INSERT_BIN,GstInsertBinClass);
end;


end.
