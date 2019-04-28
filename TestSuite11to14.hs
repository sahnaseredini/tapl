module TestSuite11to14 where

import Ch11to14
import InputData11to14
import ExpectedOutput11to14
import Numeric (showIntAtBase)
import Data.Char (intToDigit)
import Data.List
import Control.Monad

list = fmap (typeOf [("x", VarBind TyBool)]) allTests
pairs = zipWith (,) (liftM show list) (liftM show allOutputs)
output = foldl (\acc (x, y) -> (x == y) && acc) True pairs 
outNum = calSteps 1 (liftM show list) (liftM show allOutputs)

---calSteps :: Int -> [Term] -> [Term] -> Int
calSteps step (l:list) (o:output)
	| null list = if (l == o) then 0 else step
	| otherwise = (calSteps (step*2) list output) + (if l == o then 0 else step)

--main = do print list
main = do print $ (if output == False then show $ elemIndices '1' (reverse $ draw outNum)  else "Works fine!" )


draw outNum = showIntAtBase 2 intToDigit outNum ""
