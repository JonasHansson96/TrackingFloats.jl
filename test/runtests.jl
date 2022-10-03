using TrackingFloats
using Test

@testset "TrackingFloats.jl" begin
    # Write your tests here.
    using Test
    v = TrackingFloat(1.0) + TrackingFloat(3.0) # We expect TrackingFloat(4, 3)
    @test v     == TrackingFloat(4,3)           # which we test using the macro @test
    @test v*v   == TrackingFloat(16, 4)
    @test v - v == TrackingFloat(0, 4)
    @test v/TrackingFloat(0.1, 0) == TrackingFloat(40, 10)
end
