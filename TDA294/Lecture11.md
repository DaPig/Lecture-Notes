# TDA294: Formal Methods for software development
## Lecture 11 - Dynamic Logic part 1
### 2018-10-11
---
# Intro Wine Problem
If we approach the wine-problem proposed during a previous lecture we have two glasses with some amount of white and red wine.
We want to check the difference in dilution between the two glasses a & b.

a.w / (a.r + a.w) >=< b.r / (b.w + b.r)

From JML we can model

``` java
 class Wineglass {
   int r;
   int w;
 }

 /*@ requires a.r == b.w;
        ensures a.r + a.w == \old(a.r)
                      b.w + b.r == \old(b.w)
                      a.r + b.r == \old(a.r)

                      a.w = a.r
                      a.r + a.w = b.w + b.r;  */
```
I.e. the amount of wine is the same.

--- Some Key Demoing ---

# Dynamic Logic
Dynamic logic comes as a result of wanting to be able to express properties based on other, for example if->then.
Dynamic logic can be used to reason about programs. (JML specifies java programs). The extension of this is generation of Dynamic logic from JML (next week ).

We usually want logic to express properties of programs. Dynamic logic combines first order logic with the programs.

## First order Logic
In FOL we have a sets of type symbols, function symbols and predicate symbols. We also have type declarations for variables, predicate argument types and function argument types.

### First order states
In a domain D with a typing function d, for each function of result and argument types and each predicate with the respective type, we have a mapping from all domains to one domain and a set of all domains. These are called a first-order-state.

# Towards Dynamic Logic.
We need to look at the type hierarchy in java. Every object in java is a subtype of object.
In FOL we can only look at program behavior *per state*, and only define static properties. We want to be able to be more dynamic than this. For example by setting behavior based on other artifacts and reason about post-statements.

Dynamic logic combines typed FOL with programs, modalities and other. This allows us to refer to state dependent variables before and after execution of some method.

We have rigid and flexible "symbols", where the flexible can change with state and the rigid cannot (operator for example). We declare these in the key-headers.

DL also extends FOL with two additional operators. That specifies whether a program has total correctness or partial correctness (program always terminates and the formula holds / if program terminates then the formula holds) .

In the type of verification we look at we only focus on sequential program and do not support concurrency.

## First order states & Kripke
First order states can be seen as a program state. We here have different flexible and rigid symbols. A kripke system is a relation between states with a transition system. These systems can be seen as the semantics of the project. States interpret project variables. 
