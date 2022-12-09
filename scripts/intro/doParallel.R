library(doParallel)
cl <- makeCluster(4)
registerDoParallel(cl)

# code that we want executed in parallel 

stopCluster(cl)
