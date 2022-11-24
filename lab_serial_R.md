---
marp: true
paginate: true
_paginate: false
footer: Dec. 2022 | Henric Zazzi & Pedro Ojeda-May | Course: Parallel computing in R
style: |
  section {
    background-image: url('public/img/hpc2n-pdc-logo.png');
    background-repeat: no-repeat;
    background-position: right 40px top 40px;
    background-size: 8%;
    }
  section h1 {
    text-align: center;
    }
  .column50 {
    float: left;
    width: 45%;
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
# Example: Calculate PI using montecarlo

<row>
<div class="column50">

1. Randomize a number of x and y values (0-1)
2. Calculate distance from origo
3. Count values with distance>1
4. Multiply by 4 since we have a quarter circle 

```
calcpi <- function(no) {
  y <- runif(no)
  x <- runif(no)
  z <- sqrt(x^2+y^2)
  length(which(z<=1))*4/length(z)
  }
```

</div>
<div class="column50">

![](public/img/pi_calculation.png)

</div></row>

---

# Lab: Calculate PI using parallel lapply

<row>
<div class="column50">

1. Implement the function calcpi using **lapply**
1. Time your code
 