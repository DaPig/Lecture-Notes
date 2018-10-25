# Exam Prep
## Lecture 14- Reasoning about Programs with Loops and Method Calls
### 2018-10-24
---
Decomposing loops and method calls in dynamic logic is a complicated business. Our semantic calculus realizes a symbolic interpreter where we do decomposition of complex statements into simpler ones.

## Method Calls
When the interpreter reaches a method call, it declare a new variables, look up the implementing class of the method and replace the method call with an implementation invocation.

There are however some limitations to the method expand. For example, the actual source code may be unavailable, the method is invoked multiple times and the interpreter cannot handle unbounded recursion. To overcome this we can use the method contract instead and just expect that the method fulfills its contract. We must show that we fulfill the preconditions though. To do this we anonymize the assignable clause, i.e. since we don't really know how these change we "hide" them instead.


## Loops
Loops are also complicated, once we have more than a few iterations, unwinding becomes hard. Thus we instead want a loop invariant so we can use that contract instead of the actual loop.
The loop invariant must hold before the loop, during the loop and after the loop.
We also anonymize javas locations for the assignable here.

we also needs a decreasing term for this.<
