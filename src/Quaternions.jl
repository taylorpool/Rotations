using LinearAlgebra

mutable struct Quaternion{T<:Real} <: AbstractVector{T}
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

Base.exp(q::Quaternion) = begin
    v = q[2:end]
    norm_v = norm(v)
    exp(q[1])*Quaternion([
        cos(norm_v)
        v/norm_v*sin(norm_v)...
    ])
end

Base.log(q::Quaternion) = begin
    norm_q = norm(q)
    v = q[2:end]
    norm_v = norm(v)
    Quaternion([
        log(norm_q)
        v/norm_v*acos(q[1]/norm_q)...
    ])
end