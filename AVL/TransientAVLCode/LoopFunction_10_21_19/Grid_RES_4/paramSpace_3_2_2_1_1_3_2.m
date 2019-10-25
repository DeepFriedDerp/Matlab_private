function [aeroForces] = paramSpace_3_2_2_1_1_3_2(sailStates,airStates)

	CL = (7.658763)*sailStates.alpha + (0.213256)*sailStates.beta + (-2.607719)*sailStates.p + (37.713432)*sailStates.q + (2.993542)*sailStates.r + (0.011589)*sailStates.de;
	CD = -2.965280;
	CY = (-0.227761)*sailStates.alpha + (-0.025520)*sailStates.beta + (1.391914)*sailStates.p + (-1.693499)*sailStates.q + (-0.091171)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (2.915297)*sailStates.alpha + (-0.561654)*sailStates.beta + (-1.232156)*sailStates.p + (10.719826)*sailStates.q + (2.658162)*sailStates.r + (0.000349)*sailStates.de;
	Cm = (-15.348850)*sailStates.alpha + (-0.810713)*sailStates.beta + (8.070199)*sailStates.p + (-136.398376)*sailStates.q + (-10.113782)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (0.578077)*sailStates.alpha + (0.042815)*sailStates.beta + (-3.009567)*sailStates.p + (14.727539)*sailStates.q + (0.028238)*sailStates.r + (0.000742)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end