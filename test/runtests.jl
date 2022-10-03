using TrackingFloats
using Test

@testset "TrackingFloats.jl" begin
    # Write your tests here.
    using Test
    v = TrackingFloat(1.0) + TrackingFloat(3.0) # We expect TrackingFloat(4, 3)
    @test v     == TrackingFloat(4,3)           # 
    @test v*v   == TrackingFloat(16, 4)         # 
    @test v - v == TrackingFloat(0, 4)
    @test v/TrackingFloat(0.1, 0) == TrackingFloat(40, 10)
    @test -v == TrackingFloat(-4,3)
    # Try working with matrices
    A = randn(5,5)
    b = randn(5)

    # Convert using broadcast
    At = TrackingFloat.(A)
    bt = TrackingFloat.(b)

    # Try some operations
    v = A*b
    vt = At*bt
    # Did we calculate correctly? Using value to convert back to float
    @test maximum(abs, v - value.(vt)) < sqrt(eps())

    using LinearAlgebra

    # Is promotion working?
    @test TrackingFloat(1.0, 0) + 2.0 == TrackingFloat(3, 2)

    # Create Positive definite matrix
    AA = A*A'
    # Convert to TrackingFloat matrix
    AAt = TrackingFloat.(AA)

    sol1 = AAt\bt # Uses qr
    # Did we get the correct answer?
    @test maximum(abs, value.(sol1) - AA\b) < sqrt(eps())

    # Try cholesky factorization
    F = cholesky(AAt)

    sol2 = F\bt
    @test maximum(abs, value.(sol2) - AA\b) < sqrt(eps())

end
