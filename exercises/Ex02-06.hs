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

previous :: Stream Bool -> Stream Bool
previous s = [False] ++ s

alwaysBeen :: Int -> Stream Bool -> Stream Bool
alwaysBeen 0 s = s
alwaysBeen n s = s && (alwaysBeen (n - 1) (previous s))
