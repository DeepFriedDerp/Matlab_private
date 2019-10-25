function [aeroForces] = paramSpace_1_3_3_2_1_1_1(sailStates,airStates)

	CL = (4.248976)*sailStates.alpha + (0.306897)*sailStates.beta + (-2.184696)*sailStates.p + (34.749561)*sailStates.q + (-1.549005)*sailStates.r + (0.011158)*sailStates.de;
	CD = -0.356760;
	CY = (-0.052514)*sailStates.alpha + (-0.027165)*sailStates.beta + (-0.484445)*sailStates.p + (-1.027327)*sailStates.q + (-0.085518)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (0.909174)*sailStates.alpha + (0.366286)*sailStates.beta + (-0.838592)*sailStates.p + (7.039942)*sailStates.q + (-1.235647)*sailStates.r + (-0.000247)*sailStates.de;
	Cm = (-12.378382)*sailStates.alpha + (-1.101810)*sailStates.beta + (6.634432)*sailStates.p + (-124.672363)*sailStates.q + (5.160790)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (-0.337306)*sailStates.alpha + (0.049928)*sailStates.beta + (1.031698)*sailStates.p + (-3.691648)*sailStates.q + (-0.009929)*sailStates.r + (0.000201)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end