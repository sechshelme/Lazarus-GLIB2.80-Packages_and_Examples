#define GST_TYPE_GHOST_PAD              (gst_ghost_pad_get_type ())
#define GST_GHOST_PAD(obj)              (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_GHOST_PAD, GstGhostPad))
#define GST_GHOST_PAD_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_GHOST_PAD, GstGhostPadClass))
#define GST_IS_GHOST_PAD(obj)           (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_GHOST_PAD))
#define GST_IS_GHOST_PAD_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), GST_TYPE_GHOST_PAD))
#define GST_GHOST_PAD_CAST(obj)         ((GstGhostPad*)(obj))

