#!/bin/bash
# modified for ios6, unsure if it works, but compile completes 
# churns out an armv7 architecture library, so lipo freaks out that it duplicates the armv7 format
# Creating: dist-universal/lib/libavcodec.a
# /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/lipo: dist-armv7/lib/libavcodec.a and dist-armv7s/lib/libavcodec.a have the same architectures (armv7) and can't be in the same fat output file

export DEVELOPER_ROOT_PATH=/Applications/Xcode.app/Contents/Developer
export CC=${DEVELOPER_ROOT_PATH}/Platforms/iPhoneOS.platform/Developer/usr/bin/arm-apple-darwin10-llvm-gcc-4.2
export SYS_ROOT=${DEVELOPER_ROOT_PATH}/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS6.1.sdk

./configure --logfile=./logffmpeg.txt \
	--enable-cross-compile \
	--arch=armv7s \
	--target-os=darwin \
	--cpu=cortex-a9 \
	--cc=${CC} \
	--as="gas-preprocessor.pl ${CC}" \
	--prefix=./dist-armv7s/ \
	--disable-avdevice \
	--disable-devices \
	--disable-encoders \
	--disable-muxers \
	--enable-swscale  \
  	--disable-postproc  \
	--disable-avfilter \
	--disable-bzlib   \
  	--disable-armv5te \
  	--disable-armv6  \
  	--disable-armv6t2 \
	--enable-network \
	--enable-pic \
	--enable-neon \
	--extra-cflags=" -std=c99 -mfpu=neon -miphoneos-version-min=6.0 -mfloat-abi=softfp -DUSE_HFC_LOG  -isysroot ${SYS_ROOT}" \
	--extra-ldflags="-isysroot ${SYS_ROOT} -miphoneos-version-min=6.0" \
	--disable-yasm \
        --disable-asm

#  	--disable-armvfp  \
#	--enable-gpl \
#	--ld=/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/ld \
#	--ar=/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/ar \
#	--cpu=arm1176jzf-s \
#	--extra-cflags="-arch=armv7" \
#	--extra-ldflags="-arch=armv7" \
#

sed  -i '.ori' 's/CONFIGURATION.*$/CONFIGURATION \" \"/g' config.h

