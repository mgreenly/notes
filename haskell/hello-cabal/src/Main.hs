module Main where


-- https://github.com/pcapriotti/optparse-applicative#introduction


import qualified Data.Functor as F
import qualified MyLib (someFunc)
import Options.Applicative
import Data.Semigroup ((<>))
import qualified Text.PrettyPrint.ANSI.Leijen as P

data Sample = Sample
  { hello      :: String
  , quiet      :: Bool
  , enthusiasm :: Int }

sample :: Parser Sample
sample = Sample
      <$> strOption
          ( long "hello"
         <> metavar "TARGET"
         <> help "Target for the greeting" )
      <*> switch
          ( long "quiet"
         <> short 'q'
         <> help "Whether to be quiet" )
      <*> option auto
          ( long "enthusiasm"
         <> help "How enthusiastically to greet"
         <> showDefault
         <> value 1
         <> metavar "INT" )

main :: IO ()
main = greet =<< execParser opts
  where
    fdoc = Just (
      P.text "line one"
      P.<$>
      P.text "line two")

    opts = info (sample <**> helper)
      ( fullDesc
     <> progDesc "Print a greeting for TARGET"
     <> header "hello - a test for optparse-applicative"
     <> footerDoc fdoc)


greet :: Sample -> IO ()
greet (Sample h False n) = putStrLn $ "Hello, " ++ h ++ replicate n '!'
greet _ = return ()
