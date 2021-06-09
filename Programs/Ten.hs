module Programs.Ten where

import Control.Concurrent;

bigNums :: [Integer];
bigNums = map ((10^).(10^)) [1..];

toJunk :: Eq a => [a] -> [Char];
toJunk = foldr (++) [] . map (\a -> "");
-- toJunk is used to load bigNums into memory without actually printing
-- bigNums; printing bigNums uses a decent bit of processing power
-- without using much RAM, which is undesirable.

main :: IO ();
main = putStrLn $ toJunk bigNums;
