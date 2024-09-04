{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

main :: IO ()
main = do
  interpret 15 spec

myTrue :: Stream Bool
myTrue = true

myFalse :: Stream Bool
myFalse = not myTrue

mySth :: Stream Bool
mySth = not myTrue || myTrue

mySth2 :: Stream Bool
mySth2 = [False] ++ (not myTrue || myTrue)

-- Definitions can be recursive as well!
mySth3 :: Stream Bool
mySth3 = [False] ++ mySth3

-- Exercise ??
-- Define a stream that alternates between True and False, e.g.:
-- <True, False, True, False, True, ...>
alternating :: Stream Bool
alternating = false -- remove the placeholder!

spec :: Spec
spec = do
  observer "mySth3" mySth3
  observer "alternating" alternating

  trigger "sample1" myTrue [arg myTrue, arg false, arg mySth2, arg mySth3]
  -- trigger "sample2" myFalse []
  -- trigger "sample3" mySth []
