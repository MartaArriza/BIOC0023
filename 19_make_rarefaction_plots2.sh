#!/bin/bash --login
#PBS -l walltime=1:00:00
#PBS -l select=1:ncpus=16
#PBS -N make_rarefaction_plots_joined_combo
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
time make_rarefaction_plots.py \
-i ~/output/collated_alpha/ \
-o ~/output/alpha_rarefaction_plots \
-m ~/mapping_file_team4.tsv

#Deactivating environment
echo "closing environment"
conda deactivate

### end script