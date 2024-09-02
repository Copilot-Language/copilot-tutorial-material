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
sensorData = extern "sensor" (Just [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])

myProp :: Stream Bool
myProp = _ -- s < threshold
