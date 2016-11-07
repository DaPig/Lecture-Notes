# Lecture 3 -Functional Programming
## Working with lists

## What Is a list?
  -A list contains zero or several values that all have the same type. Order in list matters.

In haskell the syntax for a list is:

```haskell
  5 : ( 6 : (3 : [])) == 5 : 6 : 3 : [] == [5,6,3]
  "Haskell" == ['H','a','s','k','e','l','l']
    type String = [Char]
```  

A list in haskell is built using two constructors. The *empty list []*  and *x* where x extends a list by adding x in front of the list. The natural way to initialize the list in haskell would be:
```haskell
  data List a = Nil | Cons a (List a)
  data [a] = [] | a : [a]
```
There are several operation that can be used on list, the following allows generics.
```haskell
length :: [a] -> Int
(++)   :: [a] -> [a] -> [a]
concat :: [[a]] -> [a]
take   :: Int -> [a] -> [a]
zip    :: [a] -> [b] -> [(a,b)]

map    :: (a -> b)    -> [a] -> [b]
filter :: (a -> Bool) -> [a] -> [a]
```
But there are several other methods that are only defined for specific types.
```haskell
and, or          :: [Bool] -> Bool
words, lines     :: String -> [String]
unwords, unlines :: [String] -> String

sum, product     :: Num a => [a] -> a
elem             :: Eq a => a -> [a] -> Bool
sort             :: Ord a => [a] -> [a]
```
#Live Demo:
We want to implement standard list functions. TO overwrite standard functions we can write:

```haskell
import Prelude hiding ((++),reverse,take,drop,splitAt,zip,unzip)

```

The implementation for the add function *++* we have
```haskell
(++) :: [a] -> [a] -> [a]
[] ++ ys = ys
[x:xs] ++ ys = x: (xs ++ys)
```
This is a recursive function that adds x to the smaller list xs where the "first" element is x.

Ascii cat for reasons.
```
((      /|_/|
 \\.._.'  , ,\
 /\ | '.__ v /
(_ .   /   "         
 ) _)._  _ /
'.\ \|( / ( mrf
  '' ''\\ \\
```

We now have two other functions * cons that adds an element first in a list and snoc that adds an element to the end of a list.

We also want a method that reverses a list:

```haskell
reverse :: [a] -> [a]
reverse []    = []
reverse (x:xs) = reverse xs ++ [x]
```
This is not very efficient, to make it more efficient we can *insert answer here, was to busy adding code cat*

We now want a method *take* that takes the first n elements from a list

```haskell
take :: Int -> [a] -> [a]
take 0 xs = []
take _ [] = []
take n (x:xs) = x:take(n-1) xs
```
Pretty self explainatory. Adds x to a list that contains the element (x+1, .. , n) of the original list.


We write a function that checks if you can take n values from a list.

```haskell
  prop_take n xs = length (take n xs) == n
```



We can also implement our own functions that may help us working with lists, for example. Quicksort.
 *Quicksort*
```haskell
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x1:xs) = qsort smaller ++ [x1] ++ qsort bigger
  where
    smaller = [x | x<-xs, x<=x1]
    bigger  = [x | x<-xs, x>x1]
```
> *Cool story bro...*

However, there is a pitfall in quickcheck  when working with lists


THanks for listening

![](http://i.giphy.com/B3hcUhLX3BFHa.gif]]
