{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

main :: IO ()
main = do
  interpret 5 spec

spec :: Spec
spec = do
  trigger "sample1" true [arg true, arg false]
  trigger "sample2" false []
