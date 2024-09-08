{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

-- 7 min
-- More advanced example with custom functions.

main :: IO ()
main = interpret 10 spec

-- Just a definition without arguments.
thirteen :: Stream Int32
thirteen = 13

-- We can make functions as well. Arguments to the function are defined on the
-- left hand side of the = sign.
increase :: Stream Int32 -> Stream Int32
increase n = n + 1

-- Functions can have multiple arguments.
myPlus :: Stream Int32 -> Stream Int32 -> Stream Int32
myPlus l r = l + r


-- Exercise
-- Define a function that calculates the square root of its input.
mySqrt :: Stream Int32 -> Stream Int32
mySqrt n = 0


-- Exercise
-- Define a function that calculates the average over two integer streams.
-- Hint: use the `div` function for division in the integer space.
avg2 :: Stream Int32 -> Stream Int32 -> Stream Int32
avg2 n m = 0


spec :: Spec
spec = do
  observer "mySqrt 8" (mySqrt 8)

  observer "avg 3 5" (avg2 3 5)
