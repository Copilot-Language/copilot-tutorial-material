{-# LANGUAGE RebindableSyntax #-}
module Ex0207MyLib where

import Language.Copilot

previousT :: Stream Bool -> Stream Bool
previousT s = [True] ++ s

alwaysBeen :: Int -> Stream Bool -> Stream Bool
alwaysBeen 0 s = s
alwaysBeen n s = s && (alwaysBeen (n - 1) (previousT s))
