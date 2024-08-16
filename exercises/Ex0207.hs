{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

import Ex0207MyLib

-- Part 2, exercise 7 (5 minutes).
--
-- Move reusable definitions to a separate module.
-- Import module.
-- Check copilot-libraries on hackage
-- Point people to PTLTL and MTL modules.

main :: IO ()
main = do
  interpret 15 spec

spec :: Spec
spec = do
  trigger "sample1" myProp [arg sensorData]

sensorData :: Stream Float
sensorData = extern "sensor" (Just [5, 25, 10, 5, 15, 6, 12, 12, 12, 6, 6, 6, 13, 14, 15])

myProp :: Stream Bool
myProp = alwaysBeen 1 underThreshold -- Check for 1 sample ago and now

underThreshold :: Stream Bool
underThreshold = s < threshold
