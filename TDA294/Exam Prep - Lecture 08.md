# Exam Prep
## Lecture 8 -  Temporal Model Checking (part 2) + First-Order Logic
### 2018-10-23
---
IN this lecture we continue with the generalized büchi automata and the translation to a normal buchi automata.

# Generalized Buchi Automata
A GBA is defined as a normal buchi automata (nodes, transitions and start nodes) that are extended with a set of accepting locations. A w-word in a GBA is accepted if for every i  there is one state that is visited infinitely often. I.e. one must visit all the accepting locations.

## Constructing a Normal buchi Automata
To construct a normal buchi automata one duplicates the automata k times if there is k accepting locations. Then one "draws" the accepting locations from the accepting location in the previous to the start in the latter and the transition from the second to the first.

## Translating LTL to buchi
We focus on ltl formulas without the eventually and always-operators. And only focus on the until.

### Fisher-Ladner Closure
A fisher ladner closure of a formula is a set of sub-formulas or negated sub-formulas for the initial formula.

### Locations in GB
Every location in the generalized buchi automata are included in the power set of the fisher laudner closure where each subformula follows some rules, these are.
* If and: We need both predicates
* IF or: We need at least one of the predicates
* If implies: We need the negated first one or the second one.
* If until: We need one of the subformulas
* if not until: We need the negated second formula.

We take these locations into our buchi automata. WE now have our nodes!

### Transitions.
THe transitions are the intersection between automic propositions and the included sub-formulas. And from the untill where the second is false until other until. and Until where the first is true until all other until.

The initial locations of these are the states where the formula exist. And the accepting locations are the places that do not contain the formula or contians the second predicate, i.e. fulfull the formula.

A generalized büchi automata always gives exponential number of states.

# First Order Logic
First order logic can be seen as a language used to prove properties of a program. A signature for this language consists of a set of types, set of function symbols, set of predicate symbols and a typing.

## Syntax
To define stuff in this program we write
```
type x = variable of type x
p(type1, ..., typeN) = predicate for the types
type f(type1, .. , typeN) = define function of given types
```

### Term
A term in a FOL is either a variable of a type t or a function of a return type and a set of input types.

### Atomic Formula
An atomic formula is either true or false, a equality operators of two variables of the same type, or a predicate that exist in the typing.

### First order formula
A FOF  is ither an atomic formula or a compound formula.

All of these leads us into the notation of sequent calculus.

# Sequent calculus
Sequent calculus is based on the notion of a sequent. Here we have a antecedent and a succedent. These are sets of predicates or formulas where the antecedent implies the succedent. We can split up formulas to have the main formula and side formula, which allows us to simplify expressions one step at a time.

When solving a sequent calculus problem we start with the conclusion and break out the premises to eventually prove the conclusion. We close a proof when we have found a rule without any premise.

## First order formulas
When proving formulas that include for all we include a constant in the calculations. Where we include each occurrence in the formula with a constant of the same type. When proving an existance formula, we include a variable free term.

# First order Semantics
We need to extend our notation in propositional logic to cover semantics for our first order logic. We extend it by having domains which assigns meaning to types in the specific domain. The interpretation in this domain give meaning to our domain items and typings. 
