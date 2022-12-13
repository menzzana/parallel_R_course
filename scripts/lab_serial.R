# Function for calculating PI with 100 values
calcpi <- function(no) {
  y <- runif(100)
  x <- runif(100)
  z <- sqrt(x^2+y^2)
  length(which(z<=1))*4/length(z)
  }
# Use lapply on a list of 1000 values
res <- lapply(1:1000, calcpi)
# Unlist it as we need it as a vector
vres <- unlist(res)
# Print the mean of the results
print(mean(vres))
