module Diagram
  (

    topicNodes

  )where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine
import Diagrams.TwoD.Text

import Control.Monad

import Construct
import Layout

-- | Lay out all of the topic nodes in a diagram
topicNodes :: Mindmap -> Layout -> Either DiagramError (Diagram B)
topicNodes mm l = foldM f mempty (topics mm)
  where f d t = do
          d_t <- topicNode l t
          return $ d <> d_t



topicNode :: Layout -> Topic -> Either DiagramError (Diagram B)
topicNode l t = do
  p <- l t
  let n = topicName t
  return $ (circle 3 <> text n) # translate (r2 p)
