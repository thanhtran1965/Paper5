# Machine failure detection system

## Software requirements:
- librosa, matplotlib, numpy, pandas, sklearn. 

- MATLAB 2021a.

## Dataset:
Valmet's sound dataset can find using this link: https://zenodo.org/record/6478574#.Ymj7ONpByUk

## Usage:

- Run ```VAE_GenSound3May2022``` to synthesize sounds using autoencoder

- Run ```CROSS_CORRELATION.m``` to measure sound similarities between the original sound and the synthesized sound

- Run ```TransferLearning.mlx``` to reproduce the experiments and results with pre-trained CNNs. ```findLayersToReplace.m``` and ```freezeWeights.m``` are functions to support ```TransferLearning.mlx```

## Note
- The clean version with detailed instruction will be release later.

## Citation
If you use this code/data or part of it, please cite the following paper:


