module Resource.Bullshit where
  import System.Random;

  junkChars :: [Char];
  junkChars = ['A'..'Z'] ++ ['a'..'z'] ++ ['0'..'9'] ++ "+/";

  generateCrap :: IO [Char];
  generateCrap = newStdGen >>= \a -> return $ take 5555 $ theRand a
    where convert n = junkChars !! ((n `mod`) $ length junkChars)
          theRand n = map convert (randoms n :: [Int])
