# Function for calculating PI with 100 values
calcpi <- function(no) {
  y <- runif(100)
  x <- runif(100)
  z <- sqrt(x^2+y^2)
  length(which(z<=1))*4/length(z)
}
# Set start time
start_time <- Sys.time()
# Use lapply on a list of 1000 values
input <- 1:1000
res <- lapply(input, calcpi)
# Unlist it as we need it as a vector
vres <- unlist(res)
# Print the mean of the results
print(mean(vres))
# print end time
print(Sys.time() - start_time)
