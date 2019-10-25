function [aeroForces] = paramSpace_2_2_1_3_1_3_3(sailStates,airStates)

	CL = (4.215180)*sailStates.alpha + (0.021204)*sailStates.beta + (-2.814481)*sailStates.p + (36.294018)*sailStates.q + (0.401268)*sailStates.r + (0.010966)*sailStates.de;
	CD = -0.167790;
	CY = (-0.022728)*sailStates.alpha + (-0.024776)*sailStates.beta + (0.280127)*sailStates.p + (-0.432842)*sailStates.q + (0.018406)*sailStates.r + (-0.000094)*sailStates.de;

	Cl = (1.465723)*sailStates.alpha + (-0.114262)*sailStates.beta + (-1.434486)*sailStates.p + (11.747493)*sailStates.q + (0.422829)*sailStates.r + (0.000744)*sailStates.de;
	Cm = (-14.867164)*sailStates.alpha + (-0.061085)*sailStates.beta + (9.822287)*sailStates.p + (-144.575424)*sailStates.q + (-1.321482)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (0.115914)*sailStates.alpha + (-0.008873)*sailStates.beta + (-0.715917)*sailStates.p + (4.010369)*sailStates.q + (-0.013364)*sailStates.r + (0.000207)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end