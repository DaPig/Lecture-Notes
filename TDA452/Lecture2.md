# Lecture 2 -Functional Programming
## Modelling & Datatypes

A big part of designing sofware is to model the data in an appropriate way. Today we will look at how to model data via new types in haskell.

* The end goal today is to model a game that can play a card. *

First of all we need to define a model for the cards.
* Every card has a suit *
This can be defined as
```haskell
--Every card has a suit
  data Suit = Spades | Hearts | Diamonds | Clubs
    deriving(Show)
```
The name of types and the constructors should start with an uppercase letter.
The *deriving* keyword defines that the data derives something, like *show* or *eq* or something

A suit has a colour. (Red or black )

First, we want a Colour datatype
```haskell
data Colour = Black | Red
  deriving (Show)
```

The colour method
```haskell
colour :: Suit -> Colour
colour Spades = Black
color Clubs = Black
colour Hearts = Red
colour Diamonds = Red
```
We can shorten this by writing
```haskell
colour :: Suit -> Colour
colour Spades = Black
color Spades = Black
colour s = Red
```
If we change *s* to an underscore *_* the method don't care what the data it recieves is.

There are alternative ways of combining simular cases, check the slides.

The card also have a Rank, this can either be a value between 2 and 10, or a Jack,King,Queen or an Ace.
```haskell
data Rank = Numeric Integer | Jack | Queen | King | Ace
  deriving (Show,Eq,Ord)
```
You can also make this junk free by defining one case for each value.
```haskell
data Rank = N1 | N2 | N3 | N4 | N5| N6 | N7 |N8 | N9 | N10
              | Jack | Queen | King | Ace
  deriving Show
```

We also want to have a method that computes if a Rank "beats" another rank. This function has
-- two arguments and returns a bool. However this method have 25 cases, and the "junk-free"
-- datatype has 13*13 = 169 cases. We reduce the number of cases
```haskell
rankBeats :: Rank -> Rank -> Bool
rankBeats _ Ace = False --Nothing beats an Ace
rankBeats Ace _ = True -- Ace beats anything
rankBeats _ King = False -- nothing lower than a King beats king
rankBeats King _ = True -- king beats everything under
rankBeats _ Queen = False
rankBeats Queen _ = True
rankBeats _ Jack = False
rankBeats Jack _ = True
rankBeats (Numeric m) (Numeric n) = m > n
```
THere is an easier way of writing this, sonce the Rank derives Eq and Order
```haskell
rankBeats :: Rank -> Rank -> Bool
rankBeats r1 r2 = r1>r2
```
We want to be able to return all ranks
```haskell
all_ranks' = [N2 .. Ace]
```

We can now define the card datatype. Either we use a pair of Rank and Suit
```haskell
data Card = (Rank,Suit)
```
Or we use a new datatype
```haskell
data Card = Card Rank Suit
```
