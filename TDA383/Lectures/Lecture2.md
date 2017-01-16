# Lecture 2
## Races, locks, and semaphores
### 2017-01-16
In this lecture we want to cover where concurrency can go wrong and how to handle this.

### Races
Concurrent programs are nondeterministic, meaning that different executions may give different results. This is mainly the schedulers fault. Races captures where the computation may go wrong, i.e. the critical sections. A *Data Race* occures when two threas acess a shared memory location an at least one of the threads write to this location. These are usually due to lack of synchronization between the threads.

### Synchronization problems
Synchronization is about making sure that Races does not occur, for example limiting access to a attribute to one thread at a time. When we limit this we make sure that there will be no errors, the best part would therefor be to synchronize everything, but then we would have a sequential program, which we don't want. We therefor want to find the perfect balance.

Correctness is more important than efficiency, we want the program to give the right answer, otherwise it is irrelevant how fast it is.

We want to follow the mutual exclusion principle to solve the mutual exclusion problem. Only one (or more depending on what we use to battle races) thread may enter the critical secion at a time.

When trying to enter the critical section the thread usually have a entry protocol, and when exiting a exit protocol.

We want the program to have mutual exclusion and not getting into a deadlock. We also don't want the thread to suffer from starvation, and therefor want to have a scheduler that has Fairness.

## Locks & Semaphores
The entry and exit protocols for the critical section will have to synchronize the section, for this we can use Locks or Semaphores.

### Locks
A lock is a datastructure used to lock threads. It has two methods *lock()* and *unlock()* and basically does what it is called. When a thread calls the lock method, all other threads may not access the lock untill the first thread releases the lock, or *unlock()*'s it. All the other threads becomes blocked when trying to acess a locked lock. When the lock is released they may continue. Example down below

```java
Lock lock = new Lock();
lock.lock(); // entry protocal
try {
//critical section
} finally {
lock.unlock(); // exit protocal
}
```
This makes sure that all other threads trying to acess the critical section is halted untill it is safe to acess it.

All objects in java have a built in lock which can be accessed via the *synchronized* keyword.

### Semaphores
A semaphore is a data structure that contains a counter and *up()* & *down()* methods. The counter is intendet to show how many resources can be acessed (how many threads can access the resources) at the same time. Here the entry protocal would be *down()* and the exit protocol would be *up()*

When the counter is zero, all threads that tries to access this is blocked untill the counter is at least one again.  The semaphore satisfies the invariant *count>=0*

The difference between locks and semaphores is that locks only allows access to the critical section for one thread at a time, whereas a semaphore allows acess for an arbitrary number of threads.

Semaphores can also be used for creating barriers


# Buzzwords
* Mutual exclusion problem: The mutual exclusion problem is a fundamental synchronization
problem, which arises whenever multiple threads have access to a
shared resource.

* The mutual exclusion property: No more than one thread is in its critical section at any given time.

* Critical Section: The part of a program that accesses the shared
resource (for example, a shared variable)

* Deadlock: The situation where a group of threads wait forever
because each of them is waiting for resources that are held by
another thread in the group (circular waiting)

* Starvation: A situation where a thread is denied access to a resource because other threads get accsess instead.

* Fairness: Every thread has a chance to execute

* Invariant: A property that must always hold between calls to the object methods. For example, a counter must always be >0

* Barriers: A point in the program for which all the threads must reach before they may continue. Making it impossible for some threads to fall to far behind.
