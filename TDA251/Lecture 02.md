# TDA 251 - Advanced Algorithms
## Lecture 2 - More approximations 
### 2018-11-08
---
We previously looked at covering points with disks, reducing the ratio between our greedy solution to the optimal. 

# Weighted Set Cover
We are given a finite set of n objects, and a set of objects. We wish to find a c in the subsets with All subsets where all subsets are in C with the minimal cost (weight).
* U: set |U| = n
* S_i \in U (i=1,..,m)
* S_i has weight w_i > 0
* Find C \in \S_1,.., S_m

This is a NP complete problem, and can be reduced to Vertex cover in polynomial time. 

## Greedy Algorithm
WE have to cover a set of object "cheaply". We want to minimize the cost, thus we can greedily select the set with the minimal weight divided with the number of elements. But this is not better, because the bigger weights will cover the same elements again. Thus we include the set of uncovered elements R. I.e. we divide by the number of uncovered sets. 

C := {}
repeat
    S_i := some set with min W_i / |S_i - R|
    C := C U {S_i}, R : = R-S_i
until R = {}

This results in a greedy set cover C, The optimal Set Cover is called C*. We take the harmonic sum
H(n) = \sum{i=1 to n} (1/n) ~ ln n. The greedy set is arbitrary, so there is no specific ratio to the optimal set cover.  WE need a new idea

### Analysis
IDEA: We charge the elements for being covered, an idea is that the elements that are covered in a step shares the cost. 
s \in S pays (w_i / |S_i - R|)
where S_i is the first greedy set that covers s.

\sum {s in Y} c_s = \sum {S_i in C} w_i

WE now consider any set s_k that contains an element s_1, ..,sd, this may be in the greedy set cover. 
Elements of S_k are sorted into order of coverave of the Greedy algorithm. 

Just before Greedy covers S_j we know that each element after S_j(and s_j) are uncovered, this is d-j+1 elements,
|S_k - R| >= d-j+1.

We then take the set that covers s_j, we can then get that the harmonuc sum for d times the weight for this set. 

If we then redefine d to be the maximum size of sets s_k, then we can extend the harmonic sum for the maximum size of sets plus the real cost (the optimal) for each weight.

We know that C* is some set cover (covers every element), i.e. every element appears in the double sum (see slides), it doesnt then matter if we make the double sum smaller by counting only once. 

We now have a result. If we expect the ratiog rows in logarithmic size by d. 

This solution is the best approximation algorithm for this problem. 



