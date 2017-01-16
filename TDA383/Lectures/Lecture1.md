# Lecture 1
## Introduction to concurrent programming
### 2017-01-16

Up untill now, we've mostly written sequential programs, i.e. Programs that do things in a predefined order. We now want to start writing concurrent programs. These programs executes paralell and can therefor be quicker than their sequential equivalent.

### Concurrency vs. Paralellism
Concurrency is making several processes run side by side on a single processor whereas Paralellism is splitting the processes to run on multiple processor cores.


### Why would we want Concurrency?
Writing concurrent programs enables us to separate different tasks and therefor not worrying when these will be run, it also makes responsiveness (doing something in the background when the user does something else) avalable. As well as making the program faster.

### The death of mores law.
Mores law does not apply for the clock speed of the processor nowadays, only for the number of transistors on the chip. Therefor we get more and more cores with the same clock speed instead of getting higher speeds. Therefor Concurrency is important. However, we can not expect the program to run faster just because we have more cores, it all depends on how much of the program that can be made concurrent, as per Amdahl's law.

### Terminology.
Tasks are split into processes or threads that are supposed to be run separately, which one that is to be run at a specific point of time depends on the scheduler.

### Threads vs processes.
A thread has a local memory space which is only used in the thread, but it also have a global memory space which is shared between threads. For example, attributes (in java). Processes only has local memory, and can communicate between one another via message passing.

### Threads in java
In java, threads are written by implementing the *Runnable* interface, and therefor have to implement the *run* method. The threads can have different states

```java
public class Test implements Runnable {...}
Runnable t = new Test();

t.start(); // Starts the thread, makes it ready for execution
t.sleep(n) // makes the thread blocked for the time given (in milliseconds)
t.wait(); // Blocks the thread untill it is resumed.
t.join(); // Blocks the current thread (eg. the main thread) until t is done.

```

### Evaluate concurrency
When we want to check how a concurrent program works we can write a trace for the execution.


# Buzzwords
>Words related to this lecture.

* Concurrency: Making programs/ part of the program run concurrent, i.e. side by side on a piece of hardware.
* Paralellism: Same concept as concurrency, however making the program run concurrent on multiple prcessors (or cores)
* Threads: A way to split up a part of the programs, can be run in paralell. Have a local and a global memory space. Have three states: Blocked, Ready and running.

* Amdahl's law: A law that specifies how much faster a program can get if it is converted into a concurrent program given how much of the program that can be turned concurrent. And is as follows:
```latex
max speedup = 1 / ((1-p)+ (p/n))
```
Where p is the percentage of the program that can be made concurrent and n is the number of cores.

* Moores law: A "law" that states that every two years the number of transistors on a given chip with a given size will double, as well as the computational power for this chip will double. The latter one is not true anymore.

* Process: An independent unit of execution, only have a local memory space. Can communicate between one another with messege passing.

* Scheduler: Scheduals when different processes/ Threads will be run.

* Traces: The sequence of the states of a part of the program gices a trace on how the object changes state and how threads may interact with this object.
