# TDA294: Formal Methods for software development
## Lecture 9 - Sequent Calculus, KeY prover, Java Modeling Language part 1
### 2018-10-04
---
We use JML as a property specification language in this course to do deductive verification.

# Unit Specification
An important aspect are system level specifications in requirement analysis, this is not part of this course, however, we use unit specification, which is contracts among implementers on various levels. Example of levels are;
* Application level - Library & application level
* Library Level

## Method Specification
The units cam be specified as interfaces classes and their methods.

A method specification refers to;
* Initial values of formal parameters
* Result value for the method.
* Pre & Post-state

A commonly used analogy for designing methods are "Design by Contract" as a contract between the caller and callee, i.e. definition of what can be expected in the exchange between a method and the piece of code that calls it. For example guarantees on input and result based on input.

We can define these as pre and post condition. I.e. what is expected and what is guaranteed.  Any state of the accepted precondition will result in a state in the postconditions.

# Formal Specification
In formal specifications we define contracts with mathematical rigour as this yields high precision and the potential of automating the analysis.

## Java modeling language
JML is a specification language that provides both specification and implementation in one single language. This language being Java. As such, JML is Java + FO logic + pre/postconditions, invariants and much more. The advantage of which being specification of writing these directly into the java source files. The JML specifiers are specifies in such a way that they are ignored by the java compiler (comments).

The specification cases we write for models can be public and as such accessable from all classes and interfaces, if these end with `behavior` they are regarded as a specification case and guarantees not to throw an error if the caller guarantees all preconditions. These are defined as ```@requires``` and the postconditions as ```ensures```. The pre/post-conditions should be boolean java expressions.

We can also have different specification cases connected by `also`. And also know the prestate values (before method computation) by the `\old()`-identifier.

It is however sorta cluttering to add ensures for all locations that do not change, as such we want to add a ```assignable``` block for the locations that may change.
