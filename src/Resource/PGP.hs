module Resource.PGP where
  import System.Process;

  encrypt :: String -> String -> IO String;
  encrypt message recipient =
    readProcess "gpg2" ["-ear", recipient] message;
