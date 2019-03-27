#!/bin/bash --login
#PBS -l walltime=1:00:00
#PBS -l select=1:ncpus=16
#PBS -N make_emperor_unweighted_unifrac_joined_combo
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



#Computing beta diversity
echo "Computing beta diversity"
time make_emperor.py \
-i ~/output/principal_coordinates_wu/ \
-o ~/output/weighted_unifrac_final/ \
-m ~/mapping_file_team4.tsv \



#Deactivating environment
echo "closing environment"
conda deactivate



### script end