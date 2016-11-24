# Lecture 9
## Parsing
> Sans' videos for starters.

Today we're gonna use higher order functions to describe parsing.
Last time we showed that expressions can be modeled as a recursive datatype.
WE also showed how to print these.

Today we're gonna look at how to turn strings into things.

THe predefined show functions are bad, they don't do the job we want for the specific datatype.

### Let's start simple, how to parse a simple expression:

We want a function that converts String to numbers
```haskell
number :: String -> Int
```
If we give it nonsence, what should it write out? There are three cases
 * THe string is a number
 * The string is not a number
 * The string begins with a number and carries on with somthing else.

Case 1 & 3 are very simular.


```haskell
type Parser a = String -> Maybe (a,String)
```
THis can be described as that we parse something and have somting else left.

# Coding session:
We have the ReadExpr file which will model parsing.
Our parser type can fail, that will make our program crash.

An example of a function that can help us is the predefined method reads. However we want to parse the data into our data class.

We introduce the case expression for pattern matching.
```haskell
num :: Parser Expr
num s = case reads s of
  (i,s'):_  -> Just (Num i,s')
  _         -> Nothing
```
When we write this case expression we have to write the block on the same tab on different lines (have to be under one another) otherwise the case expression will end. We use the arrow to specify what will be done when we hade the different cases.

If we try the num method on the expression "123+234" it will return a tuple of (Num 123,"234") where the string is the rest of the input.

## More case expressions.
We want to parse expression like n1+n2+...+nk for k>1

Before we do that we can explain an expression. An expression can be written as
*<expression> ::= <term> | <term> "+" <expression>*
Where
*<term>       ::= <factor> | <factor> "*" <term>*
And
*-- <factor>     ::= "(" <expression> ")" | <number>*

In other words. An expression contains terms that can either be a factor or a factor followed by another term. THe factors are either a number or a brackedet expression.

Lets parse some things.

```haskell
expr1 = case num s of
  expr1  = case num s of
    Just (n,'+':s') -> case expr1 s' of
                        Just(e,s'') -> Just(Add n e,s'')
                        Nothing -> Just(n,'+'s')
    r               -> r
```
THis can be explained as: We parse a number which has a plus after it. Then we oarse that and make an Add n e, s'', i.e. we add them and then parse the rest. Otherwise we return the parsed result:

When we want to parse expressions we can visualize them as multiple terms put together. We want to parse the terms

```haskell
term s = case factor s of
  Just (n,'*':s') -> case term s' of
                      Just(e,s'') -> Just(Mul n e,s'')
                      Nothing -> Just(n,'*'s')
  r               -> r
```
We want to be able to parse the factors, the factors have to start with an open bracket, and have an ending bracket, otherwise it will return nothing or a string.
```haskell
factor ('(':s) = case expr s of
  Just (e,')':s') -> Just (e,s')
  _               -> Nothing
factor s       = num s
```

Finally the expressions:
```haskell
expr s = case term s of
  Just (n,'+':s') -> case expr s' of
                      Just(e,s'') -> Just(Add n e,s'')
                      Nothing -> Just(n,'+':s')
  r               -> r
```
These methods are very simular, only certain things change inbetween them, we are gonna use another method for this.

```haskell
chain p c f s = case p s of
    Just(n,c':s') | c = c' -> case chain p c f s' of
                              Just(e,s'') -> Just (f n e,s'')
                              Nothing -> Just(n,c:s')
    r               -> r
```
We should also throw away spaces to make sure our strings don't contain that junk.
```haskell
readExpr :: String -> Maybe Expr
readExpr s = case expr (filter (not.isSpace) s) of
  Just (e, "") -> Just e
  _            -> Nothing
```

### How do we test the parser? We know how to generate expressions.
But how do we get good strings to test?

```haskell
instance Arbitrary Expr where
  arbitrary = sized rExpr

prop_readExpr e = let s = showExpr e
                      Just e' = readExpr s
                  in showExpr e' == s
```
