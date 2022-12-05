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

# What is parallelization

## Course: Parallel computing in R

---

# Overview

1. Introduction to supercomputers
1. Shared memory computing
1. Distributed memory computing
1. Scaling

---

# Introduction to supercomputers

---

# Supercomputers can be useful when...

1. Your problem is too large to be solved in a single computer
1. The solution to your problem is requiring too much time to be solved

---

# Parallel methodology

![height:500px center](public/img/parallel_computation.png)

---

# What is a cluster

<div class="row">
<div class="column50">

![](public/img/cluster_definition.png)

</div>
<div class="column50">

# Cluster
#
# Nodes
#
# CPUs
# Cores

</div>
</div>

---

# HPC cluster

* HPC cluster is a collection of normal computers connected together

<div class="columnblue">

Performance is measured in *floating point operations
per second*, **flop/s, FLOPS**

</div>

* Fast interconnect to make possible inter-node communications
* Software to manage communications between the nodes
* Workload manager

---

# HPC development


![](public/img/hpc_development.png)

---

# Top 500 list

![height:450px center](public/img/top500.png)

https://www.top500.org/lists/top500/2020/11/ (Nov. 2020)

---


# Dardel

<div class="row">
<div class="column50">

![](public/img/dardel.png)

**Nodes:** 794
**Cores:** 101632
**Peak performance:** 13.5 PFLOPS

</div>
<div class="column50 columnlightblue">

### Node configuration

* 2xAMD EPYC™ 2.25 GHz CPU with 64 cores each
* RAM
  * 524 nodes, 256 GB
  * 256 nodes, 512 GB RAM
  * 8 nodes, 1024 GB RAM
  * 6 nodes, 2048 GB RAM
* <span style="color:red;">4xAMD Instinct™ MI250X GPUs</span>

</div></div>


---

# Shared memory computing

---

# Shared memory hardware

<div class="row">
<div class="column50">

![](public/img/shared_hardware.png)

</div>
<div class="column50">

### Can be executed on a standard computer

</div></div>

---

# Pros and cons of shared memory

![height:200px center](public/img/shared_jobs.png)

### Data is available in same hardware location

1. No need to move data
1. All processing units share the same memory address space
1. It can be difficult to manage concurrent access to the memory (race conditions)

---

# Distributed memory computing

---

# Distributed memory computing

<div class="row">
<div class="column50">

![height:500px center](public/img/distributed_hardware.png)

</div>
<div class="column50">

### Can be executed on a supercomputer

</div></div>

---

# Distributed memory computing

![height:300px center](public/img/distributed_jobs.png)

1. Analysis can be expanded across several nodes
1. Each CPU has access to only its own memory
1. In order to access data in another memory it needs to be transferred
1. Communications needs to be explicitly managed by the programmer

---

# Hybrid parallelism

1. Best of both worlds
1. Communications between nodes (distributed memory)
1. Computation within each node (Shared memory)

---

# Scaling

## "More processes does not always mean faster performance"

* Code cannot be parallelized
* Overhead of creating parallel process take more time than the parallel process itself

---

# The computational dilemma

<div class="row">
<div class="column50">

### Easibility, Flexibility
#
#
#
#
#
#
#
#
#
#
### Performance

</div>
<div class="column50 columnlightblue">

### High level programming
Python, matlab, **R**, JavaScript

</div>
<div class="column50 columnblue">

### Modular programming
Python+C/C++

</div>
<div class="column50 columndarkblue">

### Low level programming
C/C++, Fortran, Assembler

</div>
</div>

---

# Scaling

![height:500px center](public/img/scaling.png)

---

# Ahmdal's law

![height:100px center](public/img/ahmdal.png)

* S<sub>latency</sub> is the theoretical speedup of the task
* *s* is the number of processes
* *p* is the proportion of executation time that benefits from improved resources

---

<div class="columnblue">

### Example
Executing a code takes 10 h, where 8 h can be parallelised. How much speedup do we get using 15 parallel processes?
p=8/10=0.8, s=15
S=1/((1-0.8)+0.8/15)=**3.9**

</div>


