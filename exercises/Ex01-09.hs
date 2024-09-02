{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot                                                          
                                                                                 
main :: IO ()                                                                    
main = do                                                                        
  interpret 5 spec                                                              

myOne :: Stream Int32
myOne = 1

myTwo :: Stream Int32
myTwo = 1 + 1

myCmp :: Stream Bool
myCmp = myTwo > 2

-- Change types to Int -- wrong
-- Change type to Word32
-- Apply other operations (tan)
-- Recursion
-- Create a counter
-- Use counter in comparison

spec :: Spec                                                                     
spec = do
  trigger "sample1" myCmp [arg myOne] 
