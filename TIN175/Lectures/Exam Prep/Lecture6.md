# Lecture 4
## Search III, Non-classical and adversarial search
---
# Non classsical search
Other than the previous search stratergies we have visited. We can also use a non-classical search stratergy. Exampels of these are Nondeterministic Search, Here we cave a conginency plan/ stratergy which we follow. 

## Nondeterministic Search
Nondeterministic search covers the cases when actions are nondeterministic. For example a vacuum agent that sometomes also sucks the dirt in an adjecant. In that case, instead of an action returning one specific state, it returns a set of possible states. As such we need to generallize the solution notation with if-then-else cases

## Partial Observations
In a partially observable case, the agent cannot tell exactly what state it is in. A problem can be partially or fully observable and non - / determinisitc or a combination of these. 

### believ states
In cases such as parially observable or deterministic. We search in believ states insted, these are a set of possible states the agent can currently be in. the goal test is to check that every state in the believ state passes the goal test. I.e. we are 100% sure we have reached a solution.

# Adverseral Search.  
Sometimes, like in games we can have multiple agent that are wither cooperative or competetive, the results as such an outcomes of the actions of all the agents.

Translating this into search problems, each state are represented in a tree and agent actions are transitions into new states. The fully observable world of games are called perfect information games. One example of cooperative agents in this are the minimax algorithm

## Minimax Games
In minimax games, one agent is trying to maximize a value and one is trying to minimize the same value. 

### alpha-beta pruning
Alpha-beta pruning means trying to cut off computation trees. For example, if we have a minimum node followed by several max-nodes we can cut off subtrees for example if one of the values in the following max nodes is a indication of the smallest/largest value of that node. 

# Imperfect Decisions 
One example of this is the heuristic minimax function, this uses heurisitc to use a cutoff-method-


