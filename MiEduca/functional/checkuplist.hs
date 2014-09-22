import qualified Data.Text    as Text
import qualified Data.Text.IO as Text
import Foreign.Marshal
import System.IO.Unsafe


--Function take a character
takeWord = do putStrLn "Entre com uma letra"  
   	      word <- getChar
	      return (verify ['t','r','y'] word)

   
-- Function compare a character with list	      	
verify xs word = word `elem` xs







