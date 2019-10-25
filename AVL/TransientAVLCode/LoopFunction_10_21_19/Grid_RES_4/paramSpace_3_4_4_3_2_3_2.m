function [aeroForces] = paramSpace_3_4_4_3_2_3_2(sailStates,airStates)

	CL = (4.219283)*sailStates.alpha + (-0.253434)*sailStates.beta + (-2.563787)*sailStates.p + (35.508430)*sailStates.q + (0.996514)*sailStates.r + (0.010985)*sailStates.de;
	CD = -0.187200;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.405653)*sailStates.p + (0.000000)*sailStates.q + (-0.026588)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.231431)*sailStates.alpha + (-0.265228)*sailStates.beta + (-1.155206)*sailStates.p + (9.315137)*sailStates.q + (0.869856)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-14.069390)*sailStates.alpha + (1.052053)*sailStates.beta + (8.540085)*sailStates.p + (-136.150452)*sailStates.q + (-3.408827)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.101839)*sailStates.alpha + (0.012468)*sailStates.beta + (-0.829484)*sailStates.p + (3.432815)*sailStates.q + (0.002016)*sailStates.r + (0.000052)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end