{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

-- 5 m
-- Shows binary operations.
-- As a bonus, it shows how to have multiple triggers as well.

main :: IO ()
main = interpret 10 spec

spec :: Spec
spec = do -- notice the `do` and the indentation!
  trigger "sample1" myTrue [arg myTrue, arg false]
  trigger "sample2" myFalse []
  trigger "sample3" mySth [arg two, arg six]

myTrue :: Stream Bool
myTrue = true

myFalse :: Stream Bool
myFalse = not myTrue

-- (||) :: Stream Bool -> Stream Bool -> Stream Bool
mySth :: Stream Bool
mySth = not myTrue || myTrue

-- Basic numerical operations are available.
two :: Stream Int32
two = 1 + 1

six :: Stream Int32
six = 2 * 3
