#!/bin/bash --login
#PBS -l walltime=1:00:00
#PBS -l select=1:ncpus=16
#PBS -N collate_alpha_diversity_joined_combo
#PBS -A d411-training
#PBS -j oe

### script start

#Setting temporary directory
echo "setting temporary directory"
mkdir -p ~/qiime_tmp
export TMPDIR=~/qiime_tmp

#Loading virtual environment
echo "loading virtual environment"
conda deactivate
conda activate qiime1

# QIIME Code

#Collating alpha diversity
echo "Collating alpha diversity"
time collate_alpha.py \
-i ~/output/alpha_analysis/ \
-o ~/output/collated_alpha/ \
#Deactivating environment
echo "closing environment"
conda deactivate

### script end