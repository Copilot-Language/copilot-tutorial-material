{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

-- 3 minutes
-- Show reading streams from an external source.

main :: IO ()
main = interpret 10 spec

sensorData :: Stream Float
sensorData = extern "sensor" (Just [1, 2, 3, 4, 5, 6, 7])

-- A property that we use to fire the trigger.
myProp :: Stream Bool
myProp = sensorData > 2

spec :: Spec
spec = trigger "trigger1" myProp [arg sensorData]
