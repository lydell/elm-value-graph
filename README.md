# Elm Value Graph

> **Try it:** https://lydell.github.io/elm-value-graph

This app shows you how every function – or any value – in an Elm application depend on each other, as a graph. It lets you answer questions like “why do I depend on this package?”. Think of it as a recursive “Find usages” IDE action.

Note: All elm/\* packages are excluded because they made the graph too noisy.

Warning: This is essentially a quick hack. I run a bunch of regex on the compiled JavaScript output. It seems to work good enough, though.
