<br />
<p align="center">

<h1 align="center">🥦 <b>Broccoli</b> <br> Efficient Video Encoding with Neural Implicit Representation
</h1>
  <h4 align="center"><a href="https://github.com/datacrisis">Keifer Lee</a>, <a href="">Ankit Rajvanshi</a>, <a href="">Utkarsh Atri</a>, <a href="">Yueyu Hu </a>(Mentor) </h4>
  
  <h5 align="center"><a href="https://docs.google.com/presentation/d/17Vl2SLQFEUfY_zYlgTjfzdY43zZ397gmQey7Jv0UCr8/"> Slide </a> &emsp; <a href=""> Report </a></h5>
</p>


<!-- # Abstract
![Pipeline of Leave Your Clothes Behind (LYCB)](./assets/pipeline.png)
<p align="center">
  <b>Pipeline of Leave Your Clothes Behind (LYCB)</b>
</p>

# Results & Sample Weights
Below is an illustration of the input / output at each stage of the pipeline with custom data.
![Sample output](https://github.com/IamShubhamGupto/LYCB/blob/main/assets/merged_animation.gif)
<p align="center">
<b>Sample data at each stage. From left to right - Monocular input sequence, SAM extracted mask, NeRF2Mesh reconstructed mesh and test-fit with cloth simulation in Blender</b>
</p>

Sample data used in illustration above and the corresponding trained implicit model and reconstructed mesh can be found [here](https://drive.google.com/file/d/1nKHaewiDw_M1wOnBDXXRA_i0nXSzp8LR/view?usp=share_link)
 -->
 
## Introduction 
> **Note**: For ECE 6123 – Image and Video Processing (Spring 2023) at NYU

## Getting Started

### Installation
For LYCB, `NeRF2Mesh`'s dependencies and `Segment-Anything` are key pre-requisites. Optionally, if you would like to use your own data (without prepared camera parameters), `COLMAP` will be required as well.

```python
#Installing key requirements

#NeRF2Mesh
pip install -r requirements.txt
pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch 
pip install git+https://github.com/NVlabs/nvdiffrast/
pip install git+https://github.com/facebookresearch/pytorch3d.git

#SAM
pip install git+https://github.com/facebookresearch/segment-anything.git
```

For COLMAP installation, check out https://colmap.github.io/install.html


### Running LYCB
1. Test test
```bash
#Example for video
echo test
```


## Acknowledgements & References
The project is built on top of HNerV from Chen et. al. [here](https://github.com/haochen-rye/HNeRV).

```@InProceedings{chen2022hnerv,
      title={{HN}e{RV}: Neural Representations for Videos}, 
      author={Hao Chen and Matthew Gwilliam and Ser-Nam Lim and Abhinav Shrivastava},
      year={2022},
}
```
