# Lecture 7
## Search IV, More games, and CSP II, Local search and problem structure
### 2018-02-04
---

# Repetition of Search 
We have gone through several different kinds of search stratergies, such as classical, non-classical and advisarial search. 

# Repetition Min-Max
Two agents, one that tries to maximize a value and one who tries to minimize the same value. 

## H- minimax
The Heuristic minimax function is an alternative to the standard minimax algorithm in that is has a cutoff method that needs to know the current searchdepth 

## A alphabeta function, we go through the children and find a minimal and maximal value by deleting computation subtrees. 

# Stochastic Games 

## Imperfect information
Games in this category usually have unknown information at the start, for example an opponents cards in a cardgame, usually we then calculate probabilities for different card setups. 

IN stochastiv games we have a chance, thus we need to introduce "chance"-nodes, we use these to calculate an expected value for a position, which is the average of all possible outcomes. 
The basic idea here is to use the minimax algorithm for computing the game. 
The algorithm ExpectiMinimax can be used for stochastic games, is basically a minimax with chance nodes. 

# Repetition CSP 

## CSP: CONSTRAINT SATISFACTION PROBLEMS
In CSP a state is a set of variables Xi from a domain D, the goal state is set of constraints on these variables, we can construct constraint graphs, one specifiv CSP are the binary CSP with only binary constraints, for exmple arc consistency only works with binary constraints. Any n-CSP can be converted into a binary constraints satisfaction problem-.

## Algorithms for CSP
Different algorithms for CSP exists, such as backtracking search, heuristics, foward checking etc. 

# Conststraint propagation 
Arc consistancy, using the AC-3 algorithm, 


## Foward checking
Foward checking means checking unassigned values for their legal values, when a new value is calculated, recalculate these, for example graph coloring. Arc consistancy means that for each value in X's domain, there are some value in Y's domain that is allowed. Foward checking is only ONE inference step.

## Combining arc consistency with backtracking 


# More about CSP

## Local Search for CSP 
Given an assignment of values for vars, a conflict is a unsatisfied constraint , the goal is zero conflicts, Local search means starting with one assignment of vars, and then selecting new vars and give them values untol zero conflicts are left. 

## Problem Structure 

### Independant Subproblems 

### Tree structured CSP 