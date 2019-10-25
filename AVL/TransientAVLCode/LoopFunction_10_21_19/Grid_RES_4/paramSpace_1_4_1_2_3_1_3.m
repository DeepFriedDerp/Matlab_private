function [aeroForces] = paramSpace_1_4_1_2_3_1_3(sailStates,airStates)

	CL = (4.666774)*sailStates.alpha + (0.521201)*sailStates.beta + (-2.902377)*sailStates.p + (42.115929)*sailStates.q + (-2.364661)*sailStates.r + (0.011245)*sailStates.de;
	CD = -0.639570;
	CY = (-0.003545)*sailStates.alpha + (-0.021092)*sailStates.beta + (-0.878347)*sailStates.p + (1.057313)*sailStates.q + (-0.174828)*sailStates.r + (0.000224)*sailStates.de;

	Cl = (1.719038)*sailStates.alpha + (0.550709)*sailStates.beta + (-1.435045)*sailStates.p + (13.294044)*sailStates.q + (-1.933184)*sailStates.r + (0.000660)*sailStates.de;
	Cm = (-12.084302)*sailStates.alpha + (-2.002161)*sailStates.beta + (8.417269)*sailStates.p + (-143.598221)*sailStates.q + (7.872303)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.357991)*sailStates.alpha + (0.073346)*sailStates.beta + (1.704692)*sailStates.p + (-7.391395)*sailStates.q + (0.011180)*sailStates.r + (-0.000429)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end