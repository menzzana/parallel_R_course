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
  .columngreen {
    border: 10px solid #99ffc0;
    background-color: #99ffc0;
    box-shadow: 10px 10px 10px #888888;
    margin-top: 20px;
    margin-left: 20px;
    }
  .row:after {
    display: table;
    clear: both;
    }
  img[alt~="center"] {
    display: block;
    margin: 0 auto;
  }
---
<!-- paginate: true -->

# Best Practices for R in HPC

## Course: Parallel computing in R

---

# Start with a working single core program

* This code should produce correct results without any optimizations
> "Premature optimization is the root of all evil"  --- Donald Knuth

```
N <- 10000
h <- pi/N
mysum <-0

for (i in 1:N) {
  x <- h*(i-0.5)
  for (j in 1:N) {
    y <- h*(j-0.5)
    mysum <- mysum + sin(x+y)
  }
}

mysum*h*h
```

---

* Write clean code and write useful comments

```
# Code for computing a 2D sinus integral
N <- 10000  # Number of grid points
h <- pi/N   # Size of grid
mySum <-0   # Camel convention for variables' names

for (i in 1:N) {               # Discretization in the x direction
  x <- h*(i-0.5)               # x coordinate of the grid cell
  for (j in 1:N) {             # Discretization in the y direction
    y <- h*(j-0.5)             # y coordinate of the grid cell
    mySum <- mySum + sin(x+y)  # Computing the integral
  }
}

mySum*h*h     # Printing out the result
```

---

* Once this initial program is written we 

---



---

