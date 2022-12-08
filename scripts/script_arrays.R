job_id <- Sys.getenv("SLURM_ARRAY_JOB_ID")
cat(sprintf("This is job ID %s \n", job_id))
task_id <- Sys.getenv("SLURM_ARRAY_TASK_ID")
cat(sprintf("This is task ID %s \n", task_id))

Sys.sleep(10)
