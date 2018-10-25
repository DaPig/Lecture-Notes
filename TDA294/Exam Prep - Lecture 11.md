# Exam Prep
## Lecture 11 - Reasoning about Programs with Dynamic Logic
### 2018-10-24
---
We want to be able to extend our logic to prove and express properties for dynamic aspects of programs, for example; if x then y.

Dynamic logic comes into play here, this combines FOL with programs and dynamic interpretations.

## Dynamic Logic approach
We have a set of types where each subtype is a part of the cartesian product between the typeset and the typeset. The minimal case here is the case when all signatures have the same type T. For example, in the Java type hierachy we have integers and booleans that are all subtypes of the *any*- type.

As only static properties of a program is expressable using FOL we need dynamic logic to make assumptions on behavior based on computational statements.

# Dynamic Logic
Dynamic Logic extends FOL with programs, modalities and other items that allow us to view changes in variables during execution. We also have program symbols that are either rigid(insensitive to program state, like operators) and flexible (program variables).  Any term that have one flexible symbol is also flexible. The latter are not FO variables as they cannot be quantified. The former is.

## Modalities
Dynamic logic also have modalities.
* <p> o= Total correctness
* [p]o = Partial COrrectness

Total correctness means that p terminates and the o-formula holds. Partial correctness means that IF p terminates, o holds. In key, a potential program can look as follows

```
\programVariables {
  int i,
  int old_i;
}

\problem {
  i = old_i -> \<{i = i-1;} }\> i<old_i
}
```

Since DL is an extension to FOL, every DL formula is also a FOL formula.

## Dynamic Logic states
A first-order state can be seen as a program state where we have different interpretation of flexible variables in different states. We can model the transitions and program state using kripke structures.

A dynamic logic formula is valid if the state fulfills the formula in all states.

WE also have some additional Semantics
* Duality, the partial  correctness holds iff the negated partial correctness hold.
* Implication. If the total correctness holds, then the total correctness holds. I.e. the total implies the partial.
