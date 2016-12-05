# Lecture 11
## Web/Gui Programming
Today we will focus on GUI/web programming using haste. Haste is a compiler from haskell to javascript, it has libraries to create web applications in haskell and also supports type-safe client-server comminucation.

Javascript is used to make static webpages(HTML) dynamic and adds different functionalities.

We can either write our pages in HTML or JS but a combination of the two is more sufficient, like defining a button in HTML and creating the functionality in JS
```HTML
<input type="button", value="Click me" onclick="incr">

```
```javascript
function incr() {
  input.value = input.value + 1
}

button.onclick=incr

```

Haste gives us the functionality of writing haskell code to be used in web applications. Some haste functions are.

```haskell
newTextElem  :: String -> IO Elem
newElem      :: String -> IO Elem
appendChild  :: Elem -> Elem -> IO ()

documentBody :: Elem

setAttr, setProp, setStyle
     :: Elem -> PropId -> String -> IO ()

with :: IO Elem -> [Attribute] -> IO Elem
```
We can use this for creating web applications. For example creating a button:
```haskell
mkButton :: String -> IO Elem
mkButton label =
  do button <- newElem "input"
     setAttr button "type" "button"
     setAttr button "value" label
     return button

--- Using with
mkButton :: String -> IO Elem
mkButton label =
  newElem "input" `with` [attr "type"  =: "button",
                          attr "value" =: label]
```

We can also add event handler from the *Haste.Events* package;
```haskell
onEvent :: Event ev =>
           Elem -> ev -> (EventData ev -> IO ()) -> IO HandlerInfo

-- Instances in the Event class:
data BasicEvent = Change | Submit -- and more...
data KeyEvent   = KeyPress | KeyUp | KeyDown
data MouseEvent = Click | MouseDown | MouseUp -- and more...

--- An example of using event handlers
counterExample =
  do input <- newElem "input"
     button <- mkButton "Increment"
     appendChild documentBody input
     appendChild documentBody button
     let incr _ = do s <- getProp input "value"
                     let v = read s
                     setProp input "value" (show (v+1))
     onEvent button Click incr
```
The haste is using the IO monad, is there a way to use a more declatarative way of doing web pages in haskell?

THere is!

## Web Fudges
A web funge is layer on top of haste that enables a more declarative approach to web programming. Is based on fudgets which is a graphical user interface library for Haskell. THese are based on stream processors, which has the type
```haskell
SP :: i o
```
Where I is an output stream and O is a output stream of type i and o.
This can be used to control user interface elements.
Programs are then built by combining these fudges
```haskell
buttonF  :: String -> F x ButtonClick
counterF :: F ButtonClick Int
displayF :: F Int x
```
You connect these with combinators.
For more information on web fudges, please checkout
![http://www.cse.chalmers.se/edu/year/2016/course/TDA452/WebFudgets/WebFudgets.html]

Thats all for this lecture, Happy hacking.

![](images/hacker.gif)
