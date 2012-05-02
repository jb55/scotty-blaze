redo-ifchange scotty-blaze.cabal
cabal configure || (cabal install --only-dependencies && cabal configure)
