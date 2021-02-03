import Resource.Mail;
import Resource.PGP;
import Resource.Bullshit;
import System.Environment;

-- gs determines the subject line.
gs :: [String] -> String;
gs a
  | length a > 2 = a !! 2
  | otherwise = "(URGENT) Patch for Security Vulnerability"

encCrapWKey :: [Char] -> IO [Char];
encCrapWKey key = generateCrap >>= \crap -> encrypt crap key;

main :: IO ();
main = getArgs >>= \argz ->
  encCrapWKey (pgp $ k argz) >>= \crap ->
    sendmail crap (gs argz) (k argz) >>
    putStrLn ":^)"
    -- To be horrible, enable the following line:
    -- >> main
    where k a = GeneralUser {
            eml = a !! 0,
            pgp = a !! 1
          }
