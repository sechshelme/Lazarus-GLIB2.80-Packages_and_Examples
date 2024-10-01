
unit gstphysmemory;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstphysmemory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstphysmemory.h
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
PGstMemory  = ^GstMemory;
PGstPhysMemoryAllocator  = ^GstPhysMemoryAllocator;
PGstPhysMemoryAllocatorInterface  = ^GstPhysMemoryAllocatorInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2017 Sebastian Dröge <sebastian@centricular.com>
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
  }
{$ifndef __GST_PHYS_MEMORY_H__}
{$define __GST_PHYS_MEMORY_H__}
{$include <gst/gst.h>}
{$include <gst/allocators/allocators-prelude.h>}
{#define GST_TYPE_PHYS_MEMORY_ALLOCATOR (gst_phys_memory_allocator_get_type()) }
{#define GST_PHYS_MEMORY_ALLOCATOR_GET_INTERFACE(obj) (GST_PHYS_MEMORY_ALLOCATOR_GET_IFACE(obj)) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_PHYS_MEMORY_ALLOCATOR_CAST(obj : longint) : PGstPhysMemoryAllocator;

{*
 * GstPhysMemoryAllocatorInterface:
 * @get_phys_addr: Implementations shall return the physicall memory address
 *    that is backing the provided memory, or 0 if none.
 *
 * Marker interface for allocators with physical address backed memory
 *
 * Since: 1.14
  }
{< private > }
{< public > }
type
  PGstPhysMemoryAllocatorInterface = ^TGstPhysMemoryAllocatorInterface;
  TGstPhysMemoryAllocatorInterface = record
      parent_iface : TGTypeInterface;
      get_phys_addr : function (allocator:PGstPhysMemoryAllocator; mem:PGstMemory):Tguintptr;cdecl;
    end;


function gst_is_phys_memory(mem:PGstMemory):Tgboolean;cdecl;external;
function gst_phys_memory_get_phys_addr(mem:PGstMemory):Tguintptr;cdecl;external;
{$endif}
{ __GST_PHYS_MEMORY_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PHYS_MEMORY_ALLOCATOR_CAST(obj : longint) : PGstPhysMemoryAllocator;
begin
  GST_PHYS_MEMORY_ALLOCATOR_CAST:=PGstPhysMemoryAllocator(obj);
end;


end.
