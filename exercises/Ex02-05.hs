{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

-- Part 2, exercise 5 (15 minutes).
--
-- The specification using previous works for one sample, but we may want to
-- check multiple samples. Then it becomes cumbersome.
--
-- We want to generalize checking a property for the recent past.
--
-- We call that new *temporal* operator alwaysBeen.

main :: IO ()
main = do
  interpret 10 spec

spec :: Spec
spec = do
  trigger "sample1" myProp [arg sensorData]

sensorData :: Stream Float
sensorData = extern "sensor" (Just [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])

myProp :: Stream Bool
myProp = underThreshold && previous underThreshold

underThreshold :: Stream Bool
underThreshold = s < threshold

previous :: Stream Bool -> Stream Bool
previous s = [False] ++ s

-- Try to generalize previous using the following signature:

alwaysBeen :: Int -> Stream Bool -> Stream Bool
alwaysBeen = _

-- See below for clues.













-- Expand one step

-- alwaysBeen :: Int -> Stream Bool -> Stream Bool
-- alwaysBeen n s =
--   if ?                         -- stop condition
--     then ?                     -- base case
--     else ? && (alwaysBeen ? ?) -- recursive case
--
-- See below for possible solutions.














-- Posible solutions
--
-- alwaysBeen :: Word64 -> Stream Bool -> Stream Bool
-- alwaysBeen 0 s = true
-- alwaysBeen n s = s && (alwaysBeen (n - 1) [True] ++ s)
--
-- alwaysBeen :: Stream Word64 -> Stream Bool -> Stream Bool
-- alwaysBeen n s =
--   if n == 0
--     then true
--     else (s && (alwaysBeen (n - 1) [True] ++ s))

-- Re-write (4) using alwaysBeen.
