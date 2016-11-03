--Code file for Lecture 2 of Functional programming.

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
  deriving (Show,Eq,Ord)

-- alternative way
data Rank' = N1 | N2 | N3 | N4 | N5| N6 | N7 |N8 | N9 | N10
              | Jack' | Queen' | King' | Ace'
  deriving (Show,Enum)

-- | When does one rank beat another rank?
rankBeats :: Rank -> Rank -> Bool
rankBeats r1 r2 = r1>r2

all_ranks' = [N2 .. Ace']

-- | A card has a rank and a suit
data Card = Card Rank Suit

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
