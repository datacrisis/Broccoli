#!/bin/bash

path="/archive/ar7996/ivp/uvgdataset/"
crop="_cropped_images"
hevc="_hevc_video"
intra="_intra"
inter="_inter"
size="_960x540"
name="Beauty_3840x2160_120fps_420_8bit_YUV_960x540"
hevc265="_x265"
qp17="_qp_17"
qp22="_qp_22"
qp27="_qp_27"
qp32="_qp_32"
qp37="_qp_37"
qp42="_qp_42"


for each in $(ls -d */)
do
  if [[ $each == *"8bit"* ]]
  then
    cd $each
  else
    continue
  fi

  for each2 in $(ls  -d */)
  do
    if [[ $each2 == *"cropped_images"* ]]
    then
      filename=${each2%????????????????}
      ffmpeg -r 120 -f image2 -i $each2/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv444p -x265-params "bframes=0:qp=17" $filename$hevc$hevc265$qp17$inter.265
      ffmpeg -r 120 -f image2 -i $each2/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv444p -x265-params "bframes=0:qp=22" $filename$hevc$hevc265$qp22$inter.265
      ffmpeg -r 120 -f image2 -i $each2/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv444p -x265-params "bframes=0:qp=27" $filename$hevc$hevc265$qp27$inter.265
      ffmpeg -r 120 -f image2 -i $each2/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv444p -x265-params "bframes=0:qp=32" $filename$hevc$hevc265$qp32$inter.265
      ffmpeg -r 120 -f image2 -i $each2/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv444p -x265-params "bframes=0:qp=37" $filename$hevc$hevc265$qp37$inter.265
      ffmpeg -r 120 -f image2 -i $each2/im%05d.png -preset medium -vcodec libx265 -pix_fmt yuv444p -x265-params "bframes=0:qp=42" $filename$hevc$hevc265$qp42$inter.265

    fi
  done

  cd ..
done



