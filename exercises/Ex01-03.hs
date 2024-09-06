{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

-- 5 minutes
-- Shows that we can create our own named definitions and introduces numbers.

main :: IO ()
main = interpret 10 spec

spec :: Spec
spec = trigger "sample1" myTrue [arg true, arg myFalse, arg zero, arg one]

myTrue :: Stream Bool
myTrue = true

myFalse :: Stream Bool
myFalse = false

zero :: Stream Int32
zero = 0

one :: Stream Int32
one = 1
