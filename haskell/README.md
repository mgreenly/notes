
configure 
cabal configure --builddir=dist --enable-library-vanilla --disable-debug-info --enable-optimization --enable-split-sections --enable-executable-stripping
cabal install --install-method=copy --installdir=$PWD/ --overwrite-policy=always





# cabal init

```
mkdir -p ./bin && cabal init --non-interactive --minimal --package-name Sample --libandexe --source-dir src --main-is bin/Main.hs
```

find the executable

```
find dist-newstyle/ -executable -type f ! -name '*.so'
```


# LINKs

http://luizsol.com/why-functional-programming/
https://www.youtube.com/watch?v=US8QG9I1XW0
https://www.youtube.com/watch?v=srQt1NAHYC0 - functional design patterns - scott wlaschin
https://www.youtube.com/watch?v=KZIN9f9rI34 - monad transformer state -
https://www.youtube.com/watch?v=MvQxNm5gn8g - programatic introduction to category theory
https://www.youtube.com/watch?v=DebDaiYev2M - what makes haskell unique
https://www.youtube.com/watch?v=cuHD2qTXxL4 - Concurrency & Threads



statically typed hindley milner
scala is not hindley milner
clojure dynamicallyt

A function is a mapping that takes input values and maps them to output values.

We'll use an arrow to represent a function.

  ->

This is an abstract representation.

We haven't said what type of input it takes, or what type of output it produces, or how it maps input values to output values.

The only thing we know is that it's a function.

To describe the types of it's inputs and outputs we'd write something like this.

  Int -> Bool

Now it's a function that takes Int values and returns Bool values.

Lets give the function a name.

  isZero :: Int -> Bool

That is a `type signature` that describes a function.

To explain what that function does you pair the type signature with a function definition.

To define a function first you write it's name and then a name for each argument it takes.

In this case

  isZero n

Then you follow that with an = sign and an expression

  isZero n = if n == 0 then True else False.

Actually we don't even need the if, we could write this.

  isZero n = n == 0

The part before the = is a pattern so we could write it like this

  isZero 0 = True
  isZero _ = False

All together that gives us this

  isZero :: Int -> Bool
  isZero 0 = True
  isZero _ = False
