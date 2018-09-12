# TDA294: Formal Methods for software development
## Lecture 4 - Modeling Concurrency
### 2018-09-11
---
Today we will talk about shared memory concurrency. Concurrent processes strive to not get into each others way, such that deadlocks similar incidents occur. The problem here is to manage the shared computational resources.

SPIN can be used to model both concurrent and distributed systems. Various system behaviors change how well the concurrent system work. Items such as communications speeds on network, scheduling strategies and so forth all influence how well the system work.

Using spin to analyze the systems are very similar to that of a single program. One firstly create the model, then state the crucial properties, chek all possible runs using spin and then analyze, eventually re-modelling and starting again.

using the keyword ```run```starts the process explicitly. Running processes should be done within an ```atomic``` block. One can also use a built in variable ```_nr_pr``` to check the number of processes being run to simulate the join()-behavior of Java.

PROMELA have no synchronization primitives, such as semaphores or locks.  But PROMELA have a concept of executability, i.e. some things can sometimes not be able to be executed. Thus, synchronization primitives can be modeled using executability and atomicity,

Each statement have a notion of executability, enteties such as assignments and assertions are always executable while expression statments are not.

A statment blocks if it is not executable and the process stop if the program counter points to a blocked statement.

An example of this is shown below

```
bool locked = true;
locked == true // Blocks
```
If we also introduce the notion of atomicity we have weak atomicity, i.e. can only be interrupted when a stament blocks and strong atomicity, i.e. cannot be interrupted at all.

### d_step
This introduces a deterministic sequence and he choices are handled as a single step, if the first statmenet blocks the rest are not run att all while if any other blocks an error is thrown.

the keyword atomic is very similar but gives weak atomicity. 
