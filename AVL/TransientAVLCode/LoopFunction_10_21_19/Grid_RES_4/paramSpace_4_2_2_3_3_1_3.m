function [aeroForces] = paramSpace_4_2_2_3_3_1_3(sailStates,airStates)

	CL = (3.971128)*sailStates.alpha + (0.012838)*sailStates.beta + (-2.695751)*sailStates.p + (34.984634)*sailStates.q + (0.296169)*sailStates.r + (0.010345)*sailStates.de;
	CD = -0.105440;
	CY = (0.020124)*sailStates.alpha + (-0.024673)*sailStates.beta + (-0.135494)*sailStates.p + (0.294836)*sailStates.q + (0.026941)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.349409)*sailStates.alpha + (0.063368)*sailStates.beta + (-1.378018)*sailStates.p + (11.445397)*sailStates.q + (0.034997)*sailStates.r + (0.000742)*sailStates.de;
	Cm = (-14.617787)*sailStates.alpha + (-0.025610)*sailStates.beta + (9.586262)*sailStates.p + (-142.570129)*sailStates.q + (-1.044916)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (-0.251919)*sailStates.alpha + (-0.014014)*sailStates.beta + (0.535661)*sailStates.p + (-3.518873)*sailStates.q + (-0.059018)*sailStates.r + (-0.000120)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end