#!/bin/bash

path="/archive/ar7996/ivp/uvgdataset/"
crop="_cropped_images"
hevc="_hevc_video"
intra="_intra"
inter="_inter"
size="_960x540"
name="Beauty_3840x2160_120fps_420_10bit_YUV_960x540"
hevc264="_x264"
hevc265="_x265"
crf23="_crf_23"
crf25="_crf_25"


ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -crf 23 -x265-params bframes=0 $name$hevc$hevc265$crf23$inter.mp4

ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -crf 23 -x265-params keyint=1 $name$hevc$hevc265$crf23$intra.mp4

ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -crf 25 -x265-params bframes=0 $name$hevc$hevc265$crf25$inter.mp4

ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv420p -crf 25 -x265-params keyint=1 $name$hevc$hevc265$crf25$intra.mp4

ffmpeg -r 120 -f image2 -s 960x480 -i $name$crop/im%05d.png -preset medium -vcodec libx264 -pix_fmt yuv420p -crf 25 $name$hevc$hevc264$crf25.mp4
