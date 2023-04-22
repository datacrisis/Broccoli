#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --time=6:00:00
#SBATCH --mem=32GB
#SBATCH --gres=gpu:rtx8000:1
#SBATCH --job-name=ivp-hnerv-jockey
#SBATCH --output=jockey-hnerv-gamut.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kl3866@nyu.edu

module purge

singularity exec --nv \
            --overlay /scratch/kl3866/nerf_project/penv_torch_nerf/overlay-15GB-500K.ext3:ro \
            /scratch/work/public/singularity/cuda11.2.2-cudnn8-devel-ubuntu20.04.sif \
            /bin/bash -c "source /ext3/env.sh; conda activate base; cd /scratch/kl3866/IVP/HNeRV/batches/; ./hnerv_jockey_gamut.bash"
