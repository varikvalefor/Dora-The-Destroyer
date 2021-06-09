module Programs.Ten where

import Control.Concurrent;

-- | bigNums equals <10^10^k | k in N>, where N denotes the sequence of
-- all natural numbers.
bigNums :: [Integer];
bigNums = map ((10^).(10^)) [1..];

-- | g k equals "".  g exists for the purpose of using relatively large
-- amounts of RAM.
toJunk :: Eq a => [a] -> [Char];
toJunk = foldr (++) [] . map (\a -> "");
-- toJunk is used to load bigNums into memory without actually printing
-- bigNums; printing bigNums uses a decent bit of processing power
-- without using much RAM, which is undesirable.

main :: IO ();
main = putStrLn $ toJunk bigNums;
