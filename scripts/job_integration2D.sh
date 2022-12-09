#!/bin/bash
#SBATCH -A Project_ID
#Asking for 3 min.
#SBATCH -t 00:23:00
#SBATCH -n 2
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
ml GCC/10.2.0  OpenMPI/4.0.5
ml R/4.0.4

Rscript --no-save --no-restore integration2D.R
