module Main where

import qualified Hello (foo)

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  putStrLn $ show Hello.foo
