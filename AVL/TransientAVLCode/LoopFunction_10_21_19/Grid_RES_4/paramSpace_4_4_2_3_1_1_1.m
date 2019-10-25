function [aeroForces] = paramSpace_4_4_2_3_1_1_1(sailStates,airStates)

	CL = (3.871524)*sailStates.alpha + (-0.044186)*sailStates.beta + (-2.146540)*sailStates.p + (30.604059)*sailStates.q + (0.338063)*sailStates.r + (0.009940)*sailStates.de;
	CD = -0.057010;
	CY = (-0.030749)*sailStates.alpha + (-0.023878)*sailStates.beta + (-0.043344)*sailStates.p + (-0.294836)*sailStates.q + (0.008632)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (0.958039)*sailStates.alpha + (0.016274)*sailStates.beta + (-0.876645)*sailStates.p + (6.665198)*sailStates.q + (0.058301)*sailStates.r + (-0.000159)*sailStates.de;
	Cm = (-14.331460)*sailStates.alpha + (0.093953)*sailStates.beta + (7.569079)*sailStates.p + (-126.097916)*sailStates.q + (-1.161510)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (-0.164870)*sailStates.alpha + (-0.003428)*sailStates.beta + (0.244310)*sailStates.p + (-1.240441)*sailStates.q + (-0.025568)*sailStates.r + (0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end