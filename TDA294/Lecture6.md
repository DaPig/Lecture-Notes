# TDA294: Formal Methods for software development
## Lecture 6 - Propositional and (linear)Temporal Logic
### 2018-09-18
---
There is an additional way one can specify how a program should behave that does not only rely on assertions, namely logic.

The real world can be formalized into a formal language and formal semantics. The formal language gives meaning to the syntax, i.e. the propositional logic gives meaning to the valuation.

Promela and temporal logic gives meaning to all runs and a transitional system, i.e. our program.

The promela program that simulates the transitional system can be translated into a Büchi automota that is used to validate certain properties of the system.

# Propositional Logic
Propositional Logic consist of a set of atomic propositions (AP) connected using operators. There are also some rules. Spin uses other notations for logic than in textbook practice, very similar to standard programming operators, such as `&&,!, || ` etc..

An *interpretation* assigns a truth value to each atomic proposition, i.e. true or false. An interpretation satisfies a formula if the value for that formula is equal to true.

If a formula is satisfied by *some* interpretation it is satisfiable, if every interpretation satisfies it, it is valid.


# Transisiton Systems
 A semantic domain that helps us give meaning to the logic is called transition systems (kripke structures). In these structures we have a state tree with a finite number of states (can be infinite), each state have an interpretation of our logical syntax, these states are transitioned to another state. Transitions can be changes of the interpretation.

 A transition system consists of a set of states, an initial state, transition relations from the state to a subset of the state-space and labels to identify the states with their propositional logic. A *run* of this system is an infinite sequence of states. The *trace* of a run is the interpretations we found in the path of the run.

 A power set is the set of all subsets of a semantic
 The finite sequences are the set of all finite sequences of the elements of a set. The infinite sequence is the set of all infinite sequences of a set.

## Linear Type Properties
 A linear type property is a set of atomic propositions in the infinite sequence. Each set of possible sequences of interpretations is a property. A trace fulfills this property if it is in the property set, and violates it if it is not. I.e. a property is a sequence that a program should behave? If a program has another trace in its behavior, it is erroneous.

These properties can be divided into three classes. Safety, Liveness and non-of-the-above -property.

A property is called a safety properties is if for all sequences that violates (outside the infinite sequence) the property, there exist a finite prefix (subset), which cannot be repaired, i.e. all extensions of the finite prefix does not fall within the property. In other words, the entire trace of the trace that falls outside the property is outside the set, it does not overlap.

A property is called a liveness property if all the finite prefixes of that properties is equal to all the finite prefixes in the finite sequence. I.e every finite trace cannot be refuted in finite time.

# Linear Temporal logic
Is an extension of propositional logic that allows for specification of properties for all traces. We extend with `eventually`,  `always` and `until`
We evaluate a formula in relation to an infinite sequence.

Assuming a infinite trace, the always operator is valid if the suffix for whatever value in the trace is still valid. I.e. regardless of what subset it is true
Assuming a infinite trace, the eventually operator is valid on a suffix if for k>= 0 the trace is still valid. i.e. there exist a suffix that is true. Or in other words, given a set of transitions (k number of transitions), after these transitions the statment is true

Assuming a infinite trace, the until formula defines that for some suffix the trace is valid until some value. In other words, this statement is true until the right hand is true.

There are various rules and ways one utalizes these operators to do the temporal logic.

The model checker translates the temporal logic into büchi atomota.

# Büchi atomota

## w-languages
Given a finite alphabet a word in this alphabet is equal to a finite sequence of the subset of elements in this alphabet. A language is the set of all finite sequences on this alphabet.

A infinite word is an infinite sequence of elements from the infinite sequence of the alphabet. THis is called a w-word and the set of all infinite sequences is called a w-language.

A Büchi automaton over a given alphabet is a set of locations with a transition relation over the alphabets and locations and a set of initial locations that eventually may reach a set of accepting locations.

An accepted word in the automaton makes the accepting location appear infinitely often.

### Decidability
It is decideable whether an accepted language of the Büchi automata is empty

### Closure
The w-languages are closed with respect to uniton, intersectin and complement
