#!/bin/bash

path="/archive/ar7996/ivp/uvgdataset/"
yuv444="_YUV_444"
fps50="_50fps"
fps120="_120fps"
res2k="_2560x1440"
res4k="_3840x2160"
res1080="_1920x1080"
res960="_960x540"
crop="_cropped_images"
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

  for each2 in $(ls)
  do
    extension="${each2##*.}"
    filename="${each2%.*}"
    if [ $extension = '265' ]
    then
      mkdir $filename
      ffmpeg -pix_fmt yuv444p -s 960x480 -i $each2 -pix_fmt rgb24 -s 960x480 -f image2 $filename/im%05d.png
    fi
  done

  cd ..
done