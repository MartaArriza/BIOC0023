#!/bin/bash --login
#PBS -l walltime=1:00:00
#PBS -l select=1:ncpus=16
#PBS -N multi_rarefactions_joined_combo
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

#Performing multiple rarefactions
echo "Performing multiple rarefactions"
time multiple_rarefactions.py \
-m 10 \
-x 30000 \
-s 2999 \
-i ~/output/otu/16/otu_table.biom \
-o ~/output/rarefied_otu_tables/ \
--lineages_included

#Deactivating environment
echo "closing environment"
conda deactivate