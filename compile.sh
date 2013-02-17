#! /bin/bash


function make_dist_i386() {
   echo -n "prepare to make ffmpeg with i386 ! "
   
   cd ffmepg 
   
   make distclean
   
   ../config/config_i386.sh
   
   make -j9 && make install   
   #把build移到指定输出目录
   mv dist-i386  ../
   
   echo -n "success make ffmpeg with i386 ! "
}



make_dist_i386