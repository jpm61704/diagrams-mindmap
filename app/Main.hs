module Main where

import Diagrams.Prelude
import Diagrams.Backend.Rasterific.CmdLine
import Diagrams.TwoD.Size
import Diagrams.TwoD.Shapes
import Diagrams.TwoD.Align

import Construct
import Diagram
import Layout
import Example

main :: IO ()
main = mainWith $ (centerXY x) <> (rect w h # fc white)
  where (Right x) = topicNodes exampleMM (grid exampleMM 20)
        (h,w) = (1.2 * height x, 1.2 * width x)
