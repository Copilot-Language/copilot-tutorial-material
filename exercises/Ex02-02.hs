{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

-- Part 2, exercise 2 (10 minutes).
--
-- We want to check if an aircraft's speed was too low in the previous sample.
--
-- How do we do it?

main :: IO ()
main = do
  interpret 10 spec

spec :: Spec
spec = do
  trigger "sample1" myProp [arg sensorData]

sensorData :: Stream Float
sensorData = extern "sensor" (Just [5, 25, 10, 5, 15, 6, 12, 12, 12, 6, 6, 6, 13, 14, 15])

myProp :: Stream Bool
myProp = _

underThreshold :: Stream Bool
underThreshold = sensorData < threshold

threshold :: Stream Float
threshold = constant 10
