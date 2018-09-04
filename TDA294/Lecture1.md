# TDA294: Formal Methods for software development
## Lecture 1
### 2018-09-04
---
The course is split into two sections.
* Model checking: Modeling, using PROMELA and spin. Talk about abstract programs on a high level using modeling, properties etc, highly automated
* Specification & verification with JML & Key, deductive verification. Concrete Java, no abstraction, semi automated. More expressive on data

There will be roughly one exercise per week.

The labs are pass/Fail .


## Why do we do this course?
Software faults can have catastrophic effects, and as software is everywhere they pose a real potential danger to humans.  We need reliability...

IN other fields reliability have already existing design patterns and approaches that are proven to work. This is not however always suited for software as a comma in a number may change a programs behavior completely.

Our central strategy for validating our reliability is testing. But testing only validates presence of error, not the lack of errors. This course is the alternative to testing as testing is expensive.
## Formal Methods
Formal methods are used for development, analysis etc of systems to prove and test the reliability of a software.

The specification of a program describe what the system should and should not do. For example safety properties. The formal methods may later validate these

However, formal methods are not to show correctness of an entire system, but it can replace a large number of test cases. 
