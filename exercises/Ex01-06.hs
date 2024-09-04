{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot

main :: IO ()
main = do
  interpret 5 spec

myTrue :: Stream Bool
myTrue = true

myFalse :: Stream Bool
myFalse = not myTrue

mySth :: Stream Bool
mySth = not myTrue || myTrue

-- ++ ('append') delays a stream by a list of values.
-- (++) :: Typed a => [a] -> Stream a -> Stream a
mySth2 :: Stream Bool
mySth2 = [False] ++ (not myTrue || myTrue)

--  Exercise ??
-- Define a stream that starts with True and False, followed by
-- True ad infinitum.
-- <True, False, True, True, ...>
ex1 :: Stream Bool
ex1 = false -- 'false' is a placeholder.

spec :: Spec
spec = do
  observer "mySth"  mySth  -- 'observer' just prints the value.
  observer "mySth2" mySth2

  observer "ex1" ex1

  trigger "sample1" myTrue [arg mySth, arg mySth2]
