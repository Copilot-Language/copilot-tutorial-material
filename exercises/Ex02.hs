{-# LANGUAGE RebindableSyntax #-}
import Language.Copilot                                                          
                                                                                 
main :: IO ()                                                                    
main = do                                                                        
  interpret 6 spec                                                              

myTrue :: Stream Bool
myTrue = true

myFalse :: Stream Bool
myFalse = not myTrue

spec :: Spec                                                                     
spec = do
  trigger "sample1" myTrue [arg myTrue]
  trigger "sample2" false [] 

























-- 
-- mySth :: Stream Bool
-- mySth = not myTrue || myTrue
-- 
-- mySth2 :: Stream Bool
-- mySth2 = [False] ++ (not myTrue || myTrue)
-- 
-- mySth3 :: Stream Bool
-- mySth3 = [False] ++ not mySth3
--                                                                                  
-- 
--   trigger "sample1" myTrue [arg myTrue, arg false, arg mySth2, arg mySth3] 
--   trigger "sample2" false [] 
--   trigger "sample3" myFalse [] 
--   trigger "sample4" mySth [] 
