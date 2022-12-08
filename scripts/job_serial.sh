#!/bin/bash
#SBATCH -A Project_ID
#Asking for 3 min.
#SBATCH -t 00:03:00
#SBATCH -n 1
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
ml GCC/10.2.0  OpenMPI/4.0.5
ml R/4.0.4

R CMD BATCH --no-save --no-restore -f serial.R

Rscript serial.R 3.14