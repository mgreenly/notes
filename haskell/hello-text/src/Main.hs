{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module Main where

import BasicPrelude (IO(..), ($))
import Data.Text (Text)
import Data.Text.IO (putStrLn)
import Data.Semigroup ((<>))
import TextShow (TextShow, showbSpace, showb, showt)

data Person = Person
  { fName :: Text
  , lName :: Text
  }

instance TextShow Person where
    showb (Person { .. })
      = "Person {fName="
      <> showb fName
      <> " lName="
      <> showb lName
      <> "}"

main :: IO ()
main = do
  putStrLn greeting
  putStrLn $ showt bob
  where
    greeting = "Hello World!" :: Text
    bob = Person { fName="Bob", lName="Bruce" }
