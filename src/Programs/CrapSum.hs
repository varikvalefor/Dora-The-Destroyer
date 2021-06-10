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

-- | timeToChoose determines the version of crapsum which should be
-- used, i.e., the number of junk characters which should be returned.
timeToChoose :: [Char] -> IO ();
timeToChoose "crapsum256" = (sel >=> putStrLn) 64;
timeToChoose "crapsum512" = (sel >=> putStrLn) 128;

main :: IO ();
main = getProgName >>= timeToChoose;
