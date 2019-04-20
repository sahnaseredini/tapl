module TestSuite4 where

import Ch04
import InputData
import ExpectedOutput
import Numeric (showIntAtBase)
import Data.Char (intToDigit)
import Data.List
import Control.Monad

list = mapM eval allTests
pairs = zipWithM (,) list allOutputs
output = foldl (\acc (x, y) -> (x == y) && acc) True pairs 
outNum = calSteps 1 list allOutputs

--calSteps :: Int -> [Term] -> [Term] -> Int
calSteps step (l:list) (o:output)
	| null output = if (l == o) then 0 else step
	| otherwise = (calSteps (step*2) list output) + (if l == o then 0 else step)

main = do print $ (if output == False then show $ elemIndices '1' (reverse $ draw outNum)  else "Works fine!" )

draw outNum = showIntAtBase 2 intToDigit outNum ""
