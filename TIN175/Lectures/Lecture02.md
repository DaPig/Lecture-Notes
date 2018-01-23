# Lecture 2
## Classic & Heuristic Search
### 2018-01-19
---
# Graphs and Searching
Many AI problems can be catagorized as finding a path in a directed graph. We are also not always given an algorithm to solve the problem but we need to search.For example, an agent who has a set of states and want to reach an endstate.

# Directed graph.
Graphs consists of N nodes and A ordered set of pairs, node a is connected to node b if (a,b) is in A. Note that (a,b)!=(b,a). A solution is a path from a start node to an end node

## Examples 
For all of the examples below, the states, initial states, goals and goal test can be found in the slides.
 
### Travling in romania
Travels from a city to another city via connected cities

### Grid Game
Find coins in a grid without running out of gas. We specify the coins as booleans because either they are in their initial position, or we move them. Their position are static. We also dont keep track of Fuel deposit as we assume that it is infinite, thus we don't need to keep track of the amount left there.

### Vacuum Cleaning Agent
A agent that cleans room. The final state is that all rooms are clean. If we also do a uniform cost problem. The goal is that all rooms shall be cleaned with minimum cost (maybe like energy consumed by the agent)

### The 8-puzzle
Move the "empty square" so that we get the numbers in the correct order.

### The 8 queens problem
Place 8 queens on board so that no one threatens the other. THe total number of unique states are 64!. Which is not feasable. 

### Knuths Conjecture
All possible integers can be obtained by starting with a 4 and give a combination of floor, factorial and square roots.

### Robotic Assembly
The robot moves around things

## How do we search in a graph?
A generic search algorithm contains an froneer, i.e. the notes that are to be searched. The fronteer then expands into the unknown nodes.

### Tree search
Tree search searches all child nodes and then adds the connected to be searched. I.e. they can be searched twice which is not very efficient in seardch time. But memory is small.

### Graph search
Like tree search but we keep track on the searched nodes. I.e. search time faster bur higher memory usage. 

## Graph nodes vs. search nodes
The graph nodes are NOT the same as search nodes. The latter contains a corresponding graph nodes but also contains items as if it has been visited, path length, estimated ocst, etc

# Uninformed Search
This is a search which does not know anything about the undiscovered nodes, as such it is the direct opposite of informed(heuristic) search

## Depth first Search
A depth first searches the depth first, i.e. all the childreon of a given node before searching the nodes sibling. I.e. it handles searching as a stack, last in first out

Are some complexities with a depth first search. Such as cycles, what happens on infinite graphs, 

## Bredth first. 
A bredth first search searches all the sibling of a node before going to the subtrees, i.e. it handles searching as a queue.

Are also some complexities with this. Such as infinite graphs, cycles etc

## Uniform Cost search
A uniform cost search addresses the problem when there are costs associated with the arcs. It aims to find a solution of the smallest cost total. THe priority queue here is used as the fronteer

# Heuristic Search
In a heuristic search we use heuristics, i.e. approximations of the cost for reaching a goal. When writing the function for caluclating the approx. cost we need to make sure this approx is fast.

### Examples of heuristic functions
A greedy approach takes the node which is closest to the goal based on heuristic functions. They might however fall into an infinite loop

## A* Search
Astar uses both heuristics and path costs for calculating the values. A* is optimal. It works by always visiting the node with the lowest cost in the fronteer until we find the smallest solution.  

## Dominating heuristics


## HEURISTICS FROM A RELAXED PROBLEM



