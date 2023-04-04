#!/bin/bash
path="/archive/ar7996/ivp/uvgdataset/"
down="_960x540_downsampled_images"
size="_960x540"
pre_processed="_pre_processed"
crop="_cropped"

for each in $(ls)
do
  extension="${each##*.}"
  filename="${each%.*}"
  if [ $extension = 'yuv' ]
  then
    # echo "$each"
    # echo "$filename"
    ffmpeg -pix_fmt yuv420p10le -s 3840x2160 -ss 00:00:00 -t 1 -i $each -s 960x540 -vf fps=120 -pix_fmt yuv420p $filename$pre_processed.yuv
    ffmpeg -pix_fmt yuv420p -s 960x540 -i $filename$pre_processed.yuv -vf "crop=960:480" -pix_fmt yuv420p $filename$pre_processed$crop.yuv
  fi  
done