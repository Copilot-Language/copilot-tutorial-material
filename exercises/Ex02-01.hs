{-# LANGUAGE RebindableSyntax #-}
-- Part 2, exercise 1 (5 minutes).
--
-- We want to check if an aircraft's speed is too low.
-- 
-- Assuming we have the sensor speed, how do we write it?

import Copilot.Compile.C99
import Language.Copilot
                                                                                 
main :: IO ()                                                                    
main = do                                                                        
  spec' <- reify spec
  compile "sample1" spec'

sensorData :: Stream Float
sensorData = extern "sensor" (Just [1, 2, 3, 4, 5, 6, 7])

myProp :: Stream Bool
myProp = s < threshold

spec :: Spec                                                                     
spec = do
  trigger "sample1" myProp [arg sensorData]
