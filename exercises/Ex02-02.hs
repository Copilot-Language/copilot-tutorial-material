{-# LANGUAGE RebindableSyntax #-}
-- Part 2, exercise 2 (10 minutes).
--
-- We want to check if an aircraft's speed was too low in the previous sample.
-- 
-- How do we do it?

import Copilot.Compile.C99
import Language.Copilot
                                                                                 
main :: IO ()
main = do
  spec' <- reify spec
  compile "sample1" spec'

sensorData :: Stream Float
sensorData = extern "sensor" (Just [1, 2, 3, 4, 5, 6, 7])

myProp :: Stream Bool
myProp = _ -- s < threshold

spec :: Spec
spec = do
  trigger "sample1" myProp [arg sensorData]
