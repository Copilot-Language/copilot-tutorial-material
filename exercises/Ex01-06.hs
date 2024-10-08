{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

-- 10 minutes
-- Shows delaying of streams.

main :: IO ()
main = interpret 10 spec

mySth :: Stream Bool
mySth = not true || true

--   ++ ('append') delays a stream by a list of values.
--   ++ :: [a] -> Stream a -> Stream a
mySth2 :: Stream Bool
mySth2 = [False] ++ (not true || true)

-- Exercise
-- Define a stream that has a constant value of 12, using the ++ operator.
twelve :: Stream Int32
twelve = 0

-- Exercise
-- Define a stream that starts with True and False, followed by
-- True ad infinitum.
-- <True, False, True, True, ...>
tft :: Stream Bool
tft = false

spec :: Spec
spec = do
  observer "twelve" twelve -- 'observer' just prints the value at every step.

  trigger "trigger1" tft [arg mySth, arg mySth2]
