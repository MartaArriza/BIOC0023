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

# QIIME code

#Picking representative OTUs
echo "Picking representative OTUs"
time pick_rep_set.py \
-i ~/output/otu/16/uclust_ref_picked_otus/seqs_otus.txt \
-f ~/output/demultiplexing/slout_JointRead/seqs.fna \
-o ~/output/combo_rep_set.fna \
-r ~/silva_132_97_16S.fna \
 

#Deactivating environment
echo "closing environment"
conda deactivate

### end script