{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE TupleSections #-}

module Main where

import qualified Data.Text            as T
import qualified Data.Map             as Map
import           Data.Maybe
import           Reflex
import           Reflex.Dom
import           Data.Either
import           Data.Monoid
import           Data.List
import Control.Monad (join)

main :: IO ()
main = mainWidgetWithHead headElement bodyElement

headElement :: DomBuilder t m => m ()
headElement = do
  el "title" $ text "Rizary Blog"
  styleSheet "style/css/styles.css"
  where
    styleSheet link = elAttr "link" (Map.fromList [
          ("rel", "stylesheet")
        , ("type", "text/css")
        , ("href", link)
      ]) $ return ()

bodyElement :: DomBuilder t m => m ()
bodyElement = do
  divClass "min-h-screen flex items-center justify-center" $
    text "Hello World!!"

