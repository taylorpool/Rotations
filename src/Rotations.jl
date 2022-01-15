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

Base.:*(q1::Quaternion, q2::Quaternion) = begin
    Quaternion([
        q1[1]*q2[1] - q1[2]*q2[2] - q1[3]*q2[3] - q1[4]*q2[4]
        q1[1]*q2[2] + q1[2]*q2[1] + q1[3]*q2[4] - q1[4]*q2[3]
        q1[1]*q2[3] - q1[2]*q2[4] + q1[3]*q2[1] + q1[4]*q2[2]
        q1[1]*q2[4] + q1[2]*q2[3] - q1[3]*q2[2] + q1[4]*q2[1]
    ])
end

Base.conj(q::Quaternion) = begin
    Quaternion([
        q[1]
        -q[2]
        -q[3]
        -q[4]
    ])
end

end # module
