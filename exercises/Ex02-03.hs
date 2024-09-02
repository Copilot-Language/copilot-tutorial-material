{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

-- Part 2, exercise 3 (10 minutes).
--
-- We want to be robust to small drops in speed that are temporary, so we'll
-- check if the speed is below the threshold two times in a row. Then it's a
-- problem.
--
-- Therefore, we want to check if an aircraft's speed was too low in the
-- previous sample and the current sample (twice in a row).
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
myProp = [False] ++  (s < threshold) -- ???
