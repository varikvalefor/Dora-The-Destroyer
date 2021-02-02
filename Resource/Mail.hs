module Resource.Mail where
  import System.Process;

  data GeneralUser = GeneralUser {
    eml :: String,
    pgp :: String
  } deriving (Eq, Ord, Read, Show);

  sendmail :: String -> String -> GeneralUser -> IO String;
  sendmail msg sbj rcv = readProcess "mail" ["-s", sbj, eml rcv] msg;
