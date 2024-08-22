{-# LANGUAGE RebindableSyntax #-}
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

-- Exercises

1) We want to check if an aircraft's speed is too low.

Assuming we have the sensor speed, how do we write it?

5 minute

2) We want to check if an aircraft's speed was too low in the previous sample.

How do we do it?

10 minutes

3) We want to check if an aircraft's speed was too low in the previous sample
   and the current sample (twice in a row).

How do we do it?

We can generalize that construct for booleans by creating a `previous`
function.

10 minutes

4) Re-write previous solution using previous.

We want to be robust to small drops in speed that are temporary, so we'll check
if the speed is below the threshold two times in a row. Then it's a problem.

10 minutes.

- alwaysBeen

-- Give signature and examples of how it works
alwaysBeen :: Int -> Stream Bool -> Stream Bool

alwaysBeen :: Int -> Stream Bool -> Stream Bool
alwaysBeen n s =
  if ?                         -- stop condition
    then ?                     -- base case
    else ? && (alwaysBeen ? ?) -- recursive case

-- Posible solutions

alwaysBeen :: Word64 -> Stream Bool -> Stream Bool
alwaysBeen 0 s = true
alwaysBeen n s = s && (alwaysBeen (n - 1) [True] ++ s)

alwaysBeen :: Stream Word64 -> Stream Bool -> Stream Bool
alwaysBeen n s =
  if n == 0
    then true
    else (s && (alwaysBeen (n - 1) [True] ++ s))

15 minutes.

5) Re-write (4) using alwaysBeen.

5 minutes.

6) Re-write (5) for 10 seconds instead of 1 or 2.

2 minutes.

7) Show library in Copilot.

5 minutes.
