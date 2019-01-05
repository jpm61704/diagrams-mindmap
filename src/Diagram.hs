module Diagram
  (

    topicNodes

  )where

import Diagrams.Prelude
import Diagrams.TwoD.Shapes
import Diagrams.TwoD.Size
import Diagrams.TwoD.Text
import Diagrams.TwoD.Align
import Diagrams.Backend.Rasterific.Text
import Diagrams.Backend.Rasterific.CmdLine

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
  return $ (scaledNode t) # translate (r2 p)
  -- return $ (circle 3 <> text n) # translate (r2 p)

{- |
creates a rounded rectangle topic node using the rasterific backend's texterific
function to create text with an envelope.
-}
scaledNode :: Topic -> Diagram B
scaledNode t = box <> centerXY txt
  where txt :: Diagram B
        txt     = texterific $ topicName t
        (th,tw) = (height txt, width txt)
        sf      = 1.5
        box     = roundedRect (tw * sf) (th * sf) 0.2


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

{-
Here I will try to solve the text boxing problem. This will probably be fairly
ad-hoc.

It doesn't seem that there is a good solution from the perspective of diagrams.

We will use the rasterific backend to try and support text with envelopes. This
may be in the right direction.

-}
