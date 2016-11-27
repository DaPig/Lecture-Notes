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

# Part 2 Of lecture
The parser we built is not very general, we can only parse for the specific language we've specified. We want to generalize this.

## A more general parser
So, in order to reach this "gereralized" parser we have the file Refactoredparse, wich will be where we implement the parser.

We begin by defining our parser type
```haskell
newtype Parser a = P (String -> Maybe (a,String))
```
the newtype is a more efficient way to create new types.

We also want a function *parse* that uses a parser to parse
```haskell
parse :: Parser a -> String -> Maybe(a,String)
-- run a parser on a given string
parse (P f) = f
```
We are gonna build som simple parsers. We will start with a parser that always fails (always gives nothing)
```haskell
-- Basic Parsers, dependent on internal structure --
-- success and fail
failure :: Parser a -- always fails
failure    = P $ \s ->
             Nothing
```
We need to have these basic parsers to build more advance parsers, we use them as building blocks.
Now we want a parser that succedes without looking at the string

```haskell
success :: a -> Parser a
-- succeeds without looking at the string
success a  = P $ \s ->
             Just (a,s)
```
Now, we want to parse a single character
```haskell
-- Parse any single character
item  = P $ \s ->
        case s of
             (c:s') -> Just(c,s')
             _      -> Nothing
```
The only way this can fail is if it gets a empty list.
--
Now we want to build our first parser that tries to parse using p, if it fails it tries to parse with q insted (choose between two simpler parsers)

```haskell
-- (+++)  parse either using p or else using q
infixr 5 +++
(+++) :: Parser a -> Parser a -> Parser a
p +++ q  = P $ \s ->
           case (parse p s) of
                Just (a,s') -> Just (a,s')
                Nothing     -> parse q s
```
Now we gonna do the hardest, Say you first want to parse something, and after that parse another thing. We want to build this. More generally, we want to parse something, and then depending on the parse value we  select another parser for parsing the rest.
```haskell
-- (p >*> f) parse using p to produce a.
-- Then parse using f a

infixl 1 >*>

(>*>) :: Parser a -> (a -> Parser b) -> Parser b
p >*> f  = P $ \s ->
           case parse p s of
                Just(a,s') -> parse (f a) s'
                Nothing    -> Nothing
```
We want to try this. For example parsing a character and then parses the uppercase equivelence of this char. This can be found in the code file under *lowerUpper*

Now we want to build a parser that satisfies a property p
```haskell
-- sat p parse a single character satisfying property p
sat :: (Char -> Bool) -> Parser Char
sat p  = item >*> \c -> if p c then success c else failure

char c = sat (==c)
digit  = sat isDigit
```
If p succeeds on character c then we will run the sucess parser otherwise it will run the failure. We also have short hand for parsing chars and digits.

Sometime we want to parse something and then change the type of the parsed data, for example parsing a digit and convert this to a Integer. We can do this by:

```haskell
-- pmap modifies the result of a parser

pmap :: (a -> b) -> Parser a -> Parser b
pmap f p = p >*> \a -> success (f a)
```
The parsed data will have the f function applied on it.
## Other exaples of parsers
```haskell
(>->) :: Parser a -> Parser b -> Parser b
p >-> q = p >*> \_ -> q
```
This parses with p, throws away the result and then parses the rest of the string with q.

```haskell
(<-<) :: Parser b -> Parser a -> Parser b
p <-< q = p >*> \a -> q >-> success a
```
This parses the first symbol, throws it away, parses the other thing, keeps it and then parse the last thing and throws that away.

```haskell
(<:>):: Parser a -> Parser [a] -> Parser [a]
p <:> q = p >*> \a -> pmap (a:) q
```

```haskell
oneOrMore, zeroOrMore :: Parser a -> Parser [a]
zeroOrMore p = oneOrMore p +++ success []
oneOrMore p  = p <:> zeroOrMore p
```

```haskell
chain :: Parser a -> Parser b -> Parser [a]
-- parse a list of as which are separated by bs
chain p q = p <:> zeroOrMore (q >-> p)
```
Here we parse a chain of things, separated by a character, for example a list of digits, separaated by commas.
```haskell
-- example: comma separated digits "1,2,3"
diglist = chain digit (char ',')
```
Using our refactored parser, we can reimplement our ReadExpr file. Below follows all the redefined methods.

```haskell
-- parse an integer
-- with help from Read class
integer :: Parser Integer -- parse a natural number
integer = nat +++ pmap negate (char '-' >-> nat)
 where nat = oneOrMore digit >*> success . read  

num :: Parser Expr
num  = pmap Num integer

expr = foldr1 Add `pmap` chain term (char '+')
   -- <expr> ::= <term> | <term> "+" <expr>
term = foldr1 Mul `pmap` chain factor (char '*')
-- <term> ::= <factor> | <factor> "*" <term>
factor = char '(' >-> expr <-< char ')'
     +++ num

  -- factor ::= "(" <expr> ")" | <number>


-- top level parser
-- remove spaces and expect no junk!
readExpr :: String -> Maybe Expr              
readExpr s = let s' = filter (not.isSpace) s
             in case parse expr s' of
                     Just (e,"") -> Just e
                     _           -> Nothing
----------------------------------------------
-- show, eval and quickCheck

showExpr :: Expr -> String
showExpr (Num n)     = show n
showExpr (Add e1 e2) = showExpr e1 ++ " + " ++ showExpr e2
showExpr (Mul e1 e2) = showFactor e1 ++ " * " ++ showFactor e2

showFactor (Add e1 e2) = "(" ++ showExpr (Add e1 e2) ++ ")"
showFactor e           = showExpr e

eval :: Expr -> Integer
eval (Num n)    = n
eval (Add e1 e2)    = eval e1 + eval e2
eval (Mul e1 e2)= eval e1 * eval e2


rExpr :: Int -> Gen Expr
rExpr s = frequency [(1,rNum),(s,rOp)]
  where
   s' = s `div` 2
   rNum = do
       n <- arbitrary
       return $ Num n

   rOp = do
      op <- elements [Add,Mul]
      e1 <- rExpr s'
      e2 <- rExpr s'
      return $ op e1 e2

instance Arbitrary Expr where
  arbitrary = sized rExpr

prop_readExpr e = let s = showExpr e
                      Just e' = readExpr s
                  in showExpr e' == s
```
