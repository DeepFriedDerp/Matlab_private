function [aeroForces] = paramSpace_3_2_4_2_3_3_3(sailStates,airStates)

	CL = (4.301099)*sailStates.alpha + (0.105965)*sailStates.beta + (-3.002510)*sailStates.p + (39.417866)*sailStates.q + (1.208581)*sailStates.r + (0.011442)*sailStates.de;
	CD = -0.370930;
	CY = (0.163386)*sailStates.alpha + (-0.024667)*sailStates.beta + (0.467007)*sailStates.p + (0.668511)*sailStates.q + (-0.030539)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.371141)*sailStates.alpha + (-0.233093)*sailStates.beta + (-1.565867)*sailStates.p + (13.343944)*sailStates.q + (1.089373)*sailStates.r + (0.000940)*sailStates.de;
	Cm = (-13.617240)*sailStates.alpha + (-0.438767)*sailStates.beta + (9.958066)*sailStates.p + (-148.601746)*sailStates.q + (-4.138819)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (-0.342939)*sailStates.alpha + (0.016954)*sailStates.beta + (-0.961362)*sailStates.p + (3.400095)*sailStates.q + (-0.002091)*sailStates.r + (-0.000123)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end