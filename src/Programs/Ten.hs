module Programs.Ten (main) where
import qualified Data.List as DL;

main :: IO ();
main = mapM_ putStrLn (goodBitsOf bal) >> main;

-- | holyMessage equals the content of the Holy Message.
holyMessage :: String;
holyMessage = "Mother of God, it's all toilet sounds!";

-- | bal is a large list of type [String].  Determining the meaning of
-- the acronymic name is left as an exercise for the reader.
bal :: [String];
bal = DL.subsequences $ "We are the music makers.  " ++ [' '..'z'];

-- | For all [String] k, goodBitsOf k equals the list of all "good",
-- i.e., "holy", elements of k.
goodBitsOf :: [String] -> [String];
goodBitsOf = filter (== holyMessage) . DL.sort;
