module Resource.Bullshit where
  import System.Random;

  junkChars :: [Char];
  junkChars = ['0'..'z'];

  generateCrap :: IO [Char];
  generateCrap = newStdGen >>= \a -> return $ take 5555 $ theRand a
    where convert n = junkChars !! ((n `mod`) $ length junkChars)
          theRand n = map convert (randoms n :: [Int])
