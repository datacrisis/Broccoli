#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --time=03:00:00
#SBATCH --gres=gpu:1
#SBATCH --mem=32GB
#SBATCH --job-name=super-res-test
#SBATCH --output=bunny-default.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kl3866@nyu.edu

module purge

singularity exec --nv \
            --overlay /scratch/kl3866/nerf_project/penv_torch_nerf/overlay-15GB-500K.ext3:ro \
            /scratch/work/public/singularity/cuda11.2.2-cudnn8-devel-ubuntu20.04.sif \
            /bin/bash -c "source /ext3/env.sh; conda activate base; cd /scratch/kl3866/IVP/HNeRV/; python run_hnerv.py --data_path data/bunny \
                                                                                                          --batchSize 2 \
                                                                                                          --vid sbatch_bunny_default \
                                                                                                          --outf output \
                                                                                                          --conv_type convnext pshuffel \
                                                                                                          --act gelu \
                                                                                                          --norm none  \
                                                                                                          --crop_list 640_1280 \
                                                                                                          --resize_list -1 \
                                                                                                          --loss L2  \
                                                                                                          --enc_strds 5 4 4 2 2 \
                                                                                                          --enc_dim 64_16 \
                                                                                                          --dec_strds 5 4 4 2 2 \
                                                                                                          --ks 0_1_5 \
                                                                                                          --reduce 1.2 \
                                                                                                          --modelsize 1.5  \
                                                                                                          --epochs 300 \
                                                                                                          --eval_freq 50 \
                                                                                                          --lower_width 12 \
                                                                                                          --lr 0.001 \
                                                                                                          --quant_model_bit 36 \
                                                                                                          --quant_embed_bit 6 \
                                                                                                          #--super \
                                                                                                          #--super_rate 2\
                                                                                                          --dump_images "
