#!/bin/bash
#SBATCH -A SNIC2022-22-1012
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH -c 4

ml purge > /dev/null 2>&1
ml GCC/10.2.0 OpenMPI/4.0.5 R/4.0.4

# Batch script to submit the R program doParallel.R 
R -q --slave -f doParallel.R
