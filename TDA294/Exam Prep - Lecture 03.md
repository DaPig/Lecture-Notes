# Exam Prep
## Lecture 3 - SPIN introduction, Verifying assertions
### 2018-10-21
---
Previously we have used SPIN as a simulator for promela. Today we will start using it as a model checker.

A model checker is used to prove the user wrong by generating a failing trace that disproves whatever we are trying to prove. The search is exhaustive such that if there is a failing trace for the program, this will be discovered. If there is no such trace, we have proven our formula / property.

An exhaustive search means resolving the non determinism all possible ways. These are divided into explicit which resolves if and do statements. And implicit whit resolves scheduling.

## SPIN
Spin generates a verifier written i C++ when it validates a program. This performs the model checking by exhaustively checking our PROMELA model against the specified correctness properties. If the check fails, it provides a failing run/trace. The verifier is called pan.c that is compiled using a c-compiler to the executable pan. Stands for protocol analyzer.

To write a model we want our program to follow we can either use assertions&meta labels inside the model or LTL formulas outside the model.

# Assertions
Assertions are used within a model to describe behaviors. These are described in PROMELA as
```
assert(expr)
```
Where expr is a boolean expression. This triggers an error message if expr is evaluated to false in some state.

Some common commands when doing model checking are:
```
random simulation: spin name.pml
interactive simulation: spin -i name.pml
model checking:
spin -a name.pml
gcc -o pan pan.c
./pan

// If error
spin -t -p -l -g name.pml
```

SPIN is used for software verification that ere used for saftey critical applications. It is distributed freely, actively documented and so forth. ANd is based on a standart theory of automata and linear temporal logic.

# Meaning of Correctness
IF we have a promela model M and a set of correctness properties C_1 .. C_n, where R_M is all possible runs of M. We have, for each correctness property R_M,C_I, which is the set of all runs of M that satisfies C_i. If M is satisfied in all runs wrt. the correctness property, we have that M is correct, if not, we have a set of counter examples.

## Legal and  blocking
A process can block, so long as another process can proceed. But when a process blocks when noone else can proceed, we have a deadlock. This is described in SPIN as a "invalid end state".  If we have a valid end state, the program counters of a process is either at a textual end or a valid end-label "endxxx".
