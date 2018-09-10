# TDA294: Formal Methods for software development
## Lecture 2
### 2018-09-06
---
# Introduction to PROMELA
One of the programs we will work with this course is called PROMELA one can create programs in this and then defines system properties this should follow, then one can use a model checker to validate the properties. Promela models concurrent programs, both with shared memory and message passing, i.e. processes and threads. There are also few control structures and fixed size data structures.  It is however, not a programming language.
The syntax used is simular to C. No semi columns terminators though.

If some choices overlap in a if-statement, it is random which will be invoked.

Programs in promela can sometimes have overlapping guards, in that case the programs are not trivial/deterministic.Guards are defined by double columns as in the following

```
int a = 10
int b = 10
int catVal
if
  :: a >= b -> catVal = a
  :: b >= a -> catVal = b
fi
```
Which is chosen is random since they overlap

There are several datatypes available, such as byte, short, int unsigned with various operators. There also is a enum type called mtype, however, no floats.

One can also define loops with do/od keyword. These are broken using else like follows
```
#define maxRoof 9
active prototype SumToNine() {
  int sum = 0; byte = 1;
  do
      :: i > maxRoof -> break
      :: else -> sum = sum + i; i++
  od
}
```
Spin now also supports for-loops, arrays, record types (sorta like classes.) and jumps in program behavior to labels. (using keyword ```goto```)

Since overlapping guards are random. spin can be non-deterministic in generation of random values, or using the select keyword.

Spin also supports non-determinism using concurrent processes. These uses the keyword ```proctype```. One can also create sets of identical processes.

Atomic actions (actions that cannot interleave, for example assignments) are used to control behaviour. 
