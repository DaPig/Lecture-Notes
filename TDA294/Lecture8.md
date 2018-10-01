# TDA294: Formal Methods for software development
## Lecture 8 - Temporal Model Checking part 2 + First-Order Logic
### 2018-09-28
---
We are at a turning point of the course, today we finish model checking and start with deductive verification.

As a reminder, model checking is about validating whether a formula is valid in all runs of a transition system.

# Generalized Büchi automata

 A GBA is a standard buchi automata with an addition of a set of sets of accepting locations. This accept a word if it passes through all of the accepting sets of locations infinitely often.  

 To translate this into a Normal Buchi automata we create n clones of automatrons if we have n end states and connect the end states of each clone with the  starting location for the next clone, and wrap back around. Wee keep only the initial and accepting locations of the clone.

 The formula for this is :
 A generalized buchi automata with n end states ie equvalent to n normal BA with n times the start space,  The transition between states is within the same layer if the transiiton is not to an accepting location, otherwise it is to the next layer mod n.


# LTL to a generalized büchi automata
Translating a LTL formula to a generalized Büchi automata assumes that we do not use the always and eventually-operators. These can instead be model only using the `until` formula with negations and true.

## Fisher Ladner
A set called Fisher Ladner is a set of sub-formulas for a formula or the negation of this formula where we take a bunch of valid locations, governed by some rules.

From these we get Locations in our buchi generalized automata. Each location should be consistent and total, i.e. have the location and negation. Downward, i,e, a combination of two (eg. and) should also include these two on their own.

 The connections/transitions are allowed via a label (a member of our alphabet) if; the label is the intersection of the set with the automic proposition, if a promise is made in a state the promise should still be true in the next state, and vice versa i.e. the propagation should also hold in the next state. For example, if we have `x untill y` in the previous state, then this must also exist in the next location.

The accepting location set is a set that do not contain x U y or that contain y. i.e. it reaches its promise and does not procastinate forever.

Creating a buchi automata always yield a exponential number of state that has a PSPACE complete complexity of satisfiability checking.

---
# Starting First order Logic.
In the first order logic section we utalize the JAva modeling language that comvines java syntax with first order logic, and then we validate java programs using dynamic logic.

## First order logic
We have first order signatures and a typings. The syntax used is very similar to java notation with argument declaration, predicate symbols and function symbols.

### Signature
A signature consists of a set of types, a set of function symbols and a set of predicate symbols, with a typing.

### First order terms
We have a set of variables where each one have a unique type. Terms are described as either being a variable or a composite set of other terms (as a function would). These are recursive declarations. Example +(10,+(10,2)).


### Atomic formula
Similar to first order team but is either true or false ore a stametent that leads to these. Recursive.

## Semantic
Semantics in First order logic includes the following:

* Domain: The meaning of terms and variables
* Interpretation: Assigning meaning to the symbos
* Valuation: Evaluates an interpretation in a domain to a truth value
* Validity: A formula is valid if it is true in all domains and interpretaiton.
