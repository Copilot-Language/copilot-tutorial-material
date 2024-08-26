{-# LANGUAGE RebindableSyntax #-}

import Language.Copilot

spec = trigger "test" true [arg true]

main = interpret 10 spec
