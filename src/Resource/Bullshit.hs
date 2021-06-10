module Resource.Bullshit where
  import System.Random;

  junkChars :: [Char];
  junkChars = ['0'..'z'];

  generateCrap :: IO [Char];
  generateCrap = newStdGen >>= return . take 5555 . theRand
    where convert n = junkChars !! ((n `mod`) $ length junkChars)
          theRand n = map convert (randoms n :: [Int])
