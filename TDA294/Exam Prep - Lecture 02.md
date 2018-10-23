# Exam Prep
## Lecture 2 - Introduction to PROMELA
### 2018-10-18
---
Promela is a meta language to model concurrent systems. These contain multi-threaded systems with shared memory or message passing. It is NOT a programming language, thus it does not contain any GUI, libraries, floats and so forth. It is nondeterministic.

In promela one can model different processes. The various keywords are below

```
proctype = new process
int, byte, bit, short, unsigned = data types
+,-,*,%,.. = operators
bool, true, false = Booleans
mtype ={a,b,c} = Enumerations
; , ->= separator
```
Note, bool with true and false exist but are just syntactic sugar for bit with 0 and 1. Semi colon is a separator and not a line terminator.

Other guards

```
if/fi = If statements
else -> if no if is true
:: = guards, may overlap true guards are randomly selected.
do/od = Loop, only way to break is break or goto
break = breaks Loop
goto = goto label
for (i : low..high){} = loop from low to high
  a[] = array
  typedef{} = Record type
    select(row, low..high) = Select random between low and high to row
```

Commands/Flags in spin are the following
```
-v = trace of random simulation of multible runs
-v -l = trace with local values of variables
-g global variables
```

In promela, all variables are initialized, no input is available. All states are either blocking or have one successor state. Non-trivial promela programs are non deterministic. The non determinism can be a cause of the scheduling of the concurrent processes.

## Atomicity
A statement that is executed without the possibility for interleaving is called atomic. In PROMELA this includes assignments, jumps, skips and expressions. One cal use the *atomic* keyword to prevent interleaving, but this may still lead to interleaving.


# Why PROMELA?
We use promela to model the essential features of a given system, where we abstract away and simply some aspects. We also use fixed-size data structures. Thus we need to select what properties of a system we want to model and that the system should satisfy, such as absense of deadlocks and starvation etc. We then verify that all possible runs of this system satisfies these properties. 
