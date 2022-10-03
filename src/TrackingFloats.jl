module TrackingFloats

using LinearAlgebra
import Base: +,-,*,/, promote_rule,<,sqrt

"""
TrackingFloat
# Fields:
    x::Float64   current value
    x_max::Float64  maximum value in creation.
"""
struct TrackingFloat <: AbstractFloat
    x::Float64
    x_max::Float64
end


end
