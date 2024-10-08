{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

-- 10 minutes
-- Show recursion of streams.

main :: IO ()
main = interpret 15 spec

-- Definitions can be recursive.
myFalse :: Stream Bool
myFalse = [False] ++ myFalse

-- Exercise
-- Define a stream that alternates between True and False, e.g.:
-- <True, False, True, False, True, ...>
alternating :: Stream Bool
alternating = false -- remove the placeholder!

-- Exercise
-- Define a stream that counters from 0 and up, e.g.;
-- <0, 1, 2, 3, 4, 5, ...>
counter :: Stream Int64
counter = 0 -- remove the placeholder!

spec :: Spec
spec = do
  observer "alternating" alternating
  observer "counter" counter

  trigger "trigger1" alternating [arg counter]
