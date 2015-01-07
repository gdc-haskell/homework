module HW04 where

import BST
import Data.Char
import Data.Maybe

insertBST :: (a -> a -> Ordering) -> a -> BST a -> BST a
insertBST _ input Leaf = Node Leaf input Leaf
insertBST cmp input (Node leftTree curData rightTree)
  | cmp input curData == LT = Node (insertBST cmp input leftTree) curData rightTree
  | otherwise = Node leftTree curData (insertBST cmp input rightTree)

allCaps :: [String] -> Bool
allCaps [] = True
allCaps (x:xl) = (not . null $ x) && (isUpper . head $ x) && (allCaps xl)

dropTrailingWhitespace :: String -> String
dropTrailingWhitespace [] = []
dropTrailingWhitespace str
  | last str == ' ' = dropTrailingWhitespace . init $ str
  | otherwise = str

firstLetters :: [String] -> [Char]
firstLetters = catMaybes . map listToMaybe

asList :: [String] -> String
-- asList list = filter (/= '\"') (show list)
asList list = "[" ++ (exceptionTail $ __asList list) ++ "]"

__asList :: [String] -> String
__asList [] = []
__asList (x:xl) = (',' : x) ++ __asList xl

exceptionTail :: [a] -> [a]
exceptionTail [] = []
exceptionTail (x:xl) = xl