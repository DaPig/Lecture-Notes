# TDA 251 - Advanced Algorithms
## Lecture 1 - Introduction Lecture
### 2018-11-05
---
Course Structure:
```
2 lectures/week. 
No exercises
Compulsory Ass. - Everything is done by mail. 
Home exam - Shape will be different than previous years, not exercises. 
```

Lets get to it ... 

 # Load Balancing
 So we have n jobs that must be done, these jobs are heavy or small, categorized by processing time of the job (i.e. length). These jobs must be done on m machines. We assign these jobs to the machines. It is not possible to run the same program on more than one machine at a time. (No interruption). We have load states of the machines. We want to make the makespan the minimum, i.e. minimize the max load of any given machine. 

 Thus: 
 * N jobs with proc times 
 * m machines
 * assign jobs to machines 
 * T_i: Load of machine i.
 * T:= max T_i, makespan
 * Minimize T!
 * T* = min makespan.

## Example:
2 machines, 5 jobs =>

m = 2, 
Loads of jobs: 
{3,3,2,2,2}

The optimal loads: 
[3 + 3, 2+2+2 ]; T = 6.

We wish to minimize this load. This is a NP complete problem. This is simular to the subset sum problem, thus SubsetSum <=_p loadBalancing. 

* Subset sum -- Does there exist a subset of the given integers that sum up to the given value? 


### Greedy algorithm 
The greedy algorithm here is to always assign a process to the machine with the lowest current load. 
```
for j=1..n 
    assign the j-th job to some machine i with the smallest T_i
```


This would result in the loads

M1: 3+2+2
M2: 3+2

Which is not optimal, but still sorta okay since the time complexity is WAY better O(n) to O(n!).

How far is this greedy algorithm from the optimal makespan? Is, T from T*

1. Analyze T-T* ?: No, The difference tells us nothing. We should maybe instead analyze the ratio. 

2. Analyze T/T* ? : Yeah, this is a good approach. This is called the approximation ratio. 

We will study approximation algorithms in the start of this course. These run in polynomial time.

But how do we study the approximation ratio as T* is NP complete and cannot as such be computed in a reasonable amount of time. 

We solve this utalizing the following approach. 
Compute upper bound on T -- Dependos on algorithm.
Take lower bound on T*. -- Depends only on the problem.
Take their ratio.

#### Lower bound
The makespan cannot be lower than the total computational requirements divided with the number of machines. I.e.
T* >= 1/m * \sum(j=1..n) t_j. 
This bound does not reflect the truth. Perhaps we have a set of very small jobs and one very big one, this does as such not pose a realistic answer. As now the optimal number cannot be better than the longest job. I.e.
\forall T* >= t_j. 

#### Upper bound
Some machine have a maximum load. 
* i = machine with the maximum load. 

The machine i had a smaller than max time before adding the final job j (Not nessecarily the last job in the sequence). According to our algorithm, this machine had the smallest makespan before adding this job. When we added this job (t_j), machine i had the makespan T-t_j. Thus this time is smaller than the average of all processes divided over the machines, and this is leq to T*. The approximation ratio becomes: 
```
T/T* <= 2
```
This approximation ratio, 2, is optimal for this algorithm. 

## Figure out approximation ratio

To figure out the approximation ratio here we: 

Sort jobs such that 
t_1>=..>=t_n,
run greedy.  

If the number of jobs is smaller or equal to the number of machines, the greedy is optimal. I.e. the approximation ratio is equal to one. 
Suppose n>=m+1. At least one machine must have two jobs allocated to it. 

I.e.
T* >= 2t_m+1. 

If we consider the job that ends last again. ```j: defines as before```.  And additionally: ```j>= m+1```. Because of the sorted order we have 
t_j <= t_m1
T <= T* + t_j <= 3/2 T*
T/T* <= 3/2, which is better that 2. 

We stop here. The course is not so much about specific problems but instead about techniques and concepts.

# Center Celection
We now approach another problem of another nature. 

We have some geometric space where distance is defined, we have a set of houses and wish to place shops in an optimal approximation to the shops. 

* dist: distance function in the space
* We are given a set S of points wich are the sites in the space (sites) these are integers k<= n
* WE want to find a set C of k points (centers) so as to minimize dist

We take the maximum of the minimized distances to the customers 
* r(c) = max min dist(s,c), c \in S, c \in C. 

This problem is also NP-Complete. 

## Greedy Solution 
Assume some radius r is given, find a set of centers where r(c) <= r. This is the same as to find a set of k circular disks that covers r. 
If a optimal solution r exists, then we can find a solution where r' = 2r (twise the optimal solution). 

Algorithm: 
```
    c = []
    Do k times:
        Choose some site s \in S that is not covered by a circular disk (all centers have a distance larger than 2r from this site). 

See sketch for proof that this gives the greedy assumption. The disk produced by the greedy algorithm "contains" the optimal disk. 


One could think one could run binary search for different r, but r is not a integer, thus we have infinitely many rs. the better solution is to, for the site with the maximum distance from the closest center. 

