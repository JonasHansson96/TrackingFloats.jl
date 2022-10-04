# TrackingFloats

<!-- [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://JonasHansson96.github.io/TrackingFloats.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://JonasHansson96.github.io/TrackingFloats.jl/dev/)
[![Build Status](https://travis-ci.com/JonasHansson96/TrackingFloats.jl.svg?branch=main)](https://travis-ci.com/JonasHansson96/TrackingFloats.jl) -->
[![Coverage](https://codecov.io/gh/JonasHansson96/TrackingFloats.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/JonasHansson96/TrackingFloats.jl)


This package implements a TrackingFloat number which keeps track of the largest float creating it.

Construct a TrackingFloat using
```julia
tf = TrackingFloat(5.)
```
The following standard operations can be used
```julia
tf1 = TrackingFloat(5.); tf2= TrackingFloat(3.)
tf1+tf2;
tf1-tf2;
tf1*tf2;
tf1/tf2
```

Hope you find it useful!