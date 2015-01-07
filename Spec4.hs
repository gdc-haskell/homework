
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

compareInt :: Int -> Int -> Ordering
compareInt = compare

main :: IO()
main = hspec $ do
  describe "Prelude.heade" $ do
    it "returns the first element of a list" $ do
      head [23 ..] `shouldBe` (23 :: Int)

  describe "Insert BST" $ do
    it "empty tree insert success" $ do
      insertBST compareInt 3 Leaf `shouldBe` Node Leaf 3 Leaf
    it "insert two value success" $ do
      insertBST compareInt 5 (insertBST compareInt 3 Leaf) `shouldBe` Node Leaf 3 (Node Leaf 5 Leaf)

  describe "allCaps" $ do
    it "should success." $ do
      allCaps ["Hi","There"] `shouldBe` True
    it "should success when empty list" $ do
      allCaps [] `shouldBe` True
    it "should fail with empty string." $ do
      allCaps ["", "Blah"] `shouldBe` False
    it "should fail with fail input." $ do
      allCaps ["Hi","there"] `shouldBe` False

  describe "dropTrailingWhitespace" $ do
    it "should return same which does not have trailing whitespace" $ do
      dropTrailingWhitespace "foo" `shouldBe` "foo"
    it "should can get empty string as input" $ do
      dropTrailingWhitespace "" `shouldBe` ""
    it "should remove trailing whitespace " $ do
      dropTrailingWhitespace "bar  " `shouldBe` "bar"

  describe "firstLetters" $ do
    it "should return first letters" $ do
      firstLetters [ "foo", "bar" ] `shouldBe` [ 'f', 'b' ]
    it "should ignore empty string" $ do
      firstLetters [ "foo", "" ] `shouldBe` [ 'f' ]
    it "should return empty list when input empty" $ do
      firstLetters [ ] `shouldBe` [ ]
    it "should return empty list when input is all empty string" $ do
      firstLetters [ "", "" ] `shouldBe` [ ]

  describe "asList" $ do
    it "should concat strings" $ do
      asList ["alpha","beta","gamma"] `shouldBe` "[alpha,beta,gamma]"
    it "should get empty list" $ do
      asList [] `shouldBe` "[]"
    it "should get one argument" $ do
      asList ["lonely"] `shouldBe` "[lonely]"
