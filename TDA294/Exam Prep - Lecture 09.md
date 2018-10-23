# Exam Prep
## Lecture 9 - Java Modeling Language, Part 1
### 2018-10-23
---
Java modeling language is an extension of Java that allows us to state properties and specify behavior for java programs. As such, every Java program is a JML program (but withiut any specifications).

We use JML as a unit speicification language, thus we define specifications for the units (interfaces, classes and methods).

Starting with the methods we can define initial values of the parameters, what we expect as a result and prestate/poststate. WE can use this definition as a "contract" to follow the "design by contract"-methodology.

## Pre and Post conditions
Defining the property of a method often depends on pre and post conditions for the methods. I.e. what we expect and guarantee. In JML these are defined as

```
/*@
@ requires (formula) // precondiitons
@ ensures (formula2) // postcondition
@*/
```

# Java modeling language in a nutchell
JML allows us to specify program behavior for java programs with mathematical rigor, allowing us to formally verify the program behavior. This extends Java with FO logic, pre/postconditons, invariants and so forth.

## Specification Cases
We write specifications cases for the methods we want to test. If we give them the public visibility, these are visible from all classes and interfaces, but it can also just mention public fields and methods of the class.

A *normal_behavior* identifier opens a specification case that guarantees not to throw any exceptions, as long as the caller fulfills every preconditon. We can defferentiate different specification cases by the keyword 'also'.

We can access old variables by using the *\old()* keyword. this is evaluated in the prestate.

To define what changes during computation, we add an *asssignable* clause. That define what can be changed, nothing else will be changed. We can specify *\nothing or \everything* here to specify changes. We can define groups as well. For example object of type o or positions of arrays. 
