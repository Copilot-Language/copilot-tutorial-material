{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

-- 5
-- Show how we can apply operators to streams.
-- Additionally shows multiple triggers in a spec.

main :: IO ()
main = interpret 10 spec

spec :: Spec
spec = trigger "sample1" myTrue [arg true, arg myFalse, arg negative_one]

myTrue :: Stream Bool
myTrue = true

-- not :: Stream Bool -> Stream Bool
myFalse :: Stream Bool
myFalse = not myTrue

one :: Stream Int32
one = 1

-- (-) :: Stream Int32 -> Stream Int32
negative_one :: Stream Int32
negative_one = - one
