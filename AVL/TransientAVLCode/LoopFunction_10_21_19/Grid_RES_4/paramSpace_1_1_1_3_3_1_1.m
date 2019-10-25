function [aeroForces] = paramSpace_1_1_1_3_3_1_1(sailStates,airStates)

	CL = (4.199457)*sailStates.alpha + (-0.391892)*sailStates.beta + (-2.245123)*sailStates.p + (35.358612)*sailStates.q + (-1.676693)*sailStates.r + (0.010680)*sailStates.de;
	CD = -0.239190;
	CY = (0.105647)*sailStates.alpha + (-0.025816)*sailStates.beta + (-0.591315)*sailStates.p + (0.294838)*sailStates.q + (-0.117651)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.341194)*sailStates.alpha + (0.173955)*sailStates.beta + (-1.001963)*sailStates.p + (9.087474)*sailStates.q + (-1.349812)*sailStates.r + (0.000094)*sailStates.de;
	Cm = (-12.306975)*sailStates.alpha + (1.529071)*sailStates.beta + (6.686038)*sailStates.p + (-126.097916)*sailStates.q + (5.600856)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (-0.276038)*sailStates.alpha + (0.058196)*sailStates.beta + (1.159066)*sailStates.p + (-4.728988)*sailStates.q + (0.001455)*sailStates.r + (-0.000156)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end