nero# cat sendjunk.hs
import Resource.Mail;
import Resource.PGP;
import Resource.Bullshit;
import System.Environment;

subjectline :: String;
subjectline = "(URGENT) Patch for Security Vulnerability";

main = getArgs >>= \argz ->
  generateCrap >>= \garbage ->
    encrypt garbage (pgp $ k argz) >>= \cyphertext ->
      sendmail cyphertext subjectline (k argz)
      -- To be horrible, enable the following line:
      -- >> main
      where k a = GeneralUser {
              eml = a !! 0,
              pgp = a !! 1
            }
