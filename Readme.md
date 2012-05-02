
# Web.Scotty.Blaze

blaze-html integration for scotty

## Exports

```haskell
blaze :: Html -> ActionM ()

builder :: Builder -> ActionM ()
```

## Example

```haskell
{-# LANGUAGE OverloadedStrings #-}

import           Web.Scotty
import           Web.Scotty.Blaze
import           Network.Wai.Middleware.RequestLogger
import           Text.Blaze.Html (Html)
import qualified Text.Blaze.Html5 as H
import qualified Data.Text as T
import           Data.Monoid ((<>))

helloHtml :: T.Text -> Html
helloHtml n =
  H.html $ do
    H.head $ do
      H.title greet
    H.body $ do
      H.p greet
  where
    greet = H.toHtml $ "Hello, " <> n

main :: IO ()
main = scotty 3000 $ do
  middleware logStdoutDev
  get "/:name" $ do
    n <- param "name"
    blaze $ helloHtml (T.pack n)
```
