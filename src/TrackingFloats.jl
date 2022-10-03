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

"""
Constructs a TrackingFloat
# Usage:
    TrackingFloat(v::TrackingFloat) = v
"""
TrackingFloat(v::TrackingFloat) = v

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
"""
# Usage:
    -(x_1::TrackingFloat)=-x_1
"""
-(tf::TrackingFloat)=TrackingFloat(-value(tf),getmax(tf))

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


"""
# Usage:
    tf_new=sqrt(tf::TrackingFloat)
"""
sqrt(tf::TrackingFloat) = TrackingFloat(sqrt(value(tf)),getmax(tf))

"""
Compare value of tf1.x with tf2.x
<(tf1::TrackingFloat,tf2::TrackingFloat)
"""
<(tf1::TrackingFloat,tf2::TrackingFloat)= value(tf1)<value(tf2)

"""
Promote other real numbers to TrackingFloat
"""
promote_rule(::Type{TrackingFloat}, ::Type{T} ) where {T<:Real} = TrackingFloat

end
