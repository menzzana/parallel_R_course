integral <- function(N){ 
  # Function for computing a 2D sinus integral
  h <- pi/N             # Size of grid
  mySum <-0             # Camel convention for variables' names
  
  for (i in 1:N) {      # Discretization in the x direction
    x <- h*(i-0.5)      # x coordinate of the grid cell
      for (j in 1:N) {  # Discretization in the y direction
        y <- h*(j-0.5)  # y coordinate of the grid cell
        mySum <- mySum + sin(x+y)  # Computing the integral
      }
  }
  return(mySum*h*h)
}

#### Benchmarking your code
N <- 20000              # Number of points

system.time( res <- integral(N) ) 

library(microbenchmark)
bench <- microbenchmark( integral(N), times=2)
bench 

#### Parallelizing the 2D integration function
library(doParallel)
N <- 20000              # Number of points
M <-2                   # Set number of workers to 2
h <- pi/N               # Size of grid


integral_parallel <- function(N,i){ 
  # Parallel function for computing a 2D sinus integral
  myPartialSum <- 0.0
    x <- h*(i-0.5)           # x coordinate of the grid cell
    for (j in 1:N) {         # Discretization in the y direction
      y <- h*(j-0.5)         # y coordinate of the grid cell
      myPartialSum <- myPartialSum + sin(x+y)  # Computing the integral
    }
  
  return(myPartialSum)
}


cl <- makeCluster(M)         # Create the cluster
detectCores()
registerDoParallel(cl)
system.time( r <- foreach(i=1:N, .combine = 'c') %dopar% integral_parallel(N,i) )
stopCluster(cl)
integral <- sum(r)*h*h       # Print out final result
integral
