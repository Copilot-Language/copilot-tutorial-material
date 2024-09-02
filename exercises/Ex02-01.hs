{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

-- Part 2, exercise 1 (5 minutes).
--
-- We want to check if an aircraft's speed is too low.
--
-- Assuming we have the sensor speed, how do we write it?

main :: IO ()
main = do
  interpret 10 spec

spec :: Spec
spec = do
  trigger "sample1" myProp [arg sensorData]

sensorData :: Stream Float
sensorData = extern "sensor" (Just [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])

myProp :: Stream Bool
myProp = s < threshold
