#!/bin/bash --login
#PBS -l walltime=1:00:00
#PBS -l select=1:ncpus=16
#PBS -N make_philogeny_joined_combo
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

#Making tree
echo "Making tree"
time make_phylogeny.py \
-i ~/output/aligned_filtered_combo_rep_set/filtered_alignment/combo_rep_set_aligned_pfiltered.fasta \
-o ~/output/combo_filtered_rep_phylogeny.tree \

#Deactivating environment
echo "closing environment"
conda deactivate

### end script