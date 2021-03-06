#!/bin/bash --login
#PBS -l walltime=1:00:00
#PBS -l select=1:ncpus=16
#PBS -N pick_rep_joined_combo
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



#Computing beta diversity
echo "Computing beta diversity"
time principal_coordinates.py \
-i ~/output/beta_analysis_wu/ \
-o ~/output/principal_coordinates_wu/ \






#Deactivating environment
echo "closing environment"
conda deactivate