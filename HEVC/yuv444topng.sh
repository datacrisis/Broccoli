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
    if [ $extension = 'yuv' ] && [[ $filename == *"YUV_444"* ]]
    then
      mkdir $filename$res4k
      mkdir $filename$res2k
      mkdir $filename$res1080
      mkdir $filename$res960
      ffmpeg -pix_fmt yuv444p -s 3840x2160 -i $each2 -pix_fmt rgb24 -s 3840x2160 -f image2 $filename$res4k/im%05d.png
      ffmpeg -pix_fmt yuv444p -s 3840x2160 -i $each2 -pix_fmt rgb24 -s 2560x1440 -f image2 $filename$res2k/im%05d.png
      ffmpeg -pix_fmt yuv444p -s 3840x2160 -i $each2 -pix_fmt rgb24 -s 1920x1080 -f image2 $filename$res1080/im%05d.png
      ffmpeg -pix_fmt yuv444p -s 3840x2160 -i $each2 -pix_fmt rgb24 -s 960x540 -f image2 $filename$res960/im%05d.png
      mkdir $filename$res4k$crop
      mkdir $filename$res2k$crop
      mkdir $filename$res1080$crop
      mkdir $filename$res960$crop
      ffmpeg -s 3840x2160 -i $filename$res4k/im%05d.png -vf "crop=3840:1920" -pix_fmt rgb24 -f image2 $filename$res4k$crop/im%05d.png
      ffmpeg -s 2560x1440 -i $filename$res2k/im%05d.png -vf "crop=2560:1280" -pix_fmt rgb24 -f image2 $filename$res2k$crop/im%05d.png
      ffmpeg -s 1920x1080 -i $filename$res1080/im%05d.png -vf "crop=1920:960" -pix_fmt rgb24 -f image2 $filename$res1080$crop/im%05d.png
      ffmpeg -s 960x540 -i $filename$res960/im%05d.png -vf "crop=960:480" -pix_fmt rgb24 -f image2 $filename$res960$crop/im%05d.png

    fi
  done

  cd ..
done