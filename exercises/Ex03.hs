-- | An example showing the usage of the What4 backend in copilot-theorem for
-- propositional logic on boolean streams.

module Main where

import           Control.Monad (forM_)
import qualified Prelude       as P

import Copilot.Theorem.What4
import Language.Copilot

spec :: Spec
spec = do
  -- The constant value true, which is translated as the corresponding SMT
  -- boolean literal.
  prop "Example 1" (forAll true)

  -- The constant value false, which is translated as the corresponding SMT
  -- boolean literal.
  prop "Example 2" (forAll false)

  -- An inductively defined flavor of true, which requires induction to prove.
  let a = [True] ++ a
  prop "Example 3" (forAll a)

  -- An inductively defined "a or not a" proposition.
  let a = [False] ++ b
      b = [True] ++ a
  prop "Example 4" (forAll (a || b))

  -- A version of "a or not a" proposition which does not require any sort of
  -- inductive argument.
  let a = [False] ++ b
      b = not a
  prop "Example 5" (forAll (a || b))

  -- A bit more convoluted version of Example 5, which is provable.
  let a = [True, False] ++ b
      b = [False] ++ not (drop 1 a)
  prop "Example 6" (forAll (a || b))

  -- Exercises:
  --   How would you check if the monitor is vacuously true (always fires).
  --   How would you check if the monitor is vacuously false (never fires).
  --   How would you check if, given two monitors are exclusive (they can't
  --   both fire at the same time)?
  --   How would you check if, given two properties, one of them will always
  --   fire.





























  -- An example using external streams.
  let b :: Stream Int32
      b = extern "b" Nothing
  prop "Example 7" (forAll (b > 10 || b < 10))

  -- An example using external streams.
  --
  -- This points to the system under study being potentially unrealizable. If
  -- one of the monitored properties will always fire at some point, that means
  -- that the system will be permanently correcting an unwanted situation and
  -- is never in nominal state.
  let b :: Stream Int32
      b = extern "b" Nothing
      p1 = b > 100  -- the temperature is too high
      p2 = b <= 100 -- the temperature is too low
  prop "Example 8" (forAll (p1 || p2))

  return ()

main :: IO ()
main = do
  spec' <- reify spec

  -- Use Z3 to prove the properties.
  results <- prove Z3 spec'

  -- Print the results.
  forM_ results $ \(propName, propRes) -> do
    putStr $ propName <> ": "
    case propRes of
      Valid   -> putStrLn "valid"
      Invalid -> putStrLn "invalid"
      Unknown -> putStrLn "unknown"
