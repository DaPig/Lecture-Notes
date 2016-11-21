# Lecture 8
## Abstract Data types & Recursive Data types.
The reverse method as given below is not very efficient. Since it calls (++) many times and have to "iterate" the entire list every time.
```haskell
reverse :: [a] -> [a]
reverse [] = []
reverse (x:xs) = reverse xs ++ [x]
```
If we check the computaional time for this we can see that it is high. For example; summing the numbers between 1 and 10000 takes 0.01sec and 2,633,512 bytes, whereas reversing the sum from 1 to 10000 takes 1.56 secs and 4,455,178,368 bytes. Which is conciderably higher.

*We can do this faster.*

```haskell
reverse :: [a] -> [a]
reverse xs = revOnto xs []

-- revOnto xs rs = reverse xs ++ rs
revOnto :: [a] -> [a] -> [a]
revOnto []     rs = rs
revOnto (x:xs) rs = revOnto xs (x:rs)
```
This gives the time of reversing the sum mentioned above of 0.89 secs and 386,901,184bytes. Which is much better.

## Data structures.
Data structures are a way of storing data, some are better than others for specific tasks.
FOr example the queue. Enters at the back. Leaves at the front.
This has the interface
```haskell
data Q a                    -- the type of queues

empty   :: Q a              -- an empty queue
add     :: a -> Q a -> Q a  -- add an element at the back

isEmpty :: Q a -> Bool      -- check if the queue is empty
front   :: Q a -> a         -- inspect the front element
remove  :: Q a -> Q a       -- remove an element from the front
```
And a possible implementation:
```haskell
data Q a = Q [a] deriving (Eq,Show)

empty              = Q []
add x   (Q xs)     = Q (xs++[x])

isEmpty (Q xs)     = null xs
front   (Q (x:xs)) = x
remove  (Q (x:xs)) = Q xs
```
If we check the efficiency for the queue it's not very efficient.
Maybe use two lists? One for the front of the queue and one for the back like;

```haskell
data Q a = Q [a] [a] deriving Show

empty                = Q [] []
add x  (Q fs bs)     = Q fs (x:bs)

isEmpty (Q fs bs)    = null fs && null bs

front (Q (f:fs) bs)  = x
front (Q []     bs)  = head (reverse bs)

remove (Q (f:fs) bs) = Q fs bs
remove (Q []     bs) = Q (tail (reverse bs)) []
```
We want to make the constructor smart. SO that the front is never empty during construction.
```haskell
smartQ [] bs = Q (reverse bs) []
smartQ fs bs = Q fs bs
```
With the methods:
```haskell

empty                      = smartQ [] []
add x   (Q front back)     = smartQ front (x:back)

isEmpty (Q front back)     = null front
front   (Q (x:_) _)        = x
remove  (Q (x:front) back) = smartQ front back
```
THis is more efficient.

If we want to hide implementation details we can use a *Module*
```haskell
module Queue(Q,empty,add,remove,front,isEmpty) where

data Q a = Q [a] [a] deriving Show

empty = smartQ [] []
-- ...
-- ...
```
WE export the data type Q but not the constructor.

# Part 2
## Recursive Data types.


>Didn't listen to about 25% of the lecture because my computer crashed and was being a b*itch. Sorry

![](images/horsie.gif)
