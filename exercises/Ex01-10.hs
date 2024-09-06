{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

main :: IO ()
main = interpret 10 spec

sensorData :: Stream Float
sensorData = extern "sensor" (Just [1, 2, 3, 4, 5, 6, 7])

myProp :: Stream Bool
myProp = sensorData > 2

spec :: Spec
spec = do
  trigger "sample1" myProp [arg sensorData]

-- What if we interpret too many steps.
-- Add another sensor.
-- Altitude meter (aircraft stays within range).
