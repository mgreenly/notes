{-# LANGUAGE DuplicateRecordFields #-}


class Truthy a where
    truthy :: a -> Bool

instance Truthy Bool where
    truthy True = True
    truthy False = False

instance Truthy Integer where
    truthy 0 = False
    truthy _ = True

data Box a
  = EmptyBox
  | MkBox a
  deriving (Show)

unbox :: Box a -> a
unbox (MkBox a) = a

blahfoo :: a -> [a]
blahfoo a = [a]

-- blahfoo1 :: a -> m a
-- blahfoo1 :: return a

qux :: Integer -> [Integer]
qux a = do
  i <- return (a + 1)
  j <- return (i * 3)
  return j



main = do
    -- let x = [1,2,3] >>= (\n -> [n + 1])
    -- let z = [1,2,3] >>= qux
    -- let foo = MkBox 1
    -- let bar = MkBox "hi"
    -- putStrLn (show z)
    -- putStrLn (show x)
    -- putStrLn (show foo)
    -- putStrLn (show bar)
    -- putStrLn (show (truthy (3 :: Integer)))
    getLine >>= putStrLn
    putStrLn "hello \n world"
    where
        stuff = [1, 2, 3]
