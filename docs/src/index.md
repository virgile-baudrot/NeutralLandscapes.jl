# NeutralLandscapes.jl

A pure Julia port of https://github.com/tretherington/nlmpy

## Landscape models

```@docs
NeutralLandscapeMaker
NoGradient
PlanarGradient
EdgeGradient
WaveSurface
DistanceGradient
RectangularCluster
NearestNeighborElement
PerlinNoise
```

## Landscape generating function

```@docs
rand!
rand
_landscape!
```

## Other functions

```@docs
mask!
```
