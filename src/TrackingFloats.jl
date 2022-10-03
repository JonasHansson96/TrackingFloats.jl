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

"""
Constructs a TrackingFloat
# Usage:
    tf=TrackingFloat(x)
"""
TrackingFloat(x)=TrackingFloat(copy(x),zero(x))

# Add and subtraction of 2 TrackingFloats.
"""
# Usage:
x_3=+(x_1::TrackingFloat,x_2::TrackingFloat)=x_1+x_2
"""
+(x_1::TrackingFloat,x_2::TrackingFloat) = TrackingFloat(x_1.x+x_2.x,max(abs(x_1.x),abs(x_1.x_max),abs(x_2.x),abs(x_2.x_max)))
"""
# Usage:
-(x_1::TrackingFloat,x_2::TrackingFloat)=x_1-x_2
"""
-(x_1::TrackingFloat,x_2::TrackingFloat) = TrackingFloat(x_1.x-x_2.x,max(abs(x_1.x),abs(x_1.x_max),abs(x_2.x),abs(x_2.x_max)))

# Multiplication and division
"""
# Usage:
*(x_1::TrackingFloat,x_2::TrackingFloat)=x_1*x_2
"""
*(x_1::TrackingFloat,x_2::TrackingFloat) = TrackingFloat(x_1.x*x_2.x,max(abs(x_1.x),abs(x_1.x_max),abs(x_2.x),abs(x_2.x_max)))
"""
# Usage:
/(x_1::TrackingFloat,x_2::TrackingFloat)=x_1/x_2
"""
function /(x_1::TrackingFloat,x_2::TrackingFloat) 
    den=1/x_2.x
    TrackingFloat(x_1.x*den,max(abs(x_1.x),abs(x_1.x_max),abs(den),abs(x_2.x_max)))
end

value(tf::TrackingFloat)=tf.x
getmax(tf::TrackingFloat)=tf.x_max

end
