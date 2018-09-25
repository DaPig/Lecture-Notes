# Software Evolution Project
# Lecture 3 - Clone Detection
### 2018-09-25
---
Why do clones occur, they occur because of limitations, system complexity and so forth, i.e. duplication can occur because of many factors. Code duplication is bad because maintenance becomes harder due to propagating bugs, complicates the program design, impacts system performance in the worst cases most in the area of software size, such as embedded programming.

There are various types of clones

# Types of clones
1. Exact clones.The code is the exactly the same but in different places
2. Renamed variables/parameters, otherwise the code is the same.
3. Near miss clones, added statements, otherwise the same.
4. Semantic clones, same behavior but different implementation.

We can use algorithms for calculating code clones, for example with sonarqube. THere are several techniques

* Tree based Search: Uses syntax trees and calculate whether blocks of code are clones using a simularity measure on the sub tree (based on the syntax node and their sub trees, i.e. words).
* Graph based.

# Code classification for classification decisions
On can use models to describe the clones, these comes with proposed solutions to solve the errors.


# Fransisco time, Testing Framework and Continuous integration
There is a lot of research done in this area, we will today focus on three different frameworks for auto-generation of tests and a continuous integration pipeline.

Referring back to the V-model we have different abstraction levels of a software and each level have a corresponding test area. For example `System Requirements -> System Test `. Often we care a lot about the system and acceptance test as these are the ones that the customer cares about.

## CI and Coverage
Jenkins is an automation system. Maven is a project build system.

In a project we have Production code and test code, `you gotta keep 'em separated`. I.e. these should never mix. Further, a common programming practice, TDD consists of writing the code and testing locally, but in a CI-system we want to test all of this centrally, i.e. we test everyones part to see if they integrate correctly with one another. We need tools for this, and as we want to do this often, we need this to be automated.

We as such need something that automatically build the project and an automation server. A common combination here is Jenkins and Maven. These need to be connected to our project specifics, for example git and java.  We need to configure Jenkins and install a bunch of plugins. Then we create a project (pipeline is cool but not used).

Maven uses surefire to generate the report, we can add these as a post-build action to get some statistical data for the different builds.

## Automatic Generation
## Combining Both of these
