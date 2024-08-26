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

spec :: Spec                                                                     
spec = do
  trigger "sample1" myTrue [arg myTrue, arg false] 
  trigger "sample2" myFalse [] 
  trigger "sample3" mySth [] 
