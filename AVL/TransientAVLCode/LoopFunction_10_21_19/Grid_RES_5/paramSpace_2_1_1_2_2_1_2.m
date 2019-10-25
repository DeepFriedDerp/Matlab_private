function [aeroForces] = paramSpace_2_1_1_2_2_1_2(sailStates,airStates)

	CL = (4.119475)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.704184)*sailStates.p + (39.315578)*sailStates.q + (-1.799858)*sailStates.r + (0.010958)*sailStates.de;
	CD = -0.141230;
	CY = (0.022415)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.596827)*sailStates.p + (0.571906)*sailStates.q + (-0.126921)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.446352)*sailStates.alpha + (0.275761)*sailStates.beta + (-1.331145)*sailStates.p + (12.130797)*sailStates.q + (-1.418514)*sailStates.r + (0.000575)*sailStates.de;
	Cm = (-12.523898)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.206421)*sailStates.p + (-139.762878)*sailStates.q + (6.007336)*sailStates.r + (-0.067975)*sailStates.de;
	Cn = (0.184216)*sailStates.alpha + (0.058615)*sailStates.beta + (1.085168)*sailStates.p + (-4.237344)*sailStates.q + (-0.010919)*sailStates.r + (-0.000237)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end