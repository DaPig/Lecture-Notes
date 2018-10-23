# Exam Prep
## Lecture 6 - Propositional and (Linear) Temporal Logic
### 2018-10-22
---
As previously mentioned, when modeling a system from the real world into a program, one needs to translate into an abstraction.


# Propositional Logic
IN propositional logic we have a set of atomic propositions (AP) that are evaluated to true or false. Between these we have propositional connectives. If we take all atomic propositions with their connectives we have all formulas.

An interpretation assigns a truth value to each atomic proposition, a valuation function takes an interpretation to yield a truth value.

If we have a formula f, we can say that I satisfies the formula if this yields a truth value for that formula in the valuation function. This is written as

```
I |= f
 ```
We can also say for  a set of formulas S, that the formula f follows from S (S |= f), when all the formulas in S are satisfies by the intterpretation.

If a formula is satisfied by some interpretation it is satisfiable, if it is satisfied by every interpretation (|= f) it is called valid

# Transition System. (Kripke Structures)
We can model transitions between different interpretations by utilizing a kripke system. Thus system consists of nodes with a state id, and the current interpretation, with the transition to nodes with another interpretation. Thus every transition is a change in the interpretation. Runs, or computations are infinite runs through this system (through the states). A trace through this system is a set of interpretation in nodes of a run.

## Power Set & Sequences
A power set (2^x) is all the sets of subsets of a given set. A finite set (Y^\*) is the set of all finite sequences of a set, the infinite sequence (Y^w) is the set of all infinite sequences of a set. An interpretation oven atomic propositions can be represented as elements of the power set of the atomic proposition. A run of a transition system can be seen as an element of the infinite sequences of our states, and a trace can be seen as a element of the inifinite sequence of the power set for our atomic propositions.

Each subset of the  inifinite sequence of the power set for our atomic propositions is called a linear time property over our atomic proposition. A trace fulfills a property if the trace is in this property. If it is not in this property, it violates the property.

There are two types of properties

### Saftey Property
If we have a LT property over AP we have a saftey property if for each trace there exist a finite prefix such that our property always hold. I.e. each violating trace cannot be extended to a safe trace. I.e. we can always expect our property to hold.

### Liveness Property
A liveness property is wheneever a the set of finite prefixes of a property is in the finite power set of of all atomic propositions. I.e. it allows every finite prefix
These two new properties allow us to extend our propositional logic into linear temporal logic.

# Linear Temporal Logic
We extend our operators from prop. logic to cover infinite traces, i.e. be able to covef all traces. THese new operators are:

```
Always [] = Always true
Eventually <> = Eventually true
Untill U = True untill.

```
These now allow us to specify formulas like

[]p = p is always true, <>p = p will sometimes be True, pUq, p is true untill q becomes true.


A formula is valid if it for all traces is satisfied. If we have a transition system T, a temporal logic formula is valid in this system if it is valid in all traces of the system.

# w-Languages
If we have a finite alphabet. A w-word is a infinite sequence in the inifinite set of finite sequences of the alphabet.

# Büchi Automata
A butchi automata over  a alphabet is a non-empty set of loctations in combination with a transition relation, initial location and a set of accepting locations. A word in this automatron is accepted if some accepting location appears infinitely often.

## Decidability, Closure Properties.
It is decidable if a accepted language of a buchi automata is empty.
The set of w-languages are closed with respect to intersection, union and complement.
