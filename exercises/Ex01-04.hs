{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

main :: IO ()
main = do
  interpret 5 spec

spec :: Spec
spec = do
  trigger "sample1" myTrue [arg true, arg false]
  trigger "sample2" myFalse []

myTrue :: Stream Bool
myTrue = true

myFalse :: Stream Bool
myFalse = false

myFalse' :: Stream Bool
myFalse' = not true
