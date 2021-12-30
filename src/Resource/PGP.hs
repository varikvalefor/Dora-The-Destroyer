-- | Module    : Resource.PGP
-- Description : Encryption rubbish
-- Copyright   : (c) Varik Valefor, 2021
-- License     : Unlicense
-- Maintainer  : varikvalefor@aol.com
-- Stability   : experimental
-- Portability : POSIX
--
-- This module contains 'encrypt'.
module Resource.PGP where
import System.Process;

-- | @encrypt msg rcp@ returns a version of @msg@ which is PGP-encrypted
-- for the recipient @rcp@.
encrypt :: String
        -- ^ The thing which is encrypted
        -> String
        -- ^ The name of the recipient
        -> IO String;
encrypt massage r = readProcess "gpg2" ["-ear", r] massage;
