!/bin/bash
#SBATCH -A SNIC2022-22-1012 #Project id
#SBATCH -J my-serial-R-job #Name of job
#SBATCH --time=00:10:00 #Jobtime (HH:MM:SS) Max: 168H
#SBATCH -o Rjob_%j.out #Naming the output file
#SBATCH -e Rjob_%j.err #Naming the error file
#SBATCH -n 1 #Number of tasks (Default is 1 CPU/task. Change with --cpus-per-task) 

ml purge > /dev/null 2>&1
ml GCC/10.2.0 OpenMPI/4.0.5 R/4.0.4

R --no-save --quiet < input.R > Rexample.out
