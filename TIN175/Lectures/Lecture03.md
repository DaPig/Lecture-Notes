# Lecture 3
## Heuristic Search
### 2018-01-23
---
# Heuristic search
As mentioned during the previous lecture, an heuristic search is one that uses a heurisic function to give an approximation of the distance to a solution from a current state. 

## Generic Tree Search algorithm
A tree search does not keep track of whether a node has been previously visited.

Another two algorithms are Breadth first and Depth first search. Depth first has a smaller space complexity (bm vs b^m) but is not optimal and may fall into infinite loops. Depth first search has a stack as a fronteer whereas bredth first has a FIFO queue.

Another approach is a cost based approach adding to fronteer as a priority queue based on cost from "traveling" between nodes. One example of this that also uses a heuristic cost based approach is the A* search.

## Graph search algorithm
Graph search keeps track of visited nodes so that they are not visited more than once. But what if the node previously visited was not visited using an optimal path, then the solution will return a suboptimal path.

### When is A* optimal? 
A* uses an heurisitic function so that |h(n')-h(n)| <= cost(n',n) However, A* only selects a node to be expanded when the optimal path there have been found. Because A* always select the node with the smallest cost, if there was a node which would have been in front of node N for the optimal path, then it would have had a smaller cost and thus we have a contradiction.  For this we need a *consistant* heurisitc function h so that |h(n')-h(n)| <= cost(n',n) for all nodes. 

## Optimality of A*
Thus A* Tree algorithm is optimal if 
* Heuristic function is admissable
* Heuristic function is an underestimate of the real cost
* h(n) < cost(n,goal) for all nodes n
And A* Graph is optimal if
* Heuristic function is consistent
* |h(m)−h(n)|≤cost(m,n) for all arcs between m,n

## Dominating heuristic
If a Heuristic function h2(n) > h1(n) then h2 dominates h1 and gives better result. It still needs to me admissable though.

## Relaxed problem
A problem in which the definition is more generallized, so the problem have been simplified

## Non admissable A*
If for some node the heurisitc function is non admissable, we MAY get a non-optimal solution, the search may terminate faster thus it might be worth it, as finding a almost admissable function is easyer than a total admissable function. 

# Other search stratergies
There are some other variations we can use
## Iterative deepening
The idea here is that you take expand the deepest level of the fronteer. I.e. look for solutions with path length 1, then 2,34.... And so forth. 

## Biderectional Search
We check both the outbound arcs and inbound arcs for a node, and searches the direction with the smallest number of arcs. We can search both ways simuntainiously thus saving memory space from O(b^k) to O(b^k/2)

## Memory bounding A* 
As the problem with A* is the memory space, we can use an iterative solution that iteratively increases the memory space 
A* explores f-value contoures as it always selects the lowest f-value

# Local Search
For some solution the path is irrelevant, the solution is the only important part. We can use an iteratively better solution, i.e. try to make our state better. For example the 8-queens. Start with some configuration, move one queen so that the number of conflicts are reduced and redo.

## Hill Climbing
Hill climbing is one example of this, change if new solution is better that current. 

## Randomized Algorithm
We can move at random of give random values to all solutions within the space 

## Additional examples
Here follows more examples not in the exam
### Simulated Annealing
Bases values on a schedual and doing random steps  
### Local Beam Search 
Maintain a population of k states in parallel and selects best
### Stochastic Beam Search 
Selects the k states by probilistacally
### Generic Algorithms 
Compare pairs of individuals in the above to form childrens

