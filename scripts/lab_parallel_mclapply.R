library(parallel)
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
  # Create a vector 100000 length with 100 randomizations
  input <- rep(100, 100000)
  # Use mclapply on n cores
  res <- mclapply(input, calcpi, mc.cores = n)
  # Unlist it as we need it as a vector
  vres <- unlist(res)
  # Print the mean of the results
  print(mean(vres))
  # print end time
  print(Sys.time() - start_time)
  }
