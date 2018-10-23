# TDA294: Formal Methods for software development
## Lecture 12 - Dynamic Logic part 2
### 2018-10-16
---
Today we continue on with dynamic logic.
Dynamic logic can be seen as a representation Hoare logic, i.e. set pre and postconditions, while and also allow us to extend this further. In Dynamic logic we can specify what state we should end up in post-program.


## Proving DL Formulas
We use sequent calculus to prove DL. If we have two sets of DL formulas a sequent is valid if the aggregated and- from the first set implies the aggregated or in the second state in all states.

When using sequent calculus we decompose the top-level operator in a formula. The top level in a set of assignments is the top-most assignment as we often follow the natural control flow.

When doing the symbolic execution of a program we break down the program in its natural states and prove our formula. The symbolic execution thus "walks through" the program.

The different parts of these formulas are
* {v := t} : Update
* {v := t}t' = is a DL term
* {v:= t} o is a DL Formula

Often when we have sets of update we wish to commute these into a single one.

# Modeling JAVA in FOL
If we try to model the heap in java we have two methods, one store and one select-method that either stores or pop an object form the heap. We can then model the heap using FOL by referencing the heap in its context with one of the methods. (Note that the fievld in a heap is basically a variable or attribute of a class).

An object in key can also reference itself. Using the self keyword. 
