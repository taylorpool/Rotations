module Rotations

export Quaternion

mutable struct Quaternion{T} <: AbstractVector{T}
    data::Vector{T}
end

Base.size(q::Quaternion) = (4,)

Base.getindex(q::Quaternion, i::Int) = begin
    q.data[i]
end

Base.setindex!(q::Quaternion, value, i::Int) = begin
    q.data[i] = value
end

end # module
