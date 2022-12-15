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
# Lab 1: Calculate PI using mclapply

<row>
<div class="column50">

1. Calculate PI using **mclapply**
2. Try with different number of cores
3. Run your code on your **laptop** and on the **cluster**
4. Calculate *speedup* with increasing number of cores 

</div>
<div class="column50">

#### Example on how to calculate PI from 100 values
```
y <- runif(100)
x <- runif(100)
z <- sqrt(x^2+y^2)
res <- length(which(z<=1))*4/length(z)
```

</div></row>

---

# Lab 2: Calculate PI using parallel parlapply

1. Calculate PI using **parlapply**
2. Try with different number of cores
3. Run your code on your **laptop** and on the **cluster**
4. Calculate *speedup* with increasing number of cores 

---

# Lab 3: Calculate PI using parallel foreach

1. Calculate PI using **foreach**
2. Try with different number of cores
3. Run your code on your **laptop** and on the **cluster**
4. Calculate *speedup* with increasing number of cores 

---
