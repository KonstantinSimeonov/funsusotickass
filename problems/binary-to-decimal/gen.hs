#!/usr/bin/env runhaskell

import Prelude
import System.IO
import System.Random
import Data.List

bin 0 = "0"
bin x = let m = x `mod` 2
            d = x `div` 2
        in (if d > 0 then bin d else "") ++ show m

main = do
  outputs <- sequence $ zipWith (\low high -> randomRIO (10 ^ low, 10 ^ high)) [0..17] [1..] :: IO [Int]
  let cases = zipWith (\index output -> (pad $ show index, bin output, show output)) [0..] outputs
  mapM (\(index, input, output) -> do
        print index
        writeFile (index ++ ".test.in.txt") input
        writeFile (index ++ ".test.out.txt") output
      ) cases
  where
    pad str = case length str of
      1 -> "00" ++ str
      2 -> "0" ++ str
      _ -> str
