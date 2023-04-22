#!/bin/bash

path="/archive/ar7996/ivp/uvgdataset/"
down="_960x540_downsampled_images"
size="_960x540"

for each in $(ls)
do
  extension="${each##*.}"
  filename="${each%.*}"
  if [ $extension = 'yuv' ]
  then
    # echo "$each"
    # echo "$filename"
    mkdir $filename$down
    ffmpeg -pix_fmt yuv420p10le -s 3840x2160 -ss 00:00:00 -t 1 -i $each -vf fps=120 -pix_fmt rgb24 -s 960x540 -f image2 $filename$down/im%05d.png
  fi  
done