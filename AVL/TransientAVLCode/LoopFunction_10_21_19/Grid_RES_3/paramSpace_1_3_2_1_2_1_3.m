function [aeroForces] = paramSpace_1_3_2_1_2_1_3(sailStates,airStates)

	CL = (6.150232)*sailStates.alpha + (0.663729)*sailStates.beta + (-3.497504)*sailStates.p + (49.306328)*sailStates.q + (-3.425638)*sailStates.r + (0.012471)*sailStates.de;
	CD = -2.429200;
	CY = (-0.413463)*sailStates.alpha + (-0.023346)*sailStates.beta + (-1.327274)*sailStates.p + (0.589407)*sailStates.q + (-0.234034)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (2.017722)*sailStates.alpha + (0.840578)*sailStates.beta + (-1.877431)*sailStates.p + (17.884726)*sailStates.q + (-2.929542)*sailStates.r + (0.001364)*sailStates.de;
	Cm = (-10.402469)*sailStates.alpha + (-2.495642)*sailStates.beta + (9.748680)*sailStates.p + (-158.590927)*sailStates.q + (11.396892)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (1.732173)*sailStates.alpha + (0.106964)*sailStates.beta + (2.700937)*sailStates.p + (-11.425166)*sailStates.q + (0.018062)*sailStates.r + (-0.000441)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end