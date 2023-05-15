<br />
<p align="center">

<h1 align="center">🥦 <b>Broccoli</b> <br> Efficient Video Encoding with Neural Implicit Representation
</h1>
  <h4 align="center"><a href="https://github.com/datacrisis">Keifer Lee</a>, <a href="">Ankit Rajvanshi</a>, <a href="">Utkarsh Atri</a>, <a href="">Yueyu Hu </a>(Mentor) </h4>
  
  <h5 align="center"><a href="https://docs.google.com/presentation/d/17Vl2SLQFEUfY_zYlgTjfzdY43zZ397gmQey7Jv0UCr8/"> Slide </a> &emsp; <a href=""> Report </a></h5>
</p>

 
## Introduction 
Broccoli is a neural-implicit video encoding framework designed to maximize compactness (e.g. maximize `PSNR`/`BPP` ratio). Unlike traditional encoder, it relies on an autoencoder like deep neural network to encode the video in an end-to-end manner; and unlike some other existing deep encoders, Broccoli (like its neural-implicit brethrens such as HNeRV) is not learning to encode, but to directly represented a given sequence (e.g. overfit) directly. For more info, check out the linked report or slide above.

> **Note**: For ECE 6123 – Image and Video Processing (Spring 2023) at NYU
![Banner](./assets/broccoli_sample.png)
<p align="center">
<b>Left: </b>Ground Truth <b>Right: </b>2x Super-Resolution Reconstructed Output
</p>

### Results & Sample Weights
Below are some sample of encoded (and reconstructed) output from Broccoli - footages taken from the [UVG dataset](https://ultravideo.fi/#testsequences). 

![Sample output - Bosphorus UVG](./assets/bosphorus.gif)
<p align="center">
<b>Bosphorus</b> | <b>Left: </b>Ground Truth <b>Right: </b>2x Super-Resolution Reconstructed Output
</p>

![Sample output - City Alley UVG](./assets/cityalley.gif)
<p align="center">
<b>City Alley</b> | <b>Left: </b>Ground Truth <b>Right: </b>2x Super-Resolution Reconstructed Output
</p>

![Sample output - Beauty UVG](./assets/beauty.gif)
<p align="center">
<b>Beauty</b> | <b>Left: </b>Ground Truth <b>Right: </b>2x Super-Resolution Reconstructed Output
</p>

Pretrained weights for UVG dataset videos can be found [here](https://drive.google.com/file/d/1NYD-S6qXIFpOTooutAPXpD5sbo_QN2UR/)


## Getting Started

### Installation
The following are the key dependencies of of `Broccoli`. To reproduce the results, you would need the `UVG Dataset`, otherwise feel free to use any data of your choice.

```python
pip install -r requirements.txt
pip install brotli
```

### Running Broccoli
1. To begin, we assume that the input video to be encoded has already been converted to a sequence of RGB image frames; considering to add direct YUV parsing and support in the future. One convenient way to do so is by using `ffmpeg`.

2. Run Broccoli, which has to be done in 2 steps as follow
```bash
#Example with 2x super-resolution with output size of 1920x960
#Fit
python ../main.py --data_path path/to/images \
                  --batchSize 1 \
                  --vid output_name \
                  --outf output/path/ \
                  --crop_list 960_1920 \
                  --loss L2 \
                  --enc_strds 5 4 4 2 2 \
                  --dec_strds 5 4 4 2 2 \
                  --ks 0_1_5 \
                  --epochs 300 \
                  --eval_freq 2 \
                  --lower_width 12 \
                  --super \
                  --super_rate 2 \
                  --quant_model_bit 32 \
                  --dump_images 
```
```bash
#Brotli to compress weights
brotli -q 11 -o /path/to/output.br /path/to/quant_vid.pth
```

3. All done!

## Acknowledgements & References
The project is built on top of HNerV from Chen et. al. [here](https://github.com/haochen-rye/HNeRV).

```
@InProceedings{chen2022hnerv,
      title={{HN}e{RV}: Neural Representations for Videos}, 
      author={Hao Chen and Matthew Gwilliam and Ser-Nam Lim and Abhinav Shrivastava},
      year={2022},
}

@inproceedings{mercat2020uvg,
  title={UVG dataset: 50/120fps 4K sequences for video codec analysis and development},
  author={Mercat, Alexandre and Viitanen, Marko and Vanne, Jarno},
  booktitle={Proceedings of the 11th ACM Multimedia Systems Conference},
  pages={297--302},
  year={2020}
}
```
