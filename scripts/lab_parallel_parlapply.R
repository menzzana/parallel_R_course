library(parallel)
# Function for calculating PI with 100 values
calcpi <- function(no) {
  y <- runif(100)
  x <- runif(100)
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
  cl <- makeCluster(n)
  # Use mclapply on a list of 100000 values on n cores
  input <- list(1:100000)
  res <- parLapply(cl, input, calcpi)
  # Unlist it as we need it as a vector
  vres <- unlist(res)
  # Print the mean of the results
  print(mean(vres))
  # Stop the cluster
  stopCluster(cl)
  # print end time
  print(Sys.time() - start_time)
  }
