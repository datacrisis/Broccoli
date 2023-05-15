#!/bin/bash

path="/archive/ar7996/ivp/uvgdataset/"
crop="_cropped_images"
hevc="_hevc_video"
intra="_intra"
inter="_inter"
size="_960x540"
name="ShakeNDry_3840x2160_120fps_420_10bit_YUV_960x540"
hevc264="_x264"
hevc265="_x265"
qp17="_qp_17"
qp22="_qp_22"
qp27="_qp_27"
qp32="_qp_32"
qp37="_qp_37"
qp42="_qp_42"


ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -x265-params "bframes=0:qp=17" $name$hevc$hevc265$qp17$inter.265
ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -x265-params "bframes=0:qp=22" $name$hevc$hevc265$qp22$inter.265
ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -x265-params "bframes=0:qp=27" $name$hevc$hevc265$qp27$inter.265
ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -x265-params "bframes=0:qp=32" $name$hevc$hevc265$qp32$inter.265
ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -x265-params "bframes=0:qp=37" $name$hevc$hevc265$qp37$inter.265
ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -x265-params "bframes=0:qp=42" $name$hevc$hevc265$qp42$inter.265

ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -x265-params "keyint=1:qp=17" $name$hevc$hevc265$qp17$intra.265
ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -x265-params "keyint=1:qp=22" $name$hevc$hevc265$qp22$intra.265
ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -x265-params "keyint=1:qp=27" $name$hevc$hevc265$qp27$intra.265
ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -x265-params "keyint=1:qp=32" $name$hevc$hevc265$qp32$intra.265
ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -x265-params "keyint=1:qp=37" $name$hevc$hevc265$qp37$intra.265
ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -x265-params "keyint=1:qp=42" $name$hevc$hevc265$qp42$intra.265



# ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -crf 23 -x265-params bframes=0 $name$hevc$hevc265$crf23$inter.mp4

# ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -crf 23 -x265-params keyint=1 $name$hevc$hevc265$crf23$intra.mp4

# ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -crf 25 -x265-params bframes=0 $name$hevc$hevc265$crf25$inter.mp4

# ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -crf 25 -x265-params keyint=1 $name$hevc$hevc265$crf25$intra.mp4

# ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx264 -pix_fmt yuv420p -crf 25 $name$hevc$hevc264$crf25.mp4
