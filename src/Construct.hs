module Construct
  (
    -- * Topics
    Topic
  , topic
  , topicName

    -- * Relations
  , Relation
    -- ** Relation Operators
  , (|->)
  , (-|)

    -- * Mindmap
  , Mindmap(Mindmap)
  , topics


  ) where

--------------------------------------------------------------------------------
------------------------------ Topics ------------------------------------------
--------------------------------------------------------------------------------

-- | Topics in a mindmap
data Topic = Topic { _text :: String } deriving (Eq, Ord, Show)

topic :: String -> Topic
topic = Topic

topicName :: Topic -> String
topicName = _text

--------------------------------------------------------------------------------
------------------------------ Relation ----------------------------------------
--------------------------------------------------------------------------------

-- | Directed relations between topics with descriptions
data Relation = Relation { _desc :: String
                         , _from :: Topic
                         , _to   :: Topic } deriving (Eq, Ord, Show)


-- | Arrow operator for creating relations
(|->) :: (String, String) -> String -> Relation
(t1, d) |-> t2 = Relation d (topic t1) (topic t2)

-- | auxiliary operator for use with the arrow operator
(-|) :: String -> String -> (String, String)
t -| s = (t,s)


--------------------------------------------------------------------------------
------------------------------ MindMap -----------------------------------------
--------------------------------------------------------------------------------

{-|
A mindmap in its most basic form consists of a collection of topics and their
relations. These can be further augmented to include groupings, colors, and
other layout or appearance features.
-}
data Mindmap = Mindmap { _topics    :: [Topic]
                       , _relations :: [Relation]}


topics :: Mindmap -> [Topic]
topics = _topics
