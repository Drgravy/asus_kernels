#!/bin/sh

# creat empty directories
if [ ! -d ./init_rd/data ] ; then
    mkdir ./init_rd/data
fi

if [ ! -d ./init_rd/dev ] ; then
    mkdir ./init_rd/dev
fi

if [ ! -d ./init_rd/proc ] ; then
    mkdir ./init_rd/proc
fi

if [ ! -d ./init_rd/sys ] ; then
    mkdir ./init_rd/sys
fi

if [ ! -d ./init_rd/system ] ; then
    mkdir ./init_rd/system
fi

# cm ramdisk
if [ ! -d ./cm_init_rd/data ] ; then
    mkdir ./cm_init_rd/data
fi

if [ ! -d ./cm_init_rd/dev ] ; then
    mkdir ./cm_init_rd/dev
fi

if [ ! -d ./cm_init_rd/proc ] ; then
    mkdir ./cm_init_rd/proc
fi

if [ ! -d ./cm_init_rd/sys ] ; then
    mkdir ./cm_init_rd/sys
fi

if [ ! -d ./cm_init_rd/system ] ; then
    mkdir ./cm_init_rd/system
fi

# end cm ramdisk

if [ ! -d ./CWM-touch/tmp ] ; then
    mkdir ./CWM-touch/tmp
fi

# fix permisions
chmod 771 ./init_rd/data
chmod 644 ./init_rd/default.prop
chmod 771 ./cm_init_rd/data
chmod 644 ./cm_init_rd/default.prop
chmod 644 ./CWM-touch/default.prop
chmod 750 ./CWM-touch/etc
chmod 640 ./CWM-touch/etc/recovery.fstab
chmod 640 ./init_rd/fstab.cardhu
chmod 640 ./CWM-touch/fstab.cardhu
chmod 750 ./init_rd/init
chmod 750 ./cm_init_rd/init
chmod 750 ./CWM-touch/init
chmod 750 ./init_rd/init*.rc
chmod 750 ./cm_init_rd/init*.rc
chmod 750 ./CWM-touch/init*.rc
chmod 755 ./init_rd/proc
chmod 755 ./cm_init_rd/proc
chmod 750 -R ./CWM-touch/res
chmod 640 ./CWM-touch/res/keys
chmod 640 ./CWM-touch/res/images/*.png
chmod 750 -R ./init_rd/sbin
chmod 750 -R ./cm_init_rd/sbin
chmod 750 -R ./CWM-touch/sbin
chmod 755 ./init_rd/sys
chmod 755 ./init_rd/system
chmod 755 ./cm_init_rd/sys
chmod 755 ./cm_init_rd/system
chmod 755 ./CWM-touch/tmp
chmod 644 ./init_rd/ueventd*.rc
chmod 644 ./cm_init_rd/ueventd*.rc
chmod 644 ./CWM-touch/ueventd*.rc
