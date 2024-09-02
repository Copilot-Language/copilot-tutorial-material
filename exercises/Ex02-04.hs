{-# LANGUAGE RebindableSyntax #-}
-- Part 2, exercise 4 (10 minutes).
--
-- We can generalize that construct for booleans by creating a `previous`
-- function.
-- 
-- Re-write previous solution using previous.

import Copilot.Compile.C99
import Language.Copilot
                                                                                 
main :: IO ()
main = do
  spec' <- reify spec
  compile "sample1" spec'

sensorData :: Stream Float
sensorData = extern "sensor" (Just [1, 2, 3, 4, 5, 6, 7])

previous :: _
previous = _

myProp :: Stream Bool
myProp = underThreshold && underThresholdBefore

underThresholdBefore :: Stream Bool
underThresholdBefore = [False] ++ underThreshold

underThreshold :: Stream Bool
underThreshold = (s < threshold)

spec :: Spec
spec = do
  trigger "sample1" myProp [arg sensorData]
