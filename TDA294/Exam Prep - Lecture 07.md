# Exam Prep
## Lecture 7 - Model Checking with Temporal Logic Temporal Logic
### 2018-10-22
---
As previously mentioned, model checking is about checking if a property is valid in all runs of a transitional system (program). WE thus want to check if a LTL formula is satisfied in all traces. Our approach when doing this are the following:
1. Construct Generalized buchi automatron for the negation of the formula
2. Construct equivalent normal buchi automaton b
3. Construct the product of the Transition system and the buchi automatron
4. Analyze whether this have a path looping through a 'accepting node'
5. If such is found, we have a counter example. Otherwise we have proven our formula

I.e. we generate a negation and look for a loop through a state which breaks our formula. If that is the case we have disproven our formula.

To generate this model checking graph, we do the following,

# Model Checking graph
A model checking graph have a set of nodes, initial nodes, arrow relations and a set of accepting nodes. The nodes are the product of the transition system over our automon proposition and the buchi automatron. We combine and create all combinations of the states of the buchi automatron with the transition system.

# Model Checking in Spin using LTL
A PROMELA program can have an accept label "acceptxxx", a program that infinitaly often passes through this one is called an acceptance cycle.

Assertions does not cover all possible cases, thus we need to be able to specify ltl formulas that define program behavior in all possible cases. We use boolean temporal logic here. I.e. boolean expressions over promela variables. This includes all boolean global variables and boolean operators and ltl extensions. We can use ghost variables to validate behaviour and not use them by using the @-opertator

## Weak Fairness
When verifying liveness we want to use weak fairness as otherwise processes may starve and thus the ltl formula may not hold.
