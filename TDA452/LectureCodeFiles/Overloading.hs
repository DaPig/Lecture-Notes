-- | Examples of type classes and overloading
-- Functional Programming course 2016.
-- Thomas Hallgren
module Overloading where
import ExhaustiveTesting


--------------------------------------------------------------------------------
-- * Defining your own Eq instances

data TrafficLight = Red | Yellow | Green deriving (Show,Enum,Bounded)

instance Eq TrafficLight where
  Red    == Red    = True
  Yellow == Yellow = True
  Green  == Green  = True
  _      == _      = False


--------------------------------------------------------------------------------
-- * Writing your own Show instances

-- | Every card has a suit  ♠ ♥ ♦ ♣
data Suit = Spades | Hearts | Diamonds | Clubs
            deriving (Eq,Enum,Bounded)

instance Show Suit where
  show Spades   = "♠"
  show Hearts   = red++"♥"++normal
  show Diamonds = red++"♦"++normal
  show Clubs    = "♣"

-- | ANSI color escape sequences
red = "\ESC[31m"
normal = "\ESC[m"

-- | Cards have ranks: 2, 3 .. 10, J, Q, K, A
data Rank = Numeric Int | Jack | Queen | King | Ace
            deriving (Eq,Ord)

all_ranks = [Numeric n|n<-[2..10]]++[Jack,Queen,King,Ace]

rankBeats :: Rank -> Rank -> Bool
rankBeats r1 r2 = r1>r2

instance Show Rank where
  show (Numeric n) = show n
  show Jack = "J"
  show Queen = "Q"
  show King = "K"
  show Ace = "A"

data Card = Card {rank::Rank, suit::Suit}
            deriving Eq

cardBeats :: Card -> Card -> Bool
cardBeats (Card r1 s1) (Card r2 s2) = s1==s2 && rankBeats r1 r2

instance Show Card where
  show (Card r s) = show r++show s


example_card_1 = Card King Clubs
example_card_2 = Card {rank=Ace, suit=Spades}

-- | A hand contains zero or more cards
data Hand = Empty | Add Card Hand

instance Show Hand where
  show Empty = "."
  show (Add c h) = show c++" "++show h

example_hand_0 = Empty

example_hand_1 = Add example_card_1 Empty

example_hand_2 = Add example_card_2 example_hand_1

example_hand_3 = Add (Card (Numeric 5) Hearts) example_hand_2


--------------------------------------------------------------------------------
-- * Small instances and examples of properties that can be tested exhaustively

instance Small Suit where values = enumAll

instance Small Rank where values = all_ranks

instance Small Card where values = [Card r s | s<-values, r<-values]


prop_Ace c = not (c `cardBeats` Card Ace Spades)

prop_Face c1 c2 = (isFace c1 && isNumeric c2 && suit c1==suit c2)
                  ==> (c1 `cardBeats` c2)

isFace c = rank c>=Jack
isNumeric c = rank c<Jack

--------------------------------------------------------------------------------
-- * Ambiguity and defaulting

--f s = show (read s)         -- defaulting does not kick in

g s = show (10+read s)        -- with Num constraints, defaulting kicks in


--Defaulting, monomorphism restriction
--answer :: Num a => a
answer = 6*7
