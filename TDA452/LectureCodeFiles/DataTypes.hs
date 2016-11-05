--Code file for Lecture 2 of Functional programming.

-- | Every card has a suit  ♠ ♥ ♦ ♣
data Suit = Spades | Hearts | Diamonds | Clubs
  deriving (Show,Eq)


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
data Card = Card {rank::Rank, suit::Suit}
  deriving Show

example_card_1 = Card King Spades
example_card_2 = Card {rank=Ace, suit=Spades}


-- | A card beats another card when it has the same suit and it beats the rank
-- of the other card
cardBeats :: Card -> Card -> Bool
cardBeats (Card r1 s1) (Card r2 s2) = s1==s2 && r1 `rankBeats` r2


-- | Alternative definition
cardBeats' card1 card2 =
  suit card1 == suit card2 && rank card1 `rankBeats` rank card2


-- | A hand contains zero or more cards
data Hand = Empty | Add Card Hand
  deriving Show

example_hand_1 = Add example_card_1 Empty
example_hand_2 = Add example_card_2 example_hand_1

-- | A empty cand beats nothing. A non-empty hand can beat a card if the first
-- card can, or if the rest of the hand can
handBeats :: Hand -> Card -> Bool
handBeats Empty card = False -- An empty hand cannot beat nothin'
handBeats (Add c h) card = cardBeats c card || handBeats h card

-- | Return the cards that beat the given card.
betterCards :: Hand -> Card -> Hand
betterCards Empty   card=Empty
betterCards (Add c h) card  | c `cardBeats` card  = Add c (betterCards h card)
                            | otherwise           = betterCards h cards


-- helper methods
sameSuit :: Hand -> Suit
sameSuit = undefined


lowestCard :: Hand -> Card
lowestCard Empty = error "empty hand"
lowestCard (Add c Empty ) = c
lowestCard (Add c hand) | rank c < rank low = c
                        | otherwise = low
  where
    low = lowestCard h

haveSuit :: 


-- | Given a card to beat and a hand, choose a card from the hand that can
-- beat the card to beat, if possible.
-- Choose the lowest card that beats the card to beat
-- If you can follow suit, choose the lowest card of the same suit
-- Otherwise, choose the lowest card

chooseCard :: Card -> Hand -> Card
chooseCard beat hand
    | hand `handBeats` beat     = lowestCard (betterCards hand beat)
    | hand `haveSuit` suit beat = lowestCard (sameSuit hand (suit beat))
    | otherwise                 = lowestCard hand
