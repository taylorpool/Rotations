module Rotations

export Quaternion

mutable struct Quaternion{T} <: AbstractVector{T}
    a::T
    b::T
    c::T
    d::T
end

Base.size(q::Quaternion) = (4,)

Base.getindex(q::Quaternion, i::Int) = begin
    if i == 1
        value = q.a
    elseif i == 2
        value = q.b
    elseif i == 3
        value = q.c
    elseif i == 4
        value = q.d
    end
    value
end

Base.setindex!(q::Quaternion, value, i::Int) = begin
    if i == 1
        q.a = value
    elseif i == 2
        q.b = value
    elseif i == 3
        q.c = value
    elseif i == 4
        q.d = value
    end
end

end # module
