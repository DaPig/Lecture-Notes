# Software Evolution Project
# Lecture 3 - Clone Detection
### 2018-09-25
---
Clones are a common occurrence in programming and may be created during the development process, these may be created due to limitations, such as time. System complexity, limitations in languages, new code addition, copy-and-paste-programming and so forth, i.e. duplication can occur because of many factors.

Code duplication/clones are bad because maintenance becomes harder due to propagating bugs, complicates the program design, impacts system performance in the worst cases most in the area of software size, such as embedded programming. These may lead to increased costs in both maintenence and new additions as the old code might contain so much technical debt that it inevitable becomes unreasonable to continue on with the code without refactoring, thus halting the progress and reducing revenue.

However, cloning can sometimes be a positive thing as well. For example, it might be less complex to just clone code than to include abstractions and the language might not have abstraction functionality.

There are various types of clones

# Types of clones
There are 4 types of clones
1. Exact clones.The code is the exactly the same but in different places, may contain difference in whitespaces and comments.
2. Renamed parameterized clones. Syntactically similar, but identifiers and layout and types might be different.
3. Near miss clones, added statements, otherwise the same.
4. Semantic clones, same behavior but different implementation.


## Techniques for detecting clones
We can use algorithms for detecting code clones, for example with sonarqube. There are several techniques, such as text-based, token-based, metric-based, tree-based and graph-based. All of which are suitable for some specific type(-s) of clones.

* Metric Based clone detection: This consists of calculating a metric for the code fragments to eventually detect type 1,2 and 3- clones. Example on metrics are names, layouts, expressions and control flow. All to check if they are near miss, not very precise though.

* Tree based clone detection: Uses syntax trees and calculate whether blocks of code are clones using a similarity measure on the sub tree (based on the syntax node and their sub trees, i.e. words). These are suitable for type 1,2 and 3 - clones as well. However, if the order of the statements in the clones are different, this algorithm does not work at all.

* Graph based clone detection: We generate a dependency graph on control and data flow, then the clones becomes isomorphic subgraphs. Here the order of the statements does not matter. Suitable for type 1,2, and 3

## Refactoring
When we have found clones in our program, we can choose to refactor these to minimize potential increase maintenance cost. Examples on how one were to do this is to make the duplicated code a higher abstractions such that we only have one method that accept a wider array of input than having  a large set of methods that have the same but different types on input.

# Code classification for classification decisions
On can use models to describe the clones, these comes with proposed solutions to solve the errors. An example of such a model are Golomingis Taxonomy.




# Code Clone Evaluation
Evaluation how big a risk one of these clones poses can be done grouping these clones together and via propagating these clones see how the evaluation becomes. In this methodology we group kinds of clones into specific scenarios. These are

1. In the same method: Two pieces of code are the same in the same method. To solve this, extract the method or parameterize it.
2. In the same class: Two methods in the class contain the same code. To solve this, extract the method, insert method call, parameterize or form template method.
3. With a sibling class: Methods are the same in sibling classes. To solve this, pull up method to parent, parameterize, extract method, template method, replace subclass with a field and substitute algorithm.
4. With the superclass: A class and the superclass are duplicates. To solve: Insert super call, parameterize, pull up methods, push down methods and form template methods are suitable refactoring techniques.
5. With an Ancestor: A class inherits from a class but not directly and are clones. To solve; extract the method, parameterize, pull up method or form template method.
6. With a first cousin: Classes duplicated are in the same hiearchical level and superclasses are siblings. To solve, parameterize, extract superclass, form template methods and pull up method are suitable.
7. In common hierarchy: Same root class but on different hiearchical levels. To solve duplications, suitable techniques are; pull up methods, parameterize, extract method, form template methods and extract superclass.
8. In unrelated classes: Totally unrelated classes: This one is harder, if the method is more suitable in one of the classes, the other one could call this. 

When one have classified a clone into one of these scenarios, one cal also use the proposed measure to refactor them.

---

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
