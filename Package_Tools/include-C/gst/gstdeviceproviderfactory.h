/* GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *               2000,2004 Wim Taymans <wim@fluendo.com>
 *               2012 Olivier Crete <olivier.crete@collabora.com>
 *
 * gstdeviceproviderfactory.h: Header for GstDeviceProviderFactory
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
 */



#ifndef __GST_DEVICE_PROVIDER_FACTORY_H__
#define __GST_DEVICE_PROVIDER_FACTORY_H__

/**
 * GstDeviceProviderFactory:
 *
 * The opaque #GstDeviceProviderFactory data structure.
 *
 * Since: 1.4
 */

/**
 * GstDeviceProviderFactoryClass:
 *
 * The opaque #GstDeviceProviderFactoryClass data structure.
 *
 * Since: 1.4
 */
typedef struct _GstDeviceProviderFactory GstDeviceProviderFactory;
typedef struct _GstDeviceProviderFactoryClass GstDeviceProviderFactoryClass;

#include <gst/gstconfig.h>
#include <gst/gstplugin.h>
#include <gst/gstpluginfeature.h>
#include <gst/gstdeviceprovider.h>



#define GST_TYPE_DEVICE_PROVIDER_FACTORY            (gst_device_provider_factory_get_type())
#define GST_DEVICE_PROVIDER_FACTORY(obj)            (G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_DEVICE_PROVIDER_FACTORY,\
                                                 GstDeviceProviderFactory))
#define GST_DEVICE_PROVIDER_FACTORY_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST((klass),GST_TYPE_DEVICE_PROVIDER_FACTORY,\
                                                 GstDeviceProviderFactoryClass))
#define GST_IS_DEVICE_PROVIDER_FACTORY(obj)         (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_DEVICE_PROVIDER_FACTORY))
#define GST_IS_DEVICE_PROVIDER_FACTORY_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE((klass),GST_TYPE_DEVICE_PROVIDER_FACTORY))
#define GST_DEVICE_PROVIDER_FACTORY_CAST(obj)       ((GstDeviceProviderFactory *)(obj))

extern
GType                   gst_device_provider_factory_get_type          (void);

extern
GstDeviceProviderFactory * gst_device_provider_factory_find            (const gchar *name);

extern
GType                   gst_device_provider_factory_get_device_provider_type (GstDeviceProviderFactory *factory);

extern
const gchar *           gst_device_provider_factory_get_metadata       (GstDeviceProviderFactory *factory, const gchar *key);

extern
gchar **                gst_device_provider_factory_get_metadata_keys  (GstDeviceProviderFactory *factory);

extern
GstDeviceProvider*       gst_device_provider_factory_get                (GstDeviceProviderFactory *factory) ;

extern
GstDeviceProvider*       gst_device_provider_factory_get_by_name        (const gchar *factoryname) ;

extern
gboolean                gst_device_provider_register                   (GstPlugin *plugin, const gchar *name,
                                                                       guint rank,
                                                                       GType type);
extern
gboolean      gst_device_provider_factory_has_classesv (GstDeviceProviderFactory * factory,
                                                       gchar ** classes);
extern
gboolean      gst_device_provider_factory_has_classes (GstDeviceProviderFactory *factory,
                                                       const gchar * classes);
extern
GList *       gst_device_provider_factory_list_get_device_providers (
                                                       GstRank minrank) ;





#endif /* __GST_DEVICE_PROVIDER_FACTORY_H__ */
