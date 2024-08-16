import Language.Copilot hiding (alwaysBeen, previous)
import Prelude          hiding (not, (&&), (++), (<))

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
  interpret 15 spec

spec :: Spec
spec = do
  trigger "sample1" myProp [ arg sensorData ]

sensorData :: Stream Float
sensorData = extern "sensor" (Just [5, 25, 10, 5, 15, 6, 12, 12, 12, 6, 6, 6, 13, 14, 15])

myProp :: Stream Bool
myProp = underThreshold && previous underThreshold

underThreshold :: Stream Bool
underThreshold = sensorData < threshold

threshold :: Stream Float
threshold = constant 10

previous :: Stream Bool -> Stream Bool
previous s = [False] ++ s

-- Try to generalize previous using the following signature:

-- alwaysBeen :: Int -> Stream Bool -> Stream Bool
-- alwaysBeen = _

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
alwaysBeen :: Int -> Stream Bool -> Stream Bool
alwaysBeen 0 s = s
alwaysBeen n s = s && (alwaysBeen (n - 1) ([True] ++ s))

-- alwaysBeen :: Stream Word64 -> Stream Bool -> Stream Bool
-- alwaysBeen n s =
--   if n == 0
--     then true
--     else (s && (alwaysBeen (n - 1) [True] ++ s))

-- Re-write (4) using alwaysBeen.

-- observer "sensorData"                      sensorData
-- observer "underThreshold"                  underThreshold
-- observer "(myAlwaysBeen 0 underThreshold)" (myAlwaysBeen 0 underThreshold)
-- observer "(myAlwaysBeen 1 underThreshold)" (myAlwaysBeen 1 underThreshold)
-- observer "(myAlwaysBeen 2 underThreshold)" (myAlwaysBeen 2 underThreshold)
-- observer "(myAlwaysBeen 3 underThreshold)" (myAlwaysBeen 3 underThreshold)
