---
marp: true
style: |
  section h1 {
    text-align: center;
    }
  .column50 {
    float: left;
    width: 48%;
    border: 20px solid transparent;
    background-color: transparent;
    }
  .columnlightblue {
    border: 10px solid #b6e0ff;
    background-color: #b6e0ff;
    box-shadow: 10px 10px 10px #888888;
    margin-top: 20px;
    margin-left: 20px;
    }
  .columnblue {
    border: 10px solid #99c0ff;
    background-color: #99c0ff;
    box-shadow: 10px 10px 10px #888888;
    margin-top: 20px;
    margin-left: 20px;
    }
  .columndarkblue {
    border: 10px solid #77a0ff;
    background-color: #77a0ff;
    box-shadow: 10px 10px 10px #888888;
    margin-top: 20px;
    margin-left: 20px;
    }
  .row:after {
    display: table;
    clear: both;
    }
---
<!-- paginate: true -->

# Shared memory computing in R

## Course: Parallel computing in R

---

# Overview

1. Serial execution of R
1. Using optimized libraries
1. The parallel package
1. The foreach package

---

# Serial execution in R

* Default R only uses serial computing
* Shared memory parallel computing is using…
  * Thread, Pthread (posix thread)
  * OpenMP (Open Multi-Processing, multithreading)

---

# Using optimized libraries

---

# Faster linear algebra functions in R

### Basic Linear Algebra Subroutines (**BLAS**)
Provide standard building blocks for performing basic vector and matrix operations

---

# BLAS

<div class="columnblue">

* Usually installed by default
* Default **BLAS** is not optimized

</div>

### Installation
1. In *UBUNTU* install **OpenBLAS** via
    ```
    $ sudo apt-get install libopenblas-base
    ```
1. in *OSX* install **OpenBLAS** via
    ```
    $ brew install openblas
    ```
1. In windows, please check out *Microsoft R* https://mran.microsoft.com

---

# Installation of OpenBLAS

1. Before installation
   ```
   > La_library()
   [1] "/usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.9.0"
   > extSoftVersion()["BLAS"]
                                                BLAS 
   "/usr/lib/x86_64-linux-gnu/blas/libblas.so.3.9.0"
   ```
1. After installation (**POSIX threads available**)
   ```
   > La_library()
   [1] "/usr/lib/x86_64-linux-gnu/openblas-pthread/liblapack.so.3"
   > extSoftVersion()["BLAS"]
                                                        BLAS 
   "/usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3" 
   ```

---

# Linear algebra computing comparison

```
start_time <- Sys.time()
x <- matrix(rnorm(1e6 * 100), 1e6, 100)
b <- rnorm(100)
y <- drop(x %*% b) + rnorm(1e6)
b <- solve(crossprod(x), crossprod(x, y))
print(Sys.time() - start_time)
```

<row>
<div class="column50 columnblue">

Without optimized BLAS

</div>
<div class="column50 columnblue">

With optimized BLAS

</div>
</row>
<row>
</div>
<div class="column50 columnlightblue">

**Time difference of 16.81325 secs**

</div>
<div class="column50 columnlightblue">

**Time difference of 7.17849 secs**

</div>
</row>

---

# The parallel package

---

# Parallel package

<row>
<div class="column50">

1. Installed by default
   ```
   library(parallel)
   ```
1. Contains many functions
1. Can detect how many cores you have
   ```
   detectCores(logical = TRUE/FALSE)
   ```
1. Contains function mclapply
   ```
   mclapply(x, FUN, mc.cores = n))
   ```

</div>
<div class="column50 columnblue">

**Hyperthreading**
Process where a **CPU** splits each of its physical cores into virtual cores, which are known as threads

</div>
<div class="column50 columnblue">

*LOGICAL = TRUE* detects the hyperthreaded cores

</div>
</row>

---

# Parallel example

<row>
<div class="column50">

```
library(parallel)
no_cores <- detectCores() - 1
sprintf("Detected cores: %d", no_cores)
x <- list(mtcars$hp, mtcars$wt, mtcars$qsec)
print(mclapply(x, mean, mc.cores = no_cores)
```

</div>
<div class="column50 columnblue">

Decrease *no_cores* by one for not interfering with master thread

</div>
</row><row>
<div class="column50">

### Better example

```
library(parallel)
no_cores <- detectCores() - 1
sprintf("Detected cores: %d", no_cores)
x < - c(1:10000)
print(mclapply(x, 
   function(x) { sum(tanh(1:x)) }
   , mc.cores = no_cores))
```

</div>
<div class="column50 columnblue">

With small tasks, the overhead of scheduling the task and returning the result can be greater than the time to execute the task itself

</div>
</row>

---

# The foreach package

---

# Foreach package

1. Must be installed
   ```
   library(foreach)
   ```
1. Similar use as **OpenMP** https://en.wikipedia.org/wiki/OpenMP
1. Works for sequential, shared and distributed memory computing
   * No need to detect cores in shared memory computing
1. More information at https://cran.r-project.org/web/packages/foreach/foreach.pdf

---

# Foreach example

```
library(foreach)
foreach(i = 1:10) %do% {
    sqrt(i)
    }
```

1. Calculates the square root of numbers from 1 to 10
1. Returns a list

---

# How about calculations in parallel: doParallel package

1. Packages needed
   ```
   library(doparallel)
   ```
1. Shows how many parallel processes are available
   ```
   getDoParWorkers()
   ```
1. Register the number of processes
   ```
   registerDoParallel([cluster])
   ```
1. Substitute **%do%** with **%dopar%**

---

# foreach parallel example

```
library(foreach)
library(doParallel)
registerDoParallel()
foreach(i=1:10000) %dopar% { 
   sum(tanh(1:i))
   }
```

---

# Other userful functions

Process the tasks results as they are generated

<row>
<div class="column50">


```
library(foreach)
foreach(i = 1:10, .combine=’[type]’) 
    %dopar% {
    sqrt(i)
    }
```

</div>
<div class="column50">

| Type | Process |
| --- | --- |
| c | returns an array |
|cbind | returns a column matrix |
| rbind | returns a row matrix |
| + | summarize the results |


</div>
</row>

---

# Working examples

1. Equivalinet to **lapply(x, mean)**
   ```
   foreach(x = cbind(mtcars$hp, mtcars$wt, mtcars$qsec)) %do%
     mean(x)
   ```
1. Multiple … arguments
   ```
   foreach(i=1:4, j=1:10) %do%
     sqrt(i+j)
   ```
1. Instead of **colMeans(mtcars)**
   ```
   m <- mtcars
   foreach(i=1:ncol(m), .combine=c) %do%
     mean(m[,i])
   ```

---
