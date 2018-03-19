# Lecture 6
## Non-classical and adversarial search
### 2018-02-02
---
# Repetition
Let's start with a little bit of repetition. 

## Uninformed Search
Search stratergies that do not use heuristics, such as depth first and tree search. 

## Heuristic search 
Searh stratergies reliant on a "approximation" function, i.e. a heuristic funtion to prioritize the nodes, such as A* search. Can also been called informed search.

## Local Search 
Searches by random moves etc. Beam search, several searches in parallel. 

# Non-Classical Search 
Moving on to less classical approaches to the searching. We only cover the two below, we do not cover online search. 

## Nondeterministic Search 
A nondeterminisitic search have a search stratergy/ contingency Plan. and covers the case when the actions are nondeterministic: See below: 

But what if the action done at a given space (for example the "suck" action for a vacuum agent) is nondeterministic. We need to return a set of possible outcomes for our action instead of just one state. We also need to generallize the solution space, so instead of a single path we have a contingency plan (stratergy). We need 'and'-nodes in the search tree, used whenever a nondeterministic action is used. This means that any one of the two states can happen, not nessecarily one or the other. 

If one of the child trees from the and nodes fails, we cannot find a solution in the other subtree as the selected subtree is nodeterministic. 

## Partial Observations
A state is partially observable if the agent cannot exactly tell which state it is in at a given time. SO instead of states we search in belief states that are themself a set of states which is a set of plausable states the agent can be in. The goal test needs to test all states in the belief states to determine whether goal has been reached. 

We can think of the belief state transitions as: 
* Prediction (same as for sensorless problem) When we perform an action, and then we get to a new belief state, this can be the same (nondeterministic)
* Observation Prediction: Determines the prercepts that can be observed. We perform an observation in the current state and filter using the observation prediction
* Update: Filter the predicted states according to percepts. We keep the states that adhere to what we see. 

# Adversarial search


## Types of Games
There are many different types of games, cooperative, compeditive etc. 
Transating this into agents we can have multiple agents that are either cooperative or compeditive, 

Games can also be translated into search problems, i.e. each game state is represented by a state, we travel through states to reach a "win"


## Minimax search 
Give to players, one want to maximize a value, and one wants to minimize the same value, 

### Pruning
The minimax does a full search, but some branches are unnessecary. Pruning thus reduces the number of computations.

## Imperfect Decisions
 


