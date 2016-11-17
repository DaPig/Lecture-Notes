#Lecture 4
## Higher order functions

## What is a higher order function?
> The higher order functions can be seen as the heart and soul of functional programming.

A higher order function is a function that takes another function as an argument. Examples of this is the *even* and *map* functions.

The syntax for a hiher order function is as follows:
```haskell
functionName :: (a->b) -> n
```
Where the parameter is a function and n is some form of datatype. You can also have an function as a return type.

# Live Demo
We start by defining a few functions of the first order:

```haskell
sum :: Num a => [a] -> a
sum []      = 0
sum (x:xs)  = x + sum xs

product :: Num a => [a] -> a
product []      = 1
product (x:xs)  = x * product xs
```
In these methods we combine the elements with some operator. They have different base cases and operators.

We want to factor out the differences:

```haskell
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr op base [] = base
foldr op base (x:xs) = x `op` foldr op base xs
```
foldr is a reduction method. We use it to simplify the definitions of sum and product
```haskell
sum   xs = foldr (+) 0 xs
product xs = foldr (*) 1 xs
-- this is useful in other cases aswell!
or     xs = foldr (||) False xs
and    xs = foldr (&&) True xs
concat xs = foldr (++) [] xs

maximum (x:xs) = foldr max x xs
```
foldr is a recursive method that takes the base case, the operator and a list as parameters

We can pass functions as arguments, either by defining a helper functions such as foldr.

Operators can also be used as functions by omitting one operand
```haskell
(*3) 5 == 15
map (*3) [1..5] == [3,6,9,12,15]
filter (>3) [1..5] == [4,5]
filter (3>) [1..5] == [1,2]
```
We call this "sections"

We can also use function compostition

 (f . g) x = f (g x)

```haskell
removeSpaces "abc def \n ghi" = "abcdefghi"
removeSpaces s = filter (not . isSpace) s (from module Data.Char)
```
We can also write anonymous functions if we only want them on one place

```haskell
f3 xs = foldr snoc [] xs
  where snoc y ys = ys++[y]
```
