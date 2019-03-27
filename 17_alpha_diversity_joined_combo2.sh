#!/bin/bash --login
#PBS -l walltime=1:00:00
#PBS -l select=1:ncpus=16
#PBS -N alpha_diversity_joined_combo
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

#Computing alpha diversity
echo "Computing alpha diversity"
time parallel_alpha_diversity.py \
-i ~/output/rarefied_otu_tables/ \
-o ~/output/alpha_analysis/ \
-m shannon,PD_whole_tree,chao1,observed_otus,goods_coverage,simpson,observed_species \
-t ~/output/combo_filtered_rep_phylogeny.tree \

#Deactivating environment
echo "closing environment"
conda deactivate