# Exam Prep
## Lecture 10 - Java Modeling Language, Part 2
### 2018-10-23
---
As previously mentioned, JML extends the Java modifiers with some additional parameters

### spec_public
As public specification cases only can access public parameters, the spec_public modifier allows the public specification case to also access protected entities.
```
private /*@spec_public@*/ int ...
```

### pure
Pure methods are methods that can run and do not change any state (example, exist method). The keyword *pure* is a specification keyword thate states that a method do not have any side-effects. A method is strictly pure if it do not create any object additionally.
This implies *asssignable \nothing*.

### nullable
Allow a variable to take the value null

### non_null
Cannot be null.

# JML Boolean Expressions
JML includes all java boolean expression and also extend these with implication, equivalence and quantification. Examples follows.
```
a ==> b // A implies b
(\forall t x; a) // For all x of type t, a holds
(\exists t x; a) // there exists an x of type t such that a.
```
If one specifies a; b in exists or forall. a is called a range predicate, and used to restrict range of x further than t. For example in an array

```
(\forall int x, j; x>0 && x<j && j<100; arr[i] < arr[j])
```

# Generalized QUantifiers.

JML also provides generalized quantifiers. These are
```
\min
\max
\product
\sum
```

One can also use *\result* to refer to the return value of a method.

## invariants
One can use invariants on variables/arguments to specify how they will look, for example specifying that a array should be sorted. These invariants can be static (cannot refer to this *static invariant*) and instance invariants (can refer to this *instance invariant*.)  Both of these can refer to static fields. And instance fields (o.size).  Invariants can also be class invariants. One can specify invariants for a type by using *\invariant_for(object)*. and require these.

### helper
Helper methods are used for structuring implementation of public methods.

## Exceptional Behavior
A specification case of exceptional behavior allows for throwing exceptions. By using the signals_only

### Termination
We can also allow for non-termination by the keyword ```diverges true;```
