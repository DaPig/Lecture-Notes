-- | Modelling a Playing Cards
-- Examples to introduce data types in Haskell
-- Functional Programming course 2016.
-- Thomas Hallgren

{-
This is just a skeleton, the definitions will be filled in during
the lecture.
-}

-- | Every card has a suit  ♠ ♥ ♦ ♣
data Suit = Spades | Hearts | Diamonds | Clubs


data Colour = Black | Red
  deriving (Show)

-- | Each suit has a colour – red or black
colour :: Suit -> Colour
colour Spades = Black
colour Clubs = Black
colour s = Red


-- | Cards have ranks: 2, 3 .. 10, Jack, Queen, King, Ace
data Rank = Numeric Integer | Jack | Queen | King | Ace
  deriving Show

-- | When does one rank beat another rank?
rankBeats :: Rank -> Rank -> Bool


--


-- | Alternative, junk-free Rank type
--data Rank' =

--all_ranks' =

-- | A card has a rank and a suit
-- data Card =

--example_card_1 =
--example_card_2 =

-- | A card beats another card when it has the same suit and it beats the rank
-- of the other card
--cardBeats :: Card -> Card -> Bool


-- | Alternative definition
--cardBeats' card1 card2 =


-- | A hand contains zero or more cards
--data Hand =

--example_hand_1 =
--example_hand_2 =

-- | A empty cand beats nothing. A non-empty hand can beat a card if the first
-- card can, or if the rest of the hand can
--handBeats :: Hand -> Card -> Bool

-- | Return the cards that beat the given card.
--betterCards :: Hand -> Card -> Hand

-- | Given a card to beat and a hand, choose a card from the hand that can
-- beat the card to beat, if possible.
-- Choose the lowest card that beats the card to beat
-- If you can follow suit, choose the lowest card of the same suit
-- Otherwise, choose the lowest card

-- chooseCard :: Card -> Hand -> Card
