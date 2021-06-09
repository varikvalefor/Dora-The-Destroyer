import System.Environment;
import qualified Programs.SendJunk as SJ;
import qualified Programs.CrapSum  as CS;
import qualified Programs.Ten      as TN;

manish :: String -> IO ();
manish "sendjunk" = SJ.main;
manish "ten" = TN.main;
manish x
  | take 7 x == "crapsum" = CS.main;

main :: IO ();
main = getProgName >>= manish;
