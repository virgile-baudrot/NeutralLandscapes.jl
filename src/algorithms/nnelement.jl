"""
    NearestNeighborElement

Assigns a value to each patch using a k-NN algorithmm with `n` initial clusters
and `k` neighbors. The default is to use three cluster and a single neighbor.
"""
struct NearestNeighborElement <: NeutralLandscapeMaker
    n::Int
    k::Int
    function NearestNeighborElement(n::Int64, k::Int64)
        @assert n > 0
        @assert k > 0
        @assert k <= n
        new(n,k)
    end
end

"""
    NearestNeighborElement()

When given no arguments, partitions the landscape using the closest of three
neighbors.
"""
NearestNeighborElement() = NearestNeighborElement(3, 1)

function _landscape!(mat, alg::NearestNeighborElement)
    fill!(mat, 0.0)
    clusters = sample(eachindex(mat), alg.n; replace=false)
    for (i,n) in enumerate(clusters)
        mat[n] = i
    end  
    coordinates = Matrix{AbstractFloat}(undef, (2, prod(size(mat))))
    for (i, p) in enumerate(Iterators.product(axes(mat)...))
        coordinates[1:2, i] .= p
    end
    tree = KDTree(coordinates[:,clusters])
    if alg.k  == 1
        mat[:] .= nn(tree, coordinates)[1]
    else
        mat[:] .= map(mean, knn(tree, coordinates, alg.k)[1])
    end
    return mat
end
