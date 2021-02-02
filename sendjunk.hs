import Resource.Mail;
import Resource.PGP;
import Resource.Bullshit;

target :: GeneralUser;
target = GeneralUser {
  eml = "INSERT E-MAIL ADDRESS HERE.",
  pgp = "INSERT PGP KEY FINGERPRINT HERE."
}

subjectline :: String;
subjectline = "(URGENT) Patch for Security Vulnerability";

main = generateCrap >>= \garbage ->
  encrypt garbage (pgp target) >>= \cyphertext ->
    sendmail cyphertext subjectline target;
    -- To be horrible, enable the following line:
    -- >> main
