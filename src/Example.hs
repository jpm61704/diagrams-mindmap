module Example where

import Construct
import Layout


-- * Topics

topic_strings :: [String]
topic_strings = [ "Language"
                , "Syntax"
                , "Semantics"
                , "CFGs"
                , "Terms"
                , "Production Rules"
                , "Context Sensitive Rules"
                , "Location Sensitivity"
                , "Namespace Sensitivity"
                , "Type Sensitivity"
                , "Cursors"
                , "Spatial Logic"
                , "Loc -> Term -> Term"
                , "Concrete Syntax"
                , "Editor"
                , "Edit-Actions"
                ]

e_topics :: [Topic]
e_topics = map topic topic_strings

relations :: [Relation]
relations = [ "Language" -| "terms defined by"   |-> "Syntax"
            , "Language" -| "meaning defined by" |-> "Semantics"

            , "Syntax"   -| "represented by"     |-> "CFGs"
            , "Syntax"   -| "defines valid"      |-> "Terms"

            , "Terms"    -| "realization of"     |-> "Syntax"

            , "CFGs"     -| "constructed by"     |-> "Production Rules"

            , "Production Rules" -| "realize"    |-> "CFGs"
            , "Production Rules" -| "produce"    |-> "Terms"
            , "Production Rules" -| "some are"   |-> "Context Sensitive Rules"
            ]

exampleMM :: Mindmap
exampleMM = Mindmap e_topics relations



-- type Layout = Topic -> Either DiagramError Point


