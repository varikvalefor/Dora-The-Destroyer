module Programs.CrapSum where
import Resource.Bullshit;
import Control.Monad;
import System.Environment;

-- | hexDigit equals the sequence of all hexadecimal characters, in
-- ascending order.
hexDigit :: [Char];
hexDigit = ['0'..'9'] ++ ['a'..'f'];

-- | For all positive Integer k, sel k equals k pseudorandom hexadecimal
-- characters.
sel :: Int -> IO [Char];
sel n = generateCrap >>= return . take n . filter (`elem` hexDigit);

main :: IO ();
main = getProgName >>= sel . lengthOf >>= putStrLn
  where
  lengthOf :: String -> Int
  lengthOf n = case (drop 7 n) of
    "256" -> 64
    "512" -> 128
    _     -> error "Some fucked-up command is used.";
