import Data.Typeable


myAdd :: Num a => a -> a -> a
myAdd x y =
    z + q
  where
    z = x + 1
    q = y + x

main = do
  let x = 1 :: Integer
  putStrLn $ show x
  putStrLn ("type of x is: " ++ (show (typeOf x)))
  -- tuples
  let xy = (1,2) :: (Integer,Float)
  putStrLn $ show xy
  putStrLn $ show (typeOf xy)
  -- -- lists
  let xs = [1,2,3] :: [Integer]
  putStrLn $ show $ xs
  putStrLn $ show (typeOf xs)
  -- call function
  putStrLn $ show $ myAdd 3 7
  putStrLn $ show (typeOf (myAdd 3 7))
  -- hello
  putStrLn "Hello World!"
