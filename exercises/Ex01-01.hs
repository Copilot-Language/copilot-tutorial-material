{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

-- 5 minutes
-- Shows basic structure of a Copilot program.

main :: IO ()
main = interpret 10 spec

spec :: Spec
spec = trigger "trigger1" true []
  -- The name is customizable.
