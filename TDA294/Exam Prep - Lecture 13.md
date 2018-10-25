# Exam Prep
## Lecture 13 - Proof Obligations
### 2018-10-24
---
This lecture is about proof obligations, i.e. making the connection between JML and Dynamic logic/key. I.e. generating, understanding and proving programs.

# Normalization
We need to normalize JML contracts. I.e. normal and exceptional behaviour is translated into general specification cases. For example, the former is translated to signals false and the latter ensures false. Further, where nullable is absent, o != null is added to the precoditions as a invariant. An example of a translated case is shown below

```
/*@ public normal_behavior
  @ requires ...
  @*/

  becomes

  /*@ public behavior
    @ requires ...
    @ signals (throwable exc) false
    @*/
    ```
    An another example is the pure modifier that adds *assignable \nothing diverges false*.

    It also concatinate requires clauses.

## Translating JML to intermediate format
JML is also replaced with generalized statements on the operators.

For example ```
+ -> javaAddInt
this -> self
```
Class invariants also get translated to predicate object::<inv> that are applied to the heap.
Old is evaluated in the prestate of a method.
The assignable clause is translated to a term of Locationset or becomes strictly nothing.
