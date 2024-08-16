{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot
import Copilot.Compile.C99

-- 8 minutes
-- Show compilation to C code, the output and how everything comes together.

main :: IO ()
main = do
  spec' <- reify spec
  compile "ex01-09" spec'

-- Note how we don't specify data anymore here.
sensorData :: Stream Float
sensorData = extern "sensor" Nothing

myProp :: Stream Bool
myProp = sensorData > 2

spec :: Spec
spec = do
  trigger "trigger1" myProp [arg sensorData]
