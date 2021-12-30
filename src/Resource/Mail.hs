-- | Module    : Resource.Mail
-- Description : E-mail crap
-- Copyright   : (c) Varik Valefor, 2021
-- License     : Unlicense
-- Maintainer  : varikvalefor@aol.com
-- Stability   : experimental
-- Portability : POSIX
--
-- This module contains some e-mail-related stuff.
module Resource.Mail where
  import System.Process;

  -- | For all 'GeneralUser' @k@, @k@ represents an e-mail user.
  data GeneralUser = GeneralUser {
    -- | @eml k@ is the e-mail address of the man which @k@ represents.
    eml :: String,
    -- | @pgp k@ is the PGP public key of the man which @k@ represents.
    pgp :: String
  } deriving (Eq, Ord, Read, Show);

  -- | @sendMail msg sbj rcv@ sends an e-mail whose body and subject are
  -- @msg@ and @sbj@, respectively, to the user @rcv@, returning
  -- whatever sendmail(1) writes to the standard output when sendmail(1)
  -- sends the message.
  sendmail :: String
           -- ^ The body of the message
           -> String
           -- ^ The subject line of the message
           -> GeneralUser
           -- ^ The user to which the message is sent
           -> IO String;
  sendmail msg sbj rcv = readProcess "mail" ["-s", sbj, eml rcv] msg;
