-- | Module    : Resource.Bullshit
-- Description : (Pseudorandom string)-related stuff
-- Copyright   : (c) Varik Valefor, 2021
-- License     : Unlicense
-- Maintainer  : varikvalefor@aol.com
-- Stability   : experimental
-- Portability : POSIX
--
-- This module justcontains 'generateCrap'.
module Resource.Bullshit where
import Data.Word (Word8);
import qualified Data.ByteString.Lazy as BSL;

-- | @generateCrap@ returns an infinite pseudorandom 'String'.
generateCrap :: IO String;
generateCrap = toString . makeGood <$> BSL.readFile "/dev/random"
  where
  toString :: BSL.ByteString -> String
  toString = map (toEnum . fromEnum) . BSL.unpack
  --
  makeGood :: BSL.ByteString -> BSL.ByteString
  makeGood = BSL.filter (`elem` acceptableChars)
  --
  acceptableChars :: [Word8]
  acceptableChars = map (toEnum . fromEnum) ['0'..'z'];
