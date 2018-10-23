# TDA294: Formal Methods for software development
## Lecture 10 - Java Modeling Language Part 2
### 2018-10-05
---
Last time we introduced sequent calculus and the key prover failed. Today we continue learning Java modeling language.

In JML we have some modifiers that extends the standard Java modifiers. The most important being

### spec_public
Ability to access private/protected fields of a method as public can only access public fields

### pure
This function should terminate and does not have any side effects on existing models, for example by modifying a list. I.e. implies ```\assignable \nothing```

###  nullable
May or may not be null

### non_null
Must not be nullable, this is default in JML

* helper

# JML Extensions
JML extends the standard java booleans by introducing implication, equivalence and quantification. by ```\forall ; \exists ; ==> ; && ; || ```.

JML also adds generalized quantifiers ```\max ; \min ; \product ; \sum```

## Data Constraints
We can also specify constraints on the class data of a program. These constraints are global for that data. For example by defining that a data structure must be sorted.

## Class Invariants
We can place invariants anywhare in the file to specify constraints.

## Exceptions
We can also specify what exception a model can throw by using the keyword ```signals_only```
