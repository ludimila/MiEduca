module GameEngine (gameLoop) where

import Data.Char
import Data.List
import System.IO
import Interface
import BinarySearchTree 
import WordsTupleSetup

manResistence = 6

gameLoop :: (String,String,BSTree content) -> Int -> IO ()
gameLoop (hs,cr,(Node leaf left right)) i| i > manResistence = do
		putStrLn "\n"
		Interface.drawHangman i
                putStrLn "\n Voce Perdeu =("
		let gameCurrentLevel = BinarySearchTree.getCurrentNode left
		let word = fst leaf
		gameLoop ("",word,left) 0	
		--gameLoop ("",cr,(Node leaf left right)) 0	
             	| all (`elem` hs) (map toLower cr) = do
                putStrLn "\n "
                Interface.printWord hs cr
                putStrLn "\nParabesn voce ganhou"
	--	gameLoop ("",cr,left) 0			
		let gameCurrentLevel = BinarySearchTree.getCurrentNode right
		let word = fst gameCurrentLevel
		gameLoop ("",word,right) 0	
						
gameLoop (hs,cr,(Node leaf left right)) i  = do
    putStrLn "\n "
    Interface.drawHangman i
    Interface.printWord hs cr
    putStrLn "\n "
    h <- getChar >>= (return.toLower)
    if (h `elem` (map toLower cr)) then
      gameLoop ((h:hs),cr,(Node leaf left right)) i 
    else do
      gameLoop (hs,cr,(Node leaf left right)) (i+1)


