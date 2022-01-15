using Test

using Rotations

x = [1.0; 0.0; 0.0; 0.0]
quat = Quaternion(x)

@test quat[1] == 1.0
@test quat[2] == 0.0
@test quat[3] == 0.0
@test quat[4] == 0.0

quat[2] = 1.0
@test quat[2] == 1.0

q1 = Quaternion(x)
twoq1 = Quaternion(2*x)

@test (q1+q1) == twoq1

@test 2*q1 == twoq1

a1 = 1.0
b1 = 2.0
c1 = 3.0
d1 = 4.0
a2 = -1.0
b2 = -2.0
c2 = -3.0
d2 = -4.0

a = [a1; b1; c1; d1]
b = [a2; b2; c2; d2]

q1 = Quaternion(a)
q2 = Quaternion(b)

multiplyq = q1*q2

@test multiplyq[1] == a[1]*b[1] - sum(a[2:end].*b[2:end])
@test multiplyq[2] == (a1*b2 + b1*a2 + c1*d2 - d1*c2)
@test multiplyq[3] == (a1*c2 - b1*d2 + c1*a2 + d1*b2)
@test multiplyq[4] == (a1*d2 + b1*c2 - c1*b2 + d1*a2)