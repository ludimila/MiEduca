import GameEngine
import BinarySearchTree
import WordsTupleSetup
import System.IO
import Interface


main = do
  	hSetBuffering stdin NoBuffering
	let gameWords = WordsTupleSetup.wordsTuple
	let gameLevelTree = BinarySearchTree.generateBSTreeFromList gameWords
	let gameCurrentLevel = BinarySearchTree.getCurrentNode gameLevelTree
	let word = (fst gameCurrentLevel)
	Interface.printHello
 	gameLoop ("",word,gameLevelTree) 0





