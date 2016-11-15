# Lecture 6
## Input/Output

We did a word counter last week. We want to write a standalone program for doing this. Not just one we test in ghci.
### Standalone programs
A stand-alone haskell program should have a main function
```haskell
module Main where

main :: IO ()
main = (...)
```
THe first line can be skipped, since this is filled in by default.

*IO ()* represent IO functions.
For example:
```haskell
putStr   :: String -> IO ()
print    :: Show a => a -> IO ()
interact :: (String->String) -> IO ()
```
These imply that we will print something.

So if we take the wordCount program from last week. We take the function *interact* to be able to handle input
```haskell
module Main where
main = interact wordCounts

countWords :: String -> String
countWords = unlines .
             map (\(n,w)->w++": "++show n) .
             reverse .
             sort .
             map (\ws->(length ws,head ws)) .
             group .
             sort .
             words
```
We compile this via the
```
ghc --make countWords.hs
```
This compiles the program and makes it excecutable.

-------------------
In haskell, functions are pure. MEaning that if you put the same data into a function you will always get the same answer. There are no side effects.


The functions is equal and interchangable, for example
```haskell
map f (xs++ys) == map f xs ++ map f ys
```
Like math

We have some default input functions in haskell
```haskell
getLine
writeFile
readFile
```
However, if we look at some impure function in haskell, like
```haskell
putStr    :: String -> IO ()
getLine   :: IO String
writeFile :: FilePath -> String -> IO ()
readFile  :: FilePath -> IO String

type FilePath = String
```
All of theese have IO as a result. These are not pure since the input can change from time to time

We can however use these IO result in Haskell
The left arrow *<-* allows us to access the result of an IO function.s
```haskell
s <- readFile "hello.txt"
```
We can't write = because readFile is not pure.

We can use these arrows in functions by using the do notation
```haskell
showTheDifference :: IO ()
showTheDifference = do putStrLn "Enter two numbers:"
                       x <- readLn
                       y <- readLn
                       putStr "The difference is: "
                       print (x-y)
```
This uses the functions
```haskell
readLn   :: Read a => IO a
print    :: Show a => a -> IO ()
putStr   :: String -> IO ()
putStrLn :: String -> IO ()
```
We can also use IO and return the result by the keyword return  

Haskell is a pure language, but it still has unpure functions in the form of IO functions. These are defined by the IO type
You cannot hide the IO call. Uou have to use the *do* keyword to get acess to input in a method. But do has IO as a return type.
Purity is good for testing
# Examples

```haskell
copyFile :: FilePath -> FilePath -> IO ()
copyFile from to = do s <- readFile from
                      writeFile to s
---------------------------------------
sortFile :: FilePath -> FilePath -> IO ()
sortFile from to = do s <- readFile from
                      writeFile to (sortLines s)

sortLines = unlines . sort . lines
-----------------------------------------
doTwice :: IO a -> IO (a,a)
doTwice io = do x <- io
                y <- io
                return (x,y)

don't :: IO a -> IO ()
don't io = return ()
```

It's good to have few unpure functions and many pure functions in a program.

We now want to write a hagman program. 
