
import Test.Hspec
-- import Test.QuickCheck
-- import Control.Exception (evaluate)
import BST
import HW04

instance Eq a => Eq (BST a) where
  Leaf == Leaf = True
  Node llTree lhsElement lrTree == Node rlTree rhsElement rrTree = (llTree == rlTree) && (lhsElement == rhsElement) && (lrTree == rrTree)
  Leaf == Node _ _ _ = False
  Node _ _ _ == Leaf = False


main :: IO()
main = hspec $ do
  describe "Prelude.heade" $ do
    it "returns the first element of a list" $ do
      head [23 ..] `shouldBe` (23 :: Int)

  describe "Insert BST" $ do
    it "empty tree insert success" $ do
      insertBST (compare :: Int -> Int -> Ordering) 3 Leaf `shouldBe` Node Leaf 3 Leaf
