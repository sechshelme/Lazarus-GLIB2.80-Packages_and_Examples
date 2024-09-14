
unit gstpadtemplate;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstpadtemplate.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstpadtemplate.h
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
PGstCaps  = ^GstCaps;
PGstPad  = ^GstPad;
PGstPadPresence  = ^GstPadPresence;
PGstPadTemplate  = ^GstPadTemplate;
PGstPadTemplateClass  = ^GstPadTemplateClass;
PGstPadTemplateFlags  = ^GstPadTemplateFlags;
PGstStaticPadTemplate  = ^GstStaticPadTemplate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wim.taymans@chello.be>
 *
 * gstpadtemplate.h: Header for GstPadTemplate object
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
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_PAD_TEMPLATE_H__}
{$define __GST_PAD_TEMPLATE_H__}
{$include <gst/gstconfig.h>}
type
{$include <gst/gstobject.h>}
{$include <gst/gstbuffer.h>}
{$include <gst/gstcaps.h>}
{$include <gst/gstevent.h>}
{$include <gst/gstquery.h>}
{$include <gst/gsttask.h>}

{ was #define dname def_expr }
function GST_TYPE_PAD_TEMPLATE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PAD_TEMPLATE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PAD_TEMPLATE_CLASS(klass : longint) : longint;

{ was #define dname def_expr }
function GST_TYPE_STATIC_PAD_TEMPLATE : longint; { return type might be wrong }

{*
 * GstPadPresence:
 * @GST_PAD_ALWAYS: the pad is always available
 * @GST_PAD_SOMETIMES: the pad will become available depending on the media stream
 * @GST_PAD_REQUEST: the pad is only available on request with
 *  gst_element_request_pad().
 *
 * Indicates when this pad will become available.
  }
type
  PGstPadPresence = ^TGstPadPresence;
  TGstPadPresence =  Longint;
  Const
    GST_PAD_ALWAYS = 0;
    GST_PAD_SOMETIMES = 1;
    GST_PAD_REQUEST = 2;
;
{*
 * GST_PAD_TEMPLATE_NAME_TEMPLATE:
 * @templ: the template to query
 *
 * Get the nametemplate of the padtemplate.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_PAD_TEMPLATE_NAME_TEMPLATE(templ : longint) : longint;

{*
 * GST_PAD_TEMPLATE_DIRECTION:
 * @templ: the template to query
 *
 * Get the #GstPadDirection of the padtemplate.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE_DIRECTION(templ : longint) : longint;

{*
 * GST_PAD_TEMPLATE_PRESENCE:
 * @templ: the template to query
 *
 * Get the #GstPadPresence of the padtemplate.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE_PRESENCE(templ : longint) : longint;

{*
 * GST_PAD_TEMPLATE_CAPS:
 * @templ: the template to query
 *
 * Get a handle to the padtemplate #GstCaps
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE_CAPS(templ : longint) : longint;

{*
 * GST_PAD_TEMPLATE_GTYPE:
 * @templ: the template to query
 *
 * Get the #GType of the padtemplate
 *
 * Since: 1.14
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE_GTYPE(templ : longint) : longint;

{*
 * GstPadTemplateFlags:
 * @GST_PAD_TEMPLATE_FLAG_LAST: first flag that can be used by subclasses.
 *
 * Flags for the padtemplate
  }
{ padding  }
type
  PGstPadTemplateFlags = ^TGstPadTemplateFlags;
  TGstPadTemplateFlags =  Longint;
  Const
    GST_PAD_TEMPLATE_FLAG_LAST = GST_OBJECT_FLAG_LAST shl 4;
;
{*
 * GST_PAD_TEMPLATE_IS_FIXED:
 * @templ: the template to query
 *
 * Check if the properties of the padtemplate are fixed
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_PAD_TEMPLATE_IS_FIXED(templ : longint) : longint;

{*
 * GstPadTemplate:
 *
 * The padtemplate object.
  }
{< private > }
type
  PGstPadTemplate = ^TGstPadTemplate;
  TGstPadTemplate = record
      object : TGstObject;
      name_template : Pgchar;
      direction : TGstPadDirection;
      presence : TGstPadPresence;
      caps : PGstCaps;
      ABI : record
          case longint of
            0 : ( _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer );
            1 : ( abi : record
                gtype : TGType;
                documentation_caps : PGstCaps;
              end );
          end;
    end;

{ signal callbacks  }
{< private > }
  PGstPadTemplateClass = ^TGstPadTemplateClass;
  TGstPadTemplateClass = record
      parent_class : TGstObjectClass;
      pad_created : procedure (templ:PGstPadTemplate; pad:PGstPad);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstStaticPadTemplate:
 * @name_template: the name of the template
 * @direction: the direction of the template
 * @presence: the presence of the template
 * @static_caps: the caps of the template.
 *
 * Structure describing the #GstStaticPadTemplate.
  }
(* Const before type ignored *)
  PGstStaticPadTemplate = ^TGstStaticPadTemplate;
  TGstStaticPadTemplate = record
      name_template : Pgchar;
      direction : TGstPadDirection;
      presence : TGstPadPresence;
      static_caps : TGstStaticCaps;
    end;

{*
 * GST_STATIC_PAD_TEMPLATE:
 * @padname: the name template of the pad
 * @dir: the GstPadDirection of the pad
 * @pres: the GstPadPresence of the pad
 * @caps: the GstStaticCaps of the pad
 *
 * Convenience macro to fill the values of a #GstStaticPadTemplate
 * structure.
 * Example:
 * |[<!-- language="C" -->
 * static GstStaticPadTemplate my_src_template = \
 *   GST_STATIC_PAD_TEMPLATE("src", GST_PAD_SRC, GST_PAD_ALWAYS,
 *                           GST_STATIC_CAPS_ANY);
 * ]|
  }
{ xxxxxxxxxxxxxx }
{#define GST_STATIC_PAD_TEMPLATE(padname, dir, pres, caps) \ }
{/ \ }
{  /* name_template */    padname, \ }
{  /* direction */        dir, \ }
{  /* presence */         pres, \ }
{  /* caps */             caps \ }
{ }
{ templates and factories  }

function gst_pad_template_get_type:TGType;cdecl;external;
{*
 * gst_static_pad_template_get_type: (attributes doc.skip=true)
  }
function gst_static_pad_template_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_pad_template_new(name_template:Pgchar; direction:TGstPadDirection; presence:TGstPadPresence; caps:PGstCaps):PGstPadTemplate;cdecl;external;
(* Const before type ignored *)
function gst_pad_template_new_with_gtype(name_template:Pgchar; direction:TGstPadDirection; presence:TGstPadPresence; caps:PGstCaps; pad_type:TGType):PGstPadTemplate;cdecl;external;
function gst_static_pad_template_get(pad_template:PGstStaticPadTemplate):PGstPadTemplate;cdecl;external;
function gst_pad_template_new_from_static_pad_template_with_gtype(pad_template:PGstStaticPadTemplate; pad_type:TGType):PGstPadTemplate;cdecl;external;
function gst_static_pad_template_get_caps(templ:PGstStaticPadTemplate):PGstCaps;cdecl;external;
function gst_pad_template_get_caps(templ:PGstPadTemplate):PGstCaps;cdecl;external;
procedure gst_pad_template_set_documentation_caps(templ:PGstPadTemplate; caps:PGstCaps);cdecl;external;
function gst_pad_template_get_documentation_caps(templ:PGstPadTemplate):PGstCaps;cdecl;external;
procedure gst_pad_template_pad_created(templ:PGstPadTemplate; pad:PGstPad);cdecl;external;
{$endif}
{ __GST_PAD_TEMPLATE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_PAD_TEMPLATE : longint; { return type might be wrong }
  begin
    GST_TYPE_PAD_TEMPLATE:=gst_pad_template_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE(obj : longint) : longint;
begin
  GST_PAD_TEMPLATE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PAD_TEMPLATE,GstPadTemplate);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE_CLASS(klass : longint) : longint;
begin
  GST_PAD_TEMPLATE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PAD_TEMPLATE,GstPadTemplateClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PAD_TEMPLATE(obj : longint) : longint;
begin
  GST_IS_PAD_TEMPLATE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PAD_TEMPLATE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PAD_TEMPLATE_CLASS(klass : longint) : longint;
begin
  GST_IS_PAD_TEMPLATE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PAD_TEMPLATE);
end;

{ was #define dname def_expr }
function GST_TYPE_STATIC_PAD_TEMPLATE : longint; { return type might be wrong }
  begin
    GST_TYPE_STATIC_PAD_TEMPLATE:=gst_static_pad_template_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE_NAME_TEMPLATE(templ : longint) : longint;
begin
  GST_PAD_TEMPLATE_NAME_TEMPLATE:=(PGstPadTemplate(templ))^.name_template;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE_DIRECTION(templ : longint) : longint;
begin
  GST_PAD_TEMPLATE_DIRECTION:=(PGstPadTemplate(templ))^.direction;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE_PRESENCE(templ : longint) : longint;
begin
  GST_PAD_TEMPLATE_PRESENCE:=(PGstPadTemplate(templ))^.presence;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE_CAPS(templ : longint) : longint;
begin
  GST_PAD_TEMPLATE_CAPS:=(PGstPadTemplate(templ))^.caps;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE_GTYPE(templ : longint) : longint;
begin
  GST_PAD_TEMPLATE_GTYPE:=(PGstPadTemplate(templ))^.(ABI.(abi.gtype));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PAD_TEMPLATE_IS_FIXED(templ : longint) : longint;
begin
  GST_PAD_TEMPLATE_IS_FIXED:=GST_OBJECT_FLAG_IS_SET(templ,GST_PAD_TEMPLATE_FIXED);
end;


end.
