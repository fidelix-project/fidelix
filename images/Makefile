include sysconfig.mk

WORKDIR?=/tmp/images_work
OUTDIR?=$(HOME)/images
IMG_BASENAME?=$(OS_NAME_LOWERCASE)-$(OS_VERSION)-$(OS_ARCH)-$(OS_PKG_TAG)
COMP_EXT?=gz
COMP_PROG?=gzip

export OUTDIR WORKDIR IMG_BASENAME COMP_EXT COMP_PROG \
	USB_IMG_SIZE OS_ARCH OS_SRC_DIR

USB_IMG_NAME=$(IMG_BASENAME).img
# Image size in KB. Should fit on most 4GB flash drives.
USB_IMG_SIZE=3800000

USB_FULL_IMG_NAME=$(IMG_BASENAME)-full.img
# Image size in KB. Should fit on most 8GB flash drives.
USB_FULL_IMG_SIZE=7800000

$(OUTDIR)/$(USB_IMG_NAME).$(COMP_EXT): $(OUTDIR)
	./makeusbimage.sh

$(OUTDIR) $(WORKDIR):
	mkdir $@

%:

