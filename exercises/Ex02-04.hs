{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

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
sensorData = extern "sensor" (Just [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])

myProp :: Stream Bool
myProp = underThreshold && underThresholdBefore

underThresholdBefore :: Stream Bool
underThresholdBefore = [False] ++ underThreshold

underThreshold :: Stream Bool
underThreshold = (s < threshold)
