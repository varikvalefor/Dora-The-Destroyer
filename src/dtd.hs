import System.Environment;
import qualified Programs.SendJunk as SJ;
import qualified Programs.CrapSum  as CS;
import qualified Programs.Ten      as TN;

-- | manish determines the program which should be run.
manish :: String -> IO ();
manish "sendjunk" = SJ.main;
manish "ten" = TN.main;
manish x
  | take 7 x == "crapsum" = CS.main;
manish _ = error "RTFM and stop inputting crap.";

main :: IO ();
main = getProgName >>= manish;