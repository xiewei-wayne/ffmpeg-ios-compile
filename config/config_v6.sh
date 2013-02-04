#!/bin/bash

export DEVELOPER_ROOT_PATH=/Applications/Xcode.app/Contents/Developer
export CC=${DEVELOPER_ROOT_PATH}/Platforms/iPhoneOS.platform/Developer/usr/bin/arm-apple-darwin10-llvm-gcc-4.2
export SYS_ROOT=${DEVELOPER_ROOT_PATH}/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS6.1.sdk

./configure --logfile=./logffmpeg.txt \
	--enable-cross-compile \
	--arch=armv6 \
	--target-os=darwin \
	--cpu=arm1176jzf-s \
	--cc=${CC} \
	--as="gas-preprocessor.pl ${CC}" \
	--prefix=./dist-armv6/ \
	--disable-avdevice \
	--disable-devices \
	--disable-encoders \
	--enable-encoder=png \
        --disable-decoder=ac3 --disable-decoder=eac3 --disable-decoder=mlp \
	--disable-muxers \
	--enable-swscale  \
  	--disable-postproc  \
	--disable-avfilter \
	--disable-bzlib   \
  	--disable-armv5te \
  	--enable-armv6  \
  	--enable-armv6t2 \
	--enable-network \
	--enable-pic \
	--disable-neon \
	--extra-cflags="-fpic -mthumb-interwork -mfloat-abi=softfp -mfpu=vfp -march=armv6j -O3 -fomit-frame-pointer -std=c99 -isysroot ${SYS_ROOT}" \
	--extra-ldflags="-isysroot ${SYS_ROOT}" \
	--disable-yasm

#  	--enable-armvfp  \
#        --disable-gpl \
#	--ld=/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/ld \
#	--ar=/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/ar \
#	--cpu=arm1176jzf-s \  #### important for armv6
#	--extra-cflags="-arch=armv7" \
#	--extra-ldflags="-arch=armv7" \
#

sed  -i '.ori' 's/CONFIGURATION.*$/CONFIGURATION \" \"/g' config.h


