# Exam Prep
## Lecture 1
### 2018-10-18
---
Software defects and bugs cause big failures, there are a lot of anecdotes that point to this. Engineering is about building failsafe and secure systems, and in computer science these have sorta gone under the radar. This is getting better.

The problem is that software computes non-continuous functions where a small logic operation in the processor may change the behavior of a program completely.
Further, software designs have very high logical complexity and software engineers have been untrained to address correctness.

## Testing
A very common tool for validating behavior of a program is testing. However, testing cannot prove that a program is successful but can just showcase the existence of errors.

Tests can be done in a multitude of ways such as
* Trying to find suitable testing cases (Unit testing)
* Injecting tests (Injection tests)
* etc..
Testing is labour expensive, would be better to just try to mathematically validate system behavior.

# Formal methods
Formal methods are rigourus methods for system design, development and analysis. These uses mathematical rigor.
These may increase confidence in systems by providing tools for exhaustive search and mathematical proof that requirements are fulfilled.

One can use these for analyzing a system and also specifying the requirements.

## Specifying a system
When specifying a system one can define simple properties such as:
* Safety Properties: Something bad will never happen
* Liveness properties: Something good will happen eventually.
* General Properties for concurrency (eg. deadlocks)
* Non functional Properties (execution time)
* Full behavioral specification: Such as data consistency, system invariants etc.


However, the point of formal methods is not to show correctness of an entire system, nor is it about replacing testing or good design practices. But it can replace infinitely many test cases and can guarantee properties.

## Formalizing a system
Formalizing a system is hard. A real world idea will have to be split into formal requirements. There can be misses here, for example by missing to specify requirements about stack size.


As errors in specifications are thus very common, formalization can also help find errors here.

The system implementation description can also be of different levels and expressiveness. If it is more abstract it is easier to simplify, where as if it is more concrete it becomes harder for automated proofs. If it is simple it is easier for automated proofs, where as if it is complex it is almost impossible.  

### proofs
Proofs can be automated or semi-automated.
* Automated Proofs: No interaction required,, proof may fail, needs formal specification by hand
* Semi-Automated proof: Interaction may be required.

In Industry, model checking can be used for hardware and software verifications. 
