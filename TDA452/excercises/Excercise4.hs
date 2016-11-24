import Data.List
import Data.Char
import Data.Maybe
import Test.QuickCheck
import System.Random
import System.Directory
import System.IO
import System.Process

---How the fuck do I do part 1?

look :: Eq a => a -> [(a,b)] -> Maybe b
look x []           = Nothing
look x ((x',y):xys)
  | x == x'         = Just y
  | otherwise       = look x xys

-- 1


--3
readSequence :: IO()
readSequence = loop 0 100
        where loop ::  Int -> Int 45 =  do
                putStrLn "Think of a number"
                loop


guess :: Int -> Int -> Int
guess low high = (high-low)/2
