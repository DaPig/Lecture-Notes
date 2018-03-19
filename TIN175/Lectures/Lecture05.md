# Lecture 5
## CSP I, Backtracking, consistency and heuristics
### 2018-01-30
---
# CSP: Constraint satisfaction problems
A constraint satisfaction problem is a more specific search problem where the state is well defined by a variable Xi from domain Di, whereas a standard search problem has a "black-box" state, in which the state is not as well defined. 

In CSP the goal state is also a well defined set of constaints that specifies the allowed combinations of values for subsets of variables. As CSP is more specific, more speciallized, powerful algorithms can be used. 

### Hard and soft constraints 
In a set of variables, one can give the variable a value that: 
* Satisfies some set of constaints = Satisfability problem (we focus on these in the course)
* Minimizes some cost function = Optimization problem 
* Mix of the two = Constraint optimization problem


## Formulating a CSP
A CSP is characterized by a set of variables (X1, X2,..., Xn) where each variable have a domain of possible values, each of the subsets of variables have hard constraints that specifies the legal combinations. A solutions are an assignment to each of the variables that satisfies all of the constraints. We usually group together constraints that involve the same variables. 

## Constraint Graph
A constraint graph is a way of formulating constraints as a node-edge graph, where each variable is a node and each arc is a binary constraint. CSP algorithms can use this graph to speed up searches. 

This can as such give an indication on how the different constraints are related. 

### Variations
There are different varieties for CSPs, such as combinations of descrete variables with either finite or infine domains and contious variables, 

The constrains can also take on a variety of different setups, such as unary(single variables), binary(pairs) and global(>=3 variables) - constraints, and also be "soft", i.e. preferences.

# CSP as a Search Problem
Using CSP as a search problem consists of creating a assignment space where you test each combanation towards the constraints, to see whether that particular state satisfies the constraints and is such a solution. Searching for this, we can use some search functions.

## Backtracking Search 
One possible search function is backtracking search, as {X1 = val1, X2 = val2} = {X2 = val2, X1=val1} (order doesn't matter) we only assign one variable at each depth level, reducing the branching factor. (Not to be confused with standard backtracking search, it is called this in the domain of CSP)

## Heutistics: Improving Backtracking efficiency
Using heuristics we can improve the efficiency for the backtracking search by selecting the next unassinged variable to assign by a heuristic function, for example via MRV (minimal remaining values) 

# Constraint Propagation
Using constraint propagation we can

## Arc Consistency 
A variable is arc consistant if if every possible value in its domain satisfies the the variables binary constraints 

## Maintaining Arc Consistancy 
Maintaining the arc consistancy can be fixed by resoring to backtracking search 
