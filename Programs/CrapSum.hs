module Programs.CrapSum where
  import Resource.Bullshit;
  import Control.Monad;
  import System.Environment;

  hexDigit :: [Char];
  hexDigit = ['0'..'9'] ++ ['a'..'f'];

  sel :: Int -> IO [Char];
  sel n = generateCrap >>= return . take n . filter (`elem` hexDigit);

  timeToChoose :: [Char] -> IO ();
  timeToChoose "crapsum256" = (sel >=> putStrLn) 64;
  timeToChoose "crapsum512" = (sel >=> putStrLn) 128;

  main :: IO ();
  main = getProgName >>= timeToChoose;
