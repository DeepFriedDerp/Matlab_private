function [aeroForces] = paramSpace_1_1_1_2_1_2_2(sailStates,airStates)

	CL = (6.041785)*sailStates.alpha + (-0.111646)*sailStates.beta + (-2.440551)*sailStates.p + (33.530632)*sailStates.q + (-1.512092)*sailStates.r + (0.009908)*sailStates.de;
	CD = -0.759280;
	CY = (1.259959)*sailStates.alpha + (-0.047888)*sailStates.beta + (-0.935631)*sailStates.p + (9.876270)*sailStates.q + (-0.123878)*sailStates.r + (0.002095)*sailStates.de;

	Cl = (2.622807)*sailStates.alpha + (-0.031017)*sailStates.beta + (-1.252906)*sailStates.p + (11.231450)*sailStates.q + (-0.974619)*sailStates.r + (0.000303)*sailStates.de;
	Cm = (-18.494518)*sailStates.alpha + (0.265437)*sailStates.beta + (7.691167)*sailStates.p + (-131.889847)*sailStates.q + (4.971912)*sailStates.r + (-0.067782)*sailStates.de;
	Cn = (-1.185115)*sailStates.alpha + (0.033460)*sailStates.beta + (1.649059)*sailStates.p + (-14.155704)*sailStates.q + (0.111479)*sailStates.r + (-0.002902)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end