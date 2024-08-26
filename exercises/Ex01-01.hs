-- Example 1:
import Language.Copilot                                                          

main :: IO ()                                                                    
main = do                                                                        
  interpret 10 spec                                                              
  -- this could be 5
                                                                                 
spec :: Spec                                                                     
spec =                                                                           
  trigger "sample1" true [] 
  -- the string name is customizable
  -- meaning relevant later
