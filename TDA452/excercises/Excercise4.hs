import Data.List
import Data.Char
import Data.Maybe
import Test.QuickCheck hiding (listOf)
import System.Random
import System.Directory
import System.IO
import System.Process

--- 0 Basic IO
readAddIntegers ::  IO ()
readAddIntegers = do
  putStr "How many numbers to sum? "
  n <- readLn
  list <- readNInts n
  putStr ("Sum: ")
  print(sum list)

readNInts :: Int -> IO ([Int])
readNInts 0 = do
  return []
readNInts n = do
  putStr("Write an integer: " )
  i <- readLn
  next <- (readNInts (n-1))
  return (i:next)


  -------B
repeat :: IO()
repeat = do
  list <- readUntillZero
  putStr("Sorted List: ")
  print((sort list))

readUntillZero :: IO([Int])
readUntillZero = loop []
    where loop acc = do
          putStr( "Enter a number :")
          i <- getLine
          let value = read i :: Int
          if value == 0
            then return acc
            else loop (value:acc)

------ C


------Monadic helper functions
sequence :: Monad m => [m a] -> m [a]
sequence ms = foldr k (return []) ms
          where
            k m m' = do { x <- m; xs <- ms; return (x:xs) ]

mapM     :: Monad m => (a->m b) -> [a] -> m [a]
mapM f ms = sequence (map f ms)


----3) The number guessing game
game :: IO ()
game = do
  putStrLn("Think of a number between 1 and 100")
  guessNumber 50

guessNumber :: Int -> IO()
guessNumber n = do
  putStrLn ("Is it: ")
  print n
  print  (" ?")
  answer <- getLine
  if answer == "higher"
    then guessNumber (100-((100-n)`div`2))
    else if answer == "lower"
      then guessNumber ((100-(100-n))`div`2)
    else if answer == "yes"
      then putStrLn ("Great! I Won")
      else
        guessNumber n

--- 4) Backup Script,
--Didnt do this

-- 5) Generating List
listOf :: Integer -> Gen a -> Gen [a]
listOf n a
    | n == 0 = a
    | otherwise = (x:(listOf (n-1)))
        where
          x = ([Num y|y<-[0..10]])



prop_listOfLenght :: Int -> Bool
prop_listOfLenght n =  lenght (listOf n) == n
