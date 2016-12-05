# Lecture 11
## Lazyness

> Starts the lecture by bashing java.

Since Haskell is a lazy language, the order of which things are done in does not matter.

Programs can either have Lazy, Eager and Paralell evaluation. In Eager evaluation the language completes all the subexpressions, one at a time. In paralell, it computes them in paralell. Finally, haskell is a Lazy language.

### What is a lazy language?
A lazy language delays computation untill the result is needed.

Concurrency is a programming style when you have many threads of control, yuo comminucate between these threads, this easily leads to bugs. Paralellism is about running programs on paralell hardware.

Since haskell is lazy, parallelism can be used without worrying about the difficulties with concurrency.
So, in order to implement paralell programming in haskell, we use the Library Control.parallelism

```haskell
par :: a -> b -> b

-----Example-----
f x = par y1 (par y2(y1+y2))
    where
      y1 = heavy1 x
      y2 = heavy2 y
```
Where heavyx functions are heavy computations.

Every language has some lazyness, like the if-else block, where it does not compute else if if is true.

## Coding session
 > All the code is avalable in the Lazyness.hs file.

We can write our own if then else methods in haskell
```haskell
ite b x y = if b then x else y

f n = ite (n==0) 1000 (10 `div` n)
```
