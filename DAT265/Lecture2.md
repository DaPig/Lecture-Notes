# Software Evolution Project
# Lecture 2 - Program Comprehension
### 2018-09-11
---
Program comprehension means that a person understands the program and explain the program with its behavior, structure, effects and so forth in terms that are more than the code. I.e. have a general understanding of the actual program external to the code behavior.

This can be challenging as one needs domain and programming knowledge to understand the program, and also one needs to know that information to abstract away. Further, the system develops and changes over time, thus ones initial knowledge might be incorrect over time.

IN reality, understanding of programs often comes from reading the source code and the comment, one can also use tools and read the documentation etc.

# Techniques
One can use various techniques for program comprehension, these can be split into the following categories

### Code
If the code has good readability, one can read it using program slicing(not often used in practice), walking through the code (rubber ducky Debugging) and systematically reading the code following some techniques

### Architecture
Reverse engineering, the classes and so forth into diagrams to see coupling and cohesion. Visualizing the software etc

### Documentation
Generating documentation (eg. javadoc) and reading already existing documentation


## Reverse Engineering
Reverse engineering is note necessarily disassembling. When reverse engineering one extract aspects of the design, such as the program structure and dependency graphs, this can be challenging if the size of the program is large. This can be done by hand or by some tool, such as Doxygen & GraphViz and Object aid (check slides for more example).


## Role driven design
One can also describe the system using roles. These are

* Information Holder: Databases/ Key stores
* Service Providers: Very specialized classes for some task such as computation, parsing etc.
* Controllers: Decision making classes, often used for complex tasks, delegates work
* Coordinator: Similar to the controller, mostly where to delegate work to other classes, forwards requests.
* Structurer: Typical collection classes, where we store other classes, basically service holder/registry
* Intefacer: GUI related, API, transform converts between layers.

The systematic way of using this is to go through the different classes and give them a role based on a guess (reading the code and give them the role that best explains their behavior).

## Software Visualization
One can visualize software using various graphics, example includes circular bundle views, size of various components relative to one another, code cities (city blocks) etc.


## Documentation
DOcumentation can be generated from source code, for example javadoc which generates documentation on variables and methods with their arguments. 
