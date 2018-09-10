# TDA294: Formal Methods for software development
## Lecture 2
### 2018-09-07
---
This lecture is about spin and model checkers. Spin was previously (last lecture) used as a PROMELA simulator, but here we use it as a model checker.

A model checker is designed to show that you are wrong. A model checker tries to show that a model of a behavior is wrong, or breaks in some case, i.e. another correctness case, if it cannot find such a case, then the behavior is validated.

The model checker does exhaustive search, i.e. resolving the non-determinism in all possible ways.

# Spin
Spin is the most use model checker in the world, it simulates a model and also generates a verifier, the latter being a c program doing an exhaustive check on the PROMELA model.  If spin finds a failing run, it can be run step by step again as it generates a trace.

We can use various approaches to state the correctness properties, these include assertion statements and  meta labels ore outside-model properties. Today we will focus on assertion statements and end labels (meta labels).

In a sense, the way one would work with SPIN is the following
 1. Create the model of the system
 2. Correctness properties are defined
 3. Model checker is run to see if the model fulfills the correctness properties.  

# Assertion Statements
Assertion statements are statements in the form ```assert(statement)```(similar to JUnit). The statement here are often a boolean expression. IF the statement generates a false, an error message is thrown, otherwise nothing happens.

When spin runs this it generates a C verifier, that can be compiled using a C compiler to an executable verifier pan (protocal analyzer). When we run this it either prints "errors: 0" or "errors n" (n>n), i.e. if it has found any errors. One can use a guided simulation to check more specifically what breaks.
