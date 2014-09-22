import qualified Data.Text    as Text
import qualified Data.Text.IO as Text
import Foreign.Marshal
import System.IO.Unsafe
import Interface


testeString = "ThiaT"

--Function take a character
main = do     Interface.printHello
	      putStrLn "Entre com uma letra"  
   	      word <- getChar
	      putStrLn " "
	      return (verify testeString word)

   
-- Function compare a character with list	      	
verify xs word = word `elem` xs







