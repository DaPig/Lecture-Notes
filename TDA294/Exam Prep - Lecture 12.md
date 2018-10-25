# Exam Prep
## Lecture 12 - Reasoning about Programs with Dynamic Logic II
### 2018-10-24
---
Dynamic Logic can be seen as a instance of Hoare Logic. As DL is an instance of FOL we can use the same idea of antecedent->succedent sequent calculus where a State fulfills a set of logic formulas if it fulfills the antecedent that implies the succedent. Thus, a sequent over DL formulas is valid iff all states fulfills the sequent. When doing sequent calculus we dexompose the top-level operators in the formula. When we decompose this we follow the natural control flow of a program. an example of this is a if-case, we branch on both true and false and continue decomposing.

We want to simplify effects on program execution early and apply state change late. We have the following
```
{a := b} // Update
{v :=t}t' // DL term
{v := t}o // DL formula
```
An update is not an assignment. If we have several assignments after one another, we need to decompose these into parallel updates.

# Parallel Update
A parallel update ```{v1 : = r1 || ... || vn := rn}``` is decomposed into a set of updates that are done at the same time, where the result value (rk) is computed in the old state before the update.  If we have a conflict, the later update wins.

# Modelling Heap
The heap used in java can be modelled in FOL. THis heap is changed during the execution of the program (program variables are stored here) The heap have two methods
* store (Heap, Object, Field, any) = Store the any associated with the field.  returns new heap with addition
* select(Heap, Object, Field): Returns the value associated with the field.
The heap is formalized in its behavior, we have some definitions for the select as we need to "cast" a value to the correct type
```
int::select(h,p,Person::$id) >= 0```select.
```

## Self Reference
One can reference *this* in key using *self*  
