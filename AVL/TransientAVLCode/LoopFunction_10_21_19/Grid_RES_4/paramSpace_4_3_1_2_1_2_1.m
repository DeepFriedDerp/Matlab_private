function [aeroForces] = paramSpace_4_3_1_2_1_2_1(sailStates,airStates)

	CL = (3.967593)*sailStates.alpha + (-0.060214)*sailStates.beta + (-2.071308)*sailStates.p + (32.031658)*sailStates.q + (1.012237)*sailStates.r + (0.010579)*sailStates.de;
	CD = 0.020800;
	CY = (-0.105781)*sailStates.alpha + (-0.024539)*sailStates.beta + (0.272507)*sailStates.p + (-0.455227)*sailStates.q + (-0.054156)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.025500)*sailStates.alpha + (-0.138393)*sailStates.beta + (-0.815870)*sailStates.p + (6.681575)*sailStates.q + (0.670792)*sailStates.r + (-0.000269)*sailStates.de;
	Cm = (-13.801327)*sailStates.alpha + (0.187258)*sailStates.beta + (6.674681)*sailStates.p + (-122.911674)*sailStates.q + (-3.354038)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (0.215238)*sailStates.alpha + (0.023267)*sailStates.beta + (-0.496197)*sailStates.p + (2.345299)*sailStates.q + (-0.002810)*sailStates.r + (0.000173)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end