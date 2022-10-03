module TrackingFloats

using LinearAlgebra
import Base: +,-,*,/, promote_rule,<,sqrt

struct TrackingFloat <: AbstractFloat
    x::Float64
    x_max::Float64
end


end
