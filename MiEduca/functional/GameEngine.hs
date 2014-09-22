module Teste (gameLoop) where

import Data.Char
import System.IO
import Interface
import BinarySearchTree 
import WordsTupleSetup

manResistence = 6

gameLoop :: (String,String) -> Int -> IO ()
gameLoop ((hs),(cr)) i| i > manResistence = do
		putStrLn "\n"
		Interface.drawHangman i
             	| all (`elem` hs) (map toLower cr) = do
                putStrLn "\n "
                Interface.printWord hs cr
                putStrLn "\nParabesn voce ganhou"
gameLoop  ((hs),(cr)) i  = do
    Interface.drawHangman i
    putStrLn " "
    Interface.printWord hs cr
    h <- getChar >>= (return.toLower)
    if (h `elem` (map toLower cr)) then
      gameLoop ((h:hs),cr) i 
    else do
      gameLoop (hs,cr) (i+1)

main = do
  hSetBuffering stdin NoBuffering
  gameLoop ("","palavra") 5 
