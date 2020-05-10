

# Functor

in Data.Functor

```
class Functor f where
    fmap :: (a -> b) -> f a -> f b

Functor Laws
  fmap id = id
  fmap (f . g)  ==  fmap f . fmap g


   ```
   related
   (<$)  :: a -> f b -> f a                    -- 0 <$ [1,2,3]        -- [0,0,0]
   (<$>) :: (a -> b) -> f a -> f b             -- (1+) <$> [1,2,3]    -- [2,3,4]
   ($>)  :: f a -> b -> f b                    -- [1,2,3] $> 0        -- [0,0,0]
   ```

both (<$) and ($>) can be implemented with const.

   ```
   fmap (const 0) [1,2,3]
   ```


# Control.Applicative

Functor lets you map a function that takes 1 parameter over a functor.  This
is an example of a plain functor using it's infix notation

```
inc <$> [1,2,3]                                   -- [2,3,4]
```

If you also put the function inside of a functor you'd get an error, fmap 
expects the first parameter to be an plain function from `a -> b`

```
[inc] <$> [1,2,3]                                -- error
```

On the other hand if you use applicative `<*>` instead of `fmap` that nows how to extract
use a function in a functor to apply to values in a functor.

```
[inc] <*> [1,2,3]                                --  [2,3,4]
```

The magic of `Applicative` is that the functions can take multiple arguments.

```
[max] <*> [2] <*> [1,2,3]                        -- [2, 2, 3]
```

The infix fmap, `<$>`, can be used with a plain function and multiple parameters inside the functor

```
max <$> [2] <*> [1,2,3]                          -- [2, 2, 3]
```


# Monad

with a functor you use `<$>` to apply a function, that takes and returns normal values, to values in a context

with applicative you use `<*>` to apply a function that takes and returns normal values and is its self in a context, to values in a context.

with monads you use `>>=` to apply a function that takes normal values and returns values in a context, to values in a context

Why would you want to do this?

Because it allows you to chain functions with context together in a series.


If I use list notation to represent context the functions taken by each of these methods looks like this

 a -> b           -- <$> Functor.fmap
[a -> b]          -- <*> Applicative.apply
 a -> [b]         -- >>= Monad.bind

The `>>=` function is called `bind`.  It takes two arguments.  A value in a context and a function `a -> [b]`. 

An example

```
[1,2,3] >>= (\i -> [i + 1])                   -- [2,3,4]
```

On the left we have `[1,2,3]`.  The List is the context, so values in a context.

On the right we use lambda syntax to create a function that takes each value from the context, increments it, and returns it in that same context.

Technically this description, so far, would  mean that bind would return `[[2],[3],[4]]`.

But bind has some rules it must follow.

One of those rules `right identity` says that if we feed a monadic value to bind along with a function that returns that value, the input and output must be the same.

With examples, `[1] >>= (\i -> [i])` must have the result `[1]`.

With examples, `[1,2,3] >>= (\i -> [i])` must have the result `[1,2,3]`.

That means in that bind does more than just apply the function to each value.

it's actually defined like this for `List`.

```
instance Monad [] where
  return x = [x]
  xs (>>=) f = concat (map f xs)
```

It first maps f over xs and then flattens the result by one level.  Allowing it to satisfy the `right identity` law.




```
instance Monad Maybe where
    return x = Just x

    Nothing >>= f = Nothing
    Just x >>= f  = f x

    fail _ = Nothing
```





Except that monads are defined to allow nested monads to be flattened without chaning there meaning.

So you get [2,3,4] back.

```
([1,2,3] >>= (\i -> [i + 1])) >>= (\i -> [i * 3])     -- [6, 9, 12]
```

Why is that different than functor?

```
map ((*3).(+1)) [1,2,3]                               -- [6, 9, 12]
```

In the case of `map` what's returned from each function `(*3)` and `(+1)` has no context.


TODO:

  ```
  instance Functor Maybe where
    fmap f (Just x) = Just (f x)
    fmap f Nothing = Nothing
  ```

  ```
  instance Monad Maybe where
    return x = Just x
    Nothing >>= f = Nothing
    Just x >>= f = f x
  ```

  Each of the combined functions with fmap takes a regular value and returns a regular value and then when it's all done it wraps it in the context

  Each of the chain of functions with monad starts with context, applies a function, returns the value with conext.

  In the functor the entire operation could be skipped if the original value is Nothing otherwise the function is applied to the value and the result wrapped in teh context

  There's no difference between a combined function with fmap and a single function.

  I can't chain fmap together because it takes a function that expects a normal value.

  I can chain bind because it both takes a value with a context and returns a value with a context.

  IN the Monad you could start with a value and any step in the chain could return Nothing.

  ```
  fmap ( _ ) [1,2,3]
  fmap (Just((*3).(+1))) [1,2,3]
  ```



  look at the fmap implementation of Maybe
  look at the bind implementation of Maybe









```
[1,2,3] >>= \i -> ([i + 1] >>= \j -> [j * 3])

qux a = do
  i <- return a + 1
  j <- return i + 1
  return j
```



  Apply a function that takes a normal a and returns a value m a


```
(>>=) :: (Monad m) => m a -> (a -> m b) -> m b
```



Some function that returns the type

```
removeOdds = filter (\n `mod` 2 /= 0)
incEven = map (\n -> if (n `mod` 2 == 0) then n + 1 else n
```




does that mean I could of done

  join (map a b) (map a b)

Yes I think the difference is that with the join path it's done in parallel (applicative do)

vs the monad do which is in series.





add mx my =
    mx >>= (\x ->
        my >>= (\y ->
            return (x + y)))


add :: m a -> m a -> m a
add mx my = do
    x <- mx
    y <- my
    return (x + y)


add mx my =
    mx >>= (\x ->
        my >>= (\y ->
            return (x + y)))
With do-notation though, this can be distilled even further into a very intuitive sequence:






https://fsharpforfunandprofit.com/posts/recipe-part2/
https://medium.com/@l.mugnaini/functors-applicatives-and-monads-in-pictures-784c2b5786f7


https://gitlab.haskell.org/ghc/ghc/-/wikis/applicative-do

https://simonmar.github.io/bib/papers/applicativedo.pdf


https://en.wikibooks.org/wiki/Haskell/Category_theory
