{-# LANGUAGE RebindableSyntax #-}
module Ex0207MyLib where

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

previous :: Stream Bool -> Stream Bool
previous s = [False] ++ s

alwaysBeen :: Int -> Stream Bool -> Stream Bool
alwaysBeen 0 s = s
alwaysBeen n s = s && (alwaysBeen (n - 1) (previous s))
