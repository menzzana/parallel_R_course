#!/bin/bash
#SBATCH -A Project_ID
#Asking for 12 min.
#SBATCH -t 00:12:00
#SBATCH --array=1-28
#Writing output and error files
#SBATCH --output=Array_test.%A_%a.out
#SBATCH --error=Array_test.%A_%a.error

ml purge > /dev/null 2>&1
ml GCC/10.2.0  OpenMPI/4.0.5
ml R/4.0.4

Rscript --quiet --no-save --no-restore script_arrays.R
