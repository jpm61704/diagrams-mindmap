module Layout
  (
    -- * Types for layouts
    Point
  , Layout
  , Spacing
  , DiagramError

    -- * Layout Functions
  , grid

  ) where

import           Construct
import qualified Data.Map.Lazy as M

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

type Point = (Double, Double)

type Layout = Topic -> Either DiagramError Point

type Spacing = Double

data DiagramError = NotATopic deriving (Eq, Show)


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


-- | produces a square-ish grid of topics given a mindmap and spacing parameter
grid :: Mindmap -> Spacing -> Layout
grid mm s = \k -> M.findWithDefault (Left NotATopic) k point_map
  where ts        = topics mm
        row_size  = (rowSize . length) ts
        ts'       = zip ts [0..]
        point_map = foldr (\(t,n) -> M.insert t (Right $ point s row_size n)) mempty ts'


rowSize :: (Integral a, Integral b) => a -> b
rowSize = ceiling . sqrt . fromInteger . toInteger

{- |
The position within a row given a grids row size and that items number. Note
that this is zero-indexed.
-}
column :: (Integral a) => a -> a -> a
column m n = mod n m

{- |
The row which an item should be placed in given its grid's size and item number
This is zero-indexed.
-}
row :: (Integral a) => a -> a -> a
row m n = div n m

{- |
generates the point an item n should occur at if the grid has rows of length m
and the items number is n
-}
point :: (Integral a) => Spacing -> a -> a -> Point
point s m n = mapPair ((s *) . fromIntegral) $ divMod n m

mapPair :: (a -> b) -> (a,a) -> (b,b)
mapPair f (x,y) = (f x, f y)


