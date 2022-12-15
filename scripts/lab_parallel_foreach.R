library(parallel)
library(foreach)
library(doParallel)
# Function for calculating PI with no values
calcpi <- function(no) {
  y <- runif(no)
  x <- runif(no)
  z <- sqrt(x^2+y^2)
  length(which(z<=1))*4/length(z)
}
# Detect the number of cores
no_cores <- detectCores() - 1
# Loop to max number of cores
for (n in 1:no_cores) {
  # print how many cores we are using
  print(n)
  # Set start time
  start_time <- Sys.time()
  # Create a cluster
  nproc <- makeCluster(n)
  registerDoParallel(nproc)
  # Create a vector 1000 length with 100 randomizations
  input <- rep(100, 1000)
  # Use foreach on n cores
  registerDoParallel(nproc)
  res <- foreach(i = input, .combine = '+') %dopar%
    calcpi(i)
  # Print the mean of the results
  print(res/length(input))
  # Stop the cluster
  stopCluster(nproc)
  # print end time
  print(Sys.time() - start_time)
  }
