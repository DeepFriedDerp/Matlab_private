function [aeroForces] = paramSpace_1_4_3_3_1_2_3(sailStates,airStates)

	CL = (3.747650)*sailStates.alpha + (0.190324)*sailStates.beta + (-2.726796)*sailStates.p + (37.045586)*sailStates.q + (-0.949984)*sailStates.r + (0.010646)*sailStates.de;
	CD = 0.077030;
	CY = (-0.055507)*sailStates.alpha + (-0.025694)*sailStates.beta + (-0.165928)*sailStates.p + (-0.294837)*sailStates.q + (-0.033016)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.167071)*sailStates.alpha + (0.156152)*sailStates.beta + (-1.321989)*sailStates.p + (11.192567)*sailStates.q + (-0.630732)*sailStates.r + (0.000563)*sailStates.de;
	Cm = (-13.445311)*sailStates.alpha + (-0.658175)*sailStates.beta + (9.091619)*sailStates.p + (-141.543854)*sailStates.q + (3.193775)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (0.241557)*sailStates.alpha + (0.023838)*sailStates.beta + (0.164136)*sailStates.p + (0.274703)*sailStates.q + (-0.040525)*sailStates.r + (0.000059)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end