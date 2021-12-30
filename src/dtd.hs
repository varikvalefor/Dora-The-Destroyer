{-# LANGUAGE LambdaCase #-}

import System.Environment;
import qualified Programs.SendJunk as SJ;
import qualified Programs.CrapSum  as CS;
import qualified Programs.Ten      as TN;

main :: IO ();
main = getProgName >>= \case
  "sendjunk"                    -> SJ.main
  "ten"                         -> TN.main
  foo | take 7 foo == "crapsum" -> CS.main
  _                             -> error "RTFM and stop entering crap.";
