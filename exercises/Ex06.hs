{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot                                                          
import Copilot.Compile.C99
                                                                                 
main :: IO ()                                                                    
main = do                                                                        
  spec' <- reify spec
  compile "sample1" spec'

sensorData :: Stream Float
sensorData = extern "sensor" (Just [1, 2, 3, 4, 5, 6, 7])

myProp :: Stream Bool
myProp = sensorData > 2

spec :: Spec                                                                     
spec = do
  trigger "sample1" myProp [arg sensorData]

-- Compile this and explore header, implementation, and produce main that uses
-- this code, and run it.

-- Average two sensors
-- Low-pass filter.
--    \x -> if x < threshold then threshold else x
-- Derivative.
-- Two-term average filter?
--   Average current value with last value.
--   (s + prevS) / 2
-- Fibonacci
