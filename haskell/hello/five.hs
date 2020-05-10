module Main where

import System.IO (hFlush, stdout)


main1 = do
    putStrLn "What's your name?"
    hFlush stdout
    line <- getLine
    putStrLn line

main2 = do
    _unused <- putStrLn "What's your name?"
    _unused <- hFlush stdout
    line <- getLine
    _unused <- putStrLn line
    return ()

main3 =
    putStrLn "What's your name?" >>= \_ ->
    hFlush stdout                >>= \_ ->
    getLine                      >>= \line ->
    putStrLn line

bind a b = a >>= b

main4 =
    putStrLn "What's your name?" `bind` \_ ->
    hFlush stdout                `bind` \_ ->
    getLine                      `bind` \line ->
    putStrLn line

main =
    bind (putStrLn "What's your name?")
         (\_ -> (bind (hFlush stdout)
                      (\_ -> (bind (getLine)
                                   (\line -> (bind (putStrLn line)
                                                (\_ -> (return ()))))))))
