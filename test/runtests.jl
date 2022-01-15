using Test

using Rotations

x = [1.0; 0.0; 0.0; 0.0]
quat = Quaternion(x...)

@test quat[1] == 1.0
@test quat[2] == 0.0
@test quat[3] == 0.0
@test quat[4] == 0.0

quat[2] = 1.0
@test quat[2] == 1.0

q1 = Quaternion(x...)
twoq1 = Quaternion(2*x...)

@test (q1+q1) == twoq1

@test 2*q1 == twoq1