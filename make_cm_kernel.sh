#!/bin/bash

if [ ! -e $PWD/zImage ] ; then
    echo zImage not found
    exit 1
fi
if [ ! -d $PWD/system ] ; then
    echo system not found
    exit 1
fi
if [ -e ../cm_update.zip ] ; then
    rm ../cm_update.zip
fi
find -name .gitignore | xargs rm -fr
$PWD/bin/mkbootfs $PWD/cm_init_rd | $PWD/bin/minigzip > $PWD/ramdisk.gz
$PWD/bin/mkbootimg --kernel $PWD/zImage --ramdisk $PWD/ramdisk.gz -o $PWD/tmp
if [ -e $PWD/cm_update/kernel.blob ] ; then
    rm $PWD/cm_update/kernel.blob
fi
$PWD/bin/blobpack $PWD/cm_update/kernel.blob LNX $PWD/tmp
if [ -d $PWD/system ] ; then
    rm -fr $PWD/cm_update/system
    mkdir -p $PWD/cm_update/system
    cp -frp $PWD/system/* $PWD/cm_update/system/
    mkdir -p $PWD/cm_update/system/bin/
    cp $PWD/files/vold $PWD/cm_update/system/bin/vold
    cp $PWD/files/ntfs-3g $PWD/cm_update/system/bin/ntfs-3g
    cp $PWD/files/exfat $PWD/cm_update/system/bin/exfat
fi
cd $PWD/cm_update
zip -9r ../cm_update.zip ./*
cd ../
java -jar $PWD/bin/SignUpdate.jar $PWD/cm_update.zip
mv $PWD/signed_cm_update.zip ../cm_update.zip
rm $PWD/cm_update.zip $PWD/tmp $PWD/ramdisk.gz $PWD/cm_update/kernel.blob
rm -fr $PWD/cm_update/system
cd ../
exit 0
