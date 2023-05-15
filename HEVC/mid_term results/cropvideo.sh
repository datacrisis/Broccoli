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
  if [ $extension = 'yuv' ] && [ $filename = *"$pre_processed"* ]
  then
    # echo "$each"
    # echo "$filename"
    ffmpeg -pix_fmt yuv420p -s 960x540 -i $each -vf "crop=960:480" -pix_fmt yuv420p $filename$pre_processed$crop.yuv
  fi  
done