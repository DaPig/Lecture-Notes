# Lecture 7
## Overloading and type classes
Many programming languages have some sort of overloading, often only for built in classes. Haskell takes this a step further.

```haskell
(*) :: Num a => a -> a -> a
square x = x* x
square :: Num a => a -> a
```
the function square inherits the overloading of the operator. It will also work on any type in the Num class.

To overload you create a type class declares a set of overloading functions. For example *Num*. You can choose to implement these methods later.

```haskell
class Num a where
   (+), (*), (-) :: a -> a -> a
   negate, abs, sigum :: a -> a
   fromInteger :: Integer -> a
   -- ...
```
Instance declarations provides implementation for the overloaded functions for a specific type, here for Int.
```haskell
  instance Num Int where -- ...
```
The eq class uses this for almost every predefined types.

```haskell
class Eq a where
  (==), (/=) :: a -> a -> Bool

  a/=b = not (a==b) -- default implementation
  a==b = not (a/=b) -- default implementation

instance Eq Int    where -- ...
instance Eq Double where -- ...
instance Eq Char   where -- ...
-- There are instances for almost all predefined types

```
If you want you can define your own instances for the eq function
```haskell
data Glass = Half_Full | Half_Empty | AndHisNameIsJohnCena

instance Eq Glass where
  Half_Full   ==  Half_Full    =   True
  Half_Empty  ==  Half_Empty  = True
  ..
  ..
```

Another example is testing pairs & lists
```haskell
instance (Eq a,Eq b) => Eq (a,b) where
  (x1,y1) == (x2,y2) = x1==x2 && y1==y2

instance Eq a => Eq [a] where
[]   == []   = True
x:xs == y:ys = x==y && xs==ys
_    == _    = False
```

Kinda self explainatory. The pair testes the element in the correct order. THe list compares empty lists, and recursivly testes elements if it is not empty.

A subclass to Eq is the Ord class. So all instances of Ord class is also an instance of the Eq class.

Instances of the  Enum class can be enumerated. so for example:
```haskell
[1..5] == [1,2,3,4,5]
```
Bounded classes are classes that have a specific range of values. For example Booleans.

The Show and Read classes reads an input and converts it to the type defined.

You usually don't have to write your own implementations of instances of these standard functions. You can derive them.
```haskell
data Suit = Spades | Hearts | Diamonds | Clubs
        deriving (Eq,Ord,Show,Read,Enum,Bounded)
```
But you can choose to implement your own instances.
```haskell
data Suit = Spades | Hearts | Diamonds | Clubs
            deriving (Eq,Ord,Enum,Bounded)

instance Show Suit where
  show Spades   = "♠"
  show Hearts   = "♥"
  show Diamonds = "♦"
  show Clubs    = "♣"
  ```

If you define your own class and want to test this. Exhaustive testing is better than random testing. However. This is only practical for small arguments.


Type classes in haskell is used to overload functions. Not to describe objects like in OOP.

# Test data generators.
We have previously looked at IO. These methods has IO() as a return type and are *unpure*.
IF we want to test something we can use QuickCheck. This generates data for testing. QUickcheck uses a Gen type for generating data. This usually has instances for most predefined types. We can use the keyword sample for sampling generated data via a predefined class.
```haskell
arbitrary :: Arbitrary a => Gen a

sample   :: Show a => Gen a -> IO ()
sample'  :: Gen a -> IO [a]
generate :: Gen a -> IO a

sample(arbitrary::Gen Bool)
```
The functions for generating can be as follows:
```haskell
elements  :: [a] -> Gen a
oneof     :: [Gen a] -> Gen a
frequency :: [(Int,Gen a)] -> Gen a
listOf    :: Gen a -> Gen [a]
vectorOf  :: Int -> Gen a -> Gen [a]
choose    :: Random a => (a,a) -> Gen a
```
These uses functions from module System.Random

Say we want to write a functons that generates a suit. We can write as follows
```haskell
data Suit = Spades | Hearts | Diamonds | Clubs
          deriving (Eq,Show)
----------------------
rSuit :: Gen Suit
rSuit = elements [Spades,Hearts,Diamonds,Clubs]
```
We use the method *elements* for this.
Or a rank
```haskell
data Rank = Numeric Integer | Jack | Queen | King | Ace
            deriving (Eq,Show)
------------------

rNumeric :: Gen Rank
rNumeric = elements [Numeric n|n<-[2..10]]

rFaceCard :: Gen Rank
rFaceCard = elements [Jack,Queen,King,Ace]

rRank_v1 :: Gen Rank
rRank_v1 = oneof [rNumeric,rFaceCard]

rRank :: Gen Rank
rRank = frequency [(9,rNumeric),(4,rFaceCard)]
```

If we now want to generate a card we want to generate a rank and a suit using our methods above.
```haskell

rCard :: Gen Card
rCard = do r <- rRank
           s <- rSuit
           return (Card r s)
```
Finally, we want to generate a hand
```haskell
data Hand = Empty | Add Card Hand
            deriving (Eq,Show)
-----------------_
rHand :: Gen Hand
rHand = oneof [return Empty,
               do c <- rCard
                  h <- rHand
                  return (Add c h)]
```
We can check if the generated data tests all the important cases
```haskell
prop_all_validRank_3 r = collect r (validRank r)
```
Where validRank is a function that checks if a rank is valid.

We can also change the probability of generated cases. For example increase
the probability that a non empty hand is created
```haskell

rHand :: Gen Hand
rHand = frequency [(1,return Empty),
                   (4,do c <- rCard
                         h <- rHand
                         return (Add c h))]
```
We can also test ordered lists. But we are not going to do that here. 



That's all. Good work

![](images/pingu.gif)
