#!/bin/bash

if [ ! -e $PWD/zImage ] ; then
    echo zImage not found
    exit 1
fi
if [ ! -d $PWD/system ] ; then
    echo system not found
    exit 1
fi
if [ -e ../update.zip ] ; then
    rm ../update.zip
fi
find -name .gitignore | xargs rm -fr
$PWD/bin/mkbootfs $PWD/init_rd | $PWD/bin/minigzip > $PWD/ramdisk.gz
$PWD/bin/mkbootimg --kernel $PWD/zImage --ramdisk $PWD/ramdisk.gz -o $PWD/tmp
if [ -e $PWD/update/kernel.blob ] ; then
    rm $PWD/update/kernel.blob
fi
$PWD/bin/blobpack $PWD/update/kernel.blob LNX tmp
if [ -d $PWD/system ] ; then
    rm -fr $PWD/update/system
    mkdir -p $PWD/update/system
    cp -frp $PWD/system/* $PWD/update/system/
    mkdir -p $PWD/update/system/bin/
    mkdir -p $PWD/update/system/xbin/
    mkdir -p $PWD/update/system/etc/init.d/
    cp $PWD/files/busybox $PWD/update/system/xbin/busybox
    cp $PWD/files/install_busybox.sh $PWD/update/system/xbin/install_busybox.sh
    cp $PWD/files/vold $PWD/update/system/bin/vold
    cp $PWD/files/ntfs-3g $PWD/update/system/bin/ntfs-3g
    cp $PWD/files/exfat $PWD/update/system/bin/exfat
    cp $PWD/files/zram.sh $PWD/update/system/etc/init.d/99zram
fi
cd $PWD/update
zip -9r ../update.zip ./*
cd ../
java -jar $PWD/bin/SignUpdate.jar $PWD/update.zip
mv $PWD/signed_update.zip ../update.zip
rm $PWD/update.zip $PWD/tmp $PWD/ramdisk.gz $PWD/update/kernel.blob
rm -fr $PWD/update/system
exit 0
