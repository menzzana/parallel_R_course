!/bin/bash
#SBATCH -A SNIC2022-22-1012
#SBATCH -n 8
#SBATCH --time=00:30:00

ml purge > /dev/null 2>&1
ml GCC/10.2.0 OpenMPI/4.0.5 R/4.0.4

# Remember that you need to load the Rmpi library within your
# R script for this to work. Change <program>.R to the name 
# of your actual R script 
mpirun R -q -f <program>.R 
