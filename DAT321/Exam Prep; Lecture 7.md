# Exam Prep; 
## Lecture 7
### INternal Quality I
---
Internal quality is the qualirt of the characteristics inside the pruduct, thus as seen by the developers. As such facilitates the *ease* to move forward on a project. Internal quality is not directly measurable. Internal quality is usually split into two types

* Type I refers to qualyty percieved by the developers, that is ease of understanding, readability etc. very hard to measure as it depends on the developer.
* Type II are more ralated to the intrasinct software parameters, such as size of code, complexity etc. These are not used as they are as they influence type I attributes. THus it is easier to measure type II attributes and make conclusions about type I attributes.

LOC is one measure for type II attributes, however it is not good for quality but as a effort calculator. However there are several ways in which to calculate LOC. COCOMO can be used to calculate avg. man months to create a project of x LOC. Based on type of preject etc.

Effort prediction is nice as well. Like planning poker

### Cyclomatic Complexity
This is a complexity measurment based on calculating the number of lineary independant paths for a method M = Edges - Nodes +2. Mc Cabe gave a threshhold of 10 to be a limit.

### Halsteads Complexity
THe halstead complexity is also a way of measuring complexity, based on operators and operands in the program. Cana be used to measure time, length, depth etc. 
> N1 = Number of total Operators
> N2 = Number of total Operands
> n1 =  Number of distinct operators
> n2 = Number of distinct operands.

* Length = N =  N1+N2
* Program Volume = V = N * log2(n1+n2)
* Program Level = L = (2/n1) * (n2/N2)
* Program Difficulty =D = 1 / L
* Programming effort = E = D * V
* Programming Effort = T = E/18 sec

These are kinda good but does not take other conciderations into account, like fan in etc.

### Henry and Kafura Complexity Measures
Another good complexity measure is the Henry and Kafura Complexity measures. These are based on Fan-IN (number of calls to the given function) and Fan-out(Calls to other methods from given method.) This only considers information flow and not percieve the complexity seen by developers.

### Change Measures
Another measure, based on number of distinc changes, for example number of revisions, number of developers and number of added/removed/changed LOC. Good for locating development areas, not good for internal complexity on it self.

### Block Depth
Describes the level of nesting, deeper than 7 is NOT recommended. 