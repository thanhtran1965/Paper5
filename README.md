# Machine failure detection system

## Software requirements:
- librosa, matplotlib, numpy, pandas, sklearn. 

- MATLAB 2021a.

## This repository is structured as follow:
```
|-dataset
|----MelSpectrograms
|--------Original_AND_Synthesized_Sound   # The Mel Spectrograms of the augmented dataset that includes both original sounds and augmented sounds
|--------Original_Sounds                  # Mel Spectrograms of original sounds with low pass filter and high pass filter
|--------WITHOUT_Low_HighPassFilter       # Mel Spectrograms of original sounds WITHOUT low pass filter and high pass filter
|----Original_AND_Synthesized_Sound       # The augmented dataset that includes both original sounds and synthesized sounds from variational autoencoder
|----Original_Sounds                      # Sound dataset included 2 classes (break and normal) from Valmet AB                  
|-notebook
|----vae-gensound5Sept2022.ipynb # variational autoencoder to synthesize new sounds
|-matlab
|----CROSS_CORRELATION.m                  # Measuring sound similarities between an original sounds and a synthesized sound
|----TransferLearning.mlx                 # Sound classification using pretrained network (can use any pre-trained network by selecting the one you want)
|----findLayersToReplace.m                # Supported function for ``TransferLearning.mlx```
|----freezeWeights.m                      # Supported function for ``TransferLearning.mlx```
```

## Dataset:
Valmet's sound dataset can find using this link: https://zenodo.org/record/6478574#.Ymj7ONpByUk

## Usage:

- Run ```vae-gensound5Sept2022.ipynb``` to synthesize sounds using autoencoder

- Run ```CROSS_CORRELATION.m``` to measure sound similarities between the original sound and the synthesized sound

- Run ```TransferLearning.mlx``` to reproduce the experiments and results with pre-trained CNNs. ```findLayersToReplace.m``` and ```freezeWeights.m``` are functions to support ```TransferLearning.mlx```

## Note
- The clean version with detailed instruction will be release later.

## Citation
If you use this code/data or part of it, please cite the following paper:
```
@article{tran2022artificial,
  title={An artificial neural network-based system for detecting machine failures using tiny sound data: A case study},
  author={Tran, Thanh and Bader, Sebastian and Lundgren, Jan},
  journal={arXiv preprint arXiv:2209.11527},
  year={2022}
}
```
Published version
```
Will be published soon by the 24th IEEE International Symposium on Multimedia (ISM2022)
```
