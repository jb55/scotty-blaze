redo-ifchange configure
find src -name '*.hs' | xargs redo-ifchange
cabal build
