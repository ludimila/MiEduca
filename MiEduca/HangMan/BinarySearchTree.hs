module BinarySearchTree where

import Data.List

-- This module contains all functions for manipulate a binary search tree -- 

data BSTree content = Null
		  | Node (String,Int) (BSTree (String,Int) ) (BSTree (String,Int) ) 
	 	  deriving (Show, Read, Eq)  

-- A Minimum element of type list is a leaf -- 
leaf :: (String,Int)  -> BSTree (String,Int) 
leaf (hr,a)  = Node (hr,a) Null Null  
  
-- Return: A new Binary Search Tree with new content -- Param1:Content that will be inserted -- Param2: Binary Serch Tree where the content will be inserted --
insertOnBSTree :: (String,Int) -> BSTree (String,Int) -> BSTree (String,Int) 
insertOnBSTree (hr,a)  Null = leaf (hr,a)   
insertOnBSTree (hr,a)  (Node (cr,b) leftBranch rightBranch)   
    | (hr,a)  == (cr,b)  = Node (hr,a)  leftBranch rightBranch  
    | (hr,a)  < (cr,b)   = Node (cr,b)  (insertOnBSTree (hr,a)  leftBranch) rightBranch  
    | (hr,a)  > (cr,b)   = Node (cr,b)  leftBranch (insertOnBSTree (hr,a)  rightBranch)  

--Return:A Binary Search Tree-- Param1: List of content's that will be inserted on the BSTree -- 
generateBSTreeFromList ::[(String,Int)] -> BSTree (String,Int)
generateBSTreeFromList [] = Null
generateBSTreeFromList (h:t) = h `insertOnBSTree` (generateBSTreeFromList t)

--Return: Boll that present if the content is on BSTree -- Param1:Content to be searched -- Param1:BSTree to be consulted -- 
isOnBSTree :: (String,Int) -> BSTree (String,Int) -> Bool  
isOnBSTree  (hr,a)  Null = False  
isOnBSTree  (hr,a)  (Node (cr,b)  leftBranch rightBranch)  
    |  (hr,a)  == (cr,b)  = True  
    |  (hr,a)  < (cr,b)   = isOnBSTree  (hr,a)  leftBranch 
    |  (hr,a)  > (cr,b)   = isOnBSTree  (hr,a)  rightBranch  


--Return:A sub BSTree of right of a main Node-- Param1: BSTree to get a sub tree--
getSubTreeOfRight :: BSTree (String,Int)  -> BSTree (String,Int) 
getSubTreeOfRight Null = Null
getSubTreeOfRight (Node leaf left right)  = right

--Return:A sub BSTree of left of a main Node--  Param1: BSTree to get a sub tree--
getSubTreeOfLeft :: BSTree (String,Int)  -> BSTree (String,Int) 
getSubTreeOfLeft Null = Null
getSubTreeOfLeft (Node leaf left right) = left

getCurrentNode :: BSTree (String,Int)  -> (String,Int) 
getCurrentNode (Node leaf left right) = leaf


	
