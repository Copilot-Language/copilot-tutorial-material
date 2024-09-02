{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

-- Part 2, exercise 6 (2 minutes).
--
-- The specification using previous works for one sample, but we may want to
-- check multiple samples.
--
-- We have generalized checking a property for the recent past. We call that
-- new *temporal* operator alwaysBeen.
--
-- Re-write (5) for 10 seconds instead of 1 or 2.

main :: IO ()
main = do
  interpret 10 spec

spec :: Spec
spec = do
  trigger "sample1" myProp [arg sensorData]

sensorData :: Stream Float
sensorData = extern "sensor" (Just [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])

myProp :: Stream Bool
myProp = alwaysBeen 1 underThreshold -- Check for 1 sample ago and now

underThreshold :: Stream Bool
underThreshold = s < threshold

previous :: Stream Bool -> Stream Bool
previous s = [False] ++ s

alwaysBeen :: Int -> Stream Bool -> Stream Bool
alwaysBeen 0 s = true
alwaysBeen n s = s && (alwaysBeen (n - 1) (previous s))
