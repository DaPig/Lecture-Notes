# TDA294: Formal Methods for software development
## Lecture 7 - Temporal Model Checking part 1
### 2018-09-21
---
We will start with some recap from last lecture since we did not have time for all the material

## Buchi automata
We accept a (infinite) word if it makes us visit the end node infinitely often.

## LTL och Buchi automatas are connected
If we have a transition system and a temporal formula, the formula is valid in the transition system if all traces of the system fulfills the property.

### Create a Buchi automata from a LTL Formula.
To do this from the given formula we need a power set from the formula. Usually we can base the automata on the interpretation one is after, for example, if the interpretation is about the truth value for r, this must always be true.
---
# Model Checking
Model checking checks wether a formula is valid in all runs of a transition system. , i.e. is the formula valid in all traces of the system.

In order to check this the model checker creates a generalized buchi automata for negating the formula, then it creates a normal automata, the product is computed between these two and finally analyzed. I.e. we check if there is a word that violates our formula but exists in our system.
If we find such a word, we have a counter example. As such the steps are the following:

1. Construct a generalized Büchi Automatron for the negation of the formula.
2. Construct the equivalent notmal automatron.
3. Construct the product between the transition system and the normal buchi Automatron
4. Analyze whether there exist a path that loops through an accepting node
5. If such a path is found then the formula is invalid and we have a counter-example, otherwise it is valid.

In this lecture we check the product of the system and buchi automatron. The product between the automatron and the transition system is called a model checking graph.

## Model Checking Graph
In a model checking graph is a finite set of nodes with transitions, initial nodes and accepting nodes. It is such an easier graph.

If we have a transition system and a buchi automata, we combine these to yield a model checking graph. The nodes is the product of the nodes of our transition system and automata. The states are connected if they are in the transition system and follow the correct behaviour of the system. (Check slides for easier graphical descriptions)

## Using SPIN to model check
One can use SPIN to model check, using the same idea we did earlier (generating verifiers to executable c-file and get a trail for a potential failing run)

Accept labels are labels with the name ```acceptxxx``` and are used to specify cyclic behavior. A accept cycle is a run that infinitely often passes through one of these accept locations. These are often used in never claims to specify undesired behavior.

**Weak Fairness** means that each executable will be executed eventually and will as such never stay unexecuted.

When specifying correctness in our programs in SPIN, we can use temporal logic formulations. This is in contradiction to standard assertion given that to check critical sections we need one assertion per critical section witch can be verbose and hard to sync, amongst other drawbacks.

### Boolean temporal logic
In order to specify LTL in spin, we need to have atomic building blocks of boolean values over promela variables. For_BTL is a formula that contains all global variables, all expressions, all process@label locations amongst other things. using this we can specify properties. For example

#### Saftey Properties
Something good is guaranteed throughout each run, each violating run violates the property in finite time

Eg., throughout each run only one process visits this critical section,
```
[](critical <= 1)
```
We add this as a definition in the propela project and run spin using the Saftey property.

### Liveness Property
We state that something good will eventually happen. Each violating run requires infinitely many steps.

Example, the process visit a critical eventually

```
ltl pInCrit {<>csp}

active proctype P () {
  do :: atomic {
    ! inCriticalQ ;
    inCriticalP = true
}
  csp = true ;
  inCriticalP = f a l s e
  od
}


```
