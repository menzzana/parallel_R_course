# Function for calculating PI with no values
calcpi <- function(no) {
  y <- runif(no)
  x <- runif(no)
  z <- sqrt(x^2+y^2)
  length(which(z<=1))*4/length(z)
}
# Set start time
start_time <- Sys.time()
# Create a vector 1000 length with 100 randomizations
input <- rep(100, 1000)
# Use lapply to calculate PI
res <- lapply(input, calcpi)
# Unlist it as we need it as a vector
vres <- unlist(res)
# Print the mean of the results
print(mean(vres))
# print end time
print(Sys.time() - start_time)
