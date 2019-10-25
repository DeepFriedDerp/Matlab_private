function [aeroForces] = paramSpace_1_3_4_1_3_1_3(sailStates,airStates)

	CL = (7.581086)*sailStates.alpha + (0.267969)*sailStates.beta + (-3.454738)*sailStates.p + (50.679073)*sailStates.q + (-3.992444)*sailStates.r + (0.012799)*sailStates.de;
	CD = -3.081440;
	CY = (-0.241570)*sailStates.alpha + (-0.022744)*sailStates.beta + (-1.601477)*sailStates.p + (2.326710)*sailStates.q + (-0.318304)*sailStates.r + (0.000500)*sailStates.de;

	Cl = (3.205575)*sailStates.alpha + (0.796969)*sailStates.beta + (-1.870717)*sailStates.p + (18.623049)*sailStates.q + (-3.356870)*sailStates.r + (0.001319)*sailStates.de;
	Cm = (-12.364047)*sailStates.alpha + (-0.965866)*sailStates.beta + (8.897972)*sailStates.p + (-156.352325)*sailStates.q + (13.148357)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (1.868144)*sailStates.alpha + (0.136677)*sailStates.beta + (3.265117)*sailStates.p + (-15.193034)*sailStates.q + (0.055186)*sailStates.r + (-0.001007)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end