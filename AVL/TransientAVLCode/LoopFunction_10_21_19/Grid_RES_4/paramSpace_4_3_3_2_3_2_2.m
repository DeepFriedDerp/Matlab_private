function [aeroForces] = paramSpace_4_3_3_2_3_2_2(sailStates,airStates)

	CL = (3.798395)*sailStates.alpha + (-0.063232)*sailStates.beta + (-2.502106)*sailStates.p + (35.181850)*sailStates.q + (0.797069)*sailStates.r + (0.010595)*sailStates.de;
	CD = 0.083950;
	CY = (0.094289)*sailStates.alpha + (-0.025807)*sailStates.beta + (0.108749)*sailStates.p + (0.756269)*sailStates.q + (-0.021604)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.130156)*sailStates.alpha + (-0.101308)*sailStates.beta + (-1.161029)*sailStates.p + (9.670033)*sailStates.q + (0.527040)*sailStates.r + (0.000340)*sailStates.de;
	Cm = (-13.638755)*sailStates.alpha + (0.240115)*sailStates.beta + (8.425582)*sailStates.p + (-135.926239)*sailStates.q + (-2.713488)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (-0.235852)*sailStates.alpha + (0.018941)*sailStates.beta + (-0.068975)*sailStates.p + (-0.994807)*sailStates.q + (-0.045246)*sailStates.r + (-0.000213)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end