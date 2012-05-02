{-# LANGUAGE OverloadedStrings #-}

module Web.Scotty.Blaze (
  blaze
, builder
) where

import           Network.Wai
import           Web.Scotty (ActionM, header)
import qualified Control.Monad.State as MS
import           Text.Blaze.Html (Html)
import           Blaze.ByteString.Builder (Builder)
import           Text.Blaze.Html.Renderer.Utf8 (renderHtmlBuilder)

blaze :: Html -> ActionM ()
blaze h = do
  header "Content-Type" "text/html"
  builder $ renderHtmlBuilder h

builder :: Builder -> ActionM ()
builder = MS.modify . setContent

setContent :: Builder -> Response -> Response
setContent b (ResponseBuilder s h _) = ResponseBuilder s h b
setContent b (ResponseFile s h _ _)  = ResponseBuilder s h b
setContent b (ResponseSource s h _)  = ResponseBuilder s h b
