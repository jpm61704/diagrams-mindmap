module Main where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

import Construct
import Diagram
import Layout
import Example

main :: IO ()
main = mainWith $ x
  where (Right x) = topicNodes exampleMM (grid exampleMM 10)
