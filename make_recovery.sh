#!/bin/bash

VERSION=6.0.1.4

if [ ! -e $PWD/zImage ] ; then
    echo zImage not found
    exit 1
fi
find -name .gitignore | xargs rm -fr
rm ../CWM-Touch_$VERSION.zip ../CWM-Touch.blob
$PWD/bin/mkbootfs $PWD/CWM-touch | $PWD/bin/minigzip > $PWD/ramdisk.gz
$PWD/bin/mkbootimg --kernel $PWD/zImage --ramdisk $PWD/ramdisk.gz -o $PWD/tmp
$PWD/bin/blobpack ../CWM-Touch.blob SOS $PWD/tmp
zip -9j ../CWM-Touch_$VERSION.zip ../CWM-Touch.blob
rm $PWD/tmp $PWD/ramdisk.gz
exit 0
