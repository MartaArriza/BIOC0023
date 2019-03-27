#!/bin/bash --login
#PBS -l walltime=1:00:00
#PBS -l select=1:ncpus=16
#PBS -N filter_alignment_joined_combo
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

#Filtering alignment
echo "Filtering alignment"
time filter_alignment.py \
-i ~/output/aligned_filtered_combo_rep_set/combo_rep_set_aligned.fasta \
-o ~/output/aligned_filtered_combo_rep_set/filtered_alignment \
--suppress_lane_mask_filter \
-g 0.80 \
-e 0.1

#Deactivating environment
echo "closing environment"
conda deactivate

### end script