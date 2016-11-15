# Lecture 6
## State Machines

Pros:
  Easy to sketch, understood by many.
Cons:
Quickly becomes difficult. UML executon sematics not defined.

A finite automata has nodes and transitions(edges), one start node and one or more accepting nodes. And an input and output function.

State machines are based on this.

# What is a state machine?  
A state machine is a "drawing" that shows the transitions between states (nodes). This is very simular to finite automatas.

An event represent something that has happened. This may trigger a transition. These can be timed.

We can have guards. These must be true if a transition is to be performed.

When a transition is taken, the behaviour that is excecuted is called an Effect.
