```@example gallery
using NeutralLandscapes
using Plots

function demolandscape(alg::T) where {T <: NeutralLandscapeMaker}
    heatmap(rand(alg, (200, 200)), frame=:none, aspectratio=1, c=:davos)
end
```

## No gradient

```@example gallery
demolandscape(NoGradient())
```

## Planar gradient

```@example gallery
demolandscape(PlanarGradient(35))
```

## Edge gradient

```@example gallery
demolandscape(EdgeGradient(186))
```

## Wave surface

```@example gallery
demolandscape(WaveSurface(35, 3))
```

## Rectangular cluster
```@example gallery
demolandscape(RectangularCluster())
```

## Distance gradient

```@example gallery
sources = unique(rand(1:40000, 50))
demolandscape(DistanceGradient(sources))
```

## Nearest-neighbor element

```@example gallery
heatmap(rand(NearestNeighborElement(20, 1), (45, 45)))
```

## Perlin Noise

```@example gallery
demolandscape(PerlinNoise())
```

## Classify landscape

```@example gallery
sources = unique(rand(1:40000, 50))
heatmap(NeutralLandscapes.classify!(rand(DistanceGradient(sources), (200, 200)), [0.5, 1, 1, 0.5]))
```

## Diamond Square
```@example gallery
demolandscape(DiamondSquare())
```

## Midpoint Displacement
```@example gallery
demolandscape(MidpointDisplacement())
```
