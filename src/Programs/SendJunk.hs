module Programs.SendJunk where

import Resource.Mail;
import Resource.PGP;
import Resource.Bullshit;
import System.Environment;

-- | For all [String] k, gs k equals a subject line which reflects the
-- content of k.
-- gs is used only within SendJunk; all additional relevant information
-- is available within the definitions of gs.
gs :: [String] -> String;
gs a
  | length a > 2 = a !! 2
  | otherwise = "(URGENT) Patch for Security Vulnerability"

-- | For all String-based PGP public keys k, encCrapWKey generates some
-- pseudorandom junk data, encrypts this junk data with k, and returns
-- the resulting encrypted junk data.
encCrapWKey :: [Char] -> IO [Char];
encCrapWKey k = take 5555 <$> generateCrap >>= \crap -> encrypt crap k;

main :: IO ();
main = getArgs >>= \argz ->
  (encCrapWKey $ pgp $ k argz) >>= \crap ->
    sendmail crap (gs argz) (k argz) >>
    putStrLn ":^)"
    -- To be horrible, enable the following line:
    -- >> main
    where k a = GeneralUser {
            eml = a !! 0,
            pgp = a !! 1
          }
