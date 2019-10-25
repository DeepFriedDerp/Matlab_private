function [aeroForces] = paramSpace_1_1_3_2_3_3_2(sailStates,airStates)

	CL = (4.034247)*sailStates.alpha + (0.016349)*sailStates.beta + (-2.362100)*sailStates.p + (31.511713)*sailStates.q + (-0.145583)*sailStates.r + (0.009805)*sailStates.de;
	CD = -0.236270;
	CY = (0.089782)*sailStates.alpha + (-0.027114)*sailStates.beta + (0.135681)*sailStates.p + (0.756269)*sailStates.q + (0.027016)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.238592)*sailStates.alpha + (-0.107789)*sailStates.beta + (-1.163292)*sailStates.p + (9.512568)*sailStates.q + (0.119666)*sailStates.r + (0.000404)*sailStates.de;
	Cm = (-14.723117)*sailStates.alpha + (-0.149147)*sailStates.beta + (8.523881)*sailStates.p + (-132.741776)*sailStates.q + (0.527965)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (0.179074)*sailStates.alpha + (-0.024038)*sailStates.beta + (-0.526945)*sailStates.p + (2.508715)*sailStates.q + (-0.035076)*sailStates.r + (-0.000173)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end