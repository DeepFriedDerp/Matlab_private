function [aeroForces] = paramSpace_4_2_2_3_2_3_1(sailStates,airStates)

	CL = (4.185931)*sailStates.alpha + (0.111960)*sailStates.beta + (-2.279716)*sailStates.p + (35.450279)*sailStates.q + (1.542759)*sailStates.r + (0.011018)*sailStates.de;
	CD = -0.186790;
	CY = (-0.028473)*sailStates.alpha + (-0.024776)*sailStates.beta + (0.486585)*sailStates.p + (0.194783)*sailStates.q + (-0.096795)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.190744)*sailStates.alpha + (-0.218121)*sailStates.beta + (-0.989038)*sailStates.p + (8.737452)*sailStates.q + (1.199564)*sailStates.r + (0.000045)*sailStates.de;
	Cm = (-12.800745)*sailStates.alpha + (-0.406018)*sailStates.beta + (6.934164)*sailStates.p + (-127.822792)*sailStates.q + (-5.129440)*sailStates.r + (-0.067003)*sailStates.de;
	Cn = (0.192736)*sailStates.alpha + (0.049925)*sailStates.beta + (-0.960352)*sailStates.p + (3.676425)*sailStates.q + (-0.008464)*sailStates.r + (0.000023)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end