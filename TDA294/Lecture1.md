# TDA294: Formal Methods for software development
## Lecture 1
### 2018-09-04
---
# Course Structure
The course is split into two sections.
* Model checking: Modeling, using PROMELA and spin. Talk about abstract programs on a high level using modeling, properties etc, highly automated
* Specification & verification with JML & Key, deductive verification. Concrete Java, no abstraction, semi automated. More expressive on data

There will be roughly one exercise per week.

The labs are pass/Fail .
---

# Why is this relevant to the field of Software?
Software faults can have catastrophic effects, and as software is everywhere they pose a real potential danger to humans.  As such, reliability is important to reach such that the software can be confidently used.

In other fields reliability have already existing design patterns, calculations and approaches that are proven to work. This is not however always suited for software as the effect of smaller divergent errors, such as a comma in a number may change a programs behavior completely.

Our central strategy for validating our reliability is testing. But testing can only prove presence of error, not the lack of errors as it is impossible to test every outcome of a system, or we would at least need a huge number of tests to successfully test most outcomes.

Another approach to validate the behavior of the system is to model this using various methods, these are called formal methods.

# Formal Methods
Formal methods are used for development, analysis etc of systems to prove and test the reliability of the software. There are two different aspects of this;
* Requirements
* Implementation

Formal methods complement analysis and design methods to produce increased confidence of the correctness of the software by ensuring certain properties of the application. However, it is not expected to be able to show correctness of an entire system, nor is it expected to replace testing or design practices.

A systems requested behavior can be defined by specification such as safety and liveness properties and execution time/ memory requirements etc. This can however be difficult, as a system often have lots of requirements originating in a imperfect, chaotic world (our reality), thus simple mistakes such as verboseness or over-simplification can complicate the design.

The specification of a program describe what the system should and should not do. For example safety properties. The formal methods may later validate these. But as previously mentioned, these can be hard to describe. The system description can be abstract or concrete, i.e. either give the developer a large freedom on the implimentation or not, moreover, the specification can thus be simple or complex.

Proving a system model for the behavior can be automated or semi automated, for example validating hardware behavior or software verification.

Formal methods are shown to be very useful as a multitude of studies have been done that managed to exposed new errors and faults not caught by the tests. 
