# TDA294: Formal Methods for software development
## Lecture 14 - Verification of Method Calls and Loops
### 2018-10-23
---
This is the final lecture. Today we wrap up the them of deductive verification.
Today we focus on verification of loops and method calls.

When doing the calculus for a program we decompose statements into simpler statement (like expanding syntactic sugar).
When doing symbolic calculus we also branch on the if-statements to cover all cases.

Program variables and variables defined in the project are not the same, the latter are logical variable.

What key does in a method call can be seen in the slides at page 4->5.

Java has complex rules for localization of methods and fields, eg. overloading and scoping.

Spin splits the method into possible types on method expand. There are limitation on method inlining, for example missing source code, multiple method invocations, failure to handle unbounded recursion and so forth. If this is the case, we use the method contract instead and "skip over" the actual method call. We assume the ensures clause, i.e. assume the postcondition.

Slide 11. U is the state when we reach the method call. We keep the pre-state aspects that cannot me changed using the anonymizing function.
Basically we erase/hide the locations on the heap that contain the assignable items.


This can also be extended to the exception specification case, i.e. we only know the method throws something, but not when. Then we change the method call for the throwing of an exception.
