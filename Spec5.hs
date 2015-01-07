
import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

import Parser
import Ring
import HW05

main :: IO()
main = hspec $ do
  describe "Prelude.heade" $ do
    it "returns the first element of a list" $ do
      head [23 ..] `shouldBe` (23 :: Int)

  describe "Ring Mod5" $ do
    it "has addId 0" $ do
      addId `shouldBe` MkMod 0
    it "add 3 + 4 = 2" $ do
      add (MkMod 3) (MkMod 4) `shouldBe` MkMod 2
    it "should parse int" $ do
      parseRing "1 + 2 * 5" == Just (MkMod 1)
