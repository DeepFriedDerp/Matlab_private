function [aeroForces] = paramSpace_1_2_1_3_2_1_1(sailStates,airStates)

	CL = (4.116345)*sailStates.alpha + (-0.125741)*sailStates.beta + (-2.278427)*sailStates.p + (35.547066)*sailStates.q + (-1.559008)*sailStates.r + (0.010844)*sailStates.de;
	CD = -0.172600;
	CY = (0.031694)*sailStates.alpha + (-0.024749)*sailStates.beta + (-0.515383)*sailStates.p + (-0.194783)*sailStates.q + (-0.102495)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.190159)*sailStates.alpha + (0.232257)*sailStates.beta + (-0.988391)*sailStates.p + (8.741925)*sailStates.q + (-1.246077)*sailStates.r + (0.000045)*sailStates.de;
	Cm = (-12.396939)*sailStates.alpha + (0.494217)*sailStates.beta + (6.915706)*sailStates.p + (-127.822792)*sailStates.q + (5.222236)*sailStates.r + (-0.067003)*sailStates.de;
	Cn = (-0.199364)*sailStates.alpha + (0.052763)*sailStates.beta + (1.003800)*sailStates.p + (-3.698917)*sailStates.q + (-0.009414)*sailStates.r + (-0.000007)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end