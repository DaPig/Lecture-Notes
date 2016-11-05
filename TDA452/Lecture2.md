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
type Card = (Rank,Suit)
```
Or we use a new datatype
```haskell
data Card = Card Rank Suit
  deriving Show
```
Usually you write a function for inspecting the Rank And Suit
```haskell
rank :: Card -> Rank
rank (Card r s) = r

suit :: Card -> Suit
suit (Card r s) = s
```

If you write the card function like:
```haskell
data Card = Card{rank::Rank suit::Suit}
  deriving Show

```
You don't need these inspection methods, since they are already implemented by default.

We want a function thet derives if a card beats another card
```haskell
cardBeats :: Card -> Card -> Bool
cardBeats {Card r1 s1} {Card r2 s2} = s1==s2 && r1 'rankBeats' r2
```
This can alternativly be written as:
```haskell
cardBeats' card1 card2 =
  suit card1 == suit card2 && rank card1 `rankBeats` rank card2
```

We want to define a Hand, which will either be empty or a *Add Card Hand* meaning a hand
-- Whith the latest card added and the previous hand.
```haskell
  data Hand = Empty | Add Card Hand
    deriving show
```
We want a method that derives if a given hand beats another card.
```haskell
handBeats :: Hand -> Card -> Bool
handBeats Empty card = False -- An empty hand cannot beat nothin'
handBeats (Add c h) card = cardBeats c card || handBeats h card -- Either the card beats the card or the hand does
```
If we want to be able to return the winner card we have

```haskell
betterCards :: Hand -> Card -> Hand
betterCards Empty   card=Empty
betterCards (Add c h) card  | c `cardBeats` card  = Add c (betterCards h card)
                            | otherwise           = betterCards h cards
```

We also want to write a function that picks the card in a hand that can beat a given card.
```haskell
chooseCard :: Card -> Hand -> Card
chooseCard beat hand
    | hand `handBeats` card     = lowestCard (betterCards hand beat)
    | hand `haveSuit` suit card = lowestCard (sameSuit hand (suit card))
    | otherwise                 = lowestCard hand
```
We should implement the following helper methods for this to work
```haskell
  --lowestCard
  lowestCard :: Hand -> Card
  lowestCard Empty = error "empty hand"
  lowestCard (Add c Empty ) = c
  lowestCard (Add c hand) | rank c < rank low = c
                          | otherwise = low
    where
      low = lowestCard h

--sameSuit

```
