-- | Type classes and instances for exhaustive testing
-- Functional Programming course 2016.
-- Thomas Hallgren
module ExhaustiveTesting where

--------------------------------------------------------------------------------
-- * The class of "small" types

-- | The class of "small" types, e.g. types for which we can enumerate
-- all values
class Small a where values :: [a]

-- | An easy way to enumerate all values of types in both Enum and Bounded
enumAll :: (Bounded a,Enum a) => [a]
enumAll = [minBound .. maxBound]


instance Small ()    where values = [()]
instance Small Bool  where values = enumAll
instance Small Char  where values = enumAll
--instance Small Int where values = enumAll -- finite, but not small...


-- | We consider pairs of small types to be small too
instance (Small a,Small b) => Small (a,b) where
  values = [(x,y)|x<-values,y<-values]


--------------------------------------------------------------------------------
-- * The class for exhaustive test of properties

-- | The class of properties that can be tested exhaustively
class AlwaysTrue prop where
  alwaysTrue :: prop -> Bool

-- | Bool is testable (base case)
instance AlwaysTrue Bool where
  alwaysTrue b = b

-- | Functions with any number of small arguments are testable (inductive step)
instance (Small a,AlwaysTrue prop) => AlwaysTrue (a->prop) where
  alwaysTrue f = and [alwaysTrue (f x)|x<-values]

exhaustiveTest p = alwaysTrue p

-- | Logical implication
infixr 0 ==>
h ==> c = not h || c
