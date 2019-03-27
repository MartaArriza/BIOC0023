#!/bin/bash --login
#PBS -l walltime=1:00:00
#PBS -l select=1:ncpus=16
#PBS -N align_rep_OTUs_joined_combo
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

#Aligning representative sequences
echo "Aligning representative sequences"
align_seqs.py \
-i ~/output/combo_rep_set.fna \
-o ~/output/aligned_filtered_combo_rep_set \
-t ~/97_alignment.fna

#Deactivating environment
echo "closing environment"
conda deactivate

### end script