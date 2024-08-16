{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

-- 2 minutes
-- Shows passing arguments to a trigger.

main :: IO ()
main = interpret 10 spec

spec :: Spec
spec = trigger "trigger1" true [arg true, arg false]
