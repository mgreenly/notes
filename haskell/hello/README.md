# Hello World

Lets start with a simple program

```haskell
module Main where

import System.IO (hFlush, stdout)

main = do
    putStrLn "What's your name?"
    hFlush stdout
    line <- getLine
    putStrLn ("Hello " ++ line ++ "!")
```

Most of this shouldn't look to alien.

The first line, `module Main where`, says what follows is in the `Main` module.

The second line, `import System.IO (hFlush, stdout)` imports some functions from other modules so that we can use them.

The `main =` line defines a function.  The part before the equal is the name of the function and the part after the `=` is the body of the function.

In the body of the function we first use `putStrLn` to write "What's your name?" to the screen.

The next line `hFlush stdout` is necessary because the runtime library buffers output for performance and we want to be sure the user
has seen the question before we wait for input in the next line.

The `line <- getLine` assigns the result of the funciton call `getLine` the name `line`.

In the last line we concatenate the users response to "Hello " wth `++` and output it to stdout with `putStrLn`.



# What I didn't explain

Most significantly I completely failed to mention the `do` that follows `main =`.

I will eventually build up to a full explanation of `do' but Until then I'm going to provide a partial-truth that will suffice for now.

Haskell being a pure functional language only has expressions.  It has no concept of a series of statements.

The `do` notation allows a series of expressions to be executed in order.



# Running the program

The easiest way to run that program is to use `runghc hello.hs`




# Lets define a function and use it

```
greeting name = "Hello " ++ name ++ "!"

main = do
    putStrLn "What's your name?"
    hFlush stdout
    line <- getLine
    putStrLn (greeting line)
```

It still does the same thing as before when it's run.



# Where are the types?

Haskell is able to infer the types of most things in most cases without any help from you.

Usually programers annotate all top level functions with type information, for people reading the code, not to help the compiler.

So lets do the same and add this line, `greeting :: String -> String` just above the definition of `greeting`.

That line tells us that the name `greeting` is a function that takes a String value and returns a String value.



# Types

Haskell provides definitions for all the standard types; Bool, Char, String, Integer, Double and others.

It also provides List, Tuples, and Records so that you can construct your own compund types.

Tuples and lists provide an excellent place to start diving a bit deeper.




## Tuples

Tuples are written as a series of values separated by commas in parentheses.

The values do not need to be the same type.

The type of the resulting tuble is the union of all it's field types.

If it's constructed with two integers the type of the Tuple is (Integer, Integer)

If it's constructioned with an Integer, a Float and a String then the type is (Integer, Float, String)

Above, the string, `(Integer, Integer)`, represents a single compound type.


Short example of creating tuples

  ```
  let foo = (0, 0)
  let bar = (0, 0.0, 'haskell')
  ```

Haskell provides the built in functions, fst and snd, for deconstructing tuples.

    ```
    let foo = (1, 3)
    let x = fst foo
    let y = snd foo
    ```

# Lists

Lists in Haskell are homogenus, meaning all the items in the list are of the same type.

Haskell uses brackets with nothing between them, `[]` to mean the empty list.

You can use the cons operator, `:`, to prepend an item to an empty list, `1 : []`, and create a list, `[1]`.

You can use the cons operator to prepend an item, `2 : [1]`, and create a larger list, `[2, 1]`

Or you can just use Haskell syntax sugar to write the list, `let foo = [1, 2, 3]`.

Haskell provides methods to operate on lists, head, tail, length, etc....

  ```
  let xs = [1,2,3]
  let foo = head xs                          -- 1
  let bar = tail xs                          -- [2,3]
  let baz = length xs                        -- 3
  let qux = null xs                          -- False   (asks if the list is empty)
  ```

# Pattern Matching

Now that we have seen tuples and lists we can look a little closer at pattern matching.

first the example:

    ```
    myFst (x, _) = x
    mySnd (_, y) = y

    main = do
        let origin = (3, 7)
        putStrLn (show (myFst origin))
        putStrLn (show (mySnd origin))
    ```

This example defines a methods that duplicate the functionality of `fst` and `snd`.

Function definitions always start with the function name and that is followed by an optional pattern.

Notice that in the body of main we call `myFst` with `origin` that we know is `(3, 7)`.

Notice how the shape of the functions pattern, `(x, _)`, is similar to the construction of the tuple, `(3, 7)`.

The pattern matches the values constructor but uses names where the values would be.

Notice that `_` is used for values we don't care about.

This works with lists as well.

  ```
  myHead (x : _)  = x
  myTail (_ : xs) = xs

  main = do
      let list = ([1,2,3] :: [Integer])
      putStrLn (show (myHead list))
      putStrLn (show (myTail list))
  ```

# Custom Types

Lets take a look at the basica syntax for defining types.

Here's the standard library definition for Bool.

   ```
   data Bool = False | True
   ```

The keyword `data` indicates we're going to define a type.

After that we provide the name of the type, `Bool`.  All type names must start with a capital letter.

Finally, after the `=`, the definition consists of number of possible value constructors separated by `|`.

This is a boolean type so it only needs two value constructors; False and True and neither of those constructors needs any arguments it's value.

Lets look at a slightly more complex example

   ```
   data Shape
     = Circle Float Float Float
     | Rectangle Float Float Float Float
   ```

Here we have a type named 'Shape'.

To create a shape you can use either of the two value constructors; `Circle` or `Rectangle`.

Circle takes 3 Float arguments, lets say they're the x and y position and size.

Rectangle takes 4 float Values, lets say they're the x and y position and length and height.

You would construct shapes like this

    ```
    let c1 = Circle 0 0 3.5
    let r2 = Rectangle 0 0 2 1
    ```

The problem with that is we have to remember what each constructor argument means.

So Haskell provides Records which allows the construcotr arguments to have names

If we define a our shape this way

  ```
    data Shape
      = Circle
          { x :: Float
          , y :: Float
          , size :: Float
          }
      | Rectangle
         { x :: Float
         ,  y :: Float
         ,  length :: Float
         ,  width :: Float
         }
  ```

We can use record syntax when we construct the values

  ```
    let c1 = Circle { x=0, y=0, size=3}
  ```

Record syntax provides selector functions for each field so that you can extract values from the record.

  ```
    let c1 = Circle { x=3, y=5, size=7 }
    let foo = x c1
    let c2 = c1 { size = 9 }
  ```

Here we write our own selectors for the Shape type that returns the x value.

    ```
    xOf :: Shape -> Float
    xOf    (Circle x _ _)      = x
    xOf    (Rectangle x _ _ _) = x
    ```

We can even write incomplete functions

    ```
    sizeOf :: Shape -> Float
    sizeOf (Circle x _ _) = x
    sizeOf _ = error "I can't do that"

# Extensions

Now we need language extensions

[https://downloads.haskell.org/ghc/latest/docs/html/users_guide/glasgow_exts.html#duplicate-record-fields]

 ```
 {-# LANGUAGE DuplicateRecordFields #-}
 ```


# Type Parameters

Some times it's useful to define the operations on a type that holds values without caring what kinds of values it holds.

The `List` type is like that.  What makes a list useful is that it's a container that can hold anything.

First an example:

   ```
   data Box a
     = EmptyBox
     | MkBox a
     deriving (Show)

   main = do
     let foo = MkBox 1
     let bar = MkBox "hi"

     putStrLn (show foo)
     putStrLn (show bar)
   ```

In the example we define a simple container type called `Box`.

Then we create two boxed values `foo` and `bar`.

The first contains a `Num and the second a `String1.

If we had defined the value constructor like this `MkBox Integer` we would only be able to box `Integer` values.

The value constructor is allowed to take any type because it's defined with a variable.

When you do the construction that variable takes the value of the type passed in.

So `foo` has the type `Box Num` and `bar` has the type `Box String`.

So that means the value constructor can create multiple kinds of types.

That means the type constructor must take a type parameter `Box a`.










# Type Variables

Here we write a function that has a type variable

   ```
   myNull :: [a] -> Bool
   myNull [] = True
   myNull _  = False

   main = do
       putStrLn (show (myNull []))
       putStrLn (show (myNull [1,2,3]))
   ```

The `a` can be any type.

The type of a can be constrained to a type class.

   ```
   myNull :: Num a => [a] -> Bool
   myNull [] = True
   myNull _  = False
   ```

Now the type of a must belong to the `Num` typeclass.

We can't do this.

   ```
   putStrLn (show (myNull ["hi", "bye"]))
   ```



 

# Type Class


# Functors

https://medium.com/@l.mugnaini/functors-applicatives-and-monads-in-pictures-784c2b5786f7

A functor is any data that defines how fmap applies to it.

```
class Functor f where
  fmap :: (a -> b) -> f a -> f b
```
