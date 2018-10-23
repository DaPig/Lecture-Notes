# Exam Prep
## Lecture 4 - Modeling concurrency
### 2018-10-21
---
Concurrency is about parallelizing computation on different threads. the problem that ofter arises with these are the sharing of computational resources. The goal of a spin-style model is about checking and exposing design flaws in concurrent and distributed systems. This lecture is about the former

# Concurrent System
Concurrent systems are hard to predict and there are many different ways these can work, especially since interleaving (changing of active process) are prone to unsafe operations. Deadlocks and busy-waiting are also common problems with these systems. As a programmer one often have very limited control over how these systems should interact, such as scheduling strategies. Which lead us to needing checks to combat possible erroneous behavior.   Spin provides this. The workflow with spin is often as following:
1. Model critical aspects of a concurrent/Distributed system
2. State crucial properties with assertions or temporal logic.
3. Use spin to check these properties.
4. Analyze the result and iterate.

Modeling often includes challenges in
* Expressiveness: Model must be expressive enough to embrace defects in the real ssystem
* Simplicity. Model must be simple enough to be able to be modeled.

IN promela we use *processes* as the main building-block. These uses the keywords *active proctype* where  active instantiates the process. One can also use *init* to start processes by the keyword * run*. One often encloses the processes in an atomic block.
One can also join the processes, i.e. wait for all processes to finish by using
```
(_nr_pr == 1)
```
I.e. only the main thread (init) should run. One can also start multiple processes of the same type by using
```
active [n] proctype P() {...}
  ```

## Variables
  Variables that are declared outside of a process are global and can be used by all running processes. If they are defined within the process block they are local to only that process.

## Modeling aspects
One often wish to model the following:
* Shared memory, the global variables
* Status of shared resources: Like a status of a traffic light
* Communication Mediums: Like global channels


Different processes can infere on global data. Thus it is important to check for possible interleaving failures. Often called checking the critical area of a process.

PROMELA does not provide any synchronization primitives, thus one needs to model these oneself. Instead promela have the concept of executability. These describe whether a statement can be executed. For example an assignment can always be executed but a expression statement can only be executed if any of its alternatives are executable.

A statement blocks if it is not executable and a process block if its PC is pointing to a blocking statement. For each step of an execution, the scheduler selects a process to execute amongst the non-blocking. This is done non-deterministically. This lead to the notation of deadlocks.

### Deadlock
Deadlocks occur when all processes in a set of running processes (!= 0) are blocking. This is defined in spin as a 'invalid end state'. As previously mentioned, valid end states are textual ends and labels. Thus, if no running process are at a valid end state or can continue. We have a invalid end state = deadlock.

# Atomicity
An atomic statement is a statement that cannot be interrupted by interleaving. Atomicity is about limiting the possibility of sequences being interrupted by other processes. This can take the following two forms.

* Weakly atomic sequence: Can only be interupted when a statment blocks. ```atomic{statements}```
* Strongly atomic: Cannot be intterupted at all ```d_step{statements}```.

These two sequences are executable iff the guard is executable.

# Critical Section
A critical section of a code is where interference of other processes can cause problems. We often want
* Mutual Exclusion: Only one process in the critical section at any given time
* Absense of deadlocks. If some process want to enter the critsec, one must eventually succeed
* Starvation freedom. No process waits forever to enter the critical section.

To solve this problem one can use
* Gost variables (verification variables)
* Temporal logic
* Counters of processes in critical section
* Semaphores
