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
time parallel_beta_diversity.py \
-i ~/output/rarefied_otu_tables/ \
-o ~/output/beta_analysis_uu \
--metrics unweighted_unifrac \
-t ~/output/combo_filtered_rep_phylogeny.tree \



#Deactivating environment

echo "closing environment"
conda deactivate