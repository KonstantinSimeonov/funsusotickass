#!/usr/bin/env runhaskell

import Prelude
import System.IO
import System.Random

main = do
  inputs <- sequence $ map (\(low, high) -> randomRIO (10 ^ low :: Int, 10 ^ high :: Int)) $ zip [0..17] [1..]

  let cases = zipWith (\index input -> (pad $ show index, show input, toBin input)) [0..] inputs

  mapM (\(index, input, output) -> do
      writeFile (index ++ ".test.in.txt") input
      writeFile (index ++ ".test.out.txt") output
    ) cases

  where
    pad str = case length str of
      1 -> "00" ++ str
      2 -> "0" ++ str
      _ -> str

    toBin 0 = "0"
    toBin x = let m = x `mod` 2
                  d = x `div` 2
              in (if d > 0 then toBin d else "") ++ show m
