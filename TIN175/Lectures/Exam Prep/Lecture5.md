# Lecture 5
## CSP I, Backtracking, consistency and heuristics
---
In a constraint satisfaction problem, we have a state that is a collection of variables that all have values from a domain. There are then constraints on these variables, reaching a solution is the important thing, the path there is irrelevant.  A solution is as such an assignment to each variable from their respective domains that satisfies all of the constraints. 

## Constraint graph
A constraint graph has nodes corresponding to the variables and the arcs between the nodes are the constraints between those nodes. This can be used when trying to solve a CSP to see which other variables that are effected by, for example, changing the domain of a variable. 

There are lots of varieties for constraints problems, and constrains can be unary, binary or of a higher order, and also have preferences. Global constraints can ususally be reduced to binary constraints. 

## CSP as a search problem. 
One example of a CSP solving technique is the "generate-and-test" meaning that we generate the entire search space and tries with the constraints untill a solution have been found. 

A somewhat good example is the backtracking search stratergy, here we only assign one variable at every depth, it is a DFS stratergy.
Improving this stratergy can be done via heuristics, example in the map coloring example we can use minimum remaining values or maximum constraints as a heuristic function. 

## Inference: FOward checking
Foward check means keeping track of remaining possible values for unassigned variables, recalculating these every time an assignment have happened and terminate when any variable have zero remaining values possible. This does not check ahead of time whether the assignment will eventually terminate, for that we can use constraint propagation.

## Constraint propagation
The simples way of reaching this is to make the graph arc-consistant, that is for every x in X there is some corresponding y in Y, i.e. the domains should not contain values that do not fulfill the constraints. If X looses a value, the neighbours of X will have to be rechecked (in the graph coloring example). Arcs "Goin in" to a node needs to be rechecked wheterh the nodes' domain changes. 
