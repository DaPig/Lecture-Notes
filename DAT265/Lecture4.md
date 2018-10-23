# Software Evolution Project
# Lecture 4 - Refactoring
### 2018-10-09
---
Refactoring is changing a existing piece of code such that the structure is changed but not the behavior. This is often intended to make the code better by making it prettier, more efficient or more modular as an example. Refactoring is a series of small transformations preserving transformations. Every change is small so that it is likely not to go wrong. The system should be fully working after each change.

Possible causes for refactoring include, complexity decrease, reducing technical debt, increase readability, prepare the system for later changes and prepare the system for an organizational split. Refactoring is often really good as statistics show that the more refactoring changes, the higher decrease in post release defects we have.

There exist many documented refactoring strategies one can use to refactor common problems. Examples include "Pull up method", "Move method", " Extract class" etc..

## Automation
Refactoring can either be done manually or automatically, a lot of modern day IDEs support the latter and gives functionality for refactoring a lot of patterns. The number of people in a study that did manual versus automated refactoring was about equal, with a preference towards the automated, however, time spent on manual refactoring was much higher than the automated. Thus automated refactoring can be seen as more efficient.

## When to refactor
There are several warning signs one can look at to check when we need to refactor, a common factor is anti patterns. These are common pattern that are bad, and are known to be refactor-able.

There are several programs that can distinguish anti-patterns and fix/propose fixes for them using known refactoring strategies.

The advantage of using ready-made automated refactorings is that the refactorings will be the same all over the system.

## Disadvantages of refactorings
Refactoring also have some risks connected to it. The most common being regression bugs and build breaks, i.e. the system stops compiling. 
