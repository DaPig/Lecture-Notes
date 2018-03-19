# Lecture 2
## CLASSICAL SEARCH ALGORITHMS
--- 
We often have to search for a solution in a solution space. 
A solution in a search graph is a path from a start to an end node, i.e.the steps nessecary to reach our goal state. When searching we maintain a frontier of unvisited nodes, and explore paths. 

In a tree search nodes may be rediscovered. IN a graph search we keep track of previously visited nodes. 
We can also use search nodes to keep track of the best path to a node, the path cost, etc. 

# Uninformed search
A uninformed search is a search which does not use any herusitics for the search method. Examples are
## Bredth First Search
Use the frontier as a FIFO queeu
## Depth search
USe the frontier as a Stack 
## Uniform Cost Search 
Somethimes there is a cost associated with the arcs. An optimal solution is then to find the solution with the smalles cost. THe frontier is a PQ

# Heurisic Search
An heuristic search uses an approximation function to approximate the distance to a node. A good heuristic function is called admissable if it is a underestimation of the true cost to reach a specific goal. An example of a heurusit search may be
## Greedy best first
Base PQ on the herusitc funtion. Might not be optimal 
## A* 
A* search uses the true cost for reaching a node, plus the heuristic value in the PQ. 

A heurisitc funtion that is admissable but gives a higher value than another admissable dominates that one.