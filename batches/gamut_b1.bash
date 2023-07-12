
Show Dotfiles Show Owner/Mode
/scratch/kl3866/IVP/HNeRV/batches/2x/
#!/bin/bash

data=("/scratch/ar7996/ivp/uvgdataset/Beauty_3840x2160_120fps_420_8bit_YUV_RAW/Beauty_3840x2160_YUV_444_1920x1080_cropped_images/" 
      "/scratch/ar7996/ivp/uvgdataset/Bosphorus_3840x2160_120fps_420_8bit_YUV_RAW/Bosphorus_3840x2160_YUV_444_1920x1080_cropped_images/"
      "/scratch/ar7996/ivp/uvgdataset/CityAlley_3840x2160_50fps_420_8bit_YUV_RAW/CityAlley_3840x2160_50fps_8bit_YUV_444_1920x1080_cropped_images/"
      "/scratch/ar7996/ivp/uvgdataset/FlowerFocus_3840x2160_50fps_420_8bit_YUV_RAW/FlowerFocus_3840x2160_50fps_8bit_YUV_444_1920x1080_cropped_images/"
)
qt_model=24
qt_embed=6
names=(Beauty Bosphorus CityAlley FlowerFocus)
# r_factor=(1.2 2) #better not mess with r_Factor and modelsize since this will affect architecture and input size requirement as well
#model_size=(1.2 1.5) #could accept as, as is, since this is HNeRV's architecture by design


for idx in ${!data[@]}
do
    python ../run_hnerv.py --data_path ${data[$idx]} \
                          --batchSize 1 \
                          --vid 2x_${names[$idx]}_QTM${qt_model}_QTE${qt_embed} \
                          --outf 2x_24bit_gamut \
                          --conv_type convnext pshuffel \
                          --act gelu \
                          --norm none  \
                          --crop_list 960_1920 \
                          --resize_list -1 \
                          --loss L2 \
                          --enc_strds 5 4 4 3 2 \
                          --enc_dim 64_16 \
                          --dec_strds 5 4 4 3 2 \
                          --ks 0_1_5 \
                          --reduce 1.2 \
                          --modelsize 1.5  \
                          --epochs 600 \
                          --eval_freq 100 \
                          --lower_width 12 \
                          --lr 0.001 \
                          --super \
                          --super_rate 2 \
                          --quant_model_bit ${qt_model} \
                          --quant_embed_bit ${qt_embed} \
                          --dump_images 
done


