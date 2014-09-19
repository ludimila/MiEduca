-- This module contains all functions for manipulate a binary search tree -- 

data BSTree content = Null
		  | Node content (BSTree content) (BSTree content) 
	 	  deriving (Show, Read, Eq)  

-- A Minimum element of type list is a leaf -- 
leaf :: content -> BSTree content 
leaf content = Node content Null Null  
  
-- Return: A new Binary Search Tree with new content -- Param1:Content that will be inserted -- Param2: Binary Serch Tree where the content will be inserted --
insertOnBSTree :: (Ord content) => content -> BSTree content -> BSTree content  
insertOnBSTree newContent Null = leaf newContent  
insertOnBSTree newContent (Node content leftBranch rightBranch)   
    | newContent == content = Node newContent leftBranch rightBranch  
    | newContent < content  = Node content (insertOnBSTree newContent leftBranch) rightBranch  
    | newContent > content  = Node content leftBranch (insertOnBSTree newContent rightBranch)  

--Return:A Binary Search Tree-- Param1: List of content's that will be inserted on the BSTree -- 
generateBSTreeFromList :: Ord content => [content] -> BSTree content
generateBSTreeFromList [] = Null
generateBSTreeFromList (h:t) = h `insertOnBSTree` (generateBSTreeFromList t)

--Return: Boll that present if the content is on BSTree -- Param1:Content to be searched -- Param1:BSTree to be consulted -- 
isOnBSTree :: (Ord content) => content -> BSTree content -> Bool  
isOnBSTree queryContent Null = False  
isOnBSTree queryContent (Node content leftBranch rightBranch)  
    | queryContent == content = True  
    | queryContent < content  = isOnBSTree queryContent leftBranch 
    | queryContent > content  = isOnBSTree queryContent rightBranch  


	
