{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot hiding (previous)

-- Part 2, exercise 4 (10 minutes).
--
-- We can generalize that construct for booleans by creating a `previous`
-- function.
--
-- Re-write previous solution using previous.

main :: IO ()
main = do
  interpret 10 spec

spec :: Spec
spec = do
  trigger "sample1" myProp [arg sensorData]

sensorData :: Stream Float
sensorData = extern "sensor" (Just [5, 25, 10, 5, 15, 6, 12, 12, 12, 6, 6, 6, 13, 14, 15])

myProp :: Stream Bool
myProp = underThreshold && underThresholdBefore

underThreshold :: Stream Bool
underThreshold = sensorData < threshold

threshold :: Stream Float
threshold = constant 10

underThresholdBefore :: Stream Bool
underThresholdBefore = [False] ++ underThreshold -- Use previous here

-- Define previous
previous :: Stream Bool -> Stream Bool
previous = _
