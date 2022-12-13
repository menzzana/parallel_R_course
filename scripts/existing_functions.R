### Replicate

# Serial version
x <- cbind(mtcars$wt, mtcars$hp)
y <- replicate(n = 10, expr = x, simplify = F)

# Parallel version
clone <- function(dest,source) {
  source
}
library(parallel)
x <- cbind(mtcars$wt, mtcars$hp)
y <- vector(mode = "list", length = 10)
y <- mclapply(y, mc.cores = 2, clone, source = x)

### K-means
library(clusternor)
iris.mat <- as.matrix(iris[,1:4])
k <- length(unique(iris[, dim(iris)[2]])) # Number of unique classes
kms <- Kmeans(iris.mat, k, nthread=1)

### Bootstrap
library(boot)
Mean <- function(data, idx) {
  c <- data[idx,]
  return(mean(c))
}
x <- data.frame(mtcars$hp)

# Serial version
res <- boot(x, Mean, R=10000)
plot(res)
ci <- boot.ci(res, type="basic") 
sprintf("95%% CI from %f - %f", ci$basic[1,4], ci$basic[1,5])

# Parallel version
library(parallel)
res <- boot(x, Mean, R=10000, parallel="multicore", ncpus=2)
plot(res)
ci <- boot.ci(res, type="basic") 
sprintf("95%% CI from %f - %f", ci$basic[1,4], ci$basic[1,5])
