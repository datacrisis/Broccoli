#!/bin/bash

path="/archive/ar7996/ivp/uvgdataset/"
yuv444="_YUV_444"
fps50="_50fps"
fps120="_120fps"

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
    if [ $extension = 'yuv' ]
    then
      ffmpeg -pix_fmt yuv420p -s 3840x2160 -i $each2 -preset medium -f rawvideo -vcodec rawvideo -pix_fmt yuv444p -s 3840x2160 $filename$yuv444.yuv
    fi
  done

  cd ..
done