
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
      parseRing "1 + 2 * 5" `shouldBe` Just (MkMod 1)

  describe "Mat2x2" $ do
    it "can add matrix " $ do
      (parseRing :: String -> Maybe Mat2x2) "[[1,2][1,2]] + [[2,2][2,2]]" `shouldBe` parseRing "[[3,4][3,4]]"
    it "can multiply matrix " $ do
      (parseRing :: String -> Maybe Mat2x2) "[[1,2][1,2]] * [[2,2][2,2]]" `shouldBe` parseRing "[[6,6][6,6]]"

  describe "distribute" $ do
    it "can distribute left" $ do
      distribute (Mul (Add (Lit 1) (Lit 3)) (Lit (2 :: Integer))) `shouldBe` Add (Mul (Lit 1) (Lit 2)) (Mul (Lit 3) (Lit (2 :: Integer)))

  describe "squashMulId" $ do
    it "can squash MulId" $ do
      squashMulId (Mul (Lit (1 :: Integer)) (Lit 2)) `shouldBe` (Lit 2)
    it "can squash two depth tree" $ do
      squashMulId (Mul (Mul (Lit (1 :: Integer)) (Lit 1)) (Lit 3)) `shouldBe` (Lit 3)
