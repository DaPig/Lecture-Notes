# Lecture 3
## MORE SEARCH ALGORITHMS
---
The generic search algorithm keeps a frontier. While this is not empty we select a node from the frontier, axpand this and add neighbours to the frontier (in graph we don't add previously visited). If one of the neighbours are the goal. We have found a path (in A* we wait untill the node have been expanded not to get a suboptimal path.)
Depending on the variety of the algorithm we implement the frontier in different ways. 

## Depth First Tree
Frontier is a stack, 
space complexity O(bm) 
It's incomplete, might fall into inf loops and may not return optimal solution

## Bredth First Tree
Frontier is a queue (FIFO)
Space complexity O(b^m)
Complete, always finds solution if exisiting (when cost of edges is constant this is optimal)

# Heuristic
The heuristic functions are a variation of this search, but uses heuristics. THe basics of this (although not a heuristic function) is the Uniform cost algorithm, here the edges have a cost and the goal is to find a path of the minimal cost. That means optimality. Variations of the USS algorithm may be: 

## Greedy Best Search
Frontier is a priority QUeue based on H(x), the heuristic value to reach node x. Is incomplete, may fall into inf loop and does not always return optimal solution

## A* Search
Frontier is stack based on h(x) + g(x), that is the heuristic function to reach x and the actual cost to reach it. It is complete and optimal if h is admissable, the branching factor is finite, arc costs are bounded above zero.

A heurstic function may also be consistant, it is this when the estimation between two nodes are smaller or equal to the actual cost. Admissability means that the heuristic between a node and the goal is an underestimate, consistancy means that the herustic is a underestimate for every arc. 

# More search stratergies

## Iterative deepening
The iterative deepening algorithms is a way to combine DFS and BFS so that memory allocation is reduced but we will still find a solution. We do this by recomputing elements of the frontier, so first look for path of length 1, then 2 and so on . And works by for depth 1,2,3.. send in the initial state (set with first node) and the depth limit, and for each neighbour of the last node in the set, call the helper function again with limit -1 if the final node is goal, we return path. 

# Local Search
In many problems, the actual path to the solution is irrelevant, but we only want to find the solution or check if it exist. State space is then the set of complete states and we use iterative improvement (take a state and try to improve it in relation to relative constraints etc) these take constant space. 

## Hill climbing
Another example of a local search algorithm is a hill climbing algorithm. We here start with an initial value, and if a neighbour has a greater value than the current node, we move to that one. The problem here are local maximums, ridges and plateaus. How do we combat these? 

## Randomized Algorithm
Another approach is ramdomized algorithm. We start at random places, and report the maximum value found. 

## Randomized Hill climbing
Combining the two approaches above we can get an algorithm that combats the issues with hill climbing, random steps, i.e. move to a random neighbour sometimes and random restarts somethimes, to see if we can find a higher value. 

