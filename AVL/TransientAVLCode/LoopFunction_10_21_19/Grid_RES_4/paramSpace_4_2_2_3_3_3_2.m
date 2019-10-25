function [aeroForces] = paramSpace_4_2_2_3_3_3_2(sailStates,airStates)

	CL = (4.077090)*sailStates.alpha + (0.110747)*sailStates.beta + (-2.544882)*sailStates.p + (37.506393)*sailStates.q + (1.518074)*sailStates.r + (0.011143)*sailStates.de;
	CD = -0.130300;
	CY = (0.064743)*sailStates.alpha + (-0.024472)*sailStates.beta + (0.439694)*sailStates.p + (0.489618)*sailStates.q + (-0.087478)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.217230)*sailStates.alpha + (-0.206006)*sailStates.beta + (-1.203815)*sailStates.p + (10.693650)*sailStates.q + (1.179131)*sailStates.r + (0.000408)*sailStates.de;
	Cm = (-12.803878)*sailStates.alpha + (-0.402266)*sailStates.beta + (7.911642)*sailStates.p + (-135.545776)*sailStates.q + (-5.058626)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (-0.115218)*sailStates.alpha + (0.046767)*sailStates.beta + (-0.819807)*sailStates.p + (2.613451)*sailStates.q + (-0.023843)*sailStates.r + (-0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end